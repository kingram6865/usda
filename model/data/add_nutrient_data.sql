/*
  Updates nutrient_definition with a notes column and then adds information about each individual amino acid.
  Notes is not a general column in the USDA data, and in general additional information about nutrients is not part of the dataset.
*/

ALTER TABLE nutrient_definition ADD COLUMN notes TEXT;

UPDATE nutrient_definition 
SET notes = 'Tryptophan is needed to maintain proper nitrogen balance and is a precursor to serotonin, a neurotransmitter that regulates your appetite, sleep and mood. https://pubchem.ncbi.nlm.nih.gov/compound/L-tryptophan'
WHERE nutr_no = '501';

UPDATE nutrient_definition 
SET notes = 'Threonine is a principal part of structural proteins such as collagen and elastin, which are important components of the skin and connective tissue. It also plays a role in fat metabolism and immune function. https://pubchem.ncbi.nlm.nih.gov/compound/L-threonine'
WHERE nutr_no = '502';

UPDATE nutrient_definition 
SET notes = 'Isoleucine is involved in muscle metabolism and is heavily concentrated in muscle tissue. It’s also important for immune function, hemoglobin production and energy regulation. https://pubchem.ncbi.nlm.nih.gov/compound/l-isoleucine'
WHERE nutr_no = '503';

UPDATE nutrient_definition 
SET notes = 'Leucine is a branched-chain amino acid that is critical for protein synthesis and muscle repair. It also helps regulate blood sugar levels, stimulates wound healing and produces growth hormones. https://pubchem.ncbi.nlm.nih.gov/compound/L-leucine'
WHERE nutr_no = '504';

UPDATE nutrient_definition 
SET notes = 'Lysine plays major roles in protein synthesis, hormone and enzyme production and the absorption of calcium. It’s also important for energy production, immune function and the production of collagen and elastin. https://pubchem.ncbi.nlm.nih.gov/compound/L-lysine'
WHERE nutr_no = '505';

UPDATE nutrient_definition 
SET notes = 'Methionine plays an important role in metabolism and detoxification. It’s also necessary for tissue growth and the absorption of zinc and selenium, minerals that are vital to your health. https://pubchem.ncbi.nlm.nih.gov/compound/L-methionine'
WHERE nutr_no = '506';

UPDATE nutrient_definition 
SET notes = 'Phenylalanine is a precursor for the neurotransmitters tyrosine, dopamine, epinephrine and norepinephrine. It plays an integral role in the structure and function of proteins and enzymes and the production of other amino acids. https://pubchem.ncbi.nlm.nih.gov/compound/L-phenylalanine'
WHERE nutr_no = '508';

UPDATE nutrient_definition 
SET notes = 'Valine is one of three branched-chain amino acids, meaning it has a chain branching off to one side of its molecular structure. Valine helps stimulate muscle growth and regeneration and is involved in energy production. https://pubchem.ncbi.nlm.nih.gov/compound/L-valine'
WHERE nutr_no = '510';

UPDATE nutrient_definition 
SET notes = 'Histidine is used to produce histamine, a neurotransmitter that is vital to immune response, digestion, sexual function and sleep-wake cycles. It’s critical for maintaining the myelin sheath, a protective barrier that surrounds your nerve cells. https://pubchem.ncbi.nlm.nih.gov/compound/L-histidine'
WHERE nutr_no = '512';