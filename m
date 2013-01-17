From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: fix compatible value for exynos pinctrl
Date: Thu, 17 Jan 2013 11:16:59 +0100
Message-ID: <5593414.DjjP9pdJVI@amdc1227>
References: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com>
 <1357172423-8217-2-git-send-email-kgene.kim@samsung.com>
 <CAOesGMiSgcuD7z4yc2Z+_hi+PZnuv9pa7saeGymwT0DPz=j8dQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:17746 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759482Ab3AQKRI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 05:17:08 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGR00IFALW4B9X0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 19:17:06 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGR00IVILWGXP60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 19:17:06 +0900 (KST)
In-reply-to: <CAOesGMiSgcuD7z4yc2Z+_hi+PZnuv9pa7saeGymwT0DPz=j8dQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org

Hi Olof,

On Saturday 05 of January 2013 14:57:54 Olof Johansson wrote:
> On Wed, Jan 2, 2013 at 4:20 PM, Kukjin Kim <kgene.kim@samsung.com> 
wrote:
> > Fix the incorrect compatible property value of pinctrl for EXYNOS4
> > SoCs.
> Ah, this answers my question from the previous patch. So, why do 5450
> as a separate patch?
> 
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> > b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt index
> > e97a278..4598a47 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> > @@ -7,9 +7,9 @@ on-chip controllers onto these pads.
> > 
> >  Required Properties:
> >  - compatible: should be one of the following.
> > 
> > -  - "samsung,pinctrl-exynos4210": for Exynos4210 compatible
> > pin-controller. -  - "samsung,pinctrl-exynos4x12": for Exynos4x12
> > compatible pin-controller. -  - "samsung,pinctrl-exynos5250": for
> > Exynos5250 compatible pin-controller. +  -
> > "samsung,exynos4210-pinctrl": for Exynos4210 compatible
> > pin-controller. +  - "samsung,exynos4x12-pinctrl": for Exynos4x12
> > compatible pin-controller. +  - "samsung,exynos5250-pinctrl": for
> > Exynos5250 compatible pin-controller.
> Do we care about backwards compatibility for ARM device trees yet?
> It's becoming time to start caring soon, if we don't. So while this
> might be OK for this time around, we should start requiring some
> backwards compatibility for bindings that have been used in at least
> one released kernel.

This also brings the general problem of dts verification.

As of now, we don't have any way of checking dts files for compliance with 
defined bindings. Moreover we don't even have a way of defining those 
bindings other than plain text documentation.

Now, the problem is that anyone can put anything in their device tree 
sources and we can't check if the information is specified correctly by 
any other means that someone reading it and confirming with documentation 
and/or driver code (the documentation isn't always up to date...).

I remember there was some effort going towards encoding device tree 
bindings using something like XML schemas, but I'm not sure to what point 
it got and what was the conclusion. (Personally I think that it was a bit 
overcomplicated, but I never had time to polish and implement some of my 
ideas, eventually letting the problem fade off from my mind.)

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
