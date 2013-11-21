From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: increase CONFIG_NR_CPUS value to 8
Date: Thu, 21 Nov 2013 13:11:03 +0100
Message-ID: <3699555.ZHO9r7FOJe@amdc1227>
References: <1511364.Pd4tSi34z7@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11268 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225Ab3KUMLT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Nov 2013 07:11:19 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MWM00F6X4IMY690@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Nov 2013 12:11:17 +0000 (GMT)
In-reply-to: <1511364.Pd4tSi34z7@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Bart,

On Thursday 21 of November 2013 13:06:06 Bartlomiej Zolnierkiewicz wrote:
> Current CONFIG_NR_CPUS value (2) is too small for:
> - EXYNOS4412 (4 cores)
> - EXYNOS5440 (4 cores)
> - EXYNOS5410 (8 cores)
> - EXYNOS5420 (8 cores)
> 
> Set CONFIG_NR_CPUS to 8 so it is correct for all currently
> supported SoCs.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Definitely a change we want to have.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
