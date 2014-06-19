From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] clocksource: exynos-mct: Register the timer for stable udelay
Date: Thu, 19 Jun 2014 12:29:55 +0200
Message-ID: <4808230.DmzmRfAocp@wuerfel>
References: <1403167145-5267-1-git-send-email-amit.daniel@samsung.com> <53A2A936.3070109@linaro.org> <CADGdYn6YObHdRq6A9-L7qbD+EYiPrwhrKkLwyA5Z=0tDoWUzvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:62570 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399AbaFSKaE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 06:30:04 -0400
In-Reply-To: <CADGdYn6YObHdRq6A9-L7qbD+EYiPrwhrKkLwyA5Z=0tDoWUzvA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: amit daniel kachhap <amit.daniel@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, David Riley <davidriley@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>

On Thursday 19 June 2014 15:51:58 amit daniel kachhap wrote:
> I also didn't want to use macros but used as a last option. you want
> me to put more comments here?
> Or something like below is also possible for checking the size of
> (unsigned long) in runtime.
> 
> unsigned long x;
> unsigned int size = (char *)(&x + 1) - (char *)(&x);

reimplementing "sizeof (long)"?

> if (size == 4)
>            return __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_L);

readl_relaxed(), certainly

> else
>            return exynos4_frc_read(&mct_frc);
> 
> But this involves extra computation which should not be used for time
> critical functions.

sizeof is a constant expression, the compiler will optimize this.

	Arnd
