From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 12/13] ARM: dts: Add S5K5BA sensor regulator definitions for Trats board
Date: Mon, 08 Jul 2013 16:19:28 +0200
Message-ID: <5262209.9MjIZ8EmKh@thinkpad>
References: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com> <11736061.3CXfgF4Q9h@flatron> <51DAC8E8.2070405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:37219 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464Ab3GHOT4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jul 2013 10:19:56 -0400
Received: by mail-wg0-f49.google.com with SMTP id a12so3698457wgh.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2013 07:19:55 -0700 (PDT)
In-Reply-To: <51DAC8E8.2070405@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Andrzej Hajda <a.hajda@samsung.com>

On Monday 08 of July 2013 16:12:56 Sylwester Nawrocki wrote:
> Hi,
> 
> On 07/06/2013 01:26 AM, Tomasz Figa wrote:
> > On Monday 01 of July 2013 17:22:34 Sylwester Nawrocki wrote:
> >> From: Andrzej Hajda <a.hajda@samsung.com>
> >> 
> >> Add MAX8998 LDO12 and fixed voltage regulator nodes. While at it,
> >> all fixed voltage regulator nodes are grouped in a 'regulators' node.
> >> 
> >> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> >> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> ---
> >> 
> >>  arch/arm/boot/dts/exynos4210-trats.dts |   80
> >> 
> >> +++++++++++++++++++++++++------- 1 file changed, 64 insertions(+), 16
> >> deletions(-)
> >> 
> >> diff --git a/arch/arm/boot/dts/exynos4210-trats.dts
> >> b/arch/arm/boot/dts/exynos4210-trats.dts index 6b1568e..f62e299 100644
> >> --- a/arch/arm/boot/dts/exynos4210-trats.dts
> >> +++ b/arch/arm/boot/dts/exynos4210-trats.dts
> >> @@ -30,13 +30,64 @@
> >> 
> >>  		bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5
> > 
> > rootwait
> > 
> >> earlyprintk panic=5"; };
> >> 
> >> -	vemmc_reg: voltage-regulator@0 {
> >> -	        compatible = "regulator-fixed";
> >> -		regulator-name = "VMEM_VDD_2.8V";
> >> -		regulator-min-microvolt = <2800000>;
> >> -		regulator-max-microvolt = <2800000>;
> >> -		gpio = <&gpk0 2 0>;
> >> -		enable-active-high;
> >> +	regulators {
> >> +		compatible = "simple-bus";
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> > 
> > I don't think any addressing is needed for these regulators, so I'd
> > suggest removing those #properties and replacing @N with -N suffix.
> 
> Originally there were also 'reg' properties in the individual regulator
> nodes, but these were unused and I've removed them before posting. Just
> missed to get rid of #size/address-cells as well. Please note you
> similarly use such properties in patch [1].

Oh, you got me here. I must have forgotten to remove them as well.

As we already noticed some time ago, mistakes propagate much faster than 
correct solutions. ;)

> I suppose it is correct to have something like:
> 
> regulators {
> 	compatible = "simple-bus";
> 	regulator-0 {
> 		...
> 	};
> 
> 	regulator-1 {
> 		...
> 	};
> 	...
> };
> 
> rather than:
> 
> regulators {
> 	compatible = "simple-bus";
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 
> 	regulator@0 {
> 		reg = <...>;
> 		...
> 	};
> 
> 	regulator@1 {
> 		reg = <...>;
> 		...
> 	};
> };
> 
> Both patterns seem to be used in existing *.dts files.

Both patterns are correct, I guess. I'm not sure if it makes sense to specify 
address of something that is not addressable and so approach 1 makes more 
sense to me.

> I'm going to use the first option in the next iteration, unless
> someone suggest otherwise.

OK.

Best regards,
Tomasz
