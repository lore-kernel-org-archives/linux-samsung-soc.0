From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: Disable I2C controllers by default on
 Exynos5250
Date: Thu, 12 Sep 2013 17:59:24 +0200
Message-ID: <7196639.0uobgTXfLN@amdc1227>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
 <2175767.kktjrZWOAr@amdc1227> <5231D7BB.6050702@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45732 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754647Ab3ILP7c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 11:59:32 -0400
In-reply-to: <5231D7BB.6050702@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>

On Thursday 12 of September 2013 09:03:23 Stephen Warren wrote:
> On 09/12/2013 06:58 AM, Tomasz Figa wrote:
> > Hi Mark,
> > 
> > On Thursday 12 of September 2013 11:40:27 Mark Brown wrote:
> >> From: Mark Brown <broonie@linaro.org>
> >> 
> >> Ensure that unused I2C controllers are not activated, causing problems
> >> due to inappropriate pinmuxing or similar, by marking the controllers
> >> as
> >> disabled by default and requiring boards to explicitly enable those
> >> that
> >> are in use.
> >> 
> >> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> >> 
> >>  	i2c@12C60000 {
> >> 
> >> +		status = "okay";
> > 
> > I would keep the status properties at the end of all properties,
> > indicating that at this point the description is complete and also to
> > be consistent with other dts files around.
> 
> DT doesn't define any kind of ordering for the properties AFAIK, so the
> order shouldn't matter in practice; it conveys no semantic
> representation as far as the parsing code is concerned even if a human
> may be influenced otherwise:-)

Well, this is somehow similar to code, maybe not exactly in case of 
ordering, but coding style and conventions. Unreadable code can do exactly 
the same thing as readable code, while we somehow prefer the readable one.

> Just as an FYI, the rule I've been trying to follow in Tegra DT files is
> that properties that are overridden from any included .dtsi file come
> first, followed by any new properties. Still, there's no particular
> reason anyone else has to follow that layout.

On Exynos I've been trying to keep status as the last property, compatible 
as first, followed by reg and without any specific order of any other 
properties. Again, this is simply to keep some consistence across the dtses 
making them easier to read.

Best regards,
Tomasz
