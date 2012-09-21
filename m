From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC 6/6] ARM: dts: exynos4210: Add platform-specific descriptions
 for pin controllers
Date: Fri, 21 Sep 2012 12:56:41 -0600
Message-ID: <505CB869.5030307@wwwdotorg.org>
References: <1348131197-25506-1-git-send-email-t.figa@samsung.com> <1348131197-25506-7-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:33937 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932774Ab2IUS4p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 14:56:45 -0400
In-Reply-To: <1348131197-25506-7-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linus.walleij@linaro.org, m.szyprowski@samsung.com

On 09/20/2012 02:53 AM, Tomasz Figa wrote:
> The patch "pinctrl: samsung: Parse pin banks from DT" introduced
> platform-specific data parsing from DT.
> 
> This patch adds all necessary nodes and properties to exynos4210 device
> tree sources.

> +++ b/arch/arm/boot/dts/exynos4210-pinctrl-banks.dtsi

> +/ {
> +	pinctrl@11400000 {
> +		gpa0: pin-bank@0 {

If you're going to put a unit address ("@0")into the DT node name, the
node should have a reg property containing the same value, and the
parent node should have #address-cells and #size-cells properties.

However, I believe you can actually get unique node names without using
a unit address; instead name the nodes after the object they represent,
so e.g. s/pin-bank@0/gpa0/ above.

> +			gpio-controller;

You need a #gpio-cells property too.

> +			samsung,pctl-offset = <0x000>;
> +			samsung,pin-bank = "gpa0";
> +			samsung,pin-count = <8>;
> +			samsung,func-width = <4>;
> +			samsung,pud-width = <2>;
> +			samsung,drv-width = <2>;
> +			samsung,conpdn-width = <2>;
> +			samsung,pudpdn-width = <2>;

The properties above represent the width of the fields. Must all fields
always be packed together into say the LSB of the registers? What if
there are gaps between the fields in a future SoC variant, or the order
of the fields in the register changes? I think you want to add either a
samsung,func-bit/samsung,func-position property for each of the fields,
or change from samsung,func-width=<4> to samsung,field-mask=<0xf>. IIRC,
the generic pinctrl binding used a mask for this purpose.

What if a future SoC variant adds more fields to the register? At that
point, you'd need to edit the driver anyway in order to define a new DT
property to represent the new field. Perhaps instead of having an
explicit named property per field in the register, you want a simple
list of fields:

samsung,pin-property-names = "func", "pud", "drv", "conpdn", "pudpdn";
samsung,pin-propert-masks = <0xf 0x30 0xc0 0x300 0xc00>;

That would allow a completely arbitrary number of fields and layouts to
be described.

I wonder if for absolute generality you want a samsung,pin-stride
property to represent the difference in register address per pin. I
assume that's hard-coded as 4 right now.

> +			interrupt-controller;

You need a #interrupt-cells property too.

> +		gpd0: pin-bank@5 {
> +			gpio-controller;
> +			samsung,pctl-offset = <0x0A0>;

I think hex number are usually lower-case in DT, but I may be
extrapolating a generality from a limited set of examples.

> +		gpy5: pin-bank@19{

Missing a space before the { there.

> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index ecbc707..0e93717 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -59,6 +59,10 @@
>  		reg = <0x11400000 0x1000>;
>  		interrupts = <0 47 0>;
>  		interrupt-controller;
> +		samsung,geint-con = <0x700>;
> +		samsung,geint-mask = <0x900>;
> +		samsung,geint-pend = <0xA00>;
> +		samsung,svc = <0xB08>;

I assume those new properties represent register addresses within the
block. If not, I don't understand what they are.

It's unclear to me why those properties aren't all part of
exynos4210-pinctrl-banks.dtsi. Do you really have multiple SoCs where
the register addresses for the pinctrl registers are the same (hence can
be in a shared exynos4210-pinctrl-banks.dtsi), yet the register
addresses for the geint registers are different (hence must be in
non-shared exynos4210.dtsi)?

Do these properties interact with samsung,eint-offset at all? Oh,
perhaps these properties are defining a top-level interrupt controller
that aggregates all the banks together, whereas samsung,eint-offset is
per-bank?
