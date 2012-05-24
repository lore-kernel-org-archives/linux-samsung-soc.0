From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: EXYYNOS: Use EXYNOS4210_GPEx instead of
 EXYNOS4_GPEx
Date: Thu, 24 May 2012 17:35:34 +0900
Message-ID: <008101cd3988$2fb26b90$8f1742b0$%kim@samsung.com>
References: <1337307497-15777-1-git-send-email-jy0922.shim@samsung.com>
 <4FB5B9A1.2030606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43436 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753701Ab2EXIfh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 04:35:37 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4I00MX7Q6IL110@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 17:35:35 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4I007IJQJAMHR1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 17:35:35 +0900 (KST)
In-reply-to: <4FB5B9A1.2030606@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joonyoung Shim' <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, linus.walleij@stericsson.com, 'Sangsu Park' <sangsu4u.park@samsung.com>

Joonyoung Shim wrote:
> 
> Add to cc Grant Likely and Linus Walleij
> 
> On 05/18/2012 11:18 AM, Joonyoung Shim wrote:
> > Also use EXYNOS4210_GPIO_Ex instead of EXYNOS4_GPIO_Ex. The GPEx gpios
> > exist only on Exynos4210 and there are no on Exynos4x12. Redefine them
> > to exact SoC name.
> >
> > Signed-off-by: Joonyoung Shim<jy0922.shim@samsung.com>
> > Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> > ---
> >   arch/arm/mach-exynos/include/mach/gpio.h   |   32
++++++++++++++--------
> ------
> >   arch/arm/mach-exynos/mach-nuri.c           |   16 +++++++-------
> >   arch/arm/mach-exynos/mach-origen.c         |    6 ++--
> >   arch/arm/mach-exynos/mach-universal_c210.c |   32
++++++++++++++-------
> -------
> >   arch/arm/mach-exynos/setup-fimc.c          |    4 +-
> >   drivers/gpio/gpio-samsung.c                |   20 ++++++++--------
> >   6 files changed, 55 insertions(+), 55 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/include/mach/gpio.h b/arch/arm/mach-
> exynos/include/mach/gpio.h
> > index eb24f1e..21c9bf1 100644
> > --- a/arch/arm/mach-exynos/include/mach/gpio.h
> > +++ b/arch/arm/mach-exynos/include/mach/gpio.h
> > @@ -26,11 +26,11 @@
> >   #define EXYNOS4_GPIO_C1_NR	(5)
> >   #define EXYNOS4_GPIO_D0_NR	(4)
> >   #define EXYNOS4_GPIO_D1_NR	(4)
> > -#define EXYNOS4_GPIO_E0_NR	(5)
> > -#define EXYNOS4_GPIO_E1_NR	(8)
> > -#define EXYNOS4_GPIO_E2_NR	(6)
> > -#define EXYNOS4_GPIO_E3_NR	(8)
> > -#define EXYNOS4_GPIO_E4_NR	(8)
> > +#define EXYNOS4210_GPIO_E0_NR	(5)
> > +#define EXYNOS4210_GPIO_E1_NR	(8)
> > +#define EXYNOS4210_GPIO_E2_NR	(6)
> > +#define EXYNOS4210_GPIO_E3_NR	(8)
> > +#define EXYNOS4210_GPIO_E4_NR	(8)

I think, splitting the gpios like following(common exynos4 and exynos4210 or
exynos4x12). So please just put the definitions for EXYNOS4210 GPIO after
EXYNOS4_GPIO_XXX.

diff --git a/arch/arm/mach-exynos/include/mach/gpio.h
b/arch/arm/mach-exynos/include/mach/gpio.h
index eb24f1e..910b611 100644
--- a/arch/arm/mach-exynos/include/mach/gpio.h
+++ b/arch/arm/mach-exynos/include/mach/gpio.h
@@ -26,17 +26,10 @@
 #define EXYNOS4_GPIO_C1_NR	(5)
 #define EXYNOS4_GPIO_D0_NR	(4)
 #define EXYNOS4_GPIO_D1_NR	(4)
-#define EXYNOS4_GPIO_E0_NR	(5)
-#define EXYNOS4_GPIO_E1_NR	(8)
-#define EXYNOS4_GPIO_E2_NR	(6)
-#define EXYNOS4_GPIO_E3_NR	(8)
-#define EXYNOS4_GPIO_E4_NR	(8)
 #define EXYNOS4_GPIO_F0_NR	(8)
 #define EXYNOS4_GPIO_F1_NR	(8)
 #define EXYNOS4_GPIO_F2_NR	(8)
 #define EXYNOS4_GPIO_F3_NR	(6)
-#define EXYNOS4_GPIO_J0_NR	(8)
-#define EXYNOS4_GPIO_J1_NR	(5)
 #define EXYNOS4_GPIO_K0_NR	(7)
 #define EXYNOS4_GPIO_K1_NR	(7)
 #define EXYNOS4_GPIO_K2_NR	(7)
@@ -57,6 +50,31 @@
 #define EXYNOS4_GPIO_Y6_NR	(8)
 #define EXYNOS4_GPIO_Z_NR	(7)
 
+/* For EXYNOS4210 GPIO bank sizes */
+
+#define EXYNOS4210_GPIO_E0_NR	(5)
+#define EXYNOS4210_GPIO_E1_NR	(8)
+#define EXYNOS4210_GPIO_E2_NR	(6)
+#define EXYNOS4210_GPIO_E3_NR	(8)
+#define EXYNOS4210_GPIO_E4_NR	(8)
+#define EXYNOS4210_GPIO_J0_NR	(8)
+#define EXYNOS4210_GPIO_J1_NR	(5)

[...]

And we can add EXYNOS4X12 GPIO like following in other patch.

+/* For EXYNOS4X12 GPIO bank sizes */
+
+#define EXYNOS4X12_GPIO_J0_NR	(8)
+#define EXYNOS4X12_GPIO_J1_NR	(5)
+#define EXYNOS4X12_GPIO_M0_NR	(8)
+#define EXYNOS4X12_GPIO_M1_NR	(7)
+#define EXYNOS4X12_GPIO_M2_NR	(5)
+#define EXYNOS4X12_GPIO_M3_NR	(8)
+#define EXYNOS4X12_GPIO_M4_NR	(8)
+#define EXYNOS4X12_GPIO_V0_NR	(8)
+#define EXYNOS4X12_GPIO_V1_NR	(8)
+#define EXYNOS4X12_GPIO_V2_NR	(8)
+#define EXYNOS4X12_GPIO_V3_NR	(8)
+#define EXYNOS4X12_GPIO_V4_NR	(2)

> >   #define EXYNOS4_GPIO_F0_NR	(8)
> >   #define EXYNOS4_GPIO_F1_NR	(8)
> >   #define EXYNOS4_GPIO_F2_NR	(8)
> > @@ -67,12 +67,12 @@ enum exynos4_gpio_number {
> >   	EXYNOS4_GPIO_C1_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_C0),
> >   	EXYNOS4_GPIO_D0_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_C1),
> >   	EXYNOS4_GPIO_D1_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_D0),
> > -	EXYNOS4_GPIO_E0_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_D1),
> > -	EXYNOS4_GPIO_E1_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_E0),
> > -	EXYNOS4_GPIO_E2_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_E1),
> > -	EXYNOS4_GPIO_E3_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_E2),
> > -	EXYNOS4_GPIO_E4_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_E3),
> > -	EXYNOS4_GPIO_F0_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_E4),
> > +	EXYNOS4210_GPIO_E0_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_D1),
> > +	EXYNOS4210_GPIO_E1_START	=
EXYNOS_GPIO_NEXT(EXYNOS4210_GPIO_E0),
> > +	EXYNOS4210_GPIO_E2_START	=
EXYNOS_GPIO_NEXT(EXYNOS4210_GPIO_E1),
> > +	EXYNOS4210_GPIO_E3_START	=
EXYNOS_GPIO_NEXT(EXYNOS4210_GPIO_E2),
> > +	EXYNOS4210_GPIO_E4_START	=
EXYNOS_GPIO_NEXT(EXYNOS4210_GPIO_E3),
> > +	EXYNOS4_GPIO_F0_START	= EXYNOS_GPIO_NEXT(EXYNOS4210_GPIO_E4),
> >   	EXYNOS4_GPIO_F1_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_F0),
> >   	EXYNOS4_GPIO_F2_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_F1),
> >   	EXYNOS4_GPIO_F3_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_F2),

Same as above.

@@ -99,6 +117,31 @@ enum exynos4_gpio_number {
 	EXYNOS4_GPIO_Z_START	= EXYNOS_GPIO_NEXT(EXYNOS4_GPIO_Y6),
 };
 
+enum exynos4210_gpio_number {
+	EXYNOS4210_GPIO_E0_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_Z),
+	EXYNOS4210_GPIO_E1_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4210_GPIO_E0),
+	EXYNOS4210_GPIO_E2_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4210_GPIO_E1),
+	EXYNOS4210_GPIO_E3_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4210_GPIO_E2),
+	EXYNOS4210_GPIO_E4_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4210_GPIO_E3),
+	EXYNOS4210_GPIO_J0_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4210_GPIO_E4),
+	EXYNOS4210_GPIO_J1_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4210_GPIO_J0),
+};

[...]

And following is possible for EXYNOS4X12...

+enum exynos4x12_gpio_number {
+	EXYNOS4X12_GPIO_J0_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_Z),
+	EXYNOS4X12_GPIO_J1_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4X12_GPIO_J0),
+	EXYNOS4X12_GPIO_M0_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4X12_GPIO_J1),
+	EXYNOS4X12_GPIO_M1_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4X12_GPIO_M0),
+	EXYNOS4X12_GPIO_M2_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4X12_GPIO_M1),
+	EXYNOS4X12_GPIO_M3_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4X12_GPIO_M2),
+	EXYNOS4X12_GPIO_M4_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4X12_GPIO_M3),
+	EXYNOS4X12_GPIO_V0_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4X12_GPIO_M4),
+	EXYNOS4X12_GPIO_V1_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4X12_GPIO_V0),
+	EXYNOS4X12_GPIO_V2_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4X12_GPIO_V1),
+	EXYNOS4X12_GPIO_V3_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4X12_GPIO_V2),
+	EXYNOS4X12_GPIO_V4_START	=
EXYNOS4_GPIO_NEXT(EXYNOS4X12_GPIO_V3),
+};
+
 /* EXYNOS4 GPIO number definitions */
 
 #define EXYNOS4_GPA0(_nr)	(EXYNOS4_GPIO_A0_START + (_nr))

[...]

Of course, need to update other regarding gpio part accordingly.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
