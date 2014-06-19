From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH] i2c: exynos5: Properly use the "noirq" variants of suspend/resume
Date: Thu, 19 Jun 2014 11:43:11 -0700
Message-ID: <7h8uosyc3k.fsf@paris.lan>
References: <1403155273-1057-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403155273-1057-1-git-send-email-dianders@chromium.org> (Doug
	Anderson's message of "Wed, 18 Jun 2014 22:21:13 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, javier.martinez@collabora.co.uk, ch.naveen@samsung.com, jg1.han@samsung.com, jdelvare@suse.de, sjg@google.com, paul.gortmaker@windriver.com, standby24x7@gmail.com, sachin.kamat@linaro.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Doug Anderson <dianders@chromium.org> writes:

> The original code for the exynos i2c controller registered for the
> "noirq" variants.  However during review feedback it was moved to
> SIMPLE_DEV_PM_OPS without anyone noticing that it meant we were no
> longer actually "noirq" (despite functions named
> exynos5_i2c_suspend_noirq and exynos5_i2c_resume_noirq).
>
> i2c controllers that might have wakeup sources on them seem to need to
> resume at noirq time so that the individual drivers can actually read
> the i2c bus to handle their wakeup.

I suspect usage of the noirq variants pre-dates the existence of the
late/early callbacks in the PM core, but based on the description above,
I suspect what you actually want is the late/early callbacks.

Kevin
