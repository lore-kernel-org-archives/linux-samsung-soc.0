From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/3] cpufreq: exynos: Add exynos5420 cpufreq driver
Date: Tue, 17 Dec 2013 13:33:27 +0530
Message-ID: <CAKohpo=GtXGEJZSfRB9Rs-KtXYumZRMANFZTzVD94P9pXvuOrw@mail.gmail.com>
References: <1386323284-15646-1-git-send-email-arun.kk@samsung.com>
	<1386323284-15646-4-git-send-email-arun.kk@samsung.com>
	<CAKohpo=vkZRSQ5Xk-Tsm9QVy8h2F5Ehpm4Y8JWi5xjx0OD72tw@mail.gmail.com>
	<20131217090005.1e04ff7b@amdc2363>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20131217090005.1e04ff7b@amdc2363>
Sender: cpufreq-owner@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Arun Kumar K <arun.kk@samsung.com>, Kgene Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, abrestic@chromium.org, arunkk.samsung@gmail.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Tomasz Figa <tomasz.figa@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, arjun.kv@samsung.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 17 December 2013 13:30, Lukasz Majewski <l.majewski@samsung.com> wrote:
> When I first looked into the patch - it was almost identical to the
> exynos4210-cpufreq.c or exynos4x12-cpufreq.c files.
>
> Also I didn't spot the code characteristic to IKS. It seems like the
> code in this file is not aware if it runs on A7 or A15.

This code is only written for A15, this is what the log says. And it will
require updates for A7 to be controlled by this driver and then we
can't use cpufreq-cpu0 for it.

You might not use IKS for 5420 at all, I said it is also an optional feature
available if required.
