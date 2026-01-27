# Design to Code: Translating Figma to a Responsive Flutter UI

## How We Translated Our Figma Prototype into a Functional Flutter UI

When translating our Figma prototype into Flutter, our primary goal was to **preserve visual consistency**, **ensure responsiveness**, and **maintain usability** across a wide range of devices (small phones, large phones, and tablets). We treated Figma as the **source of design intent**, not a pixel-perfect blueprint, and used Flutter’s flexible layout system to recreate the same *feel* rather than rigid dimensions.

### 1. Maintaining Visual Consistency

To keep the Flutter UI visually aligned with Figma:

- **Color Palette & Typography**
  - We defined a centralized `ThemeData` in Flutter using the same colors and font styles as the Figma design.
  - Headings, body text, and buttons used consistent `TextStyle` definitions instead of inline styling.

- **Component Mapping**
  - Figma cards → `Card` widgets with padding, elevation, and rounded corners.
  - Buttons → `ElevatedButton` / `TextButton` based on hierarchy.
  - Input fields → `TextField` with `InputDecoration` matching Figma spacing and labels.

This ensured that the UI *looked the same everywhere*, even when layouts changed.

---

## Case Study: “The App That Looked Perfect, But Only on One Phone”

### Problem with Static Designs

In the FlexiFit scenario, the UI was designed using **fixed pixel values**:
- Hardcoded widths and heights
- Fixed spacing between elements
- No consideration for different aspect ratios

This caused:
- **Overlapping UI elements** on smaller iPhones
- **Excessive white space** on tablets
- Poor usability when switching orientation

This is a classic failure of static design in a dynamic device ecosystem.

---

## How We Solved This in Flutter

### 2. Responsive Layout Techniques Used

#### a) Flexible & Expanded (Avoiding Hardcoded Sizes)
Instead of fixed widths:
```dart
Row(
  children: [
    Expanded(child: StatsCard()),
    Expanded(child: StatsCard()),
  ],
)
This allowed cards to automatically resize based on available space, preventing overlap.

b) MediaQuery (Screen-Aware Decisions)
We used MediaQuery to adapt layouts based on screen size:

final screenWidth = MediaQuery.of(context).size.width;

if (screenWidth < 600) {
  return Column(children: mobileLayout);
} else {
  return Row(children: tabletLayout);
}
This helped us switch between vertical layouts for phones and horizontal layouts for tablets.

c) LayoutBuilder (Parent-Based Adaptation)
For complex sections like dashboards:

LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 500) {
      return MobileDashboard();
    } else {
      return TabletDashboard();
    }
  },
)
This ensured adaptability even when widgets were reused in different containers.

d) Scrolling for Content Safety
We wrapped content-heavy screens with:

SingleChildScrollView(
  child: Column(...)
)
This prevented content overflow on smaller devices.

Consistency, Responsiveness, Accessibility (The Design Triangle)
Consistency
Same colors, typography, and component hierarchy as Figma

Shared widgets for repeated UI elements

Responsiveness
No fixed pixel dimensions

Layouts adapt using Flexible, Expanded, MediaQuery, and LayoutBuilder

Accessibility
Adequate spacing for touch targets

Scalable text support

Logical navigation flow

Figma vs Flutter: What Changed?
What stayed the same:

Visual hierarchy

Core layout structure

Brand identity

What changed:

Fixed dimensions replaced with flexible constraints

Some spacing adjusted to improve usability on small screens

Layout orientation adapted for tablets

These changes were intentional and driven by real-world device behavior, not design compromise.

Video Demo (3–5 Minutes)
In the video, we demonstrate:

Our Figma prototype and layout structure

The Flutter UI running on:

A small phone emulator

A larger device or tablet

A live example of responsiveness (layout adapting to screen size)

A brief reflection on how design thinking influenced implementation decisions

Reflection
This exercise reinforced that great UI development is not about copying pixels from Figma, but about translating design intent into adaptive systems. Flutter’s layout model allowed us to build interfaces that feel the same everywhere, even when the layout changes. By combining design thinking with responsive widgets, we delivered a UI that is consistent, usable, and scalable across platforms.