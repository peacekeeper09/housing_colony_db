CREATE DATABASE housing_colony;


USE housing_colony;


CREATE TABLE residents (
  resident_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone_number VARCHAR(15) NOT NULL,
  email VARCHAR(255),
  occupation VARCHAR(255)
);

CREATE TABLE vehicles (
  vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
  make VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  year INT NOT NULL,
  license_plate_number VARCHAR(10) NOT NULL,
  resident_id INT,
  FOREIGN KEY (resident_id) REFERENCES residents (resident_id) ON DELETE CASCADE
);

CREATE TABLE amenities (
  amenity_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  location VARCHAR(255),
  hours_of_operation VARCHAR(255)
);

CREATE TABLE maintenance_requests (
  request_id INT AUTO_INCREMENT PRIMARY KEY,
  resident_id INT NOT NULL,
  request_type VARCHAR(255) NOT NULL,
  description TEXT,
  date_submitted DATE,
  status VARCHAR(255) DEFAULT 'pending',
  FOREIGN KEY (resident_id) REFERENCES residents (resident_id) ON DELETE CASCADE
);

CREATE TABLE events (
  event_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  date_and_time DATETIME,
  location VARCHAR(255),
  organizer VARCHAR(255)
);

CREATE TABLE security (
  security_id INT AUTO_INCREMENT PRIMARY KEY,
  personnel_name VARCHAR(255) NOT NULL,
  contact_info VARCHAR(255),
  duty_schedule VARCHAR(255),
  security_measure VARCHAR(255)
);

CREATE TABLE complaints (
  complaint_id INT AUTO_INCREMENT PRIMARY KEY,
  resident_id INT NOT NULL,
  complaint_type VARCHAR(255) NOT NULL,
  description TEXT,
  date_submitted DATE,
  status VARCHAR(255) DEFAULT 'pending',
  FOREIGN KEY (resident_id) REFERENCES residents (resident_id) ON DELETE CASCADE
);

CREATE TABLE staff (
  staff_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  contact_info VARCHAR(255),
  job_title VARCHAR(255),
  work_schedule VARCHAR(255)
);

CREATE TABLE billing (
  billing_id INT AUTO_INCREMENT PRIMARY KEY,
  resident_id INT NOT NULL,
  billing_period VARCHAR(255) NOT NULL,
  amount_due DECIMAL(10,2) NOT NULL,
  payment_status VARCHAR(255) DEFAULT 'pending',
  payment_date DATE,
  FOREIGN KEY (resident_id) REFERENCES residents (resident_id) ON DELETE CASCADE
);

CREATE TABLE visitors (
  visitor_id INT AUTO_INCREMENT PRIMARY KEY,
  visitor_name VARCHAR(255) NOT NULL,
  visit_date DATE,
  visit_time TIME,
  purpose VARCHAR(255),
  resident_id INT,
  FOREIGN KEY (resident_id) REFERENCES residents (resident_id) ON DELETE CASCADE
);

CREATE TABLE announcements (
  announcement_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  date_and_time DATETIME,
  audience VARCHAR(255)
);



INSERT INTO residents (name, address, phone_number, email, occupation) 
VALUES 
('John Doe', '123 Main St', '555-1234', 'johndoe@example.com', 'Software Engineer'),
('Jane Smith', '456 Oak Ave', '555-5678', 'janesmith@example.com', 'Graphic Designer'),
('Bob Johnson', '789 Elm St', '555-9012', 'bobjohnson@example.com', 'Sales Manager'),
('Lisa Brown', '234 Maple Ave', '555-3456', 'lisabrown@example.com', 'Teacher'),
('David Lee', '567 Pine St', '555-7890', 'davidlee@example.com', 'Engineer'),
('Karen Kim', '890 Cherry Ln', '555-2345', 'karenkim@example.com', 'Accountant'),
('Mike Wilson', '1234 Oak St', '555-6789', 'mikewilson@example.com', 'Doctor'),
('Emily Chen', '5678 Elm Dr', '555-0123', 'emilychen@example.com', 'Lawyer'),
('Chris Davis', '9012 Maple Rd', '555-4567', 'chrisdavis@example.com', 'Business Owner'),
('Sarah Taylor', '3456 Pine Ave', '555-8901', 'sarahtaylor@example.com', 'Marketing Manager');

SELECT * FROM residents;


INSERT INTO vehicles (make, model, year, license_plate_number, resident_id) 
VALUES 
('Toyota', 'Camry', 2018, 'ABC-123', 1),
('Honda', 'Civic', 2019, 'DEF-456', 2),
('Ford', 'Escape', 2020, 'GHI-789', 3),
('Nissan', 'Altima', 2017, 'JKL-012', 4),
('Chevrolet', 'Impala', 2021, 'MNO-345', 5),
('BMW', 'X5', 2016, 'PQR-678', 6),
('Mercedes-Benz', 'C-Class', 2015, 'STU-901', 7),
('Audi', 'A4', 2019, 'VWX-234', 8),
('Tesla', 'Model S', 2020, 'YZA-567', 9),
('Jeep', 'Wrangler', 2022, 'BCD-890', 10);


SELECT * FROM vehicles;

INSERT INTO amenities (name, description, location, hours_of_operation) 
VALUES 
('Swimming pool', 'Olympic size swimming pool with a diving board', 'Clubhouse', '9:00 AM - 9:00 PM'),
('Gym', 'Fully equipped gym with cardio and weight training equipment', 'Clubhouse', '24 hours'),
('Tennis court', 'Outdoor tennis court with floodlights for night play', 'Clubhouse', '9:00 AM - 9:00 PM'),
('Playground', 'Outdoor playground with slides, swings, and climbing equipment', 'Park', '8:00 AM - 8:00 PM'),
('Basketball court', 'Outdoor basketball court with adjustable height hoops', 'Park', '8:00 AM - 8:00 PM'),
('Jogging track', 'Paved jogging track with scenic views', 'Park', 'Open 24 hours'),
('Party hall', 'Indoor party hall for events and celebrations', 'Clubhouse', '10:00 AM - 11:00 PM'),
('BBQ area', 'Outdoor BBQ area with grills and picnic tables', 'Park', '8:00 AM - 8:00 PM'),
('Game room', 'Indoor game room with pool table, table tennis, and board games', 'Clubhouse', '10:00 AM - 11:00 PM'),
('Library', 'Indoor library with a collection of books and reading areas', 'Clubhouse', '10:00 AM - 11:00 PM');

SELECT * FROM amenities;

INSERT INTO maintenance_requests (resident_id, request_type, description, date_submitted, status)
VALUES 
(1, 'Plumbing', 'Leaking faucet in the bathroom', '2023-04-25', 'pending'),
(2, 'Electrical', 'Faulty light switch in the living room', '2023-04-26', 'in progress'),
(3, 'HVAC', 'Air conditioning unit not working properly', '2023-04-27', 'resolved'),
(4, 'Plumbing', 'Clogged drain in the kitchen sink', '2023-04-27', 'pending'),
(5, 'Painting', 'Walls need to be repainted in the bedroom', '2023-04-28', 'in progress');

SELECT * FROM maintenance_requests;

INSERT INTO events (name, description, date_and_time, location, organizer)
VALUES 
('Community Picnic', 'Join us for a fun-filled day at the park with food and games!', '2023-05-15 12:00:00', 'Central Park', 'Community Board'),
('Fitness Class', 'Stay active and healthy with our weekly fitness class', '2023-05-02 08:00:00', 'Community Gym', 'Fitness Instructor'),
('Movie Night', 'Enjoy a family-friendly movie under the stars', '2023-05-22 20:00:00', 'Community Courtyard', 'Resident Committee'),
('Book Club Meeting', 'Discuss and share your favorite books with fellow residents', '2023-05-10 18:00:00', 'Community Library', 'Book Club Organizer'),
('Arts and Crafts Workshop', 'Get creative and learn new skills with our arts and crafts workshop', '2023-05-08 14:00:00', 'Community Hall', 'Arts and Crafts Instructor');

SELECT * FROM events;

INSERT INTO security (personnel_name, contact_info, duty_schedule, security_measure) VALUES
('John Smith', '555-1234', 'Monday-Friday, 8am-5pm', 'CCTV surveillance'),
('Jane Doe', '555-5678', 'Tuesday-Saturday, 9am-6pm', 'On-site security guard'),
('Bob Johnson', '555-9876', 'Monday-Sunday, 24/7', 'Gated community with access control system'),
('Alice Lee', '555-2468', 'Thursday-Sunday, 7pm-7am', 'Regular patrols by security personnel'),
('Tom Wilson', '555-3698', 'Monday-Friday, 10am-7pm', 'Biometric entry system for residents');

SELECT * FROM security;

INSERT INTO complaints (resident_id, complaint_type, description, date_submitted)
VALUES 
(1, 'Noise', 'Loud music coming from neighbor', '2023-04-30'),
(2, 'Garbage', 'Trash not being disposed properly', '2023-04-29'),
(3, 'Maintenance', 'Leaking tap in bathroom', '2023-04-28'),
(4, 'Security', 'Unauthorized entry in premises', '2023-04-27'),
(5, 'Parking', 'Car parked in reserved spot', '2023-04-26');

SELECT * FROM complaints;

INSERT INTO staff (name, contact_info, job_title, work_schedule) 
VALUES ('John Smith', 'johnsmith@example.com', 'Maintenance Worker', 'Mon-Fri 9am-5pm');
INSERT INTO staff (name, contact_info, job_title, work_schedule) 
VALUES ('Jane Doe', 'janedoe@example.com', 'Security Guard', 'Tue-Sat 10pm-6am');
INSERT INTO staff (name, contact_info, job_title, work_schedule) 
VALUES ('Bob Johnson', 'bjohnson@example.com', 'Janitor', 'Mon-Fri 7am-3pm');
INSERT INTO staff (name, contact_info, job_title, work_schedule) 
VALUES ('Samantha Lee', 'slee@example.com', 'Front Desk Receptionist', 'Sat-Sun 12pm-8pm');

SELECT * FROM staff;

INSERT INTO billing (resident_id, billing_period, amount_due, payment_status, payment_date) VALUES
(1, 'Jan 2023', 1200.00, 'paid', '2023-02-01'),
(2, 'Jan 2023', 1500.00, 'pending', NULL),
(3, 'Jan 2023', 1000.00, 'pending', NULL),
(4, 'Jan 2023', 1300.00, 'paid', '2023-01-30'),
(5, 'Jan 2023', 1100.00, 'pending', NULL);
SELECT * FROM billing;


INSERT INTO visitors (visitor_name, visit_date, visit_time, purpose, resident_id)
VALUES 
    ('John Smith', '2023-05-01', '14:30:00', 'Meeting', 1),
    ('Mary Johnson', '2023-05-02', '10:00:00', 'Delivery', 2),
    ('Robert Lee', '2023-05-03', '16:00:00', 'Social Visit', 3),
    ('Emily Chen', '2023-05-04', '12:00:00', 'Maintenance Request', 4),
    ('David Kim', '2023-05-05', '15:30:00', 'Package Delivery', 5);
SELECT * FROM visitors;


INSERT INTO announcements (title, description, date_and_time, audience)
VALUES
('Upcoming Community Event', 'Join us for a community BBQ on June 5th at 12pm in the park!', '2023-06-05 12:00:00', 'All residents'),
('Pool Maintenance', 'The pool will be closed for maintenance from June 10th to June 15th.', '2023-06-10 00:00:00', 'Pool members'),
('Reminder: Rent Due', 'Just a friendly reminder that rent is due on the 1st of each month.', '2023-05-31 12:00:00', 'All residents'),
('New Playground Equipment', 'Exciting news! We have just installed new playground equipment in the park.', '2023-05-01 00:00:00', 'Families with children'),
('Community Garden', 'We are looking for volunteers to help maintain the community garden. If interested, please contact the office.', '2023-05-15 00:00:00', 'Garden members'),
('Notice: Parking Lot Repairs', 'The parking lot will be undergoing repairs from May 20th to May 25th. Please use caution when entering and exiting the lot.', '2023-05-20 00:00:00', 'All residents'),
('Upcoming Board Meeting', 'The next board meeting will be held on June 15th at 7pm in the community center.', '2023-06-15 19:00:00', 'Board members'),
('Lawn Care', 'Our lawn care company will be spraying for weeds on May 5th. Please keep children and pets off the lawn that day.', '2023-05-05 00:00:00', 'All residents'),
('Community Clean-Up Day', 'Join us on May 25th from 9am-12pm for a community clean-up day. Trash bags and gloves will be provided.', '2023-05-25 09:00:00', 'All residents'),
('New Recycling Program', 'We are excited to announce a new recycling program in our community. Please visit the office for more information.', '2023-05-01 00:00:00', 'All residents');

SELECT * FROM announcements;


