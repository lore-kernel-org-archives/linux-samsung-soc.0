From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv5 5/5] ARM: dts: Enable thermal_zone for exynos5422-odroidxu3
Date: Wed, 13 May 2015 14:09:43 +0530
Message-ID: <CANAwSgTaM+Fthmu=bVjsg-5-iojWRS+om32APY=NDG5nK2iPQQ@mail.gmail.com>
References: <1431499020-3912-1-git-send-email-linux.amoon@gmail.com>
 <1431499020-3912-6-git-send-email-linux.amoon@gmail.com> <CAJKOXPeNB=BXoY6CAxE8MNZ90cchhbdbUg3Xgef3qAgBR2UWJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:34499 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751820AbbEMIkF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 04:40:05 -0400
In-Reply-To: <CAJKOXPeNB=BXoY6CAxE8MNZ90cchhbdbUg3Xgef3qAgBR2UWJA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Markus Reichl <m.reichl@fivetechno.de>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 13 May 2015 at 13:10, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> 2015-05-13 15:37 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
>> Include exynos5-cpu-thermal.dtsi to enable thermal_zone support.
>
> I am a little confused because you named this file as
> exynos5-cpu-thermal, meaning it is common for all Exynos5 boards. But:
> 1. It references some specific phandles like &fan0 (cooling-device =
> <&fan0 2 3>).
> 2. You include it only here.
>
> So the question: is "exynos5-cpu-thermal.dtsi" a generic thermal DTSI?
> What is your intention?
>
> Lukasz, you acked the patchset, is it fine?
>
> Best regards,
> Krzysztof

Hi Krysxtof,

This file almost similar to below patch

https://patchwork.kernel.org/patch/5693321/

I had to create this new file as I was not able to register
#thermal-sensors to tmu_cpu0.

+       thermal-zones {
+               cpu0_thermal: cpu0-thermal {
+                       thermal-sensors = <&tmu_cpu0 0>;
+                       polling-delay-passive = <0>;
+                       polling-delay = <0>;

Earlier the DTS sensor's were not getting registers to the tmu_cpu0 sensors.

I am not aware If this file will be common to Exynos5 series.
I could not include any common dts file as I would through me
compilation error hence .dtsi  extension,

-Anand Moon
