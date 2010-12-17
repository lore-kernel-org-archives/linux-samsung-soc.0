From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 13/24] ARM: s5pv310: update clock source registration
Date: Fri, 17 Dec 2010 13:49:39 +0900
Message-ID: <002f01cb9da5$d30eac70$792c0550$%kim@samsung.com>
References: <20101213191437.GN8665@n2100.arm.linux.org.uk>
 <E1PSDvg-0008D8-6F@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38020 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753170Ab0LQEtq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Dec 2010 23:49:46 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LDK00JKD2QWY1B0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Dec 2010 13:49:44 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LDK00AFY2QV65@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Dec 2010 13:49:44 +0900 (KST)
In-reply-to: <E1PSDvg-0008D8-6F@rmk-PC.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

Russell King wrote:
> 
> In d7e81c2 (clocksource: Add clocksource_register_hz/khz interface) new
> interfaces were added which simplify (and optimize) the selection of the
> divisor shift/mult constants.  Switch over to using this new interface.
> 
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
Acked-by: Kukjin Kim <kgene.kim@samsung.com>

> ---
>  arch/arm/mach-s5pv310/time.c |    6 +-----
>  1 files changed, 1 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv310/time.c b/arch/arm/mach-s5pv310/time.c
> index 01b012a..b262d46 100644
> --- a/arch/arm/mach-s5pv310/time.c
> +++ b/arch/arm/mach-s5pv310/time.c
> @@ -211,7 +211,6 @@ struct clocksource pwm_clocksource = {
>  	.rating		= 250,
>  	.read		= s5pv310_pwm4_read,
>  	.mask		= CLOCKSOURCE_MASK(32),
> -	.shift		= 20,
>  	.flags		= CLOCK_SOURCE_IS_CONTINUOUS ,
>  };
> 
> @@ -230,10 +229,7 @@ static void __init s5pv310_clocksource_init(void)
>  	s5pv310_pwm_init(4, ~0);
>  	s5pv310_pwm_start(4, 1);
> 
> -	pwm_clocksource.mult =
> -		clocksource_khz2mult(clock_rate/1000,
pwm_clocksource.shift);
> -
> -	if (clocksource_register(&pwm_clocksource))
> +	if (clocksource_register_hz(&pwm_clocksource, clock_rate))
>  		panic("%s: can't register clocksource\n",
> pwm_clocksource.name);
>  }
> 
> --

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
