From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/3] drm/exynos: Use VIDEO_SAMSUNG_EXYNOS_GSC=n as GSC
 Kconfig dependency
Date: Thu, 21 Apr 2016 09:46:17 -0400
Message-ID: <5718D9A9.4040309@osg.samsung.com>
References: <1459214937-18686-1-git-send-email-javier@osg.samsung.com>
 <1459214937-18686-3-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:60698 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752041AbcDUNqa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Apr 2016 09:46:30 -0400
In-Reply-To: <1459214937-18686-3-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-kernel@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kukjin Kim <kgene@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org

Hello Inki,

On 03/28/2016 09:28 PM, Javier Martinez Canillas wrote:
> Commit aeefb36832e5 ("drm/exynos: gsc: add device tree support and remove
> usage of static mappings") made the DRM_EXYNOS_GSC Kconfig symbol to only
> be selectable if the exynos-gsc V4L2 driver isn't enabled, since both use
> the same HW IP block.
> 
> But added the dependency as depends on !VIDEO_SAMSUNG_EXYNOS_GSC which is
> not correct since Kconfig expressions are not boolean but tristate. So it
> will only evaluate to 'n' if VIDEO_SAMSUNG_EXYNOS_GSC=y but will evaluate
> to 'm' if VIDEO_SAMSUNG_S5P_G2D=m.
> 
> This means that both the V4L2 and DRM drivers can be enabled if the former
> is enabled as a module, which is not what we want.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---

I see that only patch 1/3 from this series was picked but according to the
conversation with Seung-Woo [0] in the cover letter, the GSC v4l2 and drm
drivers don't support to be simultaneous enabled like is the case for FIMC.

So patch 3/3 is the only one of the series that should be dropped and this
one picked as well.

[0]: https://lkml.org/lkml/2016/3/29/7

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
