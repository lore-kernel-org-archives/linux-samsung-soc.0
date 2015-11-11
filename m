From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 15/17] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Wed, 11 Nov 2015 17:10:42 -0600
Message-ID: <20151111231042.GA29893@rob-hp-laptop>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446167355-6387-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:34637 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752587AbbKKXKv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Nov 2015 18:10:51 -0500
Content-Disposition: inline
In-Reply-To: <1446167355-6387-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-deve

On Fri, Oct 30, 2015 at 09:09:15AM +0800, Yakir Yang wrote:
> Some edp screen do not have hpd signal, so we can't just return
> failed when hpd plug in detect failed.
> 
> This is an hardware property, so we need add a devicetree property
> "analogix,need-force-hpd" to indicate this sutiation.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---

I didn't find this one in v10. Did it get dropped?

> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3:
> - Add "analogix,need-force-hpd" to indicate whether driver need foce
>   hpd when hpd detect failed.
> 
> Changes in v2: None
> 
>  .../bindings/display/bridge/analogix_dp.txt        |  4 ++-
>  .../bindings/display/exynos/exynos_dp.txt          |  1 +
>  .../display/rockchip/analogix_dp-rockchip.txt      |  1 +
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 36 +++++++++++++++++++---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  2 ++
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  9 ++++++
>  6 files changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
> index 7659a7a..74f0e80 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
> @@ -22,6 +22,9 @@ Required properties for dp-controller:
>  		from general PHY binding: Should be "dp".
>  
>  Optional properties for dp-controller:
> +	-analogix,need-force-hpd:
> +		Indicate driver need force hpd when hpd detect failed, this
> +		is used for some eDP screen which don't have hpd signal.

This should be a generic property.

Rob
