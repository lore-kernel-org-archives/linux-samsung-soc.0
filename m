From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] mfd: max77686: fix support for devices without irq
 specified
Date: Fri, 08 Aug 2014 14:24:05 +0200
Message-ID: <6204488.MKXsGQj0V8@amdc1032>
References: <1457999.lNPdqEWCCR@amdc1032> <1407495251.28710.2.camel@AMDC1943>
 <53E4AD6A.4000705@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57732 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755942AbaHHMYK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Aug 2014 08:24:10 -0400
In-reply-to: <53E4AD6A.4000705@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>


Hi Javier,

On Friday, August 08, 2014 12:58:50 PM Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 08/08/2014 12:54 PM, Krzysztof Kozlowski wrote:
> >> >> 
> >> >> Not sufficient. You have to also fix RTC driver (OOPS from Trats2
> >> >> attached). Also consider adding checks for (max77686->irq) to the
> >> >> suspend and resume.
> >> >> 
> >> > 
> >> > Right, the max77686 RTC driver assumes that an IRQ domain will be created on the
> >> > mfd driver so a virtual IRQ can be mapped for the RTC alarm1 IRQ. This
> >> > assumptions comes from the fact that the "interrupt" property is required
> >> > according to the DT binding doc.
> >> > 
> >> 
> >> Although for Trats2 I see that arch/arm/boot/dts/exynos4412-trats2.dts defines
> >> an interrupt, so I wonder why regmap_irq_get_virq() is giving an oops there:
> >> 
> >> max77686_pmic@09 {
> >> 	compatible = "maxim,max77686";
> >> 	interrupt-parent = <&gpx0>;
> >> 	interrupts = <7 0>;
> >> 	reg = <0x09>;
> >> 	#clock-cells = <1>;
> >> ...
> > 
> > Because I am a nasty user :) and I removed the interrupts properties
> > manually (to test how the RTC will behave). Still the driver shouldn't
> > oops.
> > 
> 
> Oh, now it makes sense :)
> 
> Yes, I agree with you that the driver should not oops. The probe should fail
> though if no IRQ domain was created on the MFD driver since that DT property is
> required.
> 
> I'll send a fix for this today, thanks a lot for reporting it.
> 
> >> 
> >> 
> >> > So the max77686 RTC wakealarm was not working for these boards before?
> > 
> > I don't know for Odroid but on Trats2 it works fine.

On ODROID U3 with my max77686 fix applied RTC driver fails with:

[    1.743607] max77686-rtc max77686-rtc: max77686_rtc_probe
[    1.748312] max77686-rtc max77686-rtc: max77686_rtc_init_reg: fail to write controlm reg(-6)
[    1.756509] max77686-rtc max77686-rtc: Failed to initialize RTC reg:-6

However it turns out that RTC can be fixed with patches from Daniel Drake
(please see below).

> >> > 
> >> > Just to be sure that I understand the issue: these boards don't really have an
> >> > IRQ connected to the PMIC, is not that this information is just missing in the
> >> > Device Tree, right?
> >> > 
> >> 
> >> By looking at Odroid's 3.8 based vendor tree I see that an IRQ for the max77686
> >> PMIC is defined [0] using platform data:
> >> 
> >> static struct max77686_platform_data exynos4_max77686_info = {
> >> 	.irq_gpio	= 	EXYNOS4_GPX3(2),
> >> 	.ono		=	EXYNOS4_GPX1(2),
> >> 	.num_regulators = ARRAY_SIZE(max77686_regulators),
> >> 	.regulators = max77686_regulators,
> >> ...
> >> 
> >> So maybe this information is missing in
> >> arch/arm/boot/dts/exynos4412-odroid-common.dtsi?
> > 
> > Yes, it seems it is missing.
> > 
> 
> Indeed.

It seems that Daniel Drake has already fixed ODROID dtsi with:

  [PATCH 1/2] ARM: dts: Enable PMIC interrupts on ODROID
  http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg34191.html

and

  [PATCH 2/2] ARM: dts: ODROID i2c improvements
  http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg34190.html

Both patches are needed to fix boot on ODROID.  They also fix RTC driver
registration:

MFD driver error message with only patch #1 applied:
[    0.164488] max77686 0-0009: failed to add RTC irq chip: -6

RTC driver messages with both patches #1 and #2 applied:
[    1.731461] max77686-rtc max77686-rtc: max77686_rtc_probe
[    1.833303] max77686-rtc max77686-rtc: rtc core: registered max77686-rtc as rtc0

Kukjin, could you please apply Daniel's fixes?  They are critical for ODROID
boards.

Javier, I think that it still would be useful to apply my patch for max77686
as it makes new kernels work with older dtbs and leaves the possibility to
use PMIC on boards without IRQ connected.  If you agree I will post v2 of
the patch (with suspend/resume handlers fixed and bindings documentation
updated).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
