// Identify proteins with immune system functions that are involved in SARS-CoV-2 pathways
MATCH (p:Protein)-[:INVOLVED_IN]->(pathway:Pathway)
WHERE pathway.name CONTAINS "SARS-CoV-2"
MATCH (p)-[:ANNOTATED_WITH]->(go:GO)
WHERE go.name CONTAINS "immune" OR go.name CONTAINS "cytokine" OR go.name CONTAINS "inflammation"
RETURN DISTINCT p, go, pathway // alt for visual: RETURN DISTINCT p, go, pathway
LIMIT 50

// Find SARS-CoV-2-related proteins that interact with metabolites 
MATCH (p:Protein)-[:INVOLVED_IN]->(pathway:Pathway)
WHERE pathway.name CONTAINS "SARS-CoV-2"
MATCH (p)-[:ASSOCIATED_WITH]->(m:Metabolite)
RETURN DISTINCT p.name, m.name, pathway.name
LIMIT 30

// Find common pathways between SARS-CoV-2 and other respiratory viruses
MATCH (p:Protein)-[:INVOLVED_IN]->(pathway1:Pathway)
WHERE pathway1.name CONTAINS "SARS-CoV-2"
MATCH (p)-[:INVOLVED_IN]->(pathway2:Pathway)
WHERE (pathway2.name CONTAINS "influenza" OR pathway2.name CONTAINS "infection") 
      AND pathway1 <> pathway2
RETURN p.name, pathway1.name, pathway2.name //alt for visual: RETURN p, pathway1, pathway2 
