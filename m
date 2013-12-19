From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/3] clk: exynos5250: register APLL rate table
Date: Thu, 19 Dec 2013 09:14:16 +0530
Message-ID: <CAK9yfHwTgKW55-ChHNToLGZZ-frd4OJF5Zi5Djt5NzxhOZvcrg@mail.gmail.com>
References: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org>
	<1383905648-23733-3-git-send-email-sachin.kamat@linaro.org>
	<1713728.JoffI8rva3@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:46138 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751987Ab3LSDoQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 22:44:16 -0500
Received: by mail-ob0-f177.google.com with SMTP id vb8so603286obc.36
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 19:44:16 -0800 (PST)
In-Reply-To: <1713728.JoffI8rva3@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Andrew Bresticker <abrestic@chromium.org>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>

Hi Tomasz,

On 10 November 2013 22:44, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Sachin, Andrew,
>
> On Friday 08 of November 2013 15:44:08 Sachin Kamat wrote:
>> From: Andrew Bresticker <abrestic@chromium.org>
>>
>> Register the APLL rate table so that we can set the APLL rate from
>> the cpufreq driver.
>>
>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  drivers/clk/samsung/clk-exynos5250.c |   25 ++++++++++++++++++++++++-
>>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> You know that you still need to fix the cpufreq driver to use these,
> don't you? Anyway:
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

This one too needs to be applied to your tree.

-- 
With warm regards,
Sachin
