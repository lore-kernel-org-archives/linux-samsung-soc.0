From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] ARM: S5PV210: Enable I2C0 bus on GONI board
Date: Fri, 28 Jan 2011 18:28:20 +0900
Message-ID: <02e001cbbecd$b9aee0d0$2d0ca270$%kim@samsung.com>
References: <1294419468-13700-1-git-send-email-s.nawrocki@samsung.com>
 <1294419468-13700-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12295 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750869Ab1A1J2c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Jan 2011 04:28:32 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LFQ00AWS7NIF8D0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Jan 2011 18:28:30 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LFQ00HN47NI4U@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Jan 2011 18:28:30 +0900 (KST)
In-reply-to: <1294419468-13700-2-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com

Sylwester Nawrocki wrote:
> 
> Add I2C0 bus platform device for camera sensors.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/Kconfig     |    1 +
>  arch/arm/mach-s5pv210/mach-goni.c |    4 ++++
>  2 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 53aabef..b0aa462 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -75,6 +75,7 @@ config MACH_GONI
>  	bool "GONI"
>  	select CPU_S5PV210
>  	select S5P_GPIO_INT
> +	select S3C_DEV_I2C0

NO...Where is S3C_DEV_I2C0?
Basically, platform device of i2c0 which is in
arch/arm/plat-samsung/dev-i2c0.c is always selected.

>  	select S3C_DEV_FB
>  	select S5P_DEV_FIMC0
>  	select S5P_DEV_FIMC1
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index e22d511..fc34575 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -800,6 +800,7 @@ static struct platform_device *goni_devices[]
__initdata
> = {
>  	&s5pv210_device_iis0,
>  	&s3c_device_usb_hsotg,
>  	&samsung_device_keypad,
> +	&s3c_device_i2c0,
>  	&s3c_device_i2c1,
>  	&s3c_device_i2c2,
>  	&wm8994_fixed_voltage0,
> @@ -827,6 +828,9 @@ static void __init goni_machine_init(void)
>  	/* Radio: call before I2C 1 registeration */
>  	goni_radio_init();
> 
> +	/* I2C0 */
> +	s3c_i2c0_set_platdata(NULL);
> +
>  	/* I2C1 */
>  	s3c_i2c1_set_platdata(NULL);
>  	i2c_register_board_info(1, i2c1_devs, ARRAY_SIZE(i2c1_devs));
> --
> 1.7.3.5

Others, ok...please re-work this against on latest my for-next.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
