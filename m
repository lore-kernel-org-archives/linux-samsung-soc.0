From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v5 0/4] Exynos SROMc configuration and Ethernet support for
 SMDK5410
Date: Thu, 05 Nov 2015 11:44:47 +0300
Message-ID: <001a01d117a6$3aed1140$b0c733c0$@samsung.com>
References: <cover.1446542020.git.p.fedin@samsung.com>
 <5639B588.1080901@samsung.com> <000b01d1179f$ed5032b0$c7f09810$@samsung.com>
 <563B0E4D.6020808@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36885 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030329AbbKEIov (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2015 03:44:51 -0500
In-reply-to: <563B0E4D.6020808@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Kukjin Kim' <kgene@kernel.org>

 Hello!

> >>> This patchset also depends on Exynos 5410 pinctrl support, introduced by
> >>> patches 0003 and 0004 from this set:
> >>> [PATCH v4 0/5] ARM: EXYNOS: ODROID-XU DT and LEDs
> >>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/330862.html
> >>
> >> Only the first patch made up to kernel. The rest (2-5) received feedback
> >> and I am waiting for fixing it. Andreas apparently loose the interest...
> >
> >  I have rechecked the original thread on archives and found nothing new. Where can
> > i read those feedbacks? Perhaps it makes sense for me to pick them up and include
> > into my set.
> 
> Go ahead. The only waiting feedback is at patch 2/5:
> 
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/330910.html
> Javier's pointed use of linux,stdout-path and putting xxti in
> exynos5410.dtsi (and customizing it per board if needed).
> 
> Patches already got reviews and acks so only 2/5 is the stopper.

 Ah, it's odroidXU device tree. Sorry, i don't have this particular board, and my patch actually doesn't need it. I could do some
blind modifications, but cannot test them, and this is out of my scope at all.
 As mentioned in the commit msg, i need only 0003 and 0004 from there. Can they be picked up independently? They don't need 0002 by
themselves, only 0005 needs it.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
