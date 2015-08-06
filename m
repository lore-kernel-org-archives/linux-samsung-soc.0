From: "Jingoo Han" <jingoohan1@gmail.com>
Subject: Re: [RFC PATCH 0/8] Add Analogix Core Display Port Driver
Date: Thu, 6 Aug 2015 23:41:36 +0900
Message-ID: <000201d0d056$06cff040$146fd0c0$@com>
References: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:33665 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754138AbbHFOlu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Aug 2015 10:41:50 -0400
In-Reply-To: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
Content-Language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Yakir Yang' <ykk@rock-chips.com>, 'Heiko Stuebner' <heiko@sntech.de>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Fabio Estevam' <fabio.estevam@freescale.com>, 'Inki Dae' <inki.dae@samsung.com>
Cc: djkurtz@google.com, dianders@google.com, 'Takashi Iwai' <tiwai@suse.de>, 'Andrzej Hajda' <a.hajda@samsung.com>, 'Thierry Reding' <treding@nvidia.com>, 'Philipp Zabel' <p.zabel@pengutronix.de>, 'David Airlie' <airlied@linux.ie>, 'Gustavo Padovan' <gustavo.padovan@collabora.co.uk>, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Vincent Palatin' <vpalatin@chromium.org>, 'Mark Yao' <mark.yao@rock-chips.com>, 'Andy Yan' <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 'Jing

On Thursday, August 06, 2015 10:49 PM, Yakir Yang wrote:
> 
> Hi all,
>    Samsung exynos and Rockchip rk3288 almost share same dp controller,
> so I split the common code out, then rk3288 and exynos can re-used the
> same dp core driver. Cause I can't find the exact IP name of exynos dp
> controller, so I decide to name dp core driver with "analogix" which I
> find in rk3288 eDP TRM ;)


OK, I see.
The Samsung Exynos eDP contoller and Rockchip rk3288 eDP contoller share
the same IP. So, a lot of parts can be re-used. I agree with this.
However, we have to review the code carefully, as others did.

I also cannot find the exact IP name. The "analogix" may be the vendor name
of this IP.

Best regards,
Jingoo Han

> 
> Beyond that, there are three light registers setting differents bewteen
> exynos and rk3288.
> 1. RK3288 have five special pll resigters which not indicata in exynos
>    dp controller.
> 2. The address of DP_PHY_PD(dp phy power manager register) are different
>    between rk3288 and exynos.
> 3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL(dp debug
>    register).
> 
> My series patches can be divider into two parts: One for spliting the
> analogix_dp code from exynos dp driver. Another are trying to add rk3288
> dp driver support.
> 
> Best regards,
> - Yakir
> 
> 
> Yakir Yang (8):
>   drm: exynos/dp: fix code style
>   drm: exynos/dp: convert to drm bridge mode
>   drm: bridge: analogix_dp: split exynos dp driver to bridge dir
>   drm: rockchip/dp: add rockchip platform dp driver
>   drm: bridge/analogix_dp: add platform device type support
>   drm: bridge: analogix_dp: add some rk3288 special registers setting
>   drm: bridge: analogix_dp: try force hpd after plug in lookup failed
>   drm: bridge/analogix_dp: expand the delay time for hpd detect
> 
>  drivers/gpu/drm/bridge/Kconfig                     |    5 +
>  drivers/gpu/drm/bridge/Makefile                    |    1 +
>  drivers/gpu/drm/bridge/analogix_dp_core.c          | 1397 +++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix_dp_core.h          |  287 ++++
>  drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1295 ++++++++++++++++++
>  .../exynos_dp_reg.h => bridge/analogix_dp_reg.h}   |  272 ++--
>  drivers/gpu/drm/exynos/Kconfig                     |    5 +-
>  drivers/gpu/drm/exynos/Makefile                    |    2 +-
>  drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  241 ++++
>  drivers/gpu/drm/exynos/exynos_dp_core.c            | 1416 --------------------
>  drivers/gpu/drm/exynos/exynos_dp_core.h            |  282 ----
>  drivers/gpu/drm/exynos/exynos_dp_reg.c             |  100 +-
>  drivers/gpu/drm/rockchip/Kconfig                   |   10 +
>  drivers/gpu/drm/rockchip/Makefile                  |    1 +
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  420 ++++++
>  include/drm/bridge/analogix_dp.h                   |   28 +
>  16 files changed, 3880 insertions(+), 1882 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.c
>  create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.h
>  create mode 100644 drivers/gpu/drm/bridge/analogix_dp_reg.c
>  rename drivers/gpu/drm/{exynos/exynos_dp_reg.h => bridge/analogix_dp_reg.h} (62%)
>  create mode 100644 drivers/gpu/drm/exynos/analogix_dp-exynos.c
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.c
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.h
>  create mode 100644 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>  create mode 100644 include/drm/bridge/analogix_dp.h
> 
> --
> 2.1.2
