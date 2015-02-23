From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 06/15] tests/exynos: introduce wait_for_user_input
Date: Mon, 23 Feb 2015 11:22:09 +0000
Message-ID: <54EB0D61.3000603@gmail.com>
References: <1424094405-6314-1-git-send-email-tjakobi@math.uni-bielefeld.de> <1424094405-6314-7-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:33757 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861AbbBWLWF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Feb 2015 06:22:05 -0500
Received: by mail-wg0-f48.google.com with SMTP id l18so24946582wgh.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Feb 2015 03:22:04 -0800 (PST)
In-Reply-To: <1424094405-6314-7-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, robclark@freedesktop.org, m.szyprowski@samsung.com

On 16/02/15 13:46, Tobias Jakobi wrote:
> Currently getchar() is used to pause execution after each test.
> The user isn't informed if one is supposed to do anything for
> the tests to continue, so print a simple message to make this
> more clear.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  tests/exynos/exynos_fimg2d_test.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
> index 55d2970..446a6c6 100644
> --- a/tests/exynos/exynos_fimg2d_test.c
> +++ b/tests/exynos/exynos_fimg2d_test.c
> @@ -237,6 +237,18 @@ void *create_checkerboard_pattern(unsigned int num_tiles_x,
>  	return buf;
>  }
>  
> +static void wait_for_user_input(int last)
> +{
> +	printf("press <ENTER> to ");
> +
> +	if (last)
> +		printf("exit test application\n");
> +	else
> +		printf("skip to next test\n");
> +
If interested you can compact this as

	printf("press <ENTER> to %s\n", last ? "exit test application" :
	                                       "skip to next test");


Cheers
Emil
