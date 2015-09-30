From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 02/17] drm: bridge: analogix/dp: split exynos dp driver
 to bridge directory
Date: Wed, 30 Sep 2015 14:17:28 +0900
Message-ID: <560B7068.2000008@samsung.com>
References: <1442906428-2609-1-git-send-email-ykk@rock-chips.com>
 <1442906963-2883-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11125 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726AbbI3FRo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 01:17:44 -0400
In-reply-to: <1442906963-2883-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, Thierry Reding <treding@nvidia.com>, joe@perches.com, Rob Herring <robh+dt@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

On 22.09.2015 16:29, Yakir Yang wrote:
> Split the dp core driver from exynos directory to bridge directory,
> and rename the core driver to analogix_dp_*, rename the platform
> code to exynos_dp.
> 
> Beside the new analogix_dp driver would export four hooks.
> "analogix_dp_bind()" and "analogix_dp_unbind()"
> "analogix_dp_detect()" and "analogix_dp_get_modes()"
> 
> The bind/unbind symbols is used for analogix platform driver to connect
> with analogix_dp core driver. And the detect/get_modes is used for analogix
> platform driver to init the connector.
> 
> They reason why connector need register in helper driver is rockchip drm
> haven't implement the atomic API, but Exynos drm have implement it, so
> there would need two different connector helper functions, that's why we
> leave the connector register in helper driver.
> 
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
> Changes in v5:
> - Correct the check condition of gpio_is_valid when driver try to get
>   the "hpd-gpios" DT propery. (Heiko)
> - Move the platform attach callback in the front of core driver bridge
>   attch function. Cause once platform failed at attach, core driver should
>   still failed, so no need to init connector before platform attached (Krzysztof)
> - Keep code style no changes with the previous exynos_dp_code.c in this
>   patch, and update commit message about the new export symbol (Krzysztof)
> - Gather the device type patch (v4 11/16) into this one. (Krzysztof)
> - leave out the connector registration to analogix platform driver. (Thierry)

Thanks for fixing this, looks much better.

I don't feel comfortable enough to provide a review tag but it looks
good to me.

Best regards,
Krzysztof
