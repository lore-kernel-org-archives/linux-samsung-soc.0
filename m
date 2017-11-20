From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: exynos: add machine description for ODROID-XU3/4
Date: Mon, 20 Nov 2017 08:37:21 +0100
Message-ID: <CAJKOXPc=iMzT_3K9Rysnv4B06wqOmmdXWxSjU6yDTC8vMnujNg@mail.gmail.com>
References: <20171118203544.19431-1-tobetter@gmail.com> <9f1311f1-2986-21f1-7016-29efc7b2a543@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751103AbdKTHhY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Nov 2017 02:37:24 -0500
In-Reply-To: <9f1311f1-2986-21f1-7016-29efc7b2a543@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Dongjin Kim <tobetter@gmail.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Nov 19, 2017 at 6:21 PM, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
> I don't think this approach scales at all. DietPi can just read the devicetree
> through sysfs and retrieve the compatible and/or model of the base node.

Exactly, do not add new machines just for reading DT. Use
/sys/firmware/devicetree/base/compatible for this.

Best regards,
Krzysztof

> - Tobias
>
> Dongjin Kim wrote:
>> This patch is to add the machine descriptions for ODROID-XU3/4 boards
>> in order to present the hardware name at /proc/cputinfo rather than
>> "SAMSUNG EXYNOS (Flattened Device Tree)". An embedded open source project,
>> such as DietPi, reads the hardware name to run different features.
>>
>>       $ cat /proc/cpuinfo | grep Hardware
>>       Hardware        : ODROID-XU4
>>
>> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
>> ---
>>  arch/arm/mach-exynos/exynos.c | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
>> index c404c15ad07f..6197dbf9f48b 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -241,3 +241,31 @@ DT_MACHINE_START(EXYNOS_DT, "SAMSUNG EXYNOS (Flattened Device Tree)")
>>       .dt_compat      = exynos_dt_compat,
>>       .dt_fixup       = exynos_dt_fixup,
>>  MACHINE_END
>> +
>> +#define ODROID_MACHINE_START(name, compat)                   \
>> +     DT_MACHINE_START(EXYNOS5422_ODROID_##name, "ODROID-"#name)      \
>> +             .l2c_aux_val    = 0x3c400001,                   \
>> +             .l2c_aux_mask   = 0xc20fffff,                   \
>> +             .smp            = smp_ops(exynos_smp_ops),      \
>> +             .map_io         = exynos_init_io,               \
>> +             .init_early     = exynos_firmware_init,         \
>> +             .init_irq       = exynos_init_irq,              \
>> +             .init_machine   = exynos_dt_machine_init,       \
>> +             .init_late      = exynos_init_late,             \
>> +             .dt_compat      = compat,                       \
>> +             .dt_fixup       = exynos_dt_fixup,              \
>> +     MACHINE_END
>> +
>> +static char const *const exynos5422_odroidxu3_dt_compat[] __initconst = {
>> +     "hardkernel,odroid-xu3",
>> +     "hardkernel,odroid-xu3-lite",
>> +     NULL,
>> +};
>> +
>> +static char const *const exynos5422_odroidxu4_dt_compat[] __initconst = {
>> +     "hardkernel,odroid-xu4",
>> +     NULL,
>> +};
>> +
>> +ODROID_MACHINE_START(XU3, exynos5422_odroidxu3_dt_compat)
>> +ODROID_MACHINE_START(XU4, exynos5422_odroidxu4_dt_compat)
>>
>
