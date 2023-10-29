/*
Sources of Data (file name = DATA_SRC). 
Provides a citation to the DataSrc_ID in the Sources of Data Link file.

    Links to Nutrient Data file by NDB No. through the Sources of Data Link file

Field name    Type     Blank   Description
DataSrc_ID     A 6*      N     Unique ID identifying the reference/source.
Authors        A 255     Y     List of authors for a journal article or name of sponsoring organization for other documents.
Title          A 255     N     Title of article or name of document, such as a report from a company or trade association.
Year           A4        Y     Year article or document was published.
Journal        A 135     Y     Name of the journal in which the article was published.
Vol_City       A 16      Y     Volume number for journal articles, books, or reports; city where sponsoring organization is located.
Issue_State    A5        Y     Issue number for journal article; State where the sponsoring organization is located.
Start_Page     A5        Y     Starting page number of article/document.
End_Page       A5        Y     Ending page number of article/document.
* Primary key for the Sources of Data file.
*/

CREATE TABLE [IF NOT EXISTS] data_sources (
  datasrc_id     VARCHAR(6),
  authors        VARCHAR(255),
  title          VARCHAR(255),
  year           VARCHAR(4),
  journal        VARCHAR(135),
  vol_city       VARCHAR(16),
  issue_state    VARCHAR(5),
  start_page     VARCHAR(5),
  end_page       VARCHAR(5)
);

comment on column datasrc_id is 'Unique ID identifying the reference/source.';
comment on column authors is 'List of authors for a journal article or name of sponsoring organization for other documents.';
comment on column title is 'Title of article or name of document, such as a report from a company or trade association.';
comment on column year is 'Year article or document was published.';
comment on column journal is 'Name of the journal in which the article was published.';
comment on column vol_city is 'Volume number for journal articles, books, or reports; city where sponsoring organization is located.';
comment on column issue_state is 'Issue number for journal article; State where the sponsoring organization is located.';
comment on column start_page is 'Starting page number of article/document.';
comment on column end_page is 'Ending page number of article/document.';

comment on table data_sources is 'Provides a citation to the datasrc_id in the data_sources_link table.';
