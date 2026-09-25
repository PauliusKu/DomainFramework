METHOD PUBLIC STATIC {2} Get{1}Service ():
  DEFINE VARIABLE service AS CLASS {2} NO-UNDO.

  CASE eDomainMode:
    WHEN DomainMode:Include THEN service = NEW {3} (
&IF "{4}" <> "" &THEN
      PauliusKup.DomainFramework.Example.ExampleModuleFactory:Get{1}Repository()
&ENDIF
).
    WHEN DomainMode:Config THEN service = DYNAMIC-NEW ModuleFactory:GetServiceFromConfig("{1}") ().
    WHEN DomainMode:Mock THEN service = CAST(ModuleFactory:oDomainMock:GetDomain("{2}"), "{2}").
  END.

  RETURN service.
  CATCH e AS Progress.Lang.Error:
    UNDO, THROW NEW SetupError("Domain setup is wrong for {1} with mode " + STRING(eDomainMode) + "! " + e:GetMessage(1)).
  END.
END METHOD.

&IF "{4}" <> "" &THEN
METHOD private STATIC {4} Get{1}Repository ():
    DEFINE VARIABLE repository AS CLASS {4} NO-UNDO.
    CASE eRepoMode:
      WHEN RepositoryMode:Include THEN repository = NEW {5} ().
      WHEN RepositoryMode:Config THEN repository = DYNAMIC-NEW ModuleFactory:GetDomainFromConfig("{1}") ().
      WHEN RepositoryMode:Mock THEN repository = CAST(ModuleFactory:oRepositoryMock:GetRepository("{4}"), "{5}").
    END.

    RETURN repository.

    CATCH e AS Progress.Lang.Error:
      UNDO, THROW NEW SetupError("Repository setup is wrong for {1} with mode " + STRING(eRepoMode) + "! " + e:GetMessage(1)).
    END.
  END METHOD.
&ENDIF