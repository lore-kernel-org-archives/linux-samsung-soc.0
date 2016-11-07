From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/6] clk: Add driver for Maxim-8997 PMIC clocks
Date: Mon, 7 Nov 2016 22:50:58 +0530
Message-ID: <CAGcde9EkEsvJ2kBpNvd+bEZj0nbpgmFu1zBe+RQz+Kij9WxHMA@mail.gmail.com>
References: <1478513376-14307-1-git-send-email-pankaj.dubey@samsung.com>
 <1478513376-14307-4-git-send-email-pankaj.dubey@samsung.com> <63750c2f-35cb-91ab-276b-c788f51081cb@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <63750c2f-35cb-91ab-276b-c788f51081cb-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Javier,

On 7 November 2016 at 20:31, Javier Martinez Canillas
<javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote:
> Hello Pankaj,
>
> On 11/07/2016 07:09 AM, Pankaj Dubey wrote:
>> The MAX8997 PMIC has 32.786kHz crystal oscillator which provides an
>> accurate low frequency clock for MAX8997 internal circuit as well as
>> external circuit. This patch adds support for these two clocks.
>>
>> CC: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> CC: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>
> What kernel version are you basing this on? The Maxim common clock code

This patch series, I have prepared on Krzysztof's for-next which is 4.9-rc1,

> is going away for v4.9 and instead the clk-max77686 driver supports both
> 77686 and 77802 clocks. See commit 8ad313fe4e00 ("clk: max77686: Combine
> Maxim max77686 and max77802 driver").
>
> Since the 8997 clock IP looks very similar to 77802 AFAICT, you should
> also extend the clk-max77686 driver to have 8997 support.
>

I was not aware of this change. I will check this and if I can
reuse/extend max77686 for 8997 I will do it.

Thanks,
Pankaj Dubey

> Best regards,
> --
> Javier Martinez Canillas
> Open Source Group
> Samsung Research America
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
