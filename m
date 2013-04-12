From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 03/14] clocksource: samsung-pwm: Add infrastructure to share PWM hardware
Date: Fri, 12 Apr 2013 22:42:36 +0200
Message-ID: <201304122242.36801.arnd@arndb.de>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com> <1365794250-14436-4-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:60123 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751504Ab3DLUnB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 16:43:01 -0400
In-Reply-To: <1365794250-14436-4-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, john.stultz@linaro.org, tglx@linutronix.de

On Friday 12 April 2013, Tomasz Figa wrote:
> +
> +Samsung SoCs contain PWM timer blocks which can be used for system clock source
> +and clock event timers, as well as to drive SoC outputs with PWM signal. Each
> +PWM timer block provides 5 PWM channels (not all of them can drive physical
> +outputs - see SoC and board manual).
> +
...
> +Optional properties:
> +- samsung,pwm-outputs: list of PWM channels used as PWM outputs on particular
> +    platform - an array of up to 5 elements being indices of PWM channels
> +    (from 0 to 4), the order does not matter.
> +

There is probably a good reason, but can you explain why this is actually required
to be a property? Wouldn't it be enough to just not refer to the PWM outputs from
other devices when they are not used?

	Arnd
