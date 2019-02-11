From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] clocksource: exynos_mct: Move one-shot check from
 tick clear to ISR
Date: Mon, 11 Feb 2019 09:47:26 +0100
Message-ID: <CAJKOXPdNLd5MeFXa9bht4hzN8u+dMq=0GiWhhOShpUArS6RLtA@mail.gmail.com>
References: <20190210225114.20110-1-stuart.menefy@mathembedded.com> <20190210225114.20110-2-stuart.menefy@mathembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190210225114.20110-2-stuart.menefy@mathembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Menefy <stuart.menefy@mathembedded.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, 10 Feb 2019 at 23:51, Stuart Menefy
<stuart.menefy@mathembedded.com> wrote:
>
> When a timer tick occurs and the clock is in one-shot mode, the timer
> needs to be stopped to prevent it triggering subsequent interrupts.
> Currently this code is in exynos4_mct_tick_clear(), but as it is
> only needed when an ISR occurs move it into exynos4_mct_tick_isr(),
> leaving exynos4_mct_tick_clear() just doing what its name suggests it
> should.
>
> Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
> ---
>  drivers/clocksource/exynos_mct.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
