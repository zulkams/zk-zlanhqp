import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:setgaji/core/constants/app_colors.dart';

class ExpandableListProvider extends ChangeNotifier {
  bool expanded = false;
  void toggle() {
    expanded = !expanded;
    notifyListeners();
  }
}

// expandable list
class ExpandableList extends StatefulWidget {
  final String title;
  final Widget? trailing;
  final List<Widget> children;
  const ExpandableList({super.key, required this.title, this.trailing, required this.children});

  @override
  State<ExpandableList> createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconTurns;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _iconTurns = Tween<double>(begin: 0, end: 0.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpandableListProvider(),
      child: Consumer<ExpandableListProvider>(
        builder: (context, provider, child) {
          // Animate chevron
          provider.expanded ? _controller.forward() : _controller.reverse();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    provider.toggle();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: fontBlue),
                      ),
                      Row(
                        children: [
                          if (widget.trailing != null) ...[widget.trailing!, const SizedBox(width: 12)],
                          // rotate chevron
                          RotationTransition(
                            turns: _iconTurns,
                            child: const Icon(Icons.expand_more, color: primaryColor, size: 28),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // animation
                AnimatedCrossFade(
                  // collapsed stte
                  firstChild: const SizedBox.shrink(),
                  // expanded state
                  secondChild: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 4.0, right: 4.0),
                    child: Column(children: widget.children),
                  ),
                  crossFadeState: provider.expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
