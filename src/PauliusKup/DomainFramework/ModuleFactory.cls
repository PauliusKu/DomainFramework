BLOCK-LEVEL ON ERROR UNDO, THROW.

USING PauliusKup.DomainFramework.Impl.DomainMode.
USING PauliusKup.DomainFramework.Impl.RepositoryMode.
USING PauliusKup.DomainFramework.Impl.SetupError.
USING PauliusKup.DomainFramework.Mock.IDomainMock.
USING PauliusKup.DomainFramework.Mock.IRepositoryMock.
USING PauliusKup.DomainFramework.ModuleFactory.
USING Progress.Lang.Error.

CLASS PauliusKup.DomainFramework.ModuleFactory ABSTRACT:
  DEFINE PROTECTED STATIC VARIABLE eDomainMode AS DomainMode NO-UNDO.
  DEFINE PROTECTED STATIC VARIABLE eRepoMode AS RepositoryMode NO-UNDO.

  DEFINE PROTECTED STATIC VARIABLE oDomainMock AS IDomainMock NO-UNDO.
  DEFINE PROTECTED STATIC VARIABLE oRepositoryMock AS IRepositoryMock NO-UNDO.

  DEFINE PROTECTED STATIC VARIABLE cDomainConfigFile AS CHARACTER NO-UNDO.
  DEFINE PROTECTED STATIC VARIABLE cRepositoryConfigFile AS CHARACTER NO-UNDO.

  // { PauliusKup/DomainFramework/globalConfig.i }

  CONSTRUCTOR STATIC ModuleFactory():
    ModuleFactory:eDomainMode = DomainMode:Include.
    ModuleFactory:eRepoMode = RepositoryMode:Include.
  END.

  METHOD PUBLIC STATIC VOID SetDomainModeConfig(pcFileName AS CHARACTER):
    ModuleFactory:eDomainMode = DomainMode:Config.
    ModuleFactory:cDomainConfigFile = pcFileName.
  END.

  METHOD PUBLIC STATIC VOID SetRepoModeConfig(pcFileName AS CHARACTER):
    ModuleFactory:eRepoMode = RepositoryMode:Config.
    ModuleFactory:cRepositoryConfigFile = pcFileName.
  END.

  METHOD PUBLIC STATIC VOID SetDomainModeMock(poDomainMock AS IDomainMock):
    ModuleFactory:eDomainMode = DomainMode:Mock.
    ModuleFactory:oDomainMock = poDomainMock.
  END.

  METHOD PUBLIC STATIC VOID SetRepoModeMock(poRepositoryMock AS IRepositoryMock):
    ModuleFactory:eRepoMode = RepositoryMode:Mock.
    ModuleFactory:oRepositoryMock = poRepositoryMock.
  END.


  METHOD PROTECTED STATIC CHARACTER GetServiceFromConfig(pcName AS CHARACTER):
    RETURN "TODO".
  END.

  METHOD PROTECTED STATIC CHARACTER GetDomainFromConfig(pcName AS CHARACTER):
    RETURN "TODO".
  END.
END.