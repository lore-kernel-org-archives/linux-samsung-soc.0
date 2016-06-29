From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v4 08/11] drm/rockchip: analogix_dp: update the comments
 about why need to hardcode VOP output mode
Date: Wed, 29 Jun 2016 09:58:43 -0400
Message-ID: <CAOw6vbLBuK6bRs1DQjrpSaCiy1xtmS==xCW9n25vCM8yHUu_NQ@mail.gmail.com>
References: <1467191657-16941-1-git-send-email-ykk@rock-chips.com> <1467191744-17437-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vk0-f50.google.com ([209.85.213.50]:34347 "EHLO
	mail-vk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752536AbcF2N7H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 09:59:07 -0400
Received: by mail-vk0-f50.google.com with SMTP id c2so67057012vkg.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2016 06:59:06 -0700 (PDT)
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com. [209.85.213.51])
        by smtp.gmail.com with ESMTPSA id 65sm570513uas.22.2016.06.29.06.59.03
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jun 2016 06:59:04 -0700 (PDT)
Received: by mail-vk0-f51.google.com with SMTP id c2so67054812vkg.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2016 06:59:03 -0700 (PDT)
In-Reply-To: <1467191744-17437-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>, Douglas Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org

On Wed, Jun 29, 2016 at 5:15 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> The hardware IC designed that VOP must output the RGB10 video format to
> eDP contoller, and if eDP panel only support RGB8, then eDP contoller
> should cut down the video data, not via VOP contoller, that's why we need
> to hardcode the VOP output mode to RGA10 here.
>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Acked-by: Mark Yao <mark.yao@rock-chips.com>
> Reviewed-by: Tomasz Figa <tomasz.figa@chromium.com>


Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
> Changes in v4:
> - Correct the misspell of 'contoller'. (Sean)
>
> Changes in v3:
> - Add the reviewed flag from Tomasz.
>     [https://chromium-review.googlesource.com/#/c/346853/12]
> - Add the acked flag from Mark.
>
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 0a0fb3a..850edc4 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -182,17 +182,11 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
>         int ret;
>
>         /*
> -        * FIXME(Yakir): driver should configure the CRTC output video
> -        * mode with the display information which indicated the monitor
> -        * support colorimetry.
> -        *
> -        * But don't know why the CRTC driver seems could only output the
> -        * RGBaaa rightly. For example, if connect the "innolux,n116bge"
> -        * eDP screen, EDID would indicated that screen only accepted the
> -        * 6bpc mode. But if I configure CRTC to RGB666 output, then eDP
> -        * screen would show a blue picture (RGB888 show a green picture).
> -        * But if I configure CTRC to RGBaaa, and eDP driver still keep
> -        * RGB666 input video mode, then screen would works prefect.
> +        * The hardware IC designed that VOP must output the RGB10 video
> +        * format to eDP controller, and if eDP panel only support RGB8,
> +        * then eDP controller should cut down the video data, not via VOP
> +        * controller, that's why we need to hardcode the VOP output mode
> +        * to RGA10 here.
>          */
>
>         s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
> --
> 1.9.1
>
>
