From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v2] ARM: Drop fixed 200 Hz timer requirement from Samsung
 platforms
Date: Mon, 21 Nov 2016 09:07:14 +0000
Message-ID: <20161121090713.GZ1041@n2100.armlinux.org.uk>
References: <1479453418-25314-1-git-send-email-krzk@kernel.org>
 <22757093.ejshJp9T7L@wuerfel>
 <CA+Ln22GyRwywcxdO4Gp67d8TfpjfNzaE0z25=WW9GWibjGkDuQ@mail.gmail.com>
 <d67d8100-c8bf-d353-2225-e3b869a1c90d@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:51918 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752316AbcKUJH3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 04:07:29 -0500
Content-Disposition: inline
In-Reply-To: <d67d8100-c8bf-d353-2225-e3b869a1c90d@codethink.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Nov 21, 2016 at 08:59:06AM +0000, Ben Dooks wrote:
> On 21/11/16 06:01, Tomasz Figa wrote:
> >2016-11-18 17:46 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> >>Maybe add a paragraph about the specific problem:
> >>
> >>"On s3c24xx, the PWM counter is only 16 bit wide, and with the
> >>typical 12MHz input clock that overflows every 5.5ms. This works
> >>with HZ=200 or higher but not with HZ=100 which needs a 10ms
> >>interval between ticks. On Later chips (S3C64xx, S5P and EXYNOS),
> >>the counter is 32 bits and does not have this problem.
> >>The new samsung_pwm_timer driver solves the problem by scaling
> >>the input clock by a factor of 50 on s3c24xx, which makes it
> >>less accurate but allows HZ=100 as well as CONFIG_NO_HZ with
> >>fewer wakeups".
> >
> >One thing to correct here is that the typical clock is PCLK, which is
> >derived from one of the PLLs and AFAIR is between 33-66 MHz on
> >s3c24xx. Technically you can drive the PWM block from an external
> >clock (12 MHz for some board-file based boards), but for simplicity
> >this functionality was omitted in the new PWM timer driver used for DT
> >boards (which worked fine with the PWM driven by PCLK).
> 
> Given it was a clock mux option, that would not have been difficult to
> acheive. However these platforms are now so old people don't care, I
> think all my pre-armv7 stuff is now in a box.

However, there are still s3c2410 machines running out there... so we
should do our best not to break them.

> The use of the 12MHz input was to give something to run PWM timers from
> that wasn't interrupted by cpu frequency scaling as PCLK generally is
> half HCLK which is divided down from the core CPU clock.
...
> The original implementation was to go for the best accuracy from the
> timer at the expense of 200 irqs per second instead of the usual 100.

This sounds like a good enough reason not to switch away from using 200Hz
and the 12MHz input.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
