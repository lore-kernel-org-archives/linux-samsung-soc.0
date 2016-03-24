From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v14 0/17] Add Analogix Core Display Port Driver
Date: Thu, 24 Mar 2016 14:01:33 +0100
Message-ID: <14744174.gBEQWZv0K7@diego>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:35072 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757487AbcCXNCG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Mar 2016 09:02:06 -0400
In-Reply-To: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org

Am Montag, 15. Februar 2016, 19:08:05 schrieb Yakir Yang:
> Hi all,
> 
>   The Samsung Exynos eDP controller and Rockchip RK3288 eDP controller
> share the same IP, so a lot of parts can be re-used. I split the common
> code into bridge directory, then rk3288 and exynos only need to keep
> some platform code. Cause I can't find the exact IP name of exynos dp
> controller, so I decide to name dp core driver with "analogix" which I
> find in rk3288 eDP TRM
> 
> But there are still three light registers setting different between
> exynos and rk3288.
> 1. RK3288 have five special pll registers which not indicate in exynos
>    dp controller.
> 2. The address of DP_PHY_PD(dp phy power manager register) are different
>    between rk3288 and exynos.
> 3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL(dp debug
>    register).
> 
> Due to Mark Yao have introduced the ATOMIC support to Rockchip drm, so it's
> okay to use the ATOMIC helpers functions in connector_funcs. No need to
> splict the connector init to platform driver anymore, and this is the
> biggest change since version 11.
> 
> This v14 didn't have lots of new changes which seems not the correct time to
> upgrade the version number, but I have changed ordering of patches (adding
> 2 more, and removing 2 out). Especially to prevent confusing people, so I
> updated the whole series.

I guess I never said that explicitly, but of course I have tested this 
numerous times, so

This series
Tested-by: Heiko Stuebner <heiko@sntech.de>
