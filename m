From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v5 4/4] ARM: dts: Add Ethernet chip to SMDK5410
Date: Thu, 05 Nov 2015 14:36:36 +0300
Message-ID: <005001d117be$3b5709c0$b2051d40$@samsung.com>
References: <cover.1446542020.git.p.fedin@samsung.com>
 <4568ad982f0af1846994119961cbb798edff311c.1446542020.git.p.fedin@samsung.com>
 <5639C1A5.1040708@samsung.com> <004f01d117bb$1e4fbb40$5aef31c0$@samsung.com>
 <563B3D15.2070700@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48829 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031023AbbKELgk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2015 06:36:40 -0500
In-reply-to: <563B3D15.2070700@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Kukjin Kim' <kgene@kernel.org>

 Hello!

> >>> +	ethernet@3 {
> >>> +		compatible = "smsc,lan9115";
> >>> +		reg = <3 0 0x10000>;
> >>> +		phy-mode = "mii";
> >>> +		interrupt-parent = <&gpx0>;
> >>> +		interrupts = <5 8>;
> >>
> >> s/8/IRQ_TYPE_LEVEL_LOW/
> >> (is this really level low interrupt?)
> >
> >  Yes, according to: https://github.com/AndreiLux/Perseus-S3/blob/master/arch/arm/mach-
> exynos/mach-smdk5250.c#L133
> 
> Although this is different board, but okay.

 I am curious too, so i examined SMSC datasheet. The IRQ is fully programmable on
chip's side too, and our driver indeed defaults to active-low. You can switch it
to active-high by addint smsc,irq-active-high property. But i just copied
settings from those old Android kernels, and it just works.
 So, cleaning up and posting v6.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
