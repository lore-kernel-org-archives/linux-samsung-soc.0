From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCHv3 4/5] rtc: s3c: Add support for RTC of Exynos3250 SoC
Date: Tue, 16 Sep 2014 17:04:06 +0200
Message-ID: <CABxcv=nYqp8zuZxh=uKyRcJB6RgQtpM1+Hr9OcTPz849zdKsWQ@mail.gmail.com>
References: <1409216559-22402-1-git-send-email-cw00.choi@samsung.com>
	<1409216559-22402-5-git-send-email-cw00.choi@samsung.com>
	<CABxcv=ku9fjFfzyXZEnCGpTrWQ0pN+5mLWay90jXBhkFeWb7sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:37288 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753952AbaIPPEH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Sep 2014 11:04:07 -0400
Received: by mail-wi0-f176.google.com with SMTP id ex7so6537795wid.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Sep 2014 08:04:06 -0700 (PDT)
In-Reply-To: <CABxcv=ku9fjFfzyXZEnCGpTrWQ0pN+5mLWay90jXBhkFeWb7sg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Douglas Anderson <dianders@chromium.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, akpm <akpm@linux-foundation.org>, Kyungmin Park <kyungmin.park@samsung.com>, rtc-linux@googlegroups.com, Linux Kernel <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

[adding Doug Anderson as cc]

On Tue, Sep 16, 2014 at 3:48 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> On Thu, Aug 28, 2014 at 11:02 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>> This patch add support for RTC of Exynos3250 SoC. The Exynos3250 needs source
>> clock(32.768KHz) for RTC block. If source clock of RTC is registerd on clock
>> list of common clk framework, Exynos RTC drvier have to control this clock.
>>
>> Clock list for s3c-rtc device:
>> - rtc : CLK_RTC of CLK_GATE_IP_PERIR is gate clock for RTC.
>> - rtc_src : XrtcXTI is 32.768.kHz source clock for RTC.
>
> Is this RTC source clock needed for all Exynos SoCs?
>

By looking at the Exynos5420 user manual I see that there is indeed a
XrtcXTI clock pad and the doc says:

"XRTCXTI: Specifies a clock from 32.768 kHz crystal pad with XRTCXTI
and XRTCXTO pins. RTC uses this
clock as the source of a real-time clock."

Also by looking at the board schematic I see that the 32KHZAP clock
from the Maxim77802 PMIC is used as the external 32.768.kHz source
clock for the RTC but that information is not in the downstream
ChromeOS DTS since AFAIU the Maxim driver in that tree predates the
common clock framework so the PMIC clocks were modeled as regulators.

>> @@ -480,11 +530,19 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>>
>>         info->rtc_clk = devm_clk_get(&pdev->dev, "rtc");
>>         if (IS_ERR(info->rtc_clk)) {
>> -               dev_err(&pdev->dev, "failed to find rtc clock source\n");
>> +               dev_err(&pdev->dev, "failed to find rtc clock\n");
>>                 return PTR_ERR(info->rtc_clk);
>>         }
>>         clk_prepare_enable(info->rtc_clk);
>>
>> +       info->rtc_src_clk = devm_clk_get(&pdev->dev, "rtc_src");
>> +       if (IS_ERR(info->rtc_src_clk)) {
>> +               dev_err(&pdev->dev, "failed to find rtc source clock\n");
>> +               return PTR_ERR(info->rtc_src_clk);
>
> On an Exynos5420 Peach Pit machine I'm having the following error and
> the driver fails to probe:
>
> [    2.095700] s3c-rtc: probe of 101e0000.rtc failed with error -2
>
> Reverting this patch fixes the issue and the s3c RTC works again on
> this machine.
>

The following change [0] in the Peach Pit DTS makes the RTC to claim
the external clock and is working again but I'm not sure if $subject
is correct in making the "rtc_src" property mandatory since it breaks
backward DT compatibility.

Best regards,
Javier

[0]
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts
b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 9a23382..47d7a5b 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/maxim,max77802.h>
 #include "exynos5420.dtsi"

 / {
@@ -151,7 +152,7 @@
        status = "okay";
        clock-frequency = <400000>;

-       max77802-pmic@9 {
+       max77802: max77802-pmic@9 {
                compatible = "maxim,max77802";
                interrupt-parent = <&gpx3>;
                interrupts = <1 IRQ_TYPE_NONE>;
@@ -726,6 +727,8 @@
 };

 &rtc {
+       clocks = <&clock CLK_RTC>, <&max77802 MAX77802_CLK_32K_AP>;
+       clock-names = "rtc", "rtc_src";
        status = "okay";
 };
