From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Update CONFIG_ARCH_NR_GPIO for Exynos
Date: Mon, 22 Jul 2013 09:10:55 +0530
Message-ID: <CAK9yfHxq2ggVe9=_OVPa_KXN4HBed1_AwFQ3C_-Jxgzg6y1Pnw@mail.gmail.com>
References: <1372054438-15693-1-git-send-email-sachin.kamat@linaro.org>
	<0ab301ce867d$9078c170$b16a4450$%kim@samsung.com>
	<CAK9yfHzmF_oxc3DsuT5wtXX2C5O+wLxz4C2Ps3cVPnKLb8jOEw@mail.gmail.com>
	<0ad601ce868c$d88bff40$89a3fdc0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:54617 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754602Ab3GVDkz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Jul 2013 23:40:55 -0400
Received: by mail-oa0-f46.google.com with SMTP id h1so8511912oag.33
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Jul 2013 20:40:55 -0700 (PDT)
In-Reply-To: <0ad601ce868c$d88bff40$89a3fdc0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org, Tomasz Figa <t.figa@samsung.com>

On 22 July 2013 09:07, Kukjin Kim <kgene@kernel.org> wrote:
> Sachin Kamat wrote:
>>
>> On 22 July 2013 07:18, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> > Sachin Kamat wrote:
>> >>
>> >> With the recent cleanup in Exynos platform code notably commits
>> >> 17859bec ("ARM: EXYNOS: Do not select legacy Kconfig symbols any
>> >> more") and b9222210 ("ARM: EXYNOS: Remove mach/gpio.h"), the definition
>> >> of ARCH_NR_GPIOS got removed. This started causing problems on SoCs
>> like
>> >> Exynos4412 which have more (285) than the default number of GPIOs
> (255).
>> >> Thus define this number in Kconfig file. Without this patch we get the
>> >> following errors during boot:
>> >>
>> >> gpiochip_add: gpios 251..258 (gpv0) failed to register
>> >> samsung-pinctrl 106e0000.pinctrl: failed to register gpio_chip gpv0,
>> >> error code: -22
>> >> samsung-pinctrl: probe of 106e0000.pinctrl failed with error -22
>> >>
>> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> >> Cc: Tomasz Figa <t.figa@samsung.com>
>> >> ---
>> >> Based on Kukjin's for-next tree.
>> >> ---
>> >>  arch/arm/Kconfig |    1 +
>> >>  1 file changed, 1 insertion(+)
>> >>
>> >> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> >> index ddf2667..380a53b 100644
>> >> --- a/arch/arm/Kconfig
>> >> +++ b/arch/arm/Kconfig
>> >> @@ -1578,6 +1578,7 @@ config ARCH_NR_GPIO
>> >>       default 512 if SOC_OMAP5
>> >>       default 392 if ARCH_U8500
>> >>       default 352 if ARCH_VT8500
>> >> +     default 288 if ARCH_EXYNOS
>> >>       default 288 if ARCH_SUNXI
>> >>       default 264 if MACH_H4700
>> >>       default 0
>> >> --
>> >> 1.7.9.5
>> >
>> > Hmm, BTW, I'm wondering why it is 288 not 285 or other specific
> number...
>>
>> I wasn't really sure if we can have any number there. I chose the
>> closest one (288) which was already used by other platform.
>> If there is no problem to use 285 itself then I can resend with that
>> number. Please let me know.
>>
> If there is no reason, please don't use bigger value than necessary one.

Ok, I will resend this with exact value.
Thanks Kukjin.



-- 
With warm regards,
Sachin
