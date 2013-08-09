From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCHv2 5/5] ARM: dts: Add dt binding documentation for exynos
 rotator
Date: Fri, 09 Aug 2013 19:05:18 +0200
Message-ID: <4138489.peCz4QHBct@amdc1227>
References: <1376034053-31910-1-git-send-email-chanho61.park@samsung.com>
 <229348511.e5ckfeMu0d@amdc1227> <52051B06.7000209@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:58767 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751592Ab3HIRFX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 13:05:23 -0400
In-reply-to: <52051B06.7000209@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Chanho Park <chanho61.park@samsung.com>, inki.dae@samsung.com, kgene.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, mark.rutland@arm.com, l.stach@pengutronix.de, s.nawrocki@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, ian.campbell@citrix.com, rob.herring@calxeda.com, pawel.moll@arm.com

On Friday 09 of August 2013 10:38:30 Stephen Warren wrote:
> On 08/09/2013 07:15 AM, Tomasz Figa wrote:
> > Hi Chanho,
> > 
> > On Friday 09 of August 2013 16:40:53 Chanho Park wrote:
> >> This patch describes each nodes of rotator and specifies a example how
> >> to bind it.
> >> 
> >> diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> >> 
> >> +* Samsung Image Rotator
> >> +
> >> +Required properties:
> >> +  - compatible : value should be following:
> >> +	(a) "samsung,exynos4210-rotator" for Rotator IP in Exynos4210
> >> +	(b) "samsung,exynos4212-rotator" for Rotator IP in Exynos4212/4412
> >> +	(c) "samsung,exynos5250-rotator" for Rotator IP in Exynos5250
> 
> Is "rotator" the name that the HW documentation uses to refer to this
> block?

Yes, it is. More specifically it is referred to as "Image Rotator".

Best regards,
Tomasz

> If so, those compatible values seem fine. If not, they seem
> slightly too generic for me; perhaps better to use the raw HW block name?
