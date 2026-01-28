Summary

This PR demonstrates the practical difference between StatelessWidget and StatefulWidget in Flutter through a simple interactive demo app.

The implementation includes:

A StatelessWidget used for rendering static UI content (app title/header)

A StatefulWidget used for managing dynamic state and user interaction

A clear separation between static and reactive parts of the UI

Documentation and screenshots explaining how state changes affect the widget tree

🧱 Implementation Overview

StatelessWidget

Displays a static header text that does not change during runtime

Rebuilds only if its parent widget rebuilds

StatefulWidget

Manages a mutable state (counter value)

Uses setState() to update the UI in response to user interaction

Demonstrates Flutter’s reactive UI model

The demo is implemented in:

lib/screens/stateless_stateful_demo.dart

🖼️ Screenshots

📸 (Attach screenshots here)

Initial UI state (default counter value)

Updated UI after user interaction (incremented counter)

💡 Reflection / Learnings

This exercise helped me clearly understand how Flutter separates UI description from state management.

Key takeaways:

Stateless widgets are ideal for static, reusable UI components

Stateful widgets enable dynamic behavior by reacting to state changes

setState() triggers a rebuild only for the affected widget subtree, making updates efficient

Separating static and reactive UI leads to cleaner, more maintainable Flutter code

This distinction is fundamental for building scalable Flutter applications.

🎨 Design & Structure Decisions

Kept the header as a StatelessWidget to emphasize immutability

Isolated interactive logic inside a StatefulWidget to keep state localized

Chose a simple counter interaction to clearly visualize state changes

Placed the demo screen inside screens/ to follow standard Flutter project structure

📌 Commit Message
feat: implemented demo showing stateless and stateful widgets