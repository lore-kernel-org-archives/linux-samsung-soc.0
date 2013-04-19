From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] cpufreq: exynos: allow disabling cpufreq drivers
Date: Fri, 19 Apr 2013 20:59:38 +0200
Message-ID: <201304192059.38606.arnd@arndb.de>
References: <201304191554.29679.arnd@arndb.de> <51717623.2060709@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <51717623.2060709@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, cpufreq@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 19 April 2013, Sylwester Nawrocki wrote:
> Not sure what happened here, but my and Tomasz's Tested-by were given 
> for v5 of the patch series including 6e6aac7590, while it seems v6 
> has been applied. And the patch is not same in both series.

I see.

> There could be some differences in the base tree I used when testing 
> this [1] series, as it was hard to determine against what tag it was 
> created exactly. Also I didn't test in on all platforms, only 
> Exynos4412.

Maybe you just didn't have CPUFREQ enabled? I also didn't notice this
bug at first because it is turned off in the defconfigs.

It could also be working by chance on EXYNOS4, since the register
definitions were not actually removed from the regs-clk.h header
for those.

	Arnd
