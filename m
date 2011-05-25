From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 4/7] ARM: S5P64X0: Add clkdev support
Date: Wed, 25 May 2011 14:45:42 -0700
Message-ID: <4DDD7886.6010105@samsung.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com> <1305839906-1815-5-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:38397 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756758Ab1EYVpu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 17:45:50 -0400
Received: by pwi15 with SMTP id 15so65558pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 May 2011 14:45:50 -0700 (PDT)
In-Reply-To: <1305839906-1815-5-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 05/19/11 14:18, Thomas Abraham wrote:
> Add clkdev support for Samsung's s5p64x0 platforms.
>
> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
> ---
>   arch/arm/Kconfig                            |    1 +
>   arch/arm/mach-s5p64x0/clock-s5p6440.c       |   20 ++++++++++++++++++++
>   arch/arm/mach-s5p64x0/clock-s5p6450.c       |   19 +++++++++++++++++++
>   arch/arm/mach-s5p64x0/include/mach/clkdev.h |    7 +++++++
>   arch/arm/plat-s5p/s5p-time.c                |    9 +++++++++
>   5 files changed, 56 insertions(+), 0 deletions(-)
>   create mode 100644 arch/arm/mach-s5p64x0/include/mach/clkdev.h

(snip)

I wonder why following is included in this, "S5P64X0: Add clkdev support".

> diff --git a/arch/arm/plat-s5p/s5p-time.c b/arch/arm/plat-s5p/s5p-time.c
> index 8090403..d9efd29 100644
> --- a/arch/arm/plat-s5p/s5p-time.c
> +++ b/arch/arm/plat-s5p/s5p-time.c
> @@ -408,6 +408,7 @@ static void __init s5p_timer_resources(void)
>
>   	unsigned long event_id = timer_source.event_id;
>   	unsigned long source_id = timer_source.source_id;
> +	char devname[15];
>
>   	timerclk = clk_get(NULL, "timers");
>   	if (IS_ERR(timerclk))
> @@ -415,6 +416,10 @@ static void __init s5p_timer_resources(void)
>
>   	clk_enable(timerclk);
>
> +	sprintf(devname, "s3c24xx-pwm.%lu", event_id);
> +	s3c_device_timer[event_id].id = event_id;
> +	s3c_device_timer[event_id].dev.init_name = devname;
> +
>   	tin_event = clk_get(&s3c_device_timer[event_id].dev, "pwm-tin");
>   	if (IS_ERR(tin_event))
>   		panic("failed to get pwm-tin clock for event timer");
> @@ -425,6 +430,10 @@ static void __init s5p_timer_resources(void)
>
>   	clk_enable(tin_event);
>
> +	sprintf(devname, "s3c24xx-pwm.%lu", source_id);
> +	s3c_device_timer[source_id].id = source_id;
> +	s3c_device_timer[source_id].dev.init_name = devname;
> +
>   	tin_source = clk_get(&s3c_device_timer[source_id].dev, "pwm-tin");
>   	if (IS_ERR(tin_source))
>   		panic("failed to get pwm-tin clock for source timer");


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
