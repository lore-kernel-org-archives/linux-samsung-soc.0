From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/2] Subject: [PATCH 0/2] clocksource: exynos_mct: Clear
 timer interrupt when shutting down
Date: Mon, 11 Feb 2019 12:34:58 +0100
Message-ID: <CAJKOXPfguCS5jFNhdfJ8poA1yC3JVb0jnra4af-EBXfwy2P8Gw@mail.gmail.com>
References: <CGME20190210225147epcas3p4cedebfc5692274bc6135ceabbcf2642d@epcas3p4.samsung.com>
 <20190210225114.20110-1-stuart.menefy@mathembedded.com> <e22c175a-d88a-81a7-9faa-42bb4fe09a22@samsung.com>
 <e3637f0f-1e72-db3a-f744-ade0e878cfc5@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e3637f0f-1e72-db3a-f744-ade0e878cfc5@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Stuart Menefy <stuart.menefy@mathembedded.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 11 Feb 2019 at 12:23, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 11/02/2019 08:14, Marek Szyprowski wrote:
> > Hi Stuart
> >
> > On 2019-02-10 23:51, Stuart Menefy wrote:
> >> When debugging suspend problems on Exynos 5260, I had a large number
> >> of debugging prints going to the serial port after interrupts
> >> had been disabled but before the timer interrupt was shutdown. This
> >> was long enough for a timer tick to occur, but as interrupts were
> >> disabled the ISR didn't run, and so the interrupt wasn't cleared.
> >> Later when the timer was shutdown the interrupt was left asserted and
> >> so the wfi at the heart of the suspend code didn't wait, causing
> >> the suspend to fail.
> >>
> >> Currently the code which stops the timer when it is on one-shot mode
> >> and the interrupt occurs is in exynos4_mct_tick_clear(), meaning if we
> >> called this from the shutdown code exynos4_mct_tick_stop() could be
> >> called twice. So first restructure the existing code, so the check for
> >> one-shot mode and stopping the timer is moved to the ISR, leaving
> >> exynos4_mct_tick_clear() just clearing the interrupt flag.
> >>
> >> Once this has been done simply call exynos4_mct_tick_clear() from
> >> set_state_shutdown().
> >
> > This also fixes mysterious suspend failures on Odroid XU3/XU4/HC1 :)
> >
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Applied. Shall I add the stable@ tag?

Makes sense - for the second patch, although first is a prerequisite.
It should be backported up to v4.3 (the code differ a lot on older
versions).

Best regards,
Krzysztof
