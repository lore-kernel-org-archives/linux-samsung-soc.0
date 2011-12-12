From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 2/3] s5p-g2d: add G2D to mach-nuri
Date: Mon, 12 Dec 2011 18:27:30 +0900
Message-ID: <CAH9JG2UBb0Dp3i9Hzwx36AykKS5wZd5fsaP3y-og8VVoGqfhtg@mail.gmail.com>
References: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
	<1323446682-25252-3-git-send-email-k.debski@samsung.com>
	<20111212052745.GA686@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:55284 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750862Ab1LLJ1a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Dec 2011 04:27:30 -0500
Received: by dajs34 with SMTP id s34so1524409daj.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2011 01:27:30 -0800 (PST)
In-Reply-To: <20111212052745.GA686@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kamil Debski <k.debski@samsung.com>, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kgene.kim@samsung.com

On 12/12/11, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Dec 09, 2011 at 05:04:41PM +0100, Kamil Debski wrote:
>
>> index 236bbe1..5251e91 100644
>> --- a/arch/arm/mach-exynos/mach-nuri.c
>> +++ b/arch/arm/mach-exynos/mach-nuri.c
>> @@ -1262,6 +1262,7 @@ static struct platform_device *nuri_devices[]
>> __initdata = {
>>  	&s3c_device_i2c3,
>>  	&i2c9_gpio,
>>  	&s3c_device_adc,
>> +	&s5p_device_g2d,
>
> For devices like g2d which are always part of the SoC and which don't
> require any external wiring on the board I was thinking we should just
> have the core code for the SoC register the device rather than including
> it in each board individually.  It'd save effort and ensure that people
> automatically get to use the feature.
I'm welcome to use these scheme. make a common.c and register it automatically.
but I'm not sure we're ready to use this scheme. and I hope to start
these work at smdk board instead of this patch.

Thank you,
Kyungmin Park
>
> The crypto accelerators are another example of this - it's not really
> board specific if they're useful.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
