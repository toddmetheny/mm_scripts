require 'csv'

# will need to change the CSV file arguments each time
arr_of_arrs = CSV.read("Downloads/PatientList_2015-12-31.csv")

active_patients = 0

arr_of_arrs.each do |patient|
  if patient[18] == "Yes"
    active_patients += 1
  end
end

p "total active patients: #{active_patients}"

# will need to change the CSV file arguments each time
soap_visit_arr = CSV.read("Downloads/ChartNotesReport.csv")

# subtracting 12 bc that's how many soap notes are inappropriately marked
total_visits = soap_visit_arr.count - 12
p "total number of visits: #{total_visits}"

# find how many are unique bc unique visits are intakes
name_arr = []
soap_visit_arr.each do |visit|
  name_arr << visit[0]
end

intake_visits = name_arr.uniq.count - 12
p "intake visits: #{intake_visits}"

# difference b/w total and intake will be follow-up visits
p "follow up visits: #{total_visits - intake_visits}"