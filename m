From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: exynos4: allow i2c0 bus to be configured
 using pinctrl interface
Date: Thu, 6 Sep 2012 16:44:54 +0530
Message-ID: <CAJuYYwSC6nvs4eJ7GOTD2Ti8EvcTPPGZ7Fj7reT2eY65nvq22Q@mail.gmail.com>
References: <1346923381-14144-1-git-send-email-thomas.abraham@linaro.org>
	<1346923381-14144-3-git-send-email-thomas.abraham@linaro.org>
	<5320531.svfjn4BD9X@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:44234 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751301Ab2IFLO4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 07:14:56 -0400
Received: by lbbgj3 with SMTP id gj3so1045277lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Sep 2012 04:14:54 -0700 (PDT)
In-Reply-To: <5320531.svfjn4BD9X@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, w.sang@pengutronix.de, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, dong.aisheng@linaro.org

On 6 September 2012 15:43, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Thomas,
>
> On Thursday 06 of September 2012 14:53:01 Thomas Abraham wrote:
>>               compatible = "samsung,s3c2440-i2c";
>>               reg = <0x13860000 0x100>;
>>               interrupts = <0 58 0>;
>> +             pinctrl-names = "default";
>> +             pinctrl-0 = <&i2c0_bus>;
>
> If pinctrl-names property is omitted then the state index is used as a name
> (e.g. pinctrl-0 would be named "0"). Maybe it would be better to use this
> approach (with respective adjustment in first patch)? What do you think?

I tend to prefer to name the states because it is easier to
cross-reference code and dts files. i2c was a simple one, but for mmc
controllers, there will 1-bit state, 4-bit state and 8-bit state, and
it will be nicer to name then accordingly. So I prefer to use names
but if there is wider consensus on not using names, we can drop names.

Thanks,
Thomas.

>
> Best regards,
> --
> Tomasz Figa
> Samsung Poland R&D Center
>
