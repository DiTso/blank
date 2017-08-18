/**
 * makeEmbed
 * 
 * Преобразовывает ссылку на видео youtube, vimeo, rutube в ссылку для вставки в iframe
 * 
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
$regexp = [
		'youtube' => [ 
			'/(?:https?:)?\/\/(?:www\.)?(?:youtube\.com|youtu\.be|youtube-nocookie\.com)\/(?:watch\?v=|v\/|u\/|embed\/?)?([\w-]{11}).*/i',
			'//www.youtube.com/embed/{id}?&wmode=transparent',
		],
		'vimeo' => [ 
			'/(?:https?:)?\/\/(?:www\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/(?:[^\/]*)\/videos\/|)(\d+)(?:|\/\?)/i',
			'https://player.vimeo.com/video/{id}',
		],
		'rutube' => [ 
			'/(?:https?:)?\/\/(?:www\.|)rutube\.ru\/(?:video(?:\/embed)?|tracks)\/([a-zA-Z0-9_\-]+)\/?(&.+)?/i',
			'//rutube.ru/play/embed/{id}',
		],
	];

	foreach ( $regexp as $source ) {
		if ( preg_match( $source[0], $in, $matches ) ) {
			$in = str_replace( '{id}', $matches[1], $source[1] );
		}
	}

	return $in;
