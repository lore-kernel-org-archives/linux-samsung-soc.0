From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] cpufreq: Remove exynos_sort_descend_freq_table in exynos5440-cpufreq.c
Date: Tue, 29 Apr 2014 11:05:11 +0530
Message-ID: <CAKohpo=ei0v69iQtjd6cjmfUCo-+sd1JzNc4RDza92nxaPoiVg@mail.gmail.com>
References: <000701cf636b$3d1d13c0$b7573b40$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <000701cf636b$3d1d13c0$b7573b40$@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: Jonghwan Choi <jhbird.choi@samsung.com>, Amit Daniel <amit.daniel@samsung.com>
Cc: "open list:CPU FREQUENCY DRI..." <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 29 April 2014 10:54, Jonghwan Choi <jhbird.choi@samsung.com> wrote:
> diff --git a/drivers/cpufreq/exynos5440-cpufreq.c
> -static void exynos_sort_descend_freq_table(void)
> -{
> -       struct cpufreq_frequency_table *freq_tbl = dvfs_info->freq_table;
> -       int i = 0, index;
> -       unsigned int tmp_freq;
> -       /*
> -        * Exynos5440 clock controller state logic expects the cpufreq table
> to
> -        * be in descending order. But the OPP library constructs the table
> in
> -        * ascending order. So to make the table descending we just need to
> -        * swap the i element with the N - i element.
> -        */

What I am more focused is on: Why do we need to worry about order at
all in the first place.

Okay, above comment says something about it but I couldn't understand
what's the logic behind that. Why do we need same order as of clock
controller. Please point out relevant code pieces as well..

@Amit: Your comments on this ?
