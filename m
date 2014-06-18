From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v6 0/6] cpufreq: use generic cpufreq drivers for exynos platforms
Date: Wed, 18 Jun 2014 13:21:24 +0530
Message-ID: <CAKohpomt4M_V7rMAoh=+UFon3CxnZjVY_9DuVtQW9ddtTTj7Fg@mail.gmail.com>
References: <1403018733-4187-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:51632 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756231AbaFRHvZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 03:51:25 -0400
Received: by mail-oa0-f41.google.com with SMTP id l6so1050634oag.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2014 00:51:24 -0700 (PDT)
In-Reply-To: <1403018733-4187-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Chanwoo Choi <cw00.choi@samsung.com>

On 17 June 2014 20:55, Thomas Abraham <thomas.ab@samsung.com> wrote:
> Changes since v5:
> - Configuration data for cpu clock block is embedded with the code. The cpu clock
>   logic can later to extended to obtain this data from DT.
> - Excluded the support for Exynos4x12 SoC since the work on boost OPP bindings is
>   still incomplete.
> - Included cpufreq support for Exynos5420 SoC.
> - Many other minor changes (and so dropped Ack's for some of the patches in v5)
>
> This patch series removes the use of Exynos4210 and Exynos5250 specific cpufreq
> drivers and enables the use of cpufreq-cpu0 driver for these platforms. This
> series also enabled cpufreq support for Exynos5420 using arm_big_little cpufreq
> driver.

cpufreq@vger.kernel.org list is deprecated now: dec102a, use linux-pm instead.

For patch 5 and 6:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
