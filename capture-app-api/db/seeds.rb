# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
#
#



25.times do
  siobhan = User.find(1)
  job = siobhan.jobs.sample
  company = job.company
  Note.create(
    title: "#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
    content: "#{Faker::Hacker.say_something_smart} #{Faker::Hipster.paragraph(2, false, 4)}",
    user_id: 1,
    job_id: job.id,
    company_id: company.id
  )
end

job_number = 5*Job.all.length
job_number.times do
  siobhan = User.find(1)
  job=siobhan.jobs.sample
  company=job.company
  Note.create(
    title: "#{company.name} — #{Faker::Job.field} (#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun})",
    content: "#{Faker::Job.field} — #{Faker::Job.key_skill}, #{Faker::Job.key_skill}, +  #{Faker::Job.key_skill}. #{Faker::Hipster.paragraph(2, false, 4)}",
    user_id: 1,
    job_id: job.id,
    company_id: company.id
  )
end

industryOptions=["Advertising and Agencies", "Architecture", "Arts and Music", "Client Services", "Consulting",  "Education", "Entertainment & Gaming", "Fashion and Beauty", "Finance", "Food", "Government", "Healthcare", "Law", "Media", "Real Estate & Construction", "Social Good", "Social Media", "Tech", "Travel and Hospitality"]

categoryOptions=["Account Management", "Business & Strategy", "Creative & Design", "Customer Service", "Data Science", "Editorial", "Education", "Engineering", "Finance", "Fundraising & Development", "Healthcare & Medicine", "HR & Recruiting", "Legal", "Marketing & PR", "Operations", "Project & Product Management", "Retail", "Sales", "Social Media & Community"]


# Bookmark.create(
#   title: "More tech companies sue FCC over net neutrality",
#   url: "https://mashable.com/2018/03/05/tech-companies-sue-fcc-net-neutrality-foursquare-etsy-kickstarter/",
#   user_id: 1,
#   company_id: 13
# )
#
# Bookmark.create(title:'How the net neutrality repeal will hurt small businesses -- including anyone who sells things on sites like Etsy', url: "https://www.businessinsider.com/tim-ryan-how-fcc-net-neutrality-repeal-hurt-small-business-trump-2017-12", user_id: 1, company_id: 13)
#
# Bookmark.create(
#   title: "Uber's Vetting Expert Tells Jury Waymo Engineer Deal Was Rushed - Bloomberg",
#   url: "https://www.bloomberg.com/news/articles/2018-02-08/uber-s-vetting-expert-tells-jury-waymo-engineer-deal-was-rushed",
#   user_id: 1,
#   company_id: 15
# )
#
# Bookmark.create(
#   title: "Former Uber CEO Travis Kalanick is scheduled to testify Tuesday in the Waymo vs. Uber trial",
#   url: "https://www.businessinsider.com/former-uber-ceo-travis-kalanick-to-testify-in-waymo-trial-2018-2",
#   user_id: 1,
#   company_id: 15
# )





# # Company.create(name:"Facebook", size:"large", location: "Menlo Park, CA", description: "Facebook is the largest social media network, enabling over a billion users to openly connect with friends and family, share content, and discover the world.", museId: 659, twitter: "facebook", image_link: "https://pilbox.themuse.com/image.jpg?url=https%3A%2F%2Fassets.themuse.com%2Fuploaded%2Fcompanies%2F659%2Fabout_modules%2F9538%2Fd9b76611-1618-40af-942f-32c8389761e7.jpg&h=135&w=183")
# #
# # Company.create(
# #   name: "Patreon",
# #   size: "medium",
# #   location: "San Francisco, CA",
# #   description: "Patreon gives artists, creators, and makers business tools to run subscription content services that allow them to get paid on a regular basis.",
# #   museId: 1570,
# #   image_link: "https://pilbox.themuse.com/image.jpg?url=https%3A%2F%2Fassets.themuse.com%2Fuploaded%2Fcompanies%2F1570%2Fabout_modules%2F10629%2F720a9808-5dd0-4506-98ff-5c8a203d5df6.jpg&h=135&w=183")
# #
# #   Company.create(
# #     name: "Dun & Bradstreet",
# #     size: "medium",
# #     location: "Austin, TX",
# #     description: "Dun & Bradstreet helps grow valuable business relationships by uncovering important patterns in industry data and delivering analytical insight to its global network of customers and partners.",
# #     museId: 820,
# #     image_link: "https://pilbox.themuse.com/image.jpg?url=https%3A%2F%2Fassets.themuse.com%2Fuploaded%2Fcompanies%2F820%2Fpages%2F1043%2Ff1.jpg&h=135&w=183")
# #
# # Company.create(
# #   name:"Dormify",
# #   size: "small",
# #   location: "New York City, NY",
# #   "description": "Dormify creates and curates beautiful designed dorm products for stylish and fashion-minded collegians.",
# #   museId: 182,
# #   twitter: "dormify",
# #   image_link: "https://pilbox.themuse.com/image.jpg?url=https%3A%2F%2Fassets.themuse.com%2Fuploaded%2Fcompanies%2F182%2Fabout_modules%2F4644%2F16b191d0-7524-4344-be15-03d1c99c0535.jpg&h=135&w=183"
# # )
# #
# # Company.create(
# #   name: "Fresh Digital Group",
# #   size: "small",
# #   location: "New York City, NY",
# #   description: "With an unparalleled mastery of true digital creative, Fresh Digital Group generates unique marketing solutions and strategies to improve the digital life of its clients’ products.",
# #   museId: 1137,
# #   twitter: "freshdigitalgrp",
# #   image_link: "https://pilbox.themuse.com/image.jpg?url=https%3A%2F%2Fassets.themuse.com%2Fuploaded%2Fcompanies%2F1137%2Fmodules%2F4584%2Fasset1.jpg&h=135&w=183"
# # )
# #
# # Company.create(
# #   name: "DOAR",
# #   size: "medium",
# #   location: "Los Angeles, CA",
# #   description: "For the last 25 years, DOAR has set the bar in legal strategy consulting and trial presentation through an unparalleled commitment to clients success.",
# #   museId: 1204,
# #   twitter: "DOARLitigation",
# #   image_link: "https://pilbox.themuse.com/image.jpg?url=https%3A%2F%2Fassets.themuse.com%2Fuploaded%2Fcompanies%2F1204%2Fmodules%2F4507%2Fasset1.jpg&h=135&w=183"
# # )
# #
# # Job.create(
# #   title: "Social Media Coordinator Internship",
# #   date_published: "2017-07-07T18:45:37.379644Z",
# #   contents: "<p><strong>Company Description</strong></p>
# # <p>As a producers of world-class digital products, FRSH is the premiere experienced voice interaction design and development studio. We have 400+ skills between Google Home, Alexa, and Cortana live.</p>
# # <p><strong>Job Description</strong></p>
# # <p>Fresh Digital Group (FRSH) is looking for a Social Media Coordinator Intern. To thrive in this role you will need to be able to work well independently,  have strong communication skills- both verbally and written, and be an organized forward-thinker. We are looking for a self-motivated individual with a great attitude who is looking to contribute to the growth of our company and our keep up with our thought leader social presence. The right candidate will play an integral part in the future expansion of our company.</p>
# # <p>The perfect candidate must be a polished and confident communicator. You not only grasp how our digital product design and development capabilities can transform a  client’s business, but you are also passionate about digital and voice assistants personally. You bring a willingness to understand our unique offering in the market, along with our distinct processes and workflow.</p>
# # <p><strong>Responsibilities</strong>:</p>
# # <ul>
# # <li>Implement and maintain online marketing strategies through social media.</li>
# # <li>Use various forms of new media, such as blogging, social networking sites, chat rooms, discussion boards, wikis, RSS feeds, and search platforms to help represent the company through an online channel.</li>
# # <li>Show an interest in learning about a product when consumers “like” a business’s page on Facebook or other sites to gain better insights into a brand.</li>
# # <li>Maintain an up-to-date presence in order to INCREASE readers and GROW a following.</li>
# # <li>Collaborate across internal cross-functional teams to write, proofread, and format materials.</li>
# # <li>Assist in case studies when necessary.</li>
# # <li>Track business trends and spot opportunities to target potential client partners across a variety of industries based on consumer activity on social platforms.</li>
# # <li>Engage with a community of fans/followers online regularly.</li>
# # <li>VERY strong writing skills with the ability to write engaging content for various audiences.</li>
# # <li>Have a sense of humor, quick-wittiness, and seek creativity of thought when applicable.</li>
# # </ul>
# # <p><strong>Qualifications</strong>:</p>
# # <ul>
# # <li>Students pursuing BA/BS preferred. MBA degree candidates are highly desirable.</li>
# # <li>Some experience navigating through startups</li>
# # <li>Was part of at least one or two recent roles where the candidate played social media or marketing role</li>
# # <li>Tech savvy with a passion for mobile technologies, innovation, and emerging categories</li>
# # <li>Ability to market to small and big  businesses and not afraid to network</li>
# # <li>Entrepreneurial spirit with thirst to be a part of a great opportunity</li>
# # <li>Works well under pressure/short deadlines and able to interact well with Sr. leadership</li>
# # </ul>
# # <p><strong>(Additional Information)</strong></p>
# # <p><strong>What FRSH offers:</strong></p>
# # <ul>
# # <li>One on one mentoring</li>
# # <li>Access to Sr. leadership</li>
# # <li>Professional skills building</li>
# # <li>Strong cross industry network development</li>
# # <li>Action plan for career goals</li>
# # <li>Multiple Routes to Leadership</li>
# # <li>Real opportunity for accelerated growth</li>
# # <li>Additional information</li>
# # </ul>
# # <p>*This starts as unpaid, and could be a semester-long internship or become paid sooner. We are hoping you are the best opportunity for hire. A very flexible schedule 3/5 days a week. College credit is offered. Qualified graduates will be considered for a full-time position upon completion of internship.</p>
# # <p>If you feel like you are a good fit, you must include any relevant projects and your cover letter, where you tell us a little about yourself and why you think you’d be a great addition to our team!*</p>
# # <p><strong><em>All your information will be kept confidential according to EEO guidelines.</em></strong></p>",
# #   museId: 111364,
# #   company_museId:
# #   location: "New York City, NY",
# #   level: "intern",
# #   date_saved: DateTime.now,
# #   applied_status: false,
# #   company_id: 1
# # )
# #
# # Job.create(
# #   title: "Visual Communications Consultant",
# #   date_published: "2018-01-31T21:50:07.055977Z",
# #   contents: "<p>We are currently seeking a Consultant to join the Professional Services Firm at DOAR. The Consultant is responsible for the coordination, project management and design consulting related to the creation of electronic and static demonstrative exhibits. The Consultant will work directly with clients to identify key areas of their case that could be aided by persuasive visual techniques and work directly with Graphic Designers to design and develop such presentations.</p>
# # <p>Primary Responsibilities:</p>
# # <p>• Work with clients to develop the best visual approaches to advance their case strategy by applying critical thought and analytical skill to the development and use of litigation graphics.<br/>
# # • Collaborate with internal Graphic Designers to most effectively create visual presentations that support the overall case strategy and meet specific case needs.<br/>
# # • Collaborate with Jury Consultants on the development of visual presentations to support focus group and mock trial research events.<br/>
# # • Critical reading and comprehension of case materials with an eye toward graphic recommendations.<br/>
# # • Develop and present graphics to clients while providing strategic recommendations<br/>
# # • Ability to provide coaching regarding style and effective communication when using visual demonstratives.<br/>
# # • Manage day-to-day activities of graphic project teams as required by each engagement.<br/>
# # • Participate in sales pitch meetings with potential new clients.<br/>
# # • Forge, manage, and maintain high-level relationships with clients.<br/>
# # • Enhance operational effectiveness of team by emphasizing cost containment, timely service, high productivity and high quality.<br/>
# # • Increasingly positioned as lead consultant on small to medium-sized client engagements and responsible for managing client relationships.</p>
# # <p>Job Requirements:</p>
# # <p>• Successfully develops and manages high-level relationships with clients.<br/>
# # • Strong project management, consultative, presentation and interpersonal skills.<br/>
# # • Broad understanding of the breadth of all the company’s consulting services.<br/>
# # • Ability to work additional hours as needed and travel to various client sites.<br/>
# # • Ability to work in a fast-paced, deadline-driven environment while handling multiple tasks through completion.<br/>
# # • Ability to take initiative and understand tasks quickly with minimal supervision.<br/>
# # • Ability to forge and maintain internal/external client relationships.<br/>
# # • Must be comfortable with public speaking and be able to present a credible image in front of clients.<br/>
# # • Team-player able to maintain positive interpersonal relationships in the workplace.<br/>
# # • Familiarity with PowerPoint (or willingness to learn).<br/>
# # • Excellent communication skills.<br/>
# # • Minimum of five years’ experience in a consultative client facing role.<br/>
# # • Bachelor’s Degree required, post graduate degree preferred.</p>",
# #   museId: 1007635,
# #   location: "New York City, NY",
# #   level: "mid",
# #   date_saved: DateTime.now,
# #   applied_status: false,
# #   company_id: 7
# # )
# #
# # Job.create(
# #   title: "Graphic Designer",
# #   date_published: "2017-08-01T19:23:20.905497Z",
# #   contents: "<p><strong>Overview:</strong><br/>Dormify is looking for a driven, creative and talented Junior Graphic Designer to join our team. This person will work closely with our Co-founder/Creative Director and Brand Manager as well as Dormify’s Marketing Team and Art Director to create and deliver world-class digital, on-brand designs, social assets and ads for use across multiple channels, including email, display and social. Additionally, this person will work with our co-founder on product design, merchandising, photography, and photo editing. At Dormify, we all wear a lot of hats :) This is a critical design role as these assets will directly drive revenue and customer acquisition for the business.  (So a craving for constant innovation and a learn-as-you-go attitude are key!)</p><p><strong>Responsibilities:</strong></p><ul><li>Provide principle design support to Creative Director</li><li>Interpret and develop Dormify’s existing brand as it shows up on paid, organic social
# #   museId: 984948,
# #   location:"Los Angeles, CA",
# #   level: "senior",
# #   date_saved: DateTime.now,
# #   applied_status: false,
# #   company_id: 1
# # )
# #
# #
# #
# # Job.create(
# #   title: "Applied Research Scientist, Core Machine Learning",
# #   date_published:"2017-12-15T23:24:15.645283Z",
#   contents: "<p>(Menlo Park, CA - New York, NY)<br><br>Facebook's mission is to give people the power to build community and bring the world closer together. Through our family of apps and services, we're building a different kind of company that connects billions of people around the world, gives them ways to share what matters most to them, and helps bring people closer together. Whether we're creating new products or helping a small business expand its reach, people at Facebook are builders at heart. Our global teams are constantly iterating, solving problems, and working together to empower people around the world to build community and connect in meaningful ways. Together, we can help people build stronger communities - we're just getting started. <br><br>We are looking for experienced applied researchers in machine learning and AI with strong software engineering skills. The Core Machine Learning Team is part of the Applied Machine Learning organization. The team carries out app,
# #   museId: 899083,
# #   location: "Menlo Park, CA",
# #   level: "mid",
# #   date_saved: DateTime.now,
# #   applied_status: false,
# #   company_id: 1
# # )
# #
# # industries = ["Client Services", "Tech", "Engineering", "Social Media", "Consumer", "Consulting", "Advertising and Agencies"]
# #
# # industries.each do |i|
# #   Industry.create(name: i)
# # end
# #
# # Company.all.each do |c|
# #   2.times do
# #     CompanyIndustry.create(company_id: Company.all.sample.id, industry_id: Industry.all.sample.id)
# #   end
# # end
# #
# #
# # categories = ["Software Engineering", "Creative & Design", "Editorial", "Marketing & PR", "Social Media & Community", "Legal", "Project & Product Management"]
# #
# # categories.each do |i|
# #   Category.create(name: i)
# # end
# #
# # Job.all.each do |j|
# #   category = Category.all.sample
# #   2.times do
# #     JobCategory.create(job_id: j.id, category_id:Category.all.sample.id)
# #   end
# #   category.jobs << j
# # end
#
# # aJob = Job.create(
# #   title: "Server Engineer",
# #   date_published: "2018-01-10T07:34:21.820946Z",
# #   contents: "<strong>Somewhere along the way, CRM got really hard to use. We're changing that. ProsperWorks was built with three basic principles in mind: keep it simple, show what matters, and make it actionable. </strong>",
# #   museId: 788517,
# #   location: "San Francisco, CA",
# #   level: "Entry Level",
# #   date_saved: DateTime.now,
# #   applied_status: false,
# #   company: {
# #     name: "ProsperWorks",
# #     size: "Medium Size",
# #     location: "San Francisco, CA",
# #     description: "ProsperWorks provides a customer relationship management—CRM—system that makes work easier for sales teams.",
# #     museId: 1516,
# #     image_link: "https://pilbox.themuse.com/image.jpg?url=https%3A%2F%2Fassets.themuse.com%2Fuploaded%2Fcompanies%2F1516%2Fabout_modules%2F10207%2F2b0a3268-4f26-454e-b46f-ad7e33a4100f.jpg&h=135&w=183"
# #   }
# # )
