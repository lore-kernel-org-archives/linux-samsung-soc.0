From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Set 1000ns as PWM backlight period on
 SMDKV210
Date: Wed, 07 Dec 2011 16:21:20 +0900
Message-ID: <03e701ccb4b0$d1279de0$7376d9a0$%kim@samsung.com>
References: <1320804636-19950-1-git-send-email-jg1.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12526 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752638Ab1LGHVX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 02:21:23 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVT00K1AOFEN3Q0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 16:21:22 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVT005MMOFKH340@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 16:21:21 +0900 (KST)
In-reply-to: <1320804636-19950-1-git-send-email-jg1.han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

Jingoo Han wrote:
> 
> The SMDK board uses LT3591 as backlight LED driver of LTE480WV LCD.
> According to the LT3591 datasheet, the switching frequency should
> be 1MHz. So, PWM period is calculated by following formula:
> 
> PWM period = 1/switching frequency
> 	   = 1/1MHz
> 	   = 1000ns
> 
> Thus, the PWM backlight period should be 1000ns.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-smdkv210.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-
> s5pv210/mach-smdkv210.c
> index a9106c3..8662ef6 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> @@ -273,6 +273,7 @@ static struct samsung_bl_gpio_info
> smdkv210_bl_gpio_info = {
> 
>  static struct platform_pwm_backlight_data smdkv210_bl_data = {
>  	.pwm_id = 3,
> +	.pwm_period_ns = 1000,
>  };
> 
>  static void __init smdkv210_map_io(void)
> --
> 1.7.1

OK, will apply.

But when I'm looking at this in other case, we need to update the default
value of pwm_period_ns?
Let me check.

(Cc'ed Mark Brown)

Mark,
If switch frequency is 1kHz, the value of pwm_period_ns should be 1000000 at
mach-crag6410.c not 100000?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
