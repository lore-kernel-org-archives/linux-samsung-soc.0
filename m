From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH 3/3] cpufreq: exynos: Add exynos5420 cpufreq driver
Date: Tue, 17 Dec 2013 09:14:56 +0100
Message-ID: <20131217091456.1af748c3@amdc2363>
References: <1386323284-15646-1-git-send-email-arun.kk@samsung.com>
 <1386323284-15646-4-git-send-email-arun.kk@samsung.com>
 <20131209092324.1f8b6502@amdc2363>
 <CALt3h7-25_mW5SnnTbZWjoF0pOZxsU5Gg6FqOdoz1MgdH7gm5w@mail.gmail.com>
 <20131210173208.5083aa1f@amdc2363>
 <CABb+yY0C50va5UAgv5QKGKK6qE1wiDwcUmn54CC7PVQ8vpoEmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <CABb+yY0C50va5UAgv5QKGKK6qE1wiDwcUmn54CC7PVQ8vpoEmg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, abrestic@chromium.org, Viresh Kumar <viresh.kumar@linaro.org>, Arun Kumar K <arunkk.samsung@gmail.com>, rjw@rjwysocki.net, Tomasz Figa <tomasz.figa@gmail.com>, cpufreq@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, arjun.kv@samsung.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jassi,

> On Tue, Dec 10, 2013 at 10:02 PM, Lukasz Majewski
> <l.majewski@samsung.com> wrote:
> >>
> >> Actually these values are not for PLL, but for the dividers.
> >> If you see below, the PLL rate setting is done through
> >> clk_set_rate() going via CCF. But I found an issue if the divider
> >> values are set via clk_set_rate API.
> >> What I found is, the system goes into freeze if all the divider
> >> values are not set in one shot. So we cannot call multiple
> >> clk_set_rate()'s on each divider. Thats why I continued with
> >> non-CCF way of setting the divider.
> >
> > I see. I'm not an expert on common clock framework (CCF), but for me
> > conceptually clock dividers setting shall be handled by CCF.
> >
> > However, I've poked a bit at CCF. There isn't any out of the box
> > solutions available.
> >
> > A "virtual" clock can be defined and inside its implementation we
> > can atomically set dividers. Another solution would be to hack the
> > current CCF to provide atomic clock operations
> >
> CCF isn't only for clocks that have single divider or gate control
> register. One could define a clock that manipulates more than one
> divider/gate in one CCF callback. It is already abstract enough. So
> implementing a virtual clock is the solution, imho.

Thanks for sharing your experience.

>  BTW, on my platform linux needs to send a 'non-atomic' IPC message to
> a master co-processor to scale up/down cpufreq. I just define a
> virtual clock and use the generic bL cpufreq driver
> drivers/cpufreq/arm_big_little.c

My use case is simpler - cpufreq-cpu0.c or arm_bit_little.c (for bL)
driver with maybe two virtual clocks to handle divider's update.

> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
