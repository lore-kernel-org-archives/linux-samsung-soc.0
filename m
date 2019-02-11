From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/2] Subject: [PATCH 0/2] clocksource: exynos_mct: Clear
 timer interrupt when shutting down
Date: Mon, 11 Feb 2019 09:45:30 +0100
Message-ID: <CAJKOXPe+G_gPNLQcaE5kvXFLFzhXo538w8-34k3gcK7yNL8txA@mail.gmail.com>
References: <20190210225114.20110-1-stuart.menefy@mathembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190210225114.20110-1-stuart.menefy@mathembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Menefy <stuart.menefy@mathembedded.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, 10 Feb 2019 at 23:51, Stuart Menefy
<stuart.menefy@mathembedded.com> wrote:
>
> When debugging suspend problems on Exynos 5260, I had a large number
> of debugging prints going to the serial port after interrupts
> had been disabled but before the timer interrupt was shutdown. This
> was long enough for a timer tick to occur, but as interrupts were
> disabled the ISR didn't run, and so the interrupt wasn't cleared.
> Later when the timer was shutdown the interrupt was left asserted and
> so the wfi at the heart of the suspend code didn't wait, causing
> the suspend to fail.
>
> Currently the code which stops the timer when it is on one-shot mode
> and the interrupt occurs is in exynos4_mct_tick_clear(), meaning if we
> called this from the shutdown code exynos4_mct_tick_stop() could be
> called twice. So first restructure the existing code, so the check for
> one-shot mode and stopping the timer is moved to the ISR, leaving
> exynos4_mct_tick_clear() just clearing the interrupt flag.
>
> Once this has been done simply call exynos4_mct_tick_clear() from
> set_state_shutdown().

For sending the corrected version. This is second revision of the
patchset so please remember to add v2 to the title and changelog in
cover letter. v2 can be easily added with format-patch (-v2).

Best regards,
Krzysztof
