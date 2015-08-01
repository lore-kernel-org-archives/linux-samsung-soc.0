From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 4/5] cpufreq: exynos: remove Exynos4x12 specific
 cpufreq driver support
Date: Sat, 1 Aug 2015 16:20:13 +0530
Message-ID: <20150801105013.GG899@linux>
References: <1438368557-2352-1-git-send-email-b.zolnierkie@samsung.com>
 <1438368557-2352-5-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438368557-2352-5-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Thomas Abraham <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Chanwoo Choi <cw00.choi@samsung.com>, Kevin Hilman <khilman@linaro.org>, Javier Martinez Canillas <javier@dowhile0.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Anand Moon <linux.amoon@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Cc'ing Rafael, please keep him in loop for such patches and better use
get_maintainers to get the cc list automatically.

On 31-07-15, 20:49, Bartlomiej Zolnierkiewicz wrote:
> Exynos4x12 based platforms have switched over to use generic
> cpufreq driver for cpufreq functionality.  So the Exynos
> specific cpufreq support for these platforms can be removed.
> 
> Also once Exynos4x12 based platforms support have been removed
> the shared exynos-cpufreq driver is no longer needed and can
> be deleted.
> 
> Based on the earlier work by Thomas Abraham.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  drivers/cpufreq/Kconfig.arm          |  38 ------
>  drivers/cpufreq/Makefile             |   2 -
>  drivers/cpufreq/exynos-cpufreq.c     | 236 -----------------------------------
>  drivers/cpufreq/exynos-cpufreq.h     |  72 -----------
>  drivers/cpufreq/exynos4x12-cpufreq.c | 236 -----------------------------------
>  5 files changed, 584 deletions(-)
>  delete mode 100644 drivers/cpufreq/exynos-cpufreq.c
>  delete mode 100644 drivers/cpufreq/exynos-cpufreq.h
>  delete mode 100644 drivers/cpufreq/exynos4x12-cpufreq.c

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
