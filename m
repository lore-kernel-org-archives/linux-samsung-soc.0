From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] ARM: dts: Fix compatible value of pinctrl module
 on EXYNOS5440
Date: Thu, 17 Jan 2013 09:39:22 -0700
Message-ID: <50F8293A.1030807@wwwdotorg.org>
References: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com> <CACRpkdYCw8pyR2hGkMT_uMCyHUU_fCF4Zn9DhXPyuF+74JLfAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:34745 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757116Ab3AQQjZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 11:39:25 -0500
In-Reply-To: <CACRpkdYCw8pyR2hGkMT_uMCyHUU_fCF4Zn9DhXPyuF+74JLfAg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, devicetree-discuss@lists.ozlabs.org

On 01/17/2013 01:34 AM, Linus Walleij wrote:
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

Aargh. Those pencils are wrong:-)

> But I'd like a word from Rob, Grant or Stephen so I have some
> guidance here.

Yes, the existing order looks odd c.f. existing practice.

I notice that only one of the strangely ordered entries in
exynos_pinctrl_ids[] is fixed. Surely they should all be fixed?

It's probably worth adding the new names to exynos_pinctrl_ids[] rather
than replacing them. That allows the driver to be backwards-compatible
with older DTBs, and partially decouples the driver change from the
.dts/.dtsi file. Still, the whole backwards-compatible DTB thing seems a
little irrelevant when the .dts files are in the kernel source tree anyway.
