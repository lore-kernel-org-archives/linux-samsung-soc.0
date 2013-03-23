From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 00/12] ARM: samsung-time: Prepare for multiplatform support
Date: Sat, 23 Mar 2013 13:27:14 +0100
Message-ID: <2168269.vA6FhJVPyl@flatron>
References: <1362860601-18464-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:42759 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750718Ab3CWM1R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 Mar 2013 08:27:17 -0400
Received: by mail-ea0-f173.google.com with SMTP id h14so1788990eak.32
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Mar 2013 05:27:15 -0700 (PDT)
In-Reply-To: <1362860601-18464-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, Mark Rutland <mark.rutland@arm.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Rob Herring <robherring2@gmail.com>

Hi,

On Saturday 09 of March 2013 21:23:09 Tomasz Figa wrote:
> This series is an attempt to make the samsung-time clocksource driver
> ready for multiplatform kernels. It moves the driver to
> drivers/clocksource, cleans it up from uses of static platform-specific
> definitions, simplifies timer interrupt handling and adds Device Tree
> support.
> 
> Tested on a Tiny6410 board (Mini6410-compatible) both with and without
> Devicee Tree (with my DT patches for S3C64xx). Compile tested for other
> related SoCs.
> 
> Changes since v2:
> (http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16158)
>  - Addressed comments from Rob Herring and Mark Rutland
>  - Removed unused register definitions
>  - Replaced samsung,source-timer and samsung,event-timer properties
>    with samsung,pwm-outputs property that defines which PWM channels
>    are reserved for PWM outputs on particular platform
>  - Split non-DT and DT initialization into two functions
>  - Fixed a copy paste error
> 
> Changes since v1:
> (http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16005)
>  - Addressed comments from Mark Rutland
>  - Documented struct samsung_timer_variant
>  - Dropped inactive mail addresses from CC
> 
> Tomasz Figa (12):
>   ARM: SAMSUNG: Move samsung-time to drivers/clocksource
>   clocksource: samsung-time: Set platform-specific parameters at runtime
> clocksource: samsung-time: Drop useless defines from public header ARM:
> SAMSUNG: Move samsung-time.h header to inlude/clocksource clocksource:
> samsung-time: Use local register definitions
>   clocksource: samsung-time: Remove use of static register mapping
>   clocksource: samsung-time: Use clk_get_sys for getting clocks
>   ARM: SAMSUNG: devs: Drop unnecessary IRQ resources of timer devices
>   clocksource: samsung-time: Do not use static IRQ definition
>   clocksource: samsung-time: Move IRQ mask/ack handling to the driver
>   ARM: SAMSUNG: Remove unused PWM timer IRQ chip code
>   clocksource: samsung-time: Add Device Tree support

Any comments for this series?

Best regards,
Tomasz
