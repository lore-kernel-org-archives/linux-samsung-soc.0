From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: origen: Add missing USB regulators
Date: Wed, 07 Nov 2012 15:32:30 +0100
Message-ID: <1404564.Y3Pmvq2f73@amdc1227>
References: <1706359.z5UOYbqyny@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43912 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751292Ab2KGOcg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 09:32:36 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD4004HKGEAY870@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Nov 2012 23:32:34 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD400GWGGE8QY50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Nov 2012 23:32:33 +0900 (KST)
In-reply-to: <1706359.z5UOYbqyny@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, jhkim@insignal.co.kr

On Wednesday 07 of November 2012 14:01:19 Tomasz Figa wrote:
> This patch adds missing USB OTG regulators needed for s3c-hsotg driver
> to work on Origen board.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-origen.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/mach-origen.c
> b/arch/arm/mach-exynos/mach-origen.c index d8dc6d7..ddf6358 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -100,6 +100,8 @@ static struct regulator_consumer_supply __initdata
> ldo3_consumer[] = { REGULATOR_SUPPLY("vddcore", "s5p-mipi-csis.0"), /*
> MIPI */
>  	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"), /* HDMI */
>  	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"), /* HDMI */
> +	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"), /* OTG */
> +	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"), /* OTG */
>  };
>  static struct regulator_consumer_supply __initdata ldo6_consumer[] = {
>  	REGULATOR_SUPPLY("vddio", "s5p-mipi-csis.0"), /* MIPI */

It's worth noting that this patch is based on board file of Origen in 
Linaro tree

http://git.linaro.org/gitweb?p=landingteams/working/samsung/kernel;a=summary 
branch samsung-linux-3.6-2012.10

and not confirmed with respective board schematics (although verified 
working on an Origen board).

Personally I find these two consumers, which are supposed to provided with 
completely different voltages, connected to a single regulator a bit 
suspicious, so someone who know details of this board should ack or 
correct this patch.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
