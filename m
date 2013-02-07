From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH 2/3] cpufreq: exynos: Adding cpufreq driver for exynos5440
Date: Thu, 7 Feb 2013 16:58:34 +0530
Message-ID: <CAG17yqQtvg4aL7tV6b5GmrdhjwvT4k+iCyStRykkHFOmP21Q9g@mail.gmail.com>
References: <1360179562-19950-1-git-send-email-amit.daniel@samsung.com>
	<1360179562-19950-2-git-send-email-amit.daniel@samsung.com>
	<CAG17yqSh3bk8C9YSXtEsh4F5AJttwbVjFY0tdoy6=SZX5qibkQ@mail.gmail.com>
	<CAOh2x=n+-PenMYNf9iZG0SeS4ENYdh0aKFWVZtLqWVHDUYhaMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:64666 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758032Ab3BGL2g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 06:28:36 -0500
Received: by mail-wi0-f172.google.com with SMTP id ez12so6719415wid.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Feb 2013 03:28:34 -0800 (PST)
In-Reply-To: <CAOh2x=n+-PenMYNf9iZG0SeS4ENYdh0aKFWVZtLqWVHDUYhaMw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Amit Daniel Kachhap <amit.daniel@samsung.com>, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org

On 7 February 2013 16:49, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On Thu, Feb 7, 2013 at 10:39 AM, Inderpal Singh
> <inderpal.singh@linaro.org> wrote:
>>> +#define DRIVER_NAME            "exynos5440_dvfs"
>
>>> +static struct cpufreq_driver exynos_driver = {
>>> +       .name           = DRIVER_NAME,
>>> +};
>>> +
>>
>> Since this driver is only for exynos5440, having the same names as
>> common exynos-cpufreq is misleading.
>
> Where is it same?

I meant hooks names (verify/get/target and init)

Thanks,
Inder
