From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v3 03/10] drm/bridge: analogix_dp: correct the register
 bit define error in ANALOGIX_DP_PLL_REG_1
Date: Thu, 23 Jun 2016 10:33:17 -0400
Message-ID: <CAOw6vbLFYiE0vdvyznJD=rm5tV2BZazM83shQpC9ThhrEM=XHA@mail.gmail.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com> <1465904772-848-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vk0-f43.google.com ([209.85.213.43]:36262 "EHLO
	mail-vk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972AbcFWOdk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2016 10:33:40 -0400
Received: by mail-vk0-f43.google.com with SMTP id u64so108758983vkf.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jun 2016 07:33:39 -0700 (PDT)
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com. [209.85.213.51])
        by smtp.gmail.com with ESMTPSA id 94sm171615uah.1.2016.06.23.07.33.37
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2016 07:33:37 -0700 (PDT)
Received: by mail-vk0-f51.google.com with SMTP id j2so108761606vkg.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jun 2016 07:33:37 -0700 (PDT)
In-Reply-To: <1465904772-848-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>, Douglas Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tomasz Figa <tomasz.figa@chromium.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Tue, Jun 14, 2016 at 7:46 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> There're an register define error in ANALOGIX_DP_PLL_REG_1 which introduced
> by commit bcec20fd5ad6 ("drm: bridge: analogix/dp: add some rk3288 special
> registers setting").
>
> The PHY PLL input clock source is selected by ANALOGIX_DP_PLL_REG_1
> BIT 0, not BIT 1.
>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Reviewed-by: Tomasz Figa <tomasz.figa@chromium.com>
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
> Changes in v3:
> - Add reviewed flag from Tomasz.
>     [https://chromium-review.googlesource.com/#/c/346315/15]
> - Add tested flag from Javier
>
> Changes in v2: None
>
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
> index 337912b..88d56ad 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
> @@ -163,8 +163,8 @@
>  #define HSYNC_POLARITY_CFG                     (0x1 << 0)
>
>  /* ANALOGIX_DP_PLL_REG_1 */
> -#define REF_CLK_24M                            (0x1 << 1)
> -#define REF_CLK_27M                            (0x0 << 1)
> +#define REF_CLK_24M                            (0x1 << 0)
> +#define REF_CLK_27M                            (0x0 << 0)
>
>  /* ANALOGIX_DP_LANE_MAP */
>  #define LANE3_MAP_LOGIC_LANE_0                 (0x0 << 6)
> --
> 1.9.1
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
