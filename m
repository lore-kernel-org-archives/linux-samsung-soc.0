From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/4] ARM/arm64: exynos: Fix missing missing reg
 warning for syscon restart nodes
Date: Fri, 09 Feb 2018 12:17:49 +0100
Message-ID: <06515e72-d7b3-9799-698e-d8b2dd39e22a@samsung.com>
References: <CGME20180130211855epcas1p25cce42a195d8b407f4267309f9b5ccb9@epcas1p2.samsung.com>
        <20180130211819.17139-1-krzk@kernel.org>
        <4642d2d0-61c9-33b6-0289-76f487aa45ab@samsung.com>
        <20180209104806.vcrrtpq6izcnwvy2@angband.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20180209104806.vcrrtpq6izcnwvy2-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Adam,

On 2018-02-09 11:48, Adam Borowski wrote:
> On Thu, Feb 08, 2018 at 02:46:32PM +0100, Marek Szyprowski wrote:
>> On 2018-01-30 22:18, Krzysztof Kozlowski wrote:
>>> Changes since v1:
>>> 1. New patch (1/4) calling devm_of_platform_populate() in PMU driver,
>>>      following Rob's advice.
>>> 2. The DTS patches moving reboot/poweroff nodes (3/4 and 4/4) now depend
>>>      on this.
>> Tested-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> Tested following boards and reboot works fine:
>> Exynos3250 (artik5-eval)
>> Exynos4412 (trats2)
>> Exynos5410 (odroid xu)
>> Exynos5422 (odroid xu3/xu4)
>> Exynos5433 (tm2)
> Doesn't seem to work on mine:
> Exynos4412 (odroid u2)
>
> Rebooting worked correctly with 3.8 + gazillion non-mainlined patches (as
> shipped with providen images), never did with mainline.
>
> Tested on current mid-of-the-merge-window, plus these four patches.
>
>
> It's possible that I'm doing something wrong; might need an updated u-boot,
> etc.  Log of a boot-till-reboot+hang session attached.

Reboot on Odroid X2/U2/U3 doesn't work now. It is broken by devfreq since
a few kernel releases. Please disable devfreq in your .config and reboot
should also work. That's why I didn't put Odroid U3 on the above list.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
