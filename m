From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 0/6] cpufreq: use generic cpufreq drivers for
 Exynos4x12 platform
Date: Fri, 7 Aug 2015 17:09:50 +0530
Message-ID: <20150807113950.GG6939@linux>
References: <1438868514-8814-1-git-send-email-b.zolnierkie@samsung.com>
 <55C43971.5010504@samsung.com>
 <20150807051826.GJ6325@linux>
 <2061119.GBaoSb4YSL@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2061119.GBaoSb4YSL@amdc1976>
Sender: linux-pm-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd.bergmann@linaro.org>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Michael Turquette' <mturquette@baylibre.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Lukasz Majewski' <l.majewski@samsung.com>, 'Heiko Stuebner' <heiko@sntech.de>, 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Kevin Hilman' <khilman@linaro.org>, 'Javier Martinez Canillas' <javier@dowhile0.org>, 'Tobias Jakobi' <tjakobi@math.uni-bielefeld.de>, 'Anand Moon' <linux.amoon@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07-08-15, 13:31, Bartlomiej Zolnierkiewicz wrote:
> Users don't need to enable the config option to get boost
> functionality working.  It is only needed to get scaling_boost_freqs
> sysfs attribute visible (which lists available boost freqs) when
> using cpufreq-dt driver.  Also the config option in question is not
> user visible.

By users I meant the people who will prepare the build images for the
release. They can just enable the config option :)

> The worst thing that happens if these 2 PM patches don't make it
> in time is that there will be no scaling_boost_freqs available
> when using cpufreq-dt driver.  Which is not very important from
> Exynos4x12 POV as it only supports single boost freq currently.

Right. So, now that your patch is Acked, send 1/6 and 6/6 separately
to pm-list and Rafael can get them merged himself..

I hope, your 6/6 patch will change a bit now ?

-- 
viresh
