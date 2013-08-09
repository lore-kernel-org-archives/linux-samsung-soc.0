From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCHv2 5/5] ARM: dts: Add dt binding documentation for exynos
 rotator
Date: Fri, 09 Aug 2013 15:15:53 +0200
Message-ID: <229348511.e5ckfeMu0d@amdc1227>
References: <1376034053-31910-1-git-send-email-chanho61.park@samsung.com>
 <1376034053-31910-6-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52182 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758306Ab3HINP7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 09:15:59 -0400
In-reply-to: <1376034053-31910-6-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: inki.dae@samsung.com, kgene.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, mark.rutland@arm.com, l.stach@pengutronix.de, s.nawrocki@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob.herring@calxeda.com, pawel.moll@arm.com

Hi Chanho,

On Friday 09 of August 2013 16:40:53 Chanho Park wrote:
> This patch describes each nodes of rotator and specifies a example how to
> bind it.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../devicetree/bindings/gpu/samsung-rotator.txt    |   26
> ++++++++++++++++++++ 1 file changed, 26 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt new file
> mode 100644
> index 0000000..31ee7b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> @@ -0,0 +1,26 @@
> +* Samsung Image Rotator
> +
> +Required properties:
> +  - compatible : value should be following:
> +	(a) "samsung,exynos4210-rotator" for Rotator IP in Exynos4210
> +	(b) "samsung,exynos4212-rotator" for Rotator IP in Exynos4212/4412
> +	(c) "samsung,exynos5250-rotator" for Rotator IP in Exynos5250
> +
> +  - reg : Physical base address of the IP registers and length of memory
> +	  mapped region.
> +
> +  - interrupts : Interrupt number of Rotator

What about: interrupt specifier for rotator interrupt, according to format 
specific to interrupt parent.

> +
> +  - clocks : Clock number described in
> Documentations/devicetree/binding/clock. +

Perhaps: clock specifier for rotator clock, according to generic clock 
bindings.

> +  - clock-names : Clock name.

Names of clocks specified in "clocks" property. For exynos rotator this 
property should contain only one name: "rotator".

> +Example:
> +	rotator: rotator@12800000 {

I wonder if we shouldn't use a more generic name here, according to ePAPR 
node naming recommendation.

> +		compatible = "samsung,exynos4210-rotator";
> +		reg = <0x12810000 0x1000>;

Typo. Node has 12800000 in unit-address suffix, but this property has 
12810000 instead.

> +		interrupts = <0 83 0>;
> +		clocks = <&clock 278>;
> +		clock-names = "rotator";
> +		status = "disabled";

Status property should be omitted from this example, as it's not a part of 
this binding.

Best regards,
Tomasz
