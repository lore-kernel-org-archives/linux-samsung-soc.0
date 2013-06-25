From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL 1/2] Samsung cleanup PWM for v3.11
Date: Wed, 26 Jun 2013 01:34:59 +0900
Message-ID: <51C9C6B3.4040003@samsung.com>
References: <51C87D32.6050607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:58638 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750771Ab3FYQfF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 12:35:05 -0400
Received: by mail-pb0-f53.google.com with SMTP id xb12so12778917pbc.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jun 2013 09:35:04 -0700 (PDT)
In-Reply-To: <51C87D32.6050607@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Thierry Reding <thierry.reding@gmail.com>

On 06/25/13 02:09, Kukjin Kim wrote:
> The following changes since commit
> db3824e6bf0b0f421b0d43f08d905935e826a965:
>
> ARM: SAMSUNG: Remove unused plat/regs-watchdog.h header (2013-06-19
> 03:13:18 +0900)
>
> are available in the git repository at:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-cleanup-2
>
> for you to fetch changes up to 329d2fb35f05bd9255b4618813d534b8192555a4:
>
> ARM: SAMSUNG: Remove plat/regs-timer.h header (2013-06-25 01:13:49 +0900)
>
> ----------------------------------------------------------------
> based on tags/samsung-cleanup-1
>
> This cleanup of PWM Samsung is for:
> 1) moving remaining Samsung platforms to the new clocksource driver
> 2) removing old clocksource driver
> 3) adding new multiplatform- and DT-aware PWM driver
> 4) moving all Samsung platforms to use the new PWM driver
> 5) removing old PWM driver
> 6) removing all PWM-related code that is not used anymore
>
> ----------------------------------------------------------------
> Tomasz Figa (18):
> ARM: SAMSUNG: Unify base address definitions of timer block
> ARM: SAMSUNG: Add new PWM platform device
> ARM: SAMSUNG: Set PWM platform data
> clocksource: samsung_pwm_timer: Cache clocksource register address
> clocksource: samsung_pwm_timer: Do not use clocksource_mmio
> clocksource: samsung_pwm_timer: Handle suspend/resume correctly
> ARM: SAMSUNG: Move all platforms to new clocksource driver
> ARM: SAMSUNG: Remove old samsung-time driver
> ARM: SAMSUNG: Remove unused PWM timer IRQ chip code
> pwm: samsung: Rename to pwm-samsung-legacy
> pwm: Add new pwm-samsung driver
> ARM: SAMSUNG: Rework private data handling in dev-backlight
> ARM: SAMSUNG: Modify board files to use new PWM platform device
> pwm: Remove superseded pwm-samsung-legacy driver
> ARM: SAMSUNG: Remove old PWM timer platform devices
> ARM: SAMSUNG: Remove pwm-clock infrastructure
> ARM: SAMSUNG: Remove remaining uses of plat/regs-timer.h header
> ARM: SAMSUNG: Remove plat/regs-timer.h header
>

[...]

> drivers/pwm/pwm-samsung.c | 694 ++++++++++++++-------

(+ Thierry Reding)

Hi Arnd and Olof

Please hold on pulling this one because Thierry Reding has objection on 
this. I think, this can be queued for next time.

[...]

Thanks,
- Kukjin
