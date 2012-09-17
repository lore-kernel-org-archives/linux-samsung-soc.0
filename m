From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Use non-secure MDMA1
Date: Mon, 17 Sep 2012 19:51:26 +0900
Message-ID: <050101cd94c2$62febb80$28fc3280$%kim@samsung.com>
References: <5886686.Vz6SVkoRWm@amdc1227> <503D5ABD.9040801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27120 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754798Ab2IQKv3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 06:51:29 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAH008VKQ5DCGV0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 19:51:27 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAH00EULQ5R7HB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 19:51:27 +0900 (KST)
In-reply-to: <503D5ABD.9040801@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'Boojin Kim' <boojin.kim@samsung.com>

Kukjin Kim wrote:
> 
> On 08/28/12 04:08, Tomasz Figa wrote:
> > Using secure MDMA1 on TrustZone-enabled boards causes early boot crash,
> > so use non-secure instead.
> >
> > Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> > ---
> >   arch/arm/mach-exynos/dma.c              | 2 +-
> >   arch/arm/mach-exynos/include/mach/map.h | 3 ++-
> >   2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/dma.c b/arch/arm/mach-exynos/dma.c
> > index f60b66d..8858df5 100644
> > --- a/arch/arm/mach-exynos/dma.c
> > +++ b/arch/arm/mach-exynos/dma.c
> > @@ -261,7 +261,7 @@ static struct dma_pl330_platdata exynos_mdma1_pdata
> = {
> >   };
> >
> >   static AMBA_AHB_DEVICE(exynos_mdma1,  "dma-pl330.2", 0x00041330,
> > -	EXYNOS4_PA_MDMA1, {EXYNOS4_IRQ_MDMA1},&exynos_mdma1_pdata);
> > +	EXYNOS4_PA_NS_MDMA1, {EXYNOS4_IRQ_MDMA1},&exynos_mdma1_pdata);
> >
> >   static int __init exynos_dma_init(void)
> >   {
> > diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-
> > exynos/include/mach/map.h
> > index 51943f2..5df5910 100644
> > --- a/arch/arm/mach-exynos/include/mach/map.h
> > +++ b/arch/arm/mach-exynos/include/mach/map.h
> > @@ -89,7 +89,8 @@
> >   #define EXYNOS4_PA_L2CC			0x10502000
> >
> >   #define EXYNOS4_PA_MDMA0		0x10810000
> > -#define EXYNOS4_PA_MDMA1		0x12840000
> > +#define EXYNOS4_PA_S_MDMA1		0x12840000
> > +#define EXYNOS4_PA_NS_MDMA1		0x12850000
> >   #define EXYNOS4_PA_PDMA0		0x12680000
> >   #define EXYNOS4_PA_PDMA1		0x12690000
> >   #define EXYNOS5_PA_MDMA0		0x10800000
> 
> Cc'ed Boojin Kim.
> 
> Well, just fix the address is enough like exynos5 stuff? I don't have
> any idea why we need secure mdma and non-secure mdma both here...
> 
> diff --git a/arch/arm/mach-exynos/include/mach/map.h
> b/arch/arm/mach-exynos/include/mach/map.h
> index c72b675..c941053 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -89,7 +89,7 @@
>   #define EXYNOS4_PA_L2CC                        0x10502000
> 
>   #define EXYNOS4_PA_MDMA0		0x10810000
> -#define EXYNOS4_PA_MDMA1		0x12840000
> +#define EXYNOS4_PA_MDMA1		0x12850000
>   #define EXYNOS4_PA_PDMA0		0x12680000
>   #define EXYNOS4_PA_PDMA1		0x12690000
>   #define EXYNOS5_PA_MDMA0		0x10800000
> --

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: fix address for EXYNOS4 MDMA1

use non-secure mdma1 address.

Reported-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/include/mach/map.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/map.h
b/arch/arm/mach-exynos/include/mach/map.h
index c72b675..c941053 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -89,7 +89,7 @@
 #define EXYNOS4_PA_L2CC			0x10502000
 
 #define EXYNOS4_PA_MDMA0		0x10810000
-#define EXYNOS4_PA_MDMA1		0x12840000
+#define EXYNOS4_PA_MDMA1		0x12850000
 #define EXYNOS4_PA_PDMA0		0x12680000
 #define EXYNOS4_PA_PDMA1		0x12690000
 #define EXYNOS5_PA_MDMA0		0x10800000
-- 
1.7.4.1

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
