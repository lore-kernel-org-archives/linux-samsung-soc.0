From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 1/9] ARM: S3C24XX: cpufreq-utils: don't write raw values
 to MPLLCON when using ccf
Date: Wed, 23 Apr 2014 22:55:51 +0200
Message-ID: <535828D7.3080301@gmail.com>
References: <2104342.rkElQpXtvM@phil> <5855371.5GIoOu8EnE@phil> <535825AB.8060802@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:50005 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422633AbaDWUzz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 16:55:55 -0400
Received: by mail-ee0-f44.google.com with SMTP id e49so1202784eek.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2014 13:55:54 -0700 (PDT)
In-Reply-To: <535825AB.8060802@cogentembedded.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

Hi,

On 23.04.2014 22:42, Sergei Shtylyov wrote:
> Hello.
>
> On 04/23/2014 11:34 PM, Heiko St=FCbner wrote:
>
>> The s3c24xx cpufreq driver needs to change the mpll speed and was do=
ing
>> this by writing raw values from a translation table into the MPLLCON
>> register.
>
>> Change this to use a regular clk_set_rate call when using the common
>> clock framework and only write the raw value in the samsung_clock ca=
se.
>
>> To not needing to create additional infrastructure for this, the mpl=
l
>> clock
>> is requested at the first call to s3c2410_set_fvco().
>
>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> ---
>>   arch/arm/mach-s3c24xx/cpufreq-utils.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>
>> diff --git a/arch/arm/mach-s3c24xx/cpufreq-utils.c
>> b/arch/arm/mach-s3c24xx/cpufreq-utils.c
>> index 2a0aa56..d5e797b 100644
>> --- a/arch/arm/mach-s3c24xx/cpufreq-utils.c
>> +++ b/arch/arm/mach-s3c24xx/cpufreq-utils.c
> [...]
>> @@ -60,5 +61,18 @@ void s3c2410_cpufreq_setrefresh(struct
>> s3c_cpufreq_config *cfg)
>>    */
>>   void s3c2410_set_fvco(struct s3c_cpufreq_config *cfg)
>>   {
>> +#ifdef CONFIG_SAMSUNG_CLOCK
>>       __raw_writel(cfg->pll.driver_data, S3C2410_MPLLCON);
>> +#endif
>> +
>> +#ifdef CONFIG_COMMON_CLK
>> +    static struct clk *mpll;
>> +
>> +    if (!mpll)
>
>     You are testing uninitialized variable. This check wouldn't make
> much sense even if the variable was initialized.

I should probably add that NULL is considered a valid clock handle by=20
Common Clock Framework.

If there is really no way to pass the clock to this function then=20
probably a global variable initialized by some code running earlier tha=
n=20
this function could be called would be a better choice.

Anyway, Heiko, thanks for working on this. I'll try to review rest of=20
the series soon. (I'm attending the ELC next week, though, so I'm not=20
sure if I find some time then, though.)

Best regards,
Tomasz
