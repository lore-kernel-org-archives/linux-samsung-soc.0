From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clocksource: samsung_pwm: Correct definition of AUTORELOAD bit
Date: Sun, 23 Jun 2013 11:59:19 +0200
Message-ID: <4314851.1Z5ihu2ZPz@flatron>
References: <1371577267-2860-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f41.google.com ([209.85.214.41]:40198 "EHLO
	mail-bk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750883Ab3FWJ7U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 Jun 2013 05:59:20 -0400
Received: by mail-bk0-f41.google.com with SMTP id jc3so3898948bkc.28
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jun 2013 02:59:19 -0700 (PDT)
In-Reply-To: <1371577267-2860-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>

On Tuesday 18 of June 2013 19:41:07 Tomasz Figa wrote:
> PWM channel 4 (logically channel 5 in TCON register) has its autoreload
> bit located at different position. This patch fixes the driver to
> account for this.
> 
> This fixes a problem with clocksource hanging after it overflows because
> it is not reloaded any more.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  drivers/clocksource/samsung_pwm_timer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/samsung_pwm_timer.c
> b/drivers/clocksource/samsung_pwm_timer.c index 2977043..6af178f 100644
> --- a/drivers/clocksource/samsung_pwm_timer.c
> +++ b/drivers/clocksource/samsung_pwm_timer.c
> @@ -47,7 +47,8 @@
>  #define TCON_START(chan)		(1 << (4 * (chan) + 0))
>  #define TCON_MANUALUPDATE(chan)		(1 << (4 * (chan) + 1))
>  #define TCON_INVERT(chan)		(1 << (4 * (chan) + 2))
> -#define TCON_AUTORELOAD(chan)		(1 << (4 * (chan) + 3))
> +#define TCON_AUTORELOAD(chan)		(1 << (4 * (chan) \
> +						+ (((chan) < 5) ? 3 : 2)))
> 
>  DEFINE_SPINLOCK(samsung_pwm_lock);
>  EXPORT_SYMBOL(samsung_pwm_lock);

Ping.

Best regards,
Tomasz
