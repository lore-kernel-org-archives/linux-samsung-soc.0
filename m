From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS5: Add bus clock and set parent clock for FIMD
Date: Tue, 11 Sep 2012 14:49:54 +0530
Message-ID: <CAL1wa8f1=hVMYrw2qdnQK5wFh8CtLxjP79+8POOG7HHqOBU5yA@mail.gmail.com>
References: <1347307866-30641-1-git-send-email-l.krishna@samsung.com> <000101cd8fb3$90d10db0$b2732910$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:44371 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757695Ab2IKJUP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Sep 2012 05:20:15 -0400
Received: by dady13 with SMTP id y13so193002dad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Sep 2012 02:20:14 -0700 (PDT)
In-Reply-To: <000101cd8fb3$90d10db0$b2732910$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com

Hello Jingoo Han,

On Tue, Sep 11, 2012 at 5:52 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> On Tuesday, September 11, 2012 5:11 AM Leela Krishna Amudala wrote
>>
>> This patch adds the bus clock for FIMD and changes the device name for lcd clock
>> also sets mout_mpll_user as parent clock to fimd
>>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>  arch/arm/mach-exynos/clock-exynos5.c       |   34 +++++++++++++++++++--------
>>  arch/arm/plat-samsung/include/plat/clock.h |    2 +
>>  2 files changed, 26 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
>> index 774533c..f1281cf 100644
>> --- a/arch/arm/mach-exynos/clock-exynos5.c
>> +++ b/arch/arm/mach-exynos/clock-exynos5.c
>> @@ -891,6 +891,13 @@ static struct clk exynos5_clk_mdma1 = {
>>       .ctrlbit        = (1 << 4),
>>  };
>>
>> +static struct clk exynos5_clk_fimd = {
>> +     .name           = "fimd",
>> +     .devname        = "exynos5-fb",
>
>
> Replace 'exynos5-fb' with 'exynos5-fb.1', as exynos4 fimd uses exynos4-fb.0
> as devname. Exynos5 can use fimd0 or fimd1. Also, Exynos5250 uses fimd1.
>
>
Currently s3c-fb driver using "exynos5-fb" as device name, hence used
the same name in the clock.
This code is tested with both drm-fimd and s3c-fb fimd and it is
working fine showing the display on LCD.
If I change the device name in clock file then I have to change it in
s3c-fb driver also.
So I feel it is better to keep the name as "exynos5-fb" in clock file
instead of changing in the driver.

Thanks,
Leela Krishna Amudala.

>> +     .enable         = exynos5_clk_ip_disp1_ctrl,
>> +     .ctrlbit        = (1 << 0),
>> +};
>> +
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
