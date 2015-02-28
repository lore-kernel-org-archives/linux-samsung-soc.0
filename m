From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/8] arm64: exynos5433: Enable ARMv8 based Exynos5433
 (SoC) support
Date: Sat, 28 Feb 2015 09:51:14 +0900
Message-ID: <CAGTfZH2h4=PEk0BvG9ar3O7ne_rZdNEUJK_=BZu8KnCuQOBECQ@mail.gmail.com>
References: <1424755011-15999-1-git-send-email-cw00.choi@samsung.com>
	<1424755011-15999-2-git-send-email-cw00.choi@samsung.com>
	<8838911.kfOYZxBsJP@wuerfel>
	<54EED910.4010603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54EED910.4010603-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin and Sylwester,

On Thu, Feb 26, 2015 at 5:28 PM, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On 02/24/2015 05:31 PM, Arnd Bergmann wrote:
>> On Tuesday 24 February 2015 14:16:44 Chanwoo Choi wrote:
>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>> index 1b8e973..d83cea0 100644
>>> --- a/arch/arm64/Kconfig
>>> +++ b/arch/arm64/Kconfig
>>> @@ -154,6 +154,17 @@ config ARCH_EXYNOS
>>>         help
>>>           This enables support for Samsung Exynos SoC family
>>>
>>> +config ARCH_EXYNOS5433
>>> +       bool "ARMv8 based Samsung Exynos5433"
>>> +       select ARCH_EXYNOS
>>> +       select COMMON_CLK_SAMSUNG
>>> +       select HAVE_S3C_RTC if RTC_CLASS
>>> +       select PINCTRL
>>> +       select PINCTRL_EXYNOS
>>> +
>>> +       help
>>> +         This enables support for Samsung Exynos5433 SoC family
>>> +
>>>  config ARCH_EXYNOS7
>>>         bool "ARMv8 based Samsung Exynos7"
>>>         select ARCH_EXYNOS
>>> --
>>>
>>
>> Can we collapse all these entries into one for EXYNOS? I don't
>> want to end up with endless lists like we have on arm32 when
>> there is no platform specific code that is actually controlled
>> by this anway.
>
> I agree.
>
> I check the some issue for only using the CONFIG_ARCH_EXYNOS
> insead of CONFIG_ARCH_EXYNOS7 and CONFIG_ARCH_EXYNOS5433.
>
> Each CONFIG_ARCH_EXYNOS{7|5433} configuraiton was used on following list:
> - CONFIG_ARCH_EXYNOS7
> arch/arm64/boot/dts/exynos/Makefile:1:dtb-$(CONFIG_ARCH_EXYNOS7) += exynos7-espresso.dtb
> drivers/clk/samsung/Makefile:17:obj-$(CONFIG_ARCH_EXYNOS7)      += clk-exynos7.o
> - CONFIG_ARCH_EXYNOS5433
> drivers/clk/samsung/Makefile:13:obj-$(CONFIG_ARCH_EXYNOS5433)   += clk-exynos5433.o
>
> We may can fix it as following by only using 'CONFIG_ARCH_EXYNOS' without any specific configuration.
>
> arch/arm64/boot/dts/exynos/Makefile:1:dtb-$(CONFIG_ARCH_EXYNOS) += exynos7-espresso.dtb
> drivers/clk/samsung/Makefile:17:obj-$(CONFIG_ARCH_EXYNOS)       += clk-exynos7.o clk-exynos5433.o
>
> I think that we need the opinion of Kukjin Kim (Exynos SoC Maintainer)
> and Sylwester Nawrocki(Samsung clock Maintainer)

I need yout opinion about using the CONFIG_ARCH_EXYNOS
instead of CONFIG_ARCH_EXYNOS7/CONFIG_ARCH_EXYNOS5433?

Thanks,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
