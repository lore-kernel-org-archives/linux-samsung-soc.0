From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: Enable Samsung media platform
 drivers as modules
Date: Tue, 29 Mar 2016 10:25:22 +0900
Message-ID: <56F9D982.8030800@samsung.com>
References: <1458779208-6144-1-git-send-email-javier@osg.samsung.com>
 <56F33C46.8060501@samsung.com> <56F4AD53.2020307@osg.samsung.com>
 <56F8B2D0.9010609@samsung.com> <56F8BD99.9050907@osg.samsung.com>
 <56F94A79.4020808@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60597 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750827AbcC2BZb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2016 21:25:31 -0400
In-reply-to: <56F94A79.4020808@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kukjin Kim <kgene@kernel.org>

On 29.03.2016 00:15, Javier Martinez Canillas wrote:
> Tobias mentioned on IRC that the exynos4-is driver conflicts with the
> Exynos DRM driver since both exynos_drm_fimc and exynos-fimc-is use
> the FIMC block.
> 
> So I think we should just discard $SUBJECT and instead add a Kconfig
> check to not allow both drivers to be built as suggested by Tobias.
> 
> Like is the case for the other components (G2D, GSC, Mixer, etc).

Roger that.

BR,
Krzysztof
