From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 3/3] drm/exynos: mixer: add 2x scaling to mixer_graph_buffer
Date: Sun, 5 Apr 2015 17:40:08 +0100
Message-ID: <CACvgo50N_LGyA9rx-9y3dUQzu3cx0HhEaZjij=AWVsCf5-ZA2Q@mail.gmail.com>
References: <1427894943-9010-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1427894943-9010-3-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f50.google.com ([209.85.216.50]:41355 "EHLO
	mail-vn0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752660AbbDEQkJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 5 Apr 2015 12:40:09 -0400
Received: by vnbf7 with SMTP id f7so1528065vnb.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Apr 2015 09:40:08 -0700 (PDT)
In-Reply-To: <1427894943-9010-3-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>

Hi Tobias,

On 1 April 2015 at 14:29, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 5ab0e32..6822b36 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c

> @@ -528,9 +552,8 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>                 fmt = ARGB8888;
>         }
>
> -       /* 2x scaling feature */
> -       x_ratio = 0;
> -       y_ratio = 0;
> +       /* check if mixer supports requested scaling setup */
> +       if (mixer_setup_scale(plane, &x_ratio, &y_ratio)) return;
>
Having return on the same line as the if statement will make
checkpatch.pl unhappy :-(

Cheers
Emil
