From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: dts: Re-organize RTC status for 5420
Date: Sat, 21 Dec 2013 09:35:37 +0530
Message-ID: <CAK9yfHx8aTie10Cis8_iDc12XYjnks0ks9-iw83XDDQ9iRRquA@mail.gmail.com>
References: <1387450673-331-1-git-send-email-sachin.kamat@linaro.org>
	<1941342.TJqfbb7DVG@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:44130 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753099Ab3LUEFh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 23:05:37 -0500
Received: by mail-oa0-f41.google.com with SMTP id j17so3822563oag.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 20:05:37 -0800 (PST)
In-Reply-To: <1941342.TJqfbb7DVG@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Tomasz,

On 21 December 2013 02:42, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Sachin,
>
> On Thursday 19 of December 2013 16:27:53 Sachin Kamat wrote:
>> Some boards might not have RTC xtal, so RTC shouldn't really be
>> enabled by default. Enable it in the required board files.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos5420-arndale-octa.dts |    4 ++++
>>  arch/arm/boot/dts/exynos5420-smdk5420.dts     |    4 ++++
>>  arch/arm/boot/dts/exynos5420.dtsi             |    2 +-
>>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Thanks.

>
> By the way, can we expect a patch like this for Exynos 5250 to make all
> Exynos SoCs consistent about this?

Sure. That was my plan.

---
With warm regards,
Sachin
