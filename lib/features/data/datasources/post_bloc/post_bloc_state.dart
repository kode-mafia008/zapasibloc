part of 'post_bloc_bloc.dart';

enum PostStatus { initial, success, failure }

class PostBlocState extends Equatable {
  const PostBlocState({
    this.status = PostStatus.initial,
    this.posts = const <PostModel>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<PostModel> posts;
  final bool hasReachedMax;

  PostBlocState copyWith({
    PostStatus? status,
    List<PostModel>? posts,
    bool? hasReachedMax,
  }) {
    return PostBlocState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostBloState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [];
}

class PostBlocInitial extends PostBlocState {}
