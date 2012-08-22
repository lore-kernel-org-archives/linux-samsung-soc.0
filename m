From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 4/4] ARM: EXYNOS: skip wakeup interrupt setup if
 pinctrl driver is used
Date: Wed, 22 Aug 2012 10:09:34 +0530
Message-ID: <CAJuYYwTsYNWRo7uraELdv=KJvXm-7F9JFb9ZrFvEYrcwJvBMmA@mail.gmail.com>
References: <1345060656-32201-1-git-send-email-thomas.abraham@linaro.org>
	<1345060656-32201-5-git-send-email-thomas.abraham@linaro.org>
	<CACRpkdaxSZZQwefN3FNvv3ctXFHqaLZoAZ5f8CVu7Tx9n6-v1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:61688 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751511Ab2HVEjf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Aug 2012 00:39:35 -0400
Received: by lbbgj3 with SMTP id gj3so411211lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Aug 2012 21:39:34 -0700 (PDT)
In-Reply-To: <CACRpkdaxSZZQwefN3FNvv3ctXFHqaLZoAZ5f8CVu7Tx9n6-v1Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

On 21 August 2012 17:34, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Aug 15, 2012 at 9:57 PM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>
>> Pinctrl driver includes support for configuring the external wakeup
>> interrupts. On exynos platforms that use pinctrl driver, the setup
>> of wakeup interrupts in the exynos platform code can be skipped.
>>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>
>> +#ifdef CONFIG_OF
>
> Don't you actually want to use:
>
> #fidef CONFIG_PINCTRL_SAMSUNG
>
> here? CONFIG_OF is a bit vague.

Ok. I will use CONFIG_PINCTRL_SAMSUNG here.

>
> Yours,
> Linus Walleij

Thanks,
Thomas.
