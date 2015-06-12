From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 4/9] tests/exynos: clean struct connector
Date: Fri, 12 Jun 2015 16:59:00 +0100
Message-ID: <CACvgo538xoZ-z-C=WHdZiTd4BJRncf-g1v+AMb49Y2rYzU9b4A@mail.gmail.com>
References: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1433943748-15849-5-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f54.google.com ([209.85.216.54]:36454 "EHLO
	mail-vn0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753666AbbFLP7B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 11:59:01 -0400
Received: by vnbg1 with SMTP id g1so6711689vnb.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2015 08:59:00 -0700 (PDT)
In-Reply-To: <1433943748-15849-5-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk, Inki Dae <inki.dae@samsung.com>

On 10 June 2015 at 14:42, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> Remove all unused struct members.
>
Mentioning if they were used at some point in the past will be great.

Thanks
Emil

> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  tests/exynos/exynos_fimg2d_test.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
> index 64dacfa..6af9277 100644
> --- a/tests/exynos/exynos_fimg2d_test.c
> +++ b/tests/exynos/exynos_fimg2d_test.c
> @@ -65,17 +65,9 @@ struct fimg2d_test_case {
>  struct connector {
>         uint32_t id;
>         char mode_str[64];
> -       char format_str[5];
> -       unsigned int fourcc;
>         drmModeModeInfo *mode;
>         drmModeEncoder *encoder;
>         int crtc;
> -       int pipe;
> -       int plane_zpos;
> -       unsigned int fb_id[2], current_fb_id;
> -       struct timeval start;
> -
> -       int swap_count;
>  };
>
>  static void connector_find_mode(int fd, struct connector *c,
> @@ -750,8 +742,6 @@ int main(int argc, char **argv)
>         if (ret < 0)
>                 goto err_destroy_buffer;
>
> -       con.plane_zpos = -1;
> -
>         memset(bo->vaddr, 0xff, screen_width * screen_height * 4);
>
>         ret = drm_set_crtc(dev, &con, fb_id);
> --
> 2.0.5
>
