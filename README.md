
# Eta Dialogue Manager:

## Dependencies

Eta minimally requires a Lisp installation to run; [Steel Bank Common Lisp](http://www.sbcl.org) is recommended. Some avatars support specialized behavior that requires additional dependencies (see below). 

## How to run

Start SBCL in the top level directory, and select an avatar by entering `(defparameter *agent-id* <agent_id>)`, replacing
`<agent_id>` with a string corresponding to an avatar name, e.g., `"sophie"`. See below for all supported avatars. Ensure
that the required dependencies for the chosen avatar are all satisfied.

If desired, the avatar configuration can be modified by editing the corresponding configuration file in `config/`. This will
usually not be necessary, as the defaults define the intended behavior for each avatar.

To begin, enter `(load "start.lisp")`. The dialogue will then begin using the top-level schema of the chosen avatar. Eta
supports two modes of interaction by default: text input and audio input. The former can simply be entered into the command
line following an utterance from Eta. The latter should be written to `io/<agent_id>/in/Audio.lisp` as
`(setq *input* '((^you say-to.v ^me "Input here")))`, where `"Input here"` corresponds to whichever text is being piped to the system
(e.g., by an audio speech recognition program).

In either case, the system will output its responses both to the command line (along with debug messages displaying the
gist clause and logical forms extracted from the user input), as well as `io/output.txt`. Each utterance in the
latter file is on a newline and preceeded by `#` for system utterances, and `*` (along with dummy text) for a prompt
to listen for the user. This is intended to be used in conjunction with a text-to-speech program.

For each connected perception or specialist subsystem apart from Audio (as defined in an avatar's config file), the system
creates additional IO files for communication between Eta and the subsystem in `io/<agent_id>/in/` and `io/<agent_id>/out/`.
Inputs to any input file should be written as `(setq *input* '(<query1> <query2> ...))`, where `<query1>`, `<query2>`, etc.
are unscoped logical form (ULF) formulas that can be interpreted by Eta. Likewise, outputs are written to the corresponding
files as `(setq *output* '(<query1> <query2> ...))`, where the queries are ULF formulas that can be interpreted by the subsystem.

Full logs of the conversation are also maintained in `io/<agent_id>/conversation-log/`, displaying the text of all user and
system utterances, as well as any extracted gist-clauses or ULF formulas corresponding to each turn.

## Supported avatars

### david-qa

The david-qa avatar is able to hold collaborative question-answering dialogues in a physical 'blocks world' domain, where a user
may move around blocks on the table and ask the system questions about both the current and past states of the blocks. This avatar works in conjunction with a blocks world perceptual subsystem (i.e., vision and block tracking system) and a spatial reasoning system
that quantitatively models spatial relationships.

Without interacting with these subsystems through the corresponding IO files, the
capabilities of the david-qa avatar are limited only to semantic understanding (i.e., production of ULF formulas representing the
meaning of the user's questions); it will not be able to give meaningful answers to questions without the required subsystems.

<!-- TODO: give more detail on the specific queries that are supported in inputs/outputs -->

#### Dependencies

* [Quicklisp](https://www.quicklisp.org/beta/)
* [ASDF version 3 or above](https://asdf.common-lisp.dev/archives/asdf.lisp)
* [TTT](https://github.com/genelkim/ttt)
* [ulf-lib](https://github.com/genelkim/ulf-lib)
* [ulf2english](https://github.com/genelkim/ulf2english)
* [ulf-pragmatics](https://github.com/genelkim/ulf-pragmatics)
* [timegraph](https://github.com/bkane2/timegraph)

Follow the READMEs for installing each required package.

### sophie

The sophie avatar is intended to act as a virtual cancer patient, for use in helping doctors practice breaking bad news to
patients. The system is still in active development, so may sometimes fail to understand the user. In such cases, the avatar will
ask the user to clarify a few times, before moving on with the conversation.

The system's outputs may also include emotion tags (currently limited to `[NEUTRAL]`, `[HAPPY]`, or `[SAD]`), intended to provide a
signal to the avatar to select appropriate behavior.

### sophie-feedback

The sophie-feedback avatar is intended to be used in conjunction with the sophie avatar, on a separate process. At each turn of a sophie dialogue, the gist-clause extracted from the user's utterance is concatenated to the gist-clause of sophie's preceeding utterance, with a `[SEP]` token between the two gist-clauses. This string is given to the sophie-feedback avatar as input, and the
avatar then outputs some piece of feedback on that turn (for instance, suggestions for open-ended questions the user might have asked).



