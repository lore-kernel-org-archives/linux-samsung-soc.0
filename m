From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] cpufreq: exynos5250: Set APLL rate using CCF API
Date: Thu, 19 Dec 2013 10:18:23 +0530
Message-ID: <CAK9yfHz1jC-=G9rAmQ54MFn=PKacfgoPJ6JsFaGVXqGb28yG1A@mail.gmail.com>
References: <1385009046-22070-1-git-send-email-sachin.kamat@linaro.org>
	<20131129071139.46eff334@amdc2363>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:44409 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751201Ab3LSEsY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 23:48:24 -0500
Received: by mail-oa0-f45.google.com with SMTP id o6so693166oag.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 20:48:23 -0800 (PST)
In-Reply-To: <20131129071139.46eff334@amdc2363>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>

On 29 November 2013 11:41, Lukasz Majewski <l.majewski@samsung.com> wrote:
> Hi Sachin,
>
>> Use common clock framework (CCF) APIs to set the clock rates
>> instead of direct register manipulation. This now updates the
>> sysfs entry (cpuinfo_cur_freq) correctly which did not reflect
>> the correct value until now. While at it clean up the PLL s-div
>> parameter setting as it is handled by the PLL driver.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---

>
> Looks good to me.
>
> Reviewed-by: Lukasz Majewski <l.majewski@samsung.com>


Didn't see this in linux-next yet, hence gentle ping, Rafael.


-- 
With warm regards,
Sachin
