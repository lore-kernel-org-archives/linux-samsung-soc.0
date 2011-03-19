From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH 5/6] ARM: SAMSUNG: Add clkdev support for exynos4
Date: Sat, 19 Mar 2011 13:02:23 +0100
Message-ID: <4D849B4F.8020401@gmail.com>
References: <1300521019-13612-1-git-send-email-thomas.ab@samsung.com> <1300521019-13612-6-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:61833 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751465Ab1CSMC0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Mar 2011 08:02:26 -0400
Received: by wwa36 with SMTP id 36so5803424wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Mar 2011 05:02:25 -0700 (PDT)
In-Reply-To: <1300521019-13612-6-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

Hi Thomas,

On 03/19/2011 08:50 AM, Thomas Abraham wrote:
> Add clkdev support for Samsung's exynos4 platforms.
>
> Cc: Ben Dooks<ben-linux@fluff.org>
> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
> ---
>   arch/arm/mach-exynos4/Kconfig               |    1 +
>   arch/arm/mach-exynos4/clock.c               |   57 +++++++++++++++++++++++++++
>   arch/arm/mach-exynos4/include/mach/clkdev.h |    7 +++
>   arch/arm/mach-exynos4/time.c                |    2 +
>   arch/arm/plat-samsung/pwm-clock.c           |   10 +++++
>   5 files changed, 77 insertions(+), 0 deletions(-)
>   create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
>
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index a021b52..58451c3 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -110,6 +110,7 @@ config MACH_SMDKC210
>   config MACH_SMDKV310
>   	bool "SMDKV310"
>   	select CPU_EXYNOS4210
> +	select CLKDEV_LOOKUP
>   	select S3C_DEV_RTC
>   	select S3C_DEV_WDT
>   	select S3C_DEV_I2C1
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
> index 871f9d5..0b46326 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -404,41 +404,49 @@ static struct clk init_clocks_off[] = {
>   		.ctrlbit	= (1<<24),
...
>   	}, {
>   		.name		= "fimc",
> +		.devname	= "s5p-fimc.0",

This clock belongs to s5p-fimc driver however for exynos4 the platform
device name is "exynos4-fimc". So the above line needs to be:

+		.devname	= "exynos4-fimc.0",

>   		.id		= 0,
>   		.enable		= exynos4_clk_ip_cam_ctrl,
>   		.ctrlbit	= (1<<  0),
>   	}, {
>   		.name		= "fimc",
> +		.devname	= "s5p-fimc.1",

Ditto.

>   		.id		= 1,
>   		.enable		= exynos4_clk_ip_cam_ctrl,
>   		.ctrlbit	= (1<<  1),
>   	}, {
>   		.name		= "fimc",
> +		.devname	= "s5p-fimc.2",

Ditto.

>   		.id		= 2,
>   		.enable		= exynos4_clk_ip_cam_ctrl,
>   		.ctrlbit	= (1<<  2),
>   	}, {
>   		.name		= "fimc",
> +		.devname	= "s5p-fimc.3",

Ditto.

>   		.id		= 3,
>   		.enable		= exynos4_clk_ip_cam_ctrl,
>   		.ctrlbit	= (1<<  3),
>   	}, {
...
> @@ -909,6 +950,7 @@ static struct clksrc_clk clksrcs[] = {
>   	}, {
>   		.clk		= {
>   			.name		= "sclk_cam",
> +			.devname	= "s5pv310-fimc.0",

As s5pv310 has been renamed to exynos4 the above line should be:

+			.devname	= "exynos4-fimc.0",

In fact "sclk_cam" clocks are not really tied to any FIMC instance,
however IMHO keeping the current configuration is best thing to do
at this stage. I intend to add a platform device for a media device
driver which will integrate all FIMC entities and then assign both
sclk_cam clocks to that platform device.

>   			.id		= 0,
>   			.enable		= exynos4_clksrc_mask_cam_ctrl,
>   			.ctrlbit	= (1<<  16),
> @@ -919,6 +961,7 @@ static struct clksrc_clk clksrcs[] = {
>   	}, {
>   		.clk		= {
>   			.name		= "sclk_cam",
> +			.devname	= "s5pv310-fimc.1",

+			.devname	= "exynos4-fimc.1",

>   			.id		= 1,
>   			.enable		= exynos4_clksrc_mask_cam_ctrl,
>   			.ctrlbit	= (1<<  20),
> @@ -929,6 +972,7 @@ static struct clksrc_clk clksrcs[] = {
>   	}, {
>   		.clk		= {
>   			.name		= "sclk_fimc",
> +			.devname	= "s5pv310-fimc.0",

+			.devname	= "exynos4-fimc.0",

I'm going to fix the name in the driver during a coming rc period.
This is were the driver name for exynos4 is being fixed up:
http://tinyurl.com/638a9og

>   			.id		= 0,
>   			.enable		= exynos4_clksrc_mask_cam_ctrl,
>   			.ctrlbit	= (1<<  0),
> @@ -939,6 +983,7 @@ static struct clksrc_clk clksrcs[] = {
>   	}, {
>   		.clk		= {
>   			.name		= "sclk_fimc",
> +			.devname	= "s5pv310-fimc.1",

Ditto.

>   			.id		= 1,
>   			.enable		= exynos4_clksrc_mask_cam_ctrl,
>   			.ctrlbit	= (1<<  4),
> @@ -949,6 +994,7 @@ static struct clksrc_clk clksrcs[] = {
>   	}, {
>   		.clk		= {
>   			.name		= "sclk_fimc",
> +			.devname	= "s5pv310-fimc.2",

Ditto.

>   			.id		= 2,
>   			.enable		= exynos4_clksrc_mask_cam_ctrl,
>   			.ctrlbit	= (1<<  8),
> @@ -959,6 +1005,7 @@ static struct clksrc_clk clksrcs[] = {
>   	}, {
>   		.clk		= {
>   			.name		= "sclk_fimc",
> +			.devname	= "s5pv310-fimc.3",

Ditto.

>   			.id		= 3,
>   			.enable		= exynos4_clksrc_mask_cam_ctrl,
>   			.ctrlbit	= (1<<  12),

--
Thanks,
Sylwester Nawrocki
