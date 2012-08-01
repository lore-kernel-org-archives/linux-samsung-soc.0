From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Wed, 01 Aug 2012 17:15:32 +0900
Message-ID: <036901cd6fbd$d2351a50$769f4ef0$%kim@samsung.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
 <1342789723-3949-3-git-send-email-shaik.ameer@samsung.com>
 <033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com>
 <CAJuYYwTy5zkeM_cJO7HMm+=v=ORPHD26nQYZwXK6v1noWm1EuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9503 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752113Ab2HAIPj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Aug 2012 04:15:39 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8200MATHLSFKD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 17:15:33 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8200L5NHLWES70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 17:15:33 +0900 (KST)
In-reply-to: <CAJuYYwTy5zkeM_cJO7HMm+=v=ORPHD26nQYZwXK6v1noWm1EuA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: 'Shaik Ameer Basha' <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, shaik.samsung@gmail.com

Thomas Abraham wrote:
> 
> On 1 August 2012 12:10, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Shaik Ameer Basha wrote:
> 
> [...]
> 
> >> +* Samsung Exynos5 Gscaler device
> >> +
> >> +Gscaler is used for scaling and color space conversion on EXYNOS5
SoCs.
> >> +
> >> +Required properties:
> >> +- compatible: should be "samsung,exynos5250-gsc"
> >
> > IMO, should be "samsung,exynos5-gsc" because upcoming EXYNOS5 SoCs can
> use
> > same gscaler driver.
> 
> The compatible string should always be specific and it should clearly
> identify the type of the controller. If there are other variants of
> the GSC controller in previous of upcoming SoC's, then those
> controllers will have a different compatible value.
> 
As I commented, there will be no differences for gscaler between EXYNOS5
SoCs. So IMO, the 'exynos5-gsc' is clear enough for compatible string of
EXYNOS5 Gscaler.

> This allows device drivers to know the type of the controller and
> handle the differences among them. And, the node in the dts/dtsi file
> should always claim compatibility to the base version of the
> controller that the platform supports.
> 
> So the compatible value "samsung,exynos5250-gsc" is right one. If a
> new SoC in the Exynos5 family has the same GSC controller as that in
> Exynos5250 (no difference at all), then GSC device node in its dts
> file can continue to claim compatibility to Exynos5250 type. The

I don't think so...

> "samsung,s3c2410-wdt is an example of this case which has been used on
> all Samsung SoC's .
> 
I think, the case of 's3c2410-wdt' is different because you know, the name
has been used for a long time in addition, the name of driver is
s3c2410_wdt.c. But in this case, gscaler should be same on EXYNOS5 SoCs
which is including upcoming, so I don't see why we should use
'exynos5250-gsc' for all of EXYNOS5 series.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
