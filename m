From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S5PC110: enable PWM timers for GONI board
Date: Thu, 09 Jun 2011 15:12:06 -0700
Message-ID: <4DF14536.4030304@samsung.com>
References: <1307429115-13402-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:39134 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753536Ab1FIWNn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2011 18:13:43 -0400
Received: by iwn34 with SMTP id 34so1695121iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jun 2011 15:13:43 -0700 (PDT)
In-Reply-To: <1307429115-13402-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

On 06/06/11 23:45, Marek Szyprowski wrote:
> s5p_timer requires PWM device to be compiled in. Add aproperiate Kconfig
> select directive for GONI machine, so compilation won't fail if GONI is
> the only machine compiled into the kernel.
>
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>
> ---
>   arch/arm/mach-s5pv210/Kconfig |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 37b5a97..aceafb4 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -92,6 +92,7 @@ config MACH_GONI
>   	select S3C_DEV_I2C2
>   	select S3C_DEV_USB_HSOTG
>   	select S5P_DEV_ONENAND
> +	select SAMSUNG_DEV_PWM
>   	select SAMSUNG_DEV_KEYPAD
>   	select S5PV210_SETUP_FB_24BPP
>   	select S5PV210_SETUP_I2C1

Yeah, SAMSUNG_DEV_PWM is required to use s5p-time.c for HRT.
So I think following is better.

Marek, if you don't mind, I'd like to apply below...

diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index e98f5c5..7f9ff2a 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -39,6 +39,7 @@ config S5P_GPIO_INT

  config S5P_HRT
         bool
+       select SAMSUNG_DEV_PWM
         help
           Use the High Resolution timer support

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
