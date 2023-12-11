CREATE TABLE Membership 
	(
		membership_id	INT PRIMARY KEY,
		membership_name	varchar(15),
		price			FLOAT4 NOT NULL
	);

CREATE TABLE Members 
	(
		member_id				SERIAL PRIMARY KEY,
		f_name 					varchar(15) NOT NULL,
		l_name 					varchar(15) NOT NULL,
		DOB						DATE,
		health_statistics 		varchar(255),
		email 					varchar(255) UNIQUE NOT NULL,
		fitness_achievements 	varchar(255),
		user_password 			varchar(255) NOT NULL,
		payment_date 			DATE DEFAULT CURRENT_DATE NOT NULL,
		loyalty_points 			INT,
		billing_info 			varchar(255) NOT NULL,	
		membership_id			INT NOT NULL,
		
		FOREIGN KEY (membership_id) REFERENCES Membership
	);
	
CREATE TABLE Room
	(
		room_number	INT PRIMARY KEY	
	);

CREATE TABLE Administrative_staff
	(
		staff_id 	SERIAL PRIMARY KEY,
		f_name		VARCHAR(15) NOT NULL,
		l_name		VARCHAR(15)	NOT NULL
	);

CREATE TABLE Trainer
	(
		trainer_id	SERIAL PRIMARY KEY,
		f_name		VARCHAR(15) NOT NULL,
		l_name		VARCHAR(15)	NOT NULL
	
	);

CREATE TABLE Classes
	(
		session_id		SERIAL PRIMARY KEY,
		session_date	DATE,
		session_time	TIME NOT NULL
	);
	
CREATE TABLE Attend
	(
		session_id INT,
		member_id  INT,
		
		PRIMARY KEY (session_id, member_id),
		FOREIGN KEY (member_id) REFERENCES Members,
		FOREIGN KEY (session_id) REFERENCES Classes
		
	);



CREATE TABLE Equipment
	(
		equipment_id			SERIAL PRIMARY KEY,
		room_number				INT,
		maintenance_needed 		bool NOT NULL,
		maintenance_date		DATE,
		
		FOREIGN KEY (room_number) REFERENCES Room
		
	);
	
CREATE TABLE Individually_trains

	(
		member_id		INT,
		trainer_id 		INT,
		
		PRIMARY KEY (member_id, trainer_id),
		FOREIGN KEY (member_id)  REFERENCES Members,
		FOREIGN KEY (trainer_id) REFERENCES Trainer
	);
	
CREATE TABLE Instructs
	(
		trainer_id		INT,
		session_id		INT,

		PRIMARY KEY (trainer_id, session_id),
		FOREIGN KEY (trainer_id) REFERENCES Trainer,
		FOREIGN KEY (session_id) REFERENCES Classes
	);
	
CREATE TABLE Workout_plan
	(
		plan_id					SERIAL PRIMARY KEY,
		price 					INT,
		trainer_id				INT,	
		
		FOREIGN KEY (trainer_id)  REFERENCES Trainer

	);
	

CREATE TABLE Handles
	(
		staff_id		INT,
		room_number		INT,
		
		PRIMARY KEY (staff_id, room_number),
		FOREIGN KEY (staff_id) REFERENCES Administrative_staff,
		FOREIGN KEY (room_number) REFERENCES Room
	
	);
	

CREATE TABLE Provided_by
	(
		plan_id		INT,
		trainer_id	INT,
		
		PRIMARY KEY (plan_id, trainer_id),
		FOREIGN KEY (trainer_id)  REFERENCES Trainer,
		FOREIGN KEY (plan_id)  REFERENCES Workout_plan
	
	);
	
CREATE TABLE Oversees
	(
		staff_id	INT,
		plan_id		INT,
		
		PRIMARY KEY (staff_id, plan_id),
		FOREIGN KEY (staff_id) REFERENCES Administrative_staff,
		FOREIGN KEY (plan_id)  REFERENCES Workout_plan
		
	
	);
	
CREATE TABLE Manage
	(
		staff_id	INT,
		session_id	INT,
		
		PRIMARY KEY (staff_id, session_id),
		FOREIGN KEY (staff_id) REFERENCES Administrative_staff,
		FOREIGN KEY (session_id) REFERENCES Classes
	
	);
	
CREATE TABLE Supervises
	(
		staff_id	INT,
		trainer_id	INT,
		
		PRIMARY KEY (staff_id, trainer_id),
		FOREIGN KEY (staff_id) REFERENCES Administrative_staff,
		FOREIGN KEY (trainer_id)  REFERENCES Trainer
	);
	

CREATE TABLE Member_workoutplan
(
		member_id	INT,
		plan_id		INT,
	
		PRIMARY KEY (member_id, plan_id),
		FOREIGN KEY (member_id) REFERENCES Members, 
		FOREIGN KEY (plan_id)	REFERENCES Workout_plan

);

CREATE TABLE Schedule
	(
		schedule_id			SERIAL PRIMARY KEY,
		schedule_contents	VARCHAR(255)
		
	);
	
CREATE TABLE Trainer_schedules
	(
		schedule_id		INT,
		trainer_id		INT,
		
		PRIMARY KEY (schedule_id, trainer_id),
		FOREIGN KEY (schedule_id) REFERENCES Schedule,
		FOREIGN KEY (trainer_id)	REFERENCES Trainer
	);
	
CREATE TABLE Member_schedules
	(
		schedule_id		INT,
		member_id		INT,
		
		PRIMARY KEY (schedule_id, member_id),
		FOREIGN KEY (schedule_id) REFERENCES Schedule,
		FOREIGN KEY (member_id)	REFERENCES Members
	
	
	);


