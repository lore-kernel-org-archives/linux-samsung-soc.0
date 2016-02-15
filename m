From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH v2 03/17] drm/exynos: removed optional dummy encoder
 mode_fixup function.
Date: Mon, 15 Feb 2016 14:49:09 +0100
Message-ID: <CAMeQTsZLdMOnk7-isneoUyFBbQdiRUsGH6+EhD8W1LNB=80LVQ@mail.gmail.com>
References: <cover.1455540137.git.palminha@synopsys.com>
	<3768b670931572de51fca1102efa18d20dd770ee.1455540137.git.palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f195.google.com ([209.85.217.195]:35886 "EHLO
	mail-lb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159AbcBONtL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 08:49:11 -0500
Received: by mail-lb0-f195.google.com with SMTP id zr1so6351943lbb.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Feb 2016 05:49:11 -0800 (PST)
In-Reply-To: <3768b670931572de51fca1102efa18d20dd770ee.1455540137.git.palminha@synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, jingoohan1@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, p.zabel@pengutronix.de, mark.yao@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org, vincent.abriou@st.com, kraxel@redhat.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, virtualization@lists.linux-foundation.org

Hi Carlos

Any particular reason why this patch isn't squashed with patch 8/17?

Thanks
Patrik


On Mon, Feb 15, 2016 at 1:58 PM, Carlos Palminha
<CARLOS.PALMINHA@synopsys.com> wrote:
> mode_fixup function for encoder drivers became optional with patch
> http://patchwork.freedesktop.org/patch/msgid/1455106522-32307-1-git-send-email-palminha@synopsys.com
>
> This patch set nukes all the dummy mode_fixup implementations.
>
> (made on top of Daniel topic/drm-misc branch)
>
> Signed-off-by: Carlos Palminha <palminha@synopsys.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index e977a81..736115c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1597,13 +1597,6 @@ static int exynos_dsi_create_connector(struct drm_encoder *encoder)
>         return 0;
>  }
>
> -static bool exynos_dsi_mode_fixup(struct drm_encoder *encoder,
> -                                 const struct drm_display_mode *mode,
> -                                 struct drm_display_mode *adjusted_mode)
> -{
> -       return true;
> -}
> -
>  static void exynos_dsi_mode_set(struct drm_encoder *encoder,
>                                 struct drm_display_mode *mode,
>                                 struct drm_display_mode *adjusted_mode)
> @@ -1623,7 +1616,6 @@ static void exynos_dsi_mode_set(struct drm_encoder *encoder,
>  }
>
>  static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
> -       .mode_fixup = exynos_dsi_mode_fixup,
>         .mode_set = exynos_dsi_mode_set,
>         .enable = exynos_dsi_enable,
>         .disable = exynos_dsi_disable,
> --
> 2.5.0
>
