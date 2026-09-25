BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Progress.Lang.AppError.
USING PauliusKup.DomainFramework.Impl.SetupError.

CLASS PauliusKup.DomainFramework.Impl.SetupError INHERITS AppError:
  CONSTRUCTOR PUBLIC SetupError(pcMessage AS CHARACTER):
    SUPER(pcMessage, 1).
  END CONSTRUCTOR.
END CLASS.