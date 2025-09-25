import 'package:flutter/material.dart';

class LoadingSkeleton extends StatefulWidget {
  const LoadingSkeleton({super.key, this.height, this.width});
  final double? height;
  final double? width;

  @override
  State<LoadingSkeleton> createState() => _LoadingSkeletonState();
}

class _LoadingSkeletonState extends State<LoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        // Calculate smooth position for the shimmer highlight
        final shimmerValue = (_controller.value * 2) - 1; // Range: -1 to 1

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: const Alignment(-1.0, 0.0),
              end: const Alignment(1.0, 0.0),
              colors: const [
                Color(0xFF1A1529), // Base
                Color(0xFF2D2542), // Mid
                Color(0xFF403763), // Highlight
                Color(0xFF2D2542), // Mid
                Color(0xFF1A1529), // Base
              ],
              stops: [
                (shimmerValue - 0.3).clamp(0.0, 1.0),
                (shimmerValue - 0.15).clamp(0.0, 1.0),
                shimmerValue.clamp(0.0, 1.0),
                (shimmerValue + 0.15).clamp(0.0, 1.0),
                (shimmerValue + 0.3).clamp(0.0, 1.0),
              ],
            ),
          ),
          width: widget.width,
          height: widget.height,
        );
      },
    );
  }
}
