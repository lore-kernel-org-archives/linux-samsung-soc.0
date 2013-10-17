From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] cpufreq: exynos: Convert exynos-cpufreq to platform driver
Date: Thu, 17 Oct 2013 10:29:45 +0530
Message-ID: <CAK9yfHwW+ofX5f8hHF=MYQn=CUMyiHvg4iAH-cHFW7JQ5Qnscw@mail.gmail.com>
References: <1381939238-30398-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:52758 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750773Ab3JQE7q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 00:59:46 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz1so1712256pad.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Oct 2013 21:59:45 -0700 (PDT)
In-Reply-To: <1381939238-30398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lukasz Majewski <l.majewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Hi Tomasz, Lukasz,

On 16 October 2013 21:30, Tomasz Figa <t.figa@samsung.com> wrote:
> From: Lukasz Majewski <l.majewski@samsung.com>
>
> +static struct platform_driver exynos_cpufreq_platdrv = {
> +       .driver = {
> +               .name   = "exynos-cpufreq",
> +               .owner  = THIS_MODULE,
> +       },
> +       .probe = exynos_cpufreq_init,

I think the prototype of this function should be changed to:
static int __init exynos_cpufreq_init(struct platform_device *pdev)

to avoid compilation warnings.

-- 
With warm regards,
Sachin
