SELECT *
  FROM [sif].[StudentPersonal] sp
  join [sif].[Personinfo] ps on ps.Id = sp.PersonInfoId
  join [sif].[StudentContactRelationship] scr on scr.StudentPersonalId = sp.Id
  join [sif].[CodeItem] ci on ci.Id = scr.RelationshipCodeItemId
  join [sif].[StudentContactPersonal] scp on scp.Id = scr.StudentContactPersonalId
  join [sif].[Personinfo] p on p.Id = scp.PersonInfoId
WHERE sp.PsId = 2469


/* Oracle equivalence query
select * 
from students sp 
join person ps on ps.Id = sp.Person_Id
join studentcontactassoc sca on sca.StudentDcid = sp.Dcid
join studentcontactdetail scd ON scd.studentcontactassocid = sca.studentcontactassocid and ( scd.startdate IS NULL OR scd.startdate <= current_date ) AND ( scd.enddate IS NULL OR scd.enddate >= trunc(current_date) )
JOIN codeset ci on ci.codesetid = scd.relationshiptypecodesetid
join person pc ON pc.id = sca.personid
where sp.Dcid = 2469

[sif].[StudentPersonal].PsId == students.Id
[sif].[Personinfo].PsId == person.Id
[sif].[StudentContactRelationship].pSiD == studentcontactassoc.StudentContactAssocId,  sif.StudentContactRelationship sca join studentcontactdetail scd ON scd.studentcontactassocid = sca.studentcontactassocid
[sif].[CodeItem].Number == codeset.CodeSetId
[sif].[StudentContactPersonal] -- uses person.Id
[sif].[Personinfo].PsId == person.Id
*/

SELECT *
  FROM [sif].[StudentPersonal] sp
  join [sif].[Personinfo] ps on ps.Id = sp.PersonInfoId
  join [sif].[StudentContactRelationship] scr on scr.StudentPersonalId = sp.Id
  join [sif].[CodeItem] ci on ci.Id = scr.RelationshipCodeItemId
  join [sif].[StudentContactPersonal] scp on scp.Id = scr.StudentContactPersonalId
  join [sif].[Personinfo] pc on pc.Id = scp.PersonInfoId

  join [sif].[PersonInfo_Address] psa on psa.PersonInfoId = pc.Id
  join [sif].[CodeItem] cia on cia.Id = psa.TypeCodeItemId
  join [sif].[Address] a on a.Id = psa.AddressId
WHERE sp.PsId = 2469

/* Oracle equivalence query
select * 
from students sp 
join person ps on ps.Id = sp.Person_Id
join studentcontactassoc sca on sca.StudentDcid = sp.Dcid
join studentcontactdetail scd ON scd.studentcontactassocid = sca.studentcontactassocid and ( scd.startdate IS NULL OR scd.startdate <= current_date ) AND ( scd.enddate IS NULL OR scd.enddate >= trunc(current_date) )
JOIN codeset ci on ci.codesetid = scd.relationshiptypecodesetid
join person pc ON pc.id = sca.personid

--join contact's addesses
join personaddressassoc paa on paa.PersonId = pc.id
join personaddress pa on pa.personaddressid = paa.personaddressid
  and (  paa.startdate is null or (paa.startdate is not null and paa.startdate <= current_date) )
  and (  paa.enddate is null or (paa.enddate is not null and current_date <= paa.enddate))
join codeset addresstype on addresstype.codesetid = paa.addresstypecodesetid
join codeset statecode on statecode.codesetid = pa.statescodesetid

where sp.Dcid = 2469 

[sif].[PersonInfo_Address].PsId == personaddressassoc.PersonAddressAssocId 
[sif].[Address].PsId == personaddress.PersonAddressId

*/

SELECT *
  FROM [sif].[StudentPersonal] sp
  join [sif].[Personinfo] ps on ps.Id = sp.PersonInfoId
  join [sif].[StudentContactRelationship] scr on scr.StudentPersonalId = sp.Id
  join [sif].[CodeItem] ci on ci.Id = scr.RelationshipCodeItemId
  join [sif].[StudentContactPersonal] scp on scp.Id = scr.StudentContactPersonalId
  join [sif].[Personinfo] pc on pc.Id = scp.PersonInfoId

  join [sif].[PersonInfo_Phone] psa on psa.PersonInfoId = pc.Id
  --join [sif].[CodeItem] cia on cia.Id = psa.TypeCodeItemId
  join [sif].[Phone] a on a.Id = psa.PhoneId
WHERE sp.PsId = 2469

/* Oracle equivalence query
select * 
from students sp 
join person ps on ps.Id = sp.Person_Id
join studentcontactassoc sca on sca.StudentDcid = sp.Dcid
join studentcontactdetail scd ON scd.studentcontactassocid = sca.studentcontactassocid and ( scd.startdate IS NULL OR scd.startdate <= current_date ) AND ( scd.enddate IS NULL OR scd.enddate >= trunc(current_date) )
JOIN codeset ci on ci.codesetid = scd.relationshiptypecodesetid
join person pc ON pc.id = sca.personid

--join contact's phones
join personphonenumberassoc paa on paa.PersonId = pc.id
join codeset phonetype on phonetype.codesetid = paa.phonetypecodesetid
join phonenumber pa on pa.phonenumberid = paa.phonenumberid

where sp.Dcid = 2469  

[sif].[PersonInfo_Phone].PsId == personaddressassoc.PersonPhoneNumberAssocId 
[sif].[Phone].PsId == phonenumber.PhoneNumberId

*/

SELECT *
  FROM [sif].[StudentPersonal] sp
  join [sif].[Personinfo] ps on ps.Id = sp.PersonInfoId
  join [sif].[StudentContactRelationship] scr on scr.StudentPersonalId = sp.Id
  join [sif].[CodeItem] ci on ci.Id = scr.RelationshipCodeItemId
  join [sif].[StudentContactPersonal] scp on scp.Id = scr.StudentContactPersonalId
  join [sif].[Personinfo] pc on pc.Id = scp.PersonInfoId

  join [sif].[PersonInfo_Email] psa on psa.PersonInfoId = pc.Id
  join [sif].[CodeItem] cia on cia.Id = psa.TypeCodeItemId
  join [sif].[Email] a on a.Id = psa.EmailId
WHERE sp.PsId = 2469

/* Oracle equivalence query
select * 
from students sp 
join person ps on ps.Id = sp.Person_Id
join studentcontactassoc sca on sca.StudentDcid = sp.Dcid
join studentcontactdetail scd ON scd.studentcontactassocid = sca.studentcontactassocid and ( scd.startdate IS NULL OR scd.startdate <= current_date ) AND ( scd.enddate IS NULL OR scd.enddate >= trunc(current_date) )
JOIN codeset ci on ci.codesetid = scd.relationshiptypecodesetid
join person pc ON pc.id = sca.personid

--join contact's emails
join personemailaddressassoc paa on paa.PersonId = pc.id
join emailaddress pa on pa.emailaddressid = paa.emailaddressid
join codeset emailtype on emailtype.codesetid = paa.emailtypecodesetid

where sp.Dcid = 2469  

[sif].[PersonInfo_Email].PsId == personemailaddressassoc.PersonEmailAddressAssocId 
[sif].[Email].PsId == emailaddress.EmailAddressId

*/