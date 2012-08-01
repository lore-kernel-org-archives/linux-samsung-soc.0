From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Wed, 01 Aug 2012 18:00:16 +0900
Message-ID: <036f01cd6fc4$120a9910$361fcb30$%kim@samsung.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
 <1342789723-3949-3-git-send-email-shaik.ameer@samsung.com>
 <033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com>
 <CAJuYYwTy5zkeM_cJO7HMm+=v=ORPHD26nQYZwXK6v1noWm1EuA@mail.gmail.com>
 <5018E656.3070803@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:27653 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752442Ab2HAJAT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Aug 2012 05:00:19 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M82003G2JNCV1J0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 18:00:17 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M820008IJOG2TA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 18:00:17 +0900 (KST)
In-reply-to: <5018E656.3070803@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Shaik Ameer Basha' <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sachin.kamat@linaro.org, joshi@samsung.com, shaik.samsung@gmail.com, sungchun.kang@samsung.com

Sylwester Nawrocki wrote:
> 
> On 08/01/2012 09:48 AM, Thomas Abraham wrote:
> > On 1 August 2012 12:10, Kukjin Kim <kgene.kim@samsung.com> wrote:
> >> Shaik Ameer Basha wrote:
> >
> > [...]
> >
> >>> +* Samsung Exynos5 Gscaler device
> >>> +
> >>> +Gscaler is used for scaling and color space conversion on EXYNOS5
> SoCs.
> >>> +
> >>> +Required properties:
> >>> +- compatible: should be "samsung,exynos5250-gsc"
> >>
> >> IMO, should be "samsung,exynos5-gsc" because upcoming EXYNOS5 SoCs can
> use
> >> same gscaler driver.
> 
> In addition to the below explanation, perhaps it's obvious, but the driver
> can claim compatibility with multiple devices, i.e. match with multiple
> 'compatible' properties.
> 

The name of exact model is 'gscaler' for EXYNOS5 SoCs not only for
EXYNOS5250. So the driver which has been submitted is also 'exynos-gsc' not
'exynos5250-gsc'. Note that there is no gscaler on EXYNOS4 SoCs now, it can
be either 'exynos5-gsc' or 'exynos-gsc'. In addition, since some
peripherals/drivers can be used for multiple SoCs and actually it does, I'm
still thinking the compatible should be represent its usage. I don't know
why restricted name is much clearer. And if multiple 'compatible' is
required, we can add it later.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> 
> > The compatible string should always be specific and it should clearly
> > identify the type of the controller. If there are other variants of
> > the GSC controller in previous of upcoming SoC's, then those
> > controllers will have a different compatible value.
> >
> > This allows device drivers to know the type of the controller and
> > handle the differences among them. And, the node in the dts/dtsi file
> > should always claim compatibility to the base version of the
> > controller that the platform supports.
> >
> > So the compatible value "samsung,exynos5250-gsc" is right one. If a
> > new SoC in the Exynos5 family has the same GSC controller as that in
> > Exynos5250 (no difference at all), then GSC device node in its dts
> > file can continue to claim compatibility to Exynos5250 type. The
> > "samsung,s3c2410-wdt is an example of this case which has been used on
> > all Samsung SoC's .
> >
