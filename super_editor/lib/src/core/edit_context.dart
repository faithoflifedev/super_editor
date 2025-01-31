import 'package:flutter/widgets.dart';
import 'package:super_editor/src/core/document.dart';
import 'package:super_editor/src/default_editor/common_editor_operations.dart';
import 'package:super_editor/src/default_editor/super_editor.dart';
import 'document_composer.dart';
import 'document_layout.dart';
import 'editor.dart';

/// Collection of core artifacts used to edit a document.
///
/// In particular, the context contains the [DocumentEditor],
/// [DocumentComposer], and [DocumentLayout].
/// In addition, [commonOps] are available for directly applying common, complex
/// changes to the document using the artifacts.
///
/// A [scrollController] can be passed to allow changes to the scroll position in
/// the viewport.
class SuperEditorContext {
  /// Creates an edit context that makes up a collection of core artifacts for
  /// editing a document.
  ///
  /// The [documentLayout] is passed as a [getDocumentLayout] callback that
  /// should return the current layout as it might change.
  SuperEditorContext({
    required this.editor,
    required this.document,
    required DocumentLayout Function() getDocumentLayout,
    required this.composer,
    required this.commonOps,
    this.scrollController,
  }) : _getDocumentLayout = getDocumentLayout;

  /// The editor of the [Document] that allows executing commands that alter the
  /// structure of the document.
  final Editor editor;

  final Document document;

  /// The document layout that is a visual representation of the document.
  ///
  /// This member might change over time.
  DocumentLayout get documentLayout => _getDocumentLayout();
  final DocumentLayout Function() _getDocumentLayout;

  /// The [DocumentComposer] that maintains selection and attributions to work
  /// in conjunction with the [editor] to apply changes to the document.
  final DocumentComposer composer;

  /// Common operations that can be executed to apply common, complex changes to
  /// the document.
  final CommonEditorOperations commonOps;

  /// [ScrollController] that's attached to the [Scrollable] that displays the
  /// [SuperEditor]'s content.
  ///
  /// If [SuperEditor] is within another [Scrollable] widget, it controlls
  /// the ancestor [Scrollable] instead of creating one itself. In that
  /// case, the [scrollController] is the one attached to the ancestor [Scrollable]
  /// if one is present, if not then the [ScrollController] passed to the [SuperEditor]
  /// is used.
  final ScrollController? scrollController;
}
