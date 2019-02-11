From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] clocksource: exynos_mct: Clear timer interrupt when shutdown
Date: Mon, 11 Feb 2019 09:47:53 +0100
Message-ID: <CAJKOXPeHMTZn0h8aVU4btg736XyHxpYHBFy1Up7jZgmQa17gtg@mail.gmail.com>
References: <20190210225114.20110-1-stuart.menefy@mathembedded.com> <20190210225114.20110-3-stuart.menefy@mathembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190210225114.20110-3-stuart.menefy@mathembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Menefy <stuart.menefy@mathembedded.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, 10 Feb 2019 at 23:51, Stuart Menefy
<stuart.menefy@mathembedded.com> wrote:
>
> When shutting down the timer, ensure that after we have stopped the
> timer any pending interrupts are cleared. This fixes a problem when
> suspending, as interrupts are disabled before the timer is stopped,
> so the timer interrupt may still be asserted, preventing the system
> entering a low power state when the wfi is executed.
>
> Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
> ---
>  drivers/clocksource/exynos_mct.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
