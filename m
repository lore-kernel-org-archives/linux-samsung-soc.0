From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable big.LITTLE CPUidle support
Date: Fri, 28 Aug 2015 10:51:42 +0200
Message-ID: <1440751902.13118.6.camel@collabora.co.uk>
References: <1440749769-10135-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:49317 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751365AbbH1Ivr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Aug 2015 04:51:47 -0400
In-Reply-To: <1440749769-10135-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org

On Fri, 2015-08-28 at 10:16 +0200, Javier Martinez Canillas wrote:
> Some Exynos big.LITTLE boards (i.e: Exynos5420 and Exynos5800 based
> Chromebooks) have proper firmware that allow the big.LITTLE CPUidle
> driver to work correctly, so enable support for this.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> Kukjin and Krzysztof,
> 
> As you know there are other boards like the Exynos5422 based Odroid 
> XU{3,4}
> whose firmware is broken due leaving CCI in secure mode which means 
> that the
> kernel MCPM support can't properly manage CCI.
> 
> So if you pick this patch, it should be tested in kernelci before 
> appearing
> in linux-next to prevent any boot issues.

I've pushed this patch into Collabora's for-next branch, which should
get picked up by kernelci soonish.

-- 
Sjoerd Simons
Collabora Ltd.
