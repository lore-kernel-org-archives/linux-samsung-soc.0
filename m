From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: Fix compatible value of pinctrl module
 on EXYNOS5440
Date: Thu, 17 Jan 2013 20:24:23 -0600
Message-ID: <50F8B257.1090108@gmail.com>
References: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com> <CACRpkdYCw8pyR2hGkMT_uMCyHUU_fCF4Zn9DhXPyuF+74JLfAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:57946 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753594Ab3ARCYZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 21:24:25 -0500
Received: by mail-ob0-f179.google.com with SMTP id x4so3232027obh.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jan 2013 18:24:25 -0800 (PST)
In-Reply-To: <CACRpkdYCw8pyR2hGkMT_uMCyHUU_fCF4Zn9DhXPyuF+74JLfAg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, devicetree-discuss@lists.ozlabs.org

On 01/17/2013 02:34 AM, Linus Walleij wrote:
> On Thu, Jan 3, 2013 at 1:20 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> 
>> From: Thomas Abraham <thomas.ab@samsung.com>
>>
>> Fix the incorrect compatible property value of pin-controller module
>> EXYNOS5440 SoC.
>>
> (...)
>>
>>         pinctrl {
>> -               compatible = "samsung,pinctrl-exynos5440";
>> +               compatible = "samsung,exynos5440-pinctrl";
>>                 reg = <0xE0000 0x1000>;
>>                 interrupt-controller;
>>                 #interrupt-cells = <2>;
>> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
>> index 953737d..cac4b45 100644
>> --- a/drivers/gpio/gpio-samsung.c
>> +++ b/drivers/gpio/gpio-samsung.c
>> @@ -3026,7 +3026,7 @@ static __init int samsung_gpiolib_init(void)
>>         static const struct of_device_id exynos_pinctrl_ids[] = {
>>                 { .compatible = "samsung,pinctrl-exynos4210", },
>>                 { .compatible = "samsung,pinctrl-exynos4x12", },
>> -               { .compatible = "samsung,pinctrl-exynos5440", },
>> +               { .compatible = "samsung,exynos5440-pinctrl", },
>>         };
>>         for_each_matching_node(pctrl_np, exynos_pinctrl_ids)
>>                 if (pctrl_np && of_device_is_available(pctrl_np))
> 
> I am tempted to apply this patch just to annoy people with
> obsessive-compulsive disorder (but that's a bit mean).
> Reference:
> http://izismile.com/2011/08/16/obnoxious_ways_to_drive_people_with_ocd_nuts_16_pics.html
> 
> But I'd like a word from Rob, Grant or Stephen so I have some
> guidance here.

As long as we're consistently inconsistent... What about 4210 and 4x12?
Hopefully, the reason was to avoid breaking them.

This creates horrible incompatibilities between dts and kernel versions
by changing both. Any prior kernel will not work with this dts or later.
And more importantly this kernel version or newer will not work with
existing dtb's. We've been pretty lax on this as DT support has been
under heavy development, but things need to start tightening up. That
being said, if this isn't yet a concern for this platform, then I don't
really care.

Rob
