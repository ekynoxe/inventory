namespace :db do
  desc "Create the default activities for the ativity log"
  task :populate => :environment do
    Activity.create(:id=>1,:name=>"New device")
    Activity.create(:id=>2,:name=>"Device borrowed")
    Activity.create(:id=>3,:name=>"Device lent")
    Activity.create(:id=>4,:name=>"Device holder changed")
    Activity.create(:id=>5,:name=>"Device project changed")
    Activity.create(:id=>7,:name=>"Device comments changed")
  end
end