From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v6 0/3] cpufreq: Use cpufreq-dt driver for Exynos3250
Date: Fri, 24 Jul 2015 15:22:27 +0900
Message-ID: <55B1D9A3.8060301@samsung.com>
References: <1435797761-3339-1-git-send-email-cw00.choi@samsung.com>
 <4464631.oZyVO4Z0Ov@amdc1976> <093101d0b8c3$4b5d3ec0$e217bc40$@kernel.org>
 <20150724003005.642.21781@quantum> <55B1B3B0.8090106@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <55B1B3B0.8090106-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Chanwoo Choi' <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 24.07.2015 12:40, Kukjin Kim wrote:
> On 07/24/15 09:30, Michael Turquette wrote:
>> Quoting Kukjin Kim (2015-07-07 07:43:31)
>>> Bartlomiej Zolnierkiewicz wrote:
> 
> [...]
> 
>>>>> Chanwoo Choi (3):
>>>>>   clk: samsung: exynos3250: Add cpu clock configuration data and instaniate cpu clock
>>>>>   ARM: dts: Add CPU OPP and regulator supply property for Exynos3250
>>>>>   ARM: exynos: Add exynos3250 compatible to use generic cpufreq driver
>>>>>
>>>>>  arch/arm/boot/dts/exynos3250-monk.dts   |  4 ++++
>>>>>  arch/arm/boot/dts/exynos3250-rinato.dts |  4 ++++
>>>>>  arch/arm/boot/dts/exynos3250.dtsi       | 15 +++++++++++++++
>>>>>  arch/arm/mach-exynos/exynos.c           |  1 +
>>>>>  drivers/clk/samsung/clk-exynos3250.c    | 32 ++++++++++++++++++++++++++++++--
>>>>>  include/dt-bindings/clock/exynos3250.h  |  1 +
>>>>>  6 files changed, 55 insertions(+), 2 deletions(-)
>>>>
>>>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>>
>>>> Thank you for working on this.
>>>>
>>> +1 Thanks.
>>>
>>> Mike and Sylwester, if you're OK on this series, I'd like to pick up in Samsung
>>> tree together. And if you want, I could provide topic branch for clk tree.
>>
>> Kukjin,
>>
>> A topic branch would be great.
>>
> Sure, BTW it means you did 'ack' on this clk change? If not, please let
> em know ;-) I'll let you know once the topic branch is ready.

Dear Kukjin,

Will you handle this patchset and dependants (ARM: dts: Add CPU cooling
binding for Exynos3250-based Rinato/Monk board) for v4.3?

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
