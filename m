From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/2] ARM: EXYNOS: Enable PINCTRL config option for Exynos4
 device tree enabled platform
Date: Wed, 22 Aug 2012 10:28:08 +0530
Message-ID: <CAJuYYwQnia6xB0AgmQ9UKH1Ot+-C=ABzQ7LC8shdjxwKGGP0oA@mail.gmail.com>
References: <1345061442-32378-1-git-send-email-thomas.abraham@linaro.org>
	<1345061442-32378-3-git-send-email-thomas.abraham@linaro.org>
	<CACRpkda9BiGejU+Qs=1CqKgLxLGumcM4QZOb_og-aAAmKr-0VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:33611 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750825Ab2HVE6K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Aug 2012 00:58:10 -0400
Received: by lagy9 with SMTP id y9so330974lag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Aug 2012 21:58:08 -0700 (PDT)
In-Reply-To: <CACRpkda9BiGejU+Qs=1CqKgLxLGumcM4QZOb_og-aAAmKr-0VQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

On 21 August 2012 18:01, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Aug 15, 2012 at 10:10 PM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>
>> This enables support for Samsung and Exynos4 pinctrl driver for device
>> tree enabled Exynos4 platforms.
>>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>>  arch/arm/mach-exynos/Kconfig |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index b5b4c8c..ad96c59 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -405,6 +405,7 @@ config MACH_EXYNOS4_DT
>>         select USE_OF
>>         select ARM_AMBA
>>         select HAVE_SAMSUNG_KEYPAD if INPUT_KEYBOARD
>> +       select PINCTRL
>
> I don't think this works, since PINCTRL_SAMSUNG is not default "y"
> (nor should it be).

I think I got this wrong. PINCTRL_SAMSUNG depends of OF, which is not
correct. The correct way would be select PINCTRL_SAMSUNG from
PINCTRL_EXYNOS4. I will fix this.

>
> For the platforms I converted I had to select both the subsystem and
> the indivudual driver, as is already done for some GPIO controllers
> for example:
>
> select PINCTRL
> select PINCTRL_SAMSUNG
>
> Yours,
> Linus Walleij

Thanks,
Thomas.
