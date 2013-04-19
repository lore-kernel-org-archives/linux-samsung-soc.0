From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] cpufreq: exynos: allow disabling cpufreq drivers
Date: Fri, 19 Apr 2013 22:43:30 +0200
Message-ID: <201304192243.30430.arnd@arndb.de>
References: <201304191554.29679.arnd@arndb.de> <201304192059.38606.arnd@arndb.de> <5171AB10.5070702@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <5171AB10.5070702@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, cpufreq@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 19 April 2013, Sylwester Nawrocki wrote:
> > It could also be working by chance on EXYNOS4, since the register
> > definitions were not actually removed from the regs-clk.h header
> > for those.
> 
> That's most likely what happened.

Ok. I think I see the bigger picture now. The EXYNOS5 cpufreq driver was
actually just merged now, so I assume that by the time Thomas did the clock
changes, the register definitions for EXYNOS5 were actually unused and he
subsequently removed them from the kernel.

Since the driver now depends on them, I think the only way forward for 3.10
is to revert the change that removed the definitions and put them back in
place.

We really should use the clock API from all the exynos cpufreq drivers, but it's
too late for that change now in 3.10 and we will have to do it for 3.11 then.

This are not looking so good for exynos multiplatform support in 3.10 now, but
if we get it in, that will mean we have to disable cpufreq when building
multiplatform, but it can remain for the classic single-platform configurations.

	Arnd
