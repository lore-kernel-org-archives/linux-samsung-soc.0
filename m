From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2] ARM: Drop fixed 200 Hz timer requirement from Samsung platforms
Date: Mon, 21 Nov 2016 15:01:57 +0900
Message-ID: <CA+Ln22GyRwywcxdO4Gp67d8TfpjfNzaE0z25=WW9GWibjGkDuQ@mail.gmail.com>
References: <1479453418-25314-1-git-send-email-krzk@kernel.org> <22757093.ejshJp9T7L@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <22757093.ejshJp9T7L@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

2016-11-18 17:46 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> Maybe add a paragraph about the specific problem:
>
> "On s3c24xx, the PWM counter is only 16 bit wide, and with the
> typical 12MHz input clock that overflows every 5.5ms. This works
> with HZ=200 or higher but not with HZ=100 which needs a 10ms
> interval between ticks. On Later chips (S3C64xx, S5P and EXYNOS),
> the counter is 32 bits and does not have this problem.
> The new samsung_pwm_timer driver solves the problem by scaling
> the input clock by a factor of 50 on s3c24xx, which makes it
> less accurate but allows HZ=100 as well as CONFIG_NO_HZ with
> fewer wakeups".

One thing to correct here is that the typical clock is PCLK, which is
derived from one of the PLLs and AFAIR is between 33-66 MHz on
s3c24xx. Technically you can drive the PWM block from an external
clock (12 MHz for some board-file based boards), but for simplicity
this functionality was omitted in the new PWM timer driver used for DT
boards (which worked fine with the PWM driven by PCLK).

Also I'm wondering if the divisor we use right now for 16-bit timers
isn't too small, since it gives us a really short wraparound time,
which means getting more timer interrupts for longer intervals, kind
of defeating the benefit of tickless mode. However, AFAICT it doesn't
affect the HZ problem.

Best regards.
Tomasz
