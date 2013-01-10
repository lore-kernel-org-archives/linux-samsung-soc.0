From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: dts: fix compatible value for exynos pinctrl
Date: Wed, 09 Jan 2013 17:34:03 -0800
Message-ID: <00e001cdeed2$94c89a90$be59cfb0$@samsung.com>
References: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com>
 <1357172423-8217-2-git-send-email-kgene.kim@samsung.com>
 <CAOesGMiSgcuD7z4yc2Z+_hi+PZnuv9pa7saeGymwT0DPz=j8dQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14232 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932383Ab3AJBeS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 20:34:18 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGD00DEZZ09OB50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 10:34:17 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGD003XZZ111V20@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 10:34:16 +0900 (KST)
In-reply-to: <CAOesGMiSgcuD7z4yc2Z+_hi+PZnuv9pa7saeGymwT0DPz=j8dQ@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>, 'Grant Likely' <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org

Olof Johansson wrote:
> 
> On Wed, Jan 2, 2013 at 4:20 PM, Kukjin Kim <kgene.kim@samsung.com>
> wrote:
> > Fix the incorrect compatible property value of pinctrl for EXYNOS4 SoCs.
> 
> Ah, this answers my question from the previous patch. So, why do 5450
> as a separate patch?
> 
OK, let me create one patch to fix it :-)

> 
> > diff --git
a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> > index e97a278..4598a47 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> > @@ -7,9 +7,9 @@ on-chip controllers onto these pads.
> >
> >  Required Properties:
> >  - compatible: should be one of the following.
> > -  - "samsung,pinctrl-exynos4210": for Exynos4210 compatible pin-
> controller.
> > -  - "samsung,pinctrl-exynos4x12": for Exynos4x12 compatible pin-
> controller.
> > -  - "samsung,pinctrl-exynos5250": for Exynos5250 compatible pin-
> controller.
> > +  - "samsung,exynos4210-pinctrl": for Exynos4210 compatible pin-
> controller.
> > +  - "samsung,exynos4x12-pinctrl": for Exynos4x12 compatible pin-
> controller.
> > +  - "samsung,exynos5250-pinctrl": for Exynos5250 compatible pin-
> controller.
> 
> Do we care about backwards compatibility for ARM device trees yet?
> It's becoming time to start caring soon, if we don't. So while this
> might be OK for this time around, we should start requiring some
> backwards compatibility for bindings that have been used in at least
> one released kernel.
> 
Agree, let me check again.

> Once we do care, then you can update the dts/dtsi files, but you'll
> need to keep both the old and the new bindings in the C file below.
> 
OK, I see.

Thanks.

[...]

- Kukjin
