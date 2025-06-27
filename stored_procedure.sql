Create or ALTER PROCEDURE AllocateSubjects
AS
BEGIN
    -- Clear previous results
    DELETE FROM Allotments;
    DELETE FROM UnallottedStudents;

    DECLARE @StudentId INT, @SubjectId VARCHAR(10);

    -- Cursor over students sorted by GPA DESC
    DECLARE student_cursor CURSOR FOR
        SELECT StudentId FROM StudentDetails ORDER BY GPA DESC;

    OPEN student_cursor;
    FETCH NEXT FROM student_cursor INTO @StudentId;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @Allocated BIT = 0;

        -- Inner cursor: loop over student's preferences in order
        DECLARE pref_cursor CURSOR FOR
            SELECT SubjectId FROM StudentPreference
            WHERE StudentId = @StudentId
            ORDER BY Preference;

        OPEN pref_cursor;
        FETCH NEXT FROM pref_cursor INTO @SubjectId;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            IF EXISTS (
                SELECT 1 FROM SubjectDetails
                WHERE SubjectId = @SubjectId AND RemainingSeats > 0
            )
            BEGIN
                -- Allot
                INSERT INTO Allotments (SubjectId, StudentId)
                VALUES (@SubjectId, @StudentId);

                -- Decrease seat
                UPDATE SubjectDetails
                SET RemainingSeats = RemainingSeats - 1
                WHERE SubjectId = @SubjectId;

                SET @Allocated = 1;
                BREAK;
            END

            FETCH NEXT FROM pref_cursor INTO @SubjectId;
        END

        CLOSE pref_cursor;
        DEALLOCATE pref_cursor;

        -- If not allotted
        IF @Allocated = 0
        BEGIN
            INSERT INTO UnallottedStudents (StudentId)
            VALUES (@StudentId);
        END

        FETCH NEXT FROM student_cursor INTO @StudentId;
    END

    CLOSE student_cursor;
    DEALLOCATE student_cursor;

    -- Show Results After Allotment
    PRINT 'Allotments Table:';
    SELECT * FROM Allotments;

    PRINT 'Unallotted Students:';
    SELECT * FROM UnallottedStudents;

    PRINT 'Updated SubjectDetails:';
    SELECT * FROM SubjectDetails;
END;
