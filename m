From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/19] pinctrl: exynos: Add support for Exynos5433
Date: Thu, 27 Nov 2014 21:14:59 +0900
Message-ID: <CA+Ln22FtvUD1HqH9PCGPCRu8Cyc6u4oNnsrEWyKYODtCT8wKHQ@mail.gmail.com>
References: <1417073716-22997-1-git-send-email-cw00.choi@samsung.com>
	<1417073716-22997-2-git-send-email-cw00.choi@samsung.com>
	<3904347.Bp2gmpYM49@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3904347.Bp2gmpYM49@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanho Park <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "sw0312.kim" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

2014-11-27 20:45 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Thursday 27 November 2014 16:34:58 Chanwoo Choi wrote:
>> +
>> +/*
>> + * Samsung pinctrl driver data for Exynos5433 SoC. Exynos5433 SoC includes
>> + * four gpio/pin-mux/pinconfig controllers.
>> + */
>> +struct samsung_pin_ctrl exynos5433_pin_ctrl[] = {
>> +       {
>> +               /* pin-controller instance 0 data */
>> +               .pin_banks      = exynos5433_pin_banks0,
>> +               .nr_banks       = ARRAY_SIZE(exynos5433_pin_banks0),
>> +               .eint_wkup_init = exynos_eint_wkup_init,
>> +               .suspend        = exynos_pinctrl_suspend,
>> +               .resume         = exynos_pinctrl_resume,
>> +               .label          = "exynos5433-gpio-ctrl0",
>> +       }, {
>>
>
> I'm counting nine controllers, not four ;-)
>
> These seem to all be fairly regular,

Yup, especially considering what Chanwoo mentioned about the great
idea someone came up with about putting EINT registers of one of the
controllers in different pin controller.

> my impression is that with the
> move to arm64, you should come up with a new binding that can fully
> describe each controller so you don't have to add new code and bindings
> for each future SoC that uses the same scheme.

Still, this is exactly the same thing I thought when initially refactoring this
driver 2 years ago and what was dismissed at that time due to people
supposedly not wanting that much data in DT. If this point of view has changed,
then I fully support your view, though.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
