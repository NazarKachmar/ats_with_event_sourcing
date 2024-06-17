# CREATE JOBS AND APPLICATIONS

chef_job = FactoryBot.create(:job, title: 'Chef', description: 'Prepare and cook meals')
teacher_job = FactoryBot.create(:job, title: 'Teacher', description: 'Educate students')
nurse_job = FactoryBot.create(:job, title: 'Nurse', description: 'Provide medical care')

chef_application1 = FactoryBot.create(:application, job: chef_job, user_name: 'Emily')
chef_application2 = FactoryBot.create(:application, job: chef_job, user_name: 'Michael')

teacher_application1 = FactoryBot.create(:application, job: teacher_job, user_name: 'Sophia')
teacher_application2 = FactoryBot.create(:application, job: teacher_job, user_name: 'Daniel')

nurse_application1 = FactoryBot.create(:application, job: nurse_job, user_name: 'Olivia')
nurse_application2 = FactoryBot.create(:application, job: nurse_job, user_name: 'James')


# CREATE JOB EVENTS

FactoryBot.create(:job_activated_event, job: chef_job)
FactoryBot.create(:job_deactivated_event, job: chef_job)
FactoryBot.create(:job_activated_event, job: chef_job)

FactoryBot.create(:job_activated_event, job: teacher_job)

FactoryBot.create(:job_activated_event, job: nurse_job)
FactoryBot.create(:job_deactivated_event, job: nurse_job)

# CREATE APPLICATION EVENTS

# Emily (Chef job)
FactoryBot.create(:application_interview_event, application: chef_application1, interview_date: 1.week.ago)
FactoryBot.create(:application_note_event, application: chef_application1, content: 'Emily has excellent cooking skills')
FactoryBot.create(:application_hired_event, application: chef_application1, hired_at: 1.day.ago)

# Michael (Chef job)
FactoryBot.create(:application_interview_event, application: chef_application2, interview_date: 2.days.ago)
FactoryBot.create(:application_note_event, application: chef_application2, content: 'Michael has good experience but needs more training')
FactoryBot.create(:application_rejected_event, application: chef_application2)

# Sophia (Teacher job)
FactoryBot.create(:application_interview_event, application: teacher_application1, interview_date: 3.days.ago)
FactoryBot.create(:application_note_event, application: teacher_application1, content: 'Sophia is highly qualified for the teaching position')

# Daniel (Teacher job)
FactoryBot.create(:application_interview_event, application: teacher_application2, interview_date: 1.week.ago)
FactoryBot.create(:application_note_event, application: teacher_application2, content: 'Daniel needs to improve his teaching techniques')
FactoryBot.create(:application_rejected_event, application: teacher_application2)

# Olivia (Nurse job)
FactoryBot.create(:application_interview_event, application: nurse_application1, interview_date: 4.days.ago)
FactoryBot.create(:application_note_event, application: nurse_application1, content: 'Olivia is very experienced and compassionate')
FactoryBot.create(:application_hired_event, application: nurse_application1, hired_at: 2.days.ago)

# James (Nurse job)
FactoryBot.create(:application_interview_event, application: nurse_application2, interview_date: 5.days.ago)
FactoryBot.create(:application_note_event, application: nurse_application2, content: 'James has potential but needs more practical experience')