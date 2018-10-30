import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('.input-box-topic', {
    strings: ["Multiculturalism", "Osama Bin Laden", "9/11 Terrorist Attack", "2003 Invasion of Iraq", "Privatization of Social Security", "Political Corruption", "Conservatism in the USA", "Nuclear Weapons", "New World Order", "Barack Obama as President", "Black History Month", "Fair Taxation in America", "Efforts to Impeach George W. Bush", "American Economy and Recession", "Historical Controversial Issues", "The Holocaust Denials", "White Supremacy", "Native Americans in USA", "Feminism and Women's Rights", "Ku Klux Klan", "Capital Punishment", "Quebec Separatism", "Women in Military", "Genocide", "Racism", "U.S Civil War", "World War I & II", "Terrorism", "Atomic Bombing of Hiroshima and Nagasaki", "Issues Related to Medicine & Healthcare", "Human Cloning", "Stem Cells", "Genetically Modified Foods", "Mercy Killing or Euthanasia", "Vegetarianism", "Genetic Engineering", "Pro Life Movement", "Fad Diets and Health Concerns", "Steroids", "Assisted Suicide", "Alcohol Consumption", "AIDS: Acceptance and Denial", "Human Evolution", "Sperm Donor and Egg Donor", "Surrogacy", "Family & Society Related Issues", "Homelessness", "Adoption",  "Gay Rights", "LGBT Rights", "Unidentified Flying Objects", "Satanism", "Marijuana Legalization", "Paranormal Phenomena"],
    typeSpeed: 50,
    loop: true,
    shuffle: true,
    showCursor: true,
    cursorChar: '|',
    autoInsertCss: true
  });
}

export { loadDynamicBannerText };
