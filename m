From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH 3/4] ARM: S5PV210: Enable FIMC on SMDKV210
Date: Mon, 26 Dec 2011 17:27:58 +0100
Message-ID: <4EF8A08E.9070808@gmail.com>
References: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org> <1324893613-5469-4-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:56992 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932Ab1LZQ2R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 11:28:17 -0500
Received: by eekc4 with SMTP id c4so11141707eek.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2011 08:28:16 -0800 (PST)
In-Reply-To: <1324893613-5469-4-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sachin,

thanks for the patch.

On 12/26/2011 11:00 AM, Sachin Kamat wrote:
> This patch adds support for FIMC 0, 1 and 2 on SMDKV210 board.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-s5pv210/Kconfig         |    3 +++
>  arch/arm/mach-s5pv210/mach-smdkv210.c |    3 +++
>  2 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 32893c7..66e1b3d 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -138,6 +138,9 @@ config MACH_SMDKV210
>  	select S3C_DEV_I2C2
>  	select S3C_DEV_RTC
>  	select S3C_DEV_WDT
> +	select S5P_DEV_FIMC0
> +	select S5P_DEV_FIMC1
> +	select S5P_DEV_FIMC2
>  	select S5P_DEV_MFC
>  	select SAMSUNG_DEV_ADC
>  	select SAMSUNG_DEV_BACKLIGHT
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
> index d50cacd..038fc5f 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> @@ -226,6 +226,9 @@ static struct platform_device *smdkv210_devices[] __initdata = {
>  	&s3c_device_rtc,
>  	&s3c_device_ts,
>  	&s3c_device_wdt,
> +	&s5p_device_fimc0,
> +	&s5p_device_fimc1,
> +	&s5p_device_fimc2,

Sorry, this won't work, unless you add &s5p_device_fimc_md after all
s5p_fimc_device? entries. s5p_device_fimc_md is a platform device for
FIMC media device driver (/dev/media?), which registers all required
video nodes (mem-to-mem and video capture).
Complete board code for FIMC can be found in Goni (or Nuri) board files.

Does the above really work for you with 3.2-rc7 kernel ?

I've had prepared a patch adding s5p_device_fimc_md for the SMDK boards
that already register FIMC devices, but got distracted by other tasks
and finally I didn't send it for 3.2 :(

BTW, is there anyone interested in s3c64xx (s3c24xx) CAMIF v4l2 driver
in the mainline kernel ? I've started some works on it and could carry on
with that if there is some interest, so we can have something which
is in line with the mainline APIs.

--

Thanks,
Sylwester
