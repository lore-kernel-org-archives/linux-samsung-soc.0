From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [PATCH 4/5] ARM: SAMSUNG: Add clkdev support for exynos4
Date: Tue, 29 Mar 2011 10:35:00 +0530
Message-ID: <AANLkTi=uL6u_8UYgWD+yY=dKaB5c=KQRbCt-58e69Dxa@mail.gmail.com>
References: <1301310460-20974-1-git-send-email-thomas.ab@samsung.com>
	<1301310460-20974-5-git-send-email-thomas.ab@samsung.com>
	<AANLkTimzhpEmWBsz-YzHGtY9xs8DungV1nRdp793nZzb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:42702 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751496Ab1C2FFB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Mar 2011 01:05:01 -0400
Received: by iyb14 with SMTP id 14so3870060iyb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Mar 2011 22:05:00 -0700 (PDT)
In-Reply-To: <AANLkTimzhpEmWBsz-YzHGtY9xs8DungV1nRdp793nZzb@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>, =?UTF-8?B?7J2064+Z7ZmU?= <dh09.lee@samsung.com>

Hi Mr. Kyungmin Park,

On Mon, Mar 28, 2011 at 6:41 PM, Kyungmin Park <kmpark@infradead.org> wrote:
> Hi,
>
> On Mon, Mar 28, 2011 at 8:07 PM, Thomas Abraham <thomas.ab@samsung.com> wrote:
>> Add clkdev support for Samsung's Exynos4 platforms.
>>
>> Cc: Ben Dooks <ben-linux@fluff.org>
>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>> ---
>>  arch/arm/Kconfig                            |    1 +
>>  arch/arm/mach-exynos4/clock.c               |   57 +++++++++++++++++++++++++++
>>  arch/arm/mach-exynos4/include/mach/clkdev.h |    7 +++
>>  arch/arm/mach-exynos4/time.c                |    2 +
>>  arch/arm/plat-samsung/pwm-clock.c           |   10 +++++
>>  5 files changed, 77 insertions(+), 0 deletions(-)
>>  create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
>>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 93d595a..66f50f8 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -779,6 +779,7 @@ config ARCH_EXYNOS4
>>        select ARCH_SPARSEMEM_ENABLE
>>        select GENERIC_GPIO
>>        select HAVE_CLK
>> +       select CLKDEV_LOOKUP
>>        select ARCH_HAS_CPUFREQ
>>        select GENERIC_CLOCKEVENTS
>>        select HAVE_S3C_RTC if RTC_CLASS
>> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
>> index 871f9d5..8e4dbf6 100644
>> --- a/arch/arm/mach-exynos4/clock.c
>> +++ b/arch/arm/mach-exynos4/clock.c
>> @@ -404,41 +404,49 @@ static struct clk init_clocks_off[] = {
>>                .ctrlbit        = (1<<24),
>>        }, {
>>                .name           = "csis",
>> +               .devname        = "s5p-mipi-csis.0",
>>                .id             = 0,
>>                .enable         = exynos4_clk_ip_cam_ctrl,
>>                .ctrlbit        = (1 << 4),

[...]

>>        }, {
>>                .name           = "fimc",
>> +               .devname        = "exynos4-fimc.3",
>>                .id             = 3,
>>                .enable         = exynos4_clk_ip_cam_ctrl,
>>                .ctrlbit        = (1 << 3),
>>        }, {
>>                .name           = "fimd",
>> +               .devname        = "s5pv310-fb.0",
>
> actually it doesn't yet determine which name is used at framebuffer,
> fimd or lcd.

The fb driver (drivers/video/s3c-fb.c) is using 'lcd' as the name of
the clock. So the name of the clock above 'fimd' will have to be
changed to 'lcd'. If a patch for that change is not already submitted,
I will submit a separate patch for that.

>
>>                .id             = 0,
>>                .enable         = exynos4_clk_ip_lcd0_ctrl,
>>                .ctrlbit        = (1 << 0),
>>        }, {

[...]

>>                .name           = "hsmmc",
>> +               .devname        = "s3c-sdhci.4",
> exynos4 has different host controller at channel 4. designeware
> dw_mmc. so please check it.

Thanks for pointing this out. The clock name will change for this
(need to still find a name). Since, this will be the only instance of
clock (.id = -1), the devname can be avoided. In the next revision of
this patch, I will remove the devname addition for this clock.

>
>>                .id             = 4,
>>                .parent         = &clk_aclk_133.clk,
>>                .enable         = exynos4_clk_ip_fsys_ctrl,
>> @@ -486,11 +499,13 @@ static struct clk init_clocks_off[] = {
>>                .ctrlbit        = (1 << 10),
>>        }, {
>>                .name           = "pdma",
>> +               .devname        = "s3c-pl330.0",
>>                .id             = 0,
>>                .enable         = exynos4_clk_ip_fsys_ctrl,
>>                .ctrlbit        = (1 << 0),

[...]

>>        }, {
>>                .name           = "iis",
>> +               .devname        = "samsung-i2s.0",
> does it still use the 'iis'?

The i2c driver uses the clock name as iis. So no change here.

>>                .id             = 0,
>>                .enable         = exynos4_clk_ip_peril_ctrl,
>>                .ctrlbit        = (1 << 19),
>>        }, {
>>                .name           = "iis",

[...]

>> diff --git a/arch/arm/mach-exynos4/include/mach/clkdev.h b/arch/arm/mach-exynos4/include/mach/clkdev.h
>> new file mode 100644
>> index 0000000..1247f5e
>> --- /dev/null
>> +++ b/arch/arm/mach-exynos4/include/mach/clkdev.h
>> @@ -0,0 +1,7 @@
>> +#ifndef __MACH_EXYNOS4_CLKDEV_H__
>> +#define __MACH_EXYNOS4_CLKDEV_H__
>> +
>> +#define __clk_get(clk) ({ 1; })
>> +#define __clk_put(clk) do { } while (0)
>> +
>> +#endif
>> diff --git a/arch/arm/mach-exynos4/time.c b/arch/arm/mach-exynos4/time.c
>> index 86b9fa0..cb63f97 100644
>> --- a/arch/arm/mach-exynos4/time.c
>> +++ b/arch/arm/mach-exynos4/time.c
>> @@ -262,6 +262,7 @@ static void __init exynos4_timer_resources(void)
>>        clk_enable(timerclk);
>>
>>        tmpdev.id = 2;
>> +       tmpdev.dev.init_name = "s3c24xx-pwm.2";
>
> what's this? why does it need at here?

platform_device instances are not registered for PWM timer's that are
used to generate the clock ticks. A un-registered version of
platform_device (tmpdev above) is used to lookup the clocks in this
case. Since this platform_device is unregistered and clk_get (when
using clkdev lookup) requires a devname, a temporary device name can
be assigned to the platform_device (refer to dev_name function in
include/linux/device.h file).

Thanks for your comments.

Regards,
Thomas.
