From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 7/7] ARM: dts: Add device tree sources for Exynos3250
Date: Sat, 26 Apr 2014 13:38:00 +0200
Message-ID: <535B9A98.3060206@gmail.com>
References: <1398388572-30239-1-git-send-email-cw00.choi@samsung.com> <1398388572-30239-8-git-send-email-cw00.choi@samsung.com> <535B0324.50705@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <535B0324.50705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hyunhee.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sajjan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 26.04.2014 02:51, Tomasz Figa wrote:
> Hi Chanwoo,
>
> On 25.04.2014 03:16, Chanwoo Choi wrote:
>> From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> This patch add new exynos3250.dtsi to support Exynos3250 SoC based on
>> Cortex-A7
>> dual core and includes following dt nodes:
>>
>> - GIC interrupt controller
>> - Pinctrl to control GPIOs
>> - Clock controller
>> - CPU information (Cortex-A7 dual core)
>> - UART to support serial port
>> - MCT (Multi Core Timer)
>> - ADC (Analog Digital Converter)
>> - I2C/SPI bus
>> - Power domain
>> - PMU (Performance Monitoring Unit)
>> - MSHC (Mobile Storage Host Controller)
>> - PWM (Pluse Width Modulation)
>> - AMBA bus
>>
>> Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Hyunhee Kim <hyunhee.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
>> Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>>   arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 477 +++++++++++++++
>>   arch/arm/boot/dts/exynos3250.dtsi         | 405 +++++++++++++
>>   arch/arm/boot/dts/exynos4212-tizenw.dts   | 926
>> ++++++++++++++++++++++++++++++
>>   3 files changed, 1808 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/exynos3250-pinctrl.dtsi
>>   create mode 100644 arch/arm/boot/dts/exynos3250.dtsi
>>   create mode 100644 arch/arm/boot/dts/exynos4212-tizenw.dts
>>
>> diff --git a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
>> b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
>> new file mode 100644
>> index 0000000..976490b
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
>> @@ -0,0 +1,477 @@
>> +/*
>> + * Samsung's Exynos3250 SoCs pin-mux and pin-config device tree source
>> + *
>> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
>> + *        http://www.samsung.com
>> + *
>> + * Samsung's Exynos3250 SoCs pin-mux and pin-config optiosn are
>> listed as device
>> + * tree nodes are listed in this file.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +/ {
>> +    pinctrl@11400000 {
>
> Could you use references instead of re-specifying the whole tree
> hierarchy in every file a node is used?
>
> Instead of
>
> / {
>      pinctrl@11400000 {
>
>      };
> };
>
> one may simply use
>
> &pinctrl_0 {
>
> };
>
> You might just need to change the location of #include
> "exynos3250-pinctrl.dtsi" from top of exynos3250.dtsi to bottom of it.

Oh, well, you also should move all nodes of on-SoC devices under a 
simple-bus node called soc. You can see the patch adding dts file for 
Exynos5260 for an example [1].

[1] http://thread.gmane.org/gmane.linux.kernel.samsung-soc/29360/focus=29361

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
