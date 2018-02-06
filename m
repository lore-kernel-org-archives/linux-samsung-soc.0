From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: Add soc node to exynos4
Date: Tue, 06 Feb 2018 12:24:24 +0100
Message-ID: <17e8871f-71c9-7cd5-e57d-efb8fbc21f1f@samsung.com>
References: <CGME20180205112603eucas1p17d1b5ef274e9541b785320a59f855c2a@eucas1p1.samsung.com>
        <1517829936-26311-1-git-send-email-m.purski@samsung.com>
        <1517829936-26311-2-git-send-email-m.purski@samsung.com>
        <CAJKOXPec6=SiwgcRBixwt+DjhyKvoK+nPYOSpHuUGgWL8vDHbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAJKOXPec6=SiwgcRBixwt+DjhyKvoK+nPYOSpHuUGgWL8vDHbQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org



On 02/05/2018 04:02 PM, Krzysztof Kozlowski wrote:
> On Mon, Feb 5, 2018 at 12:25 PM, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Soc nodes are used in other exynos DTS. Exynos4 boards should use them
>> as well.
>>
>> Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/exynos4.dtsi | 1727 ++++++++++++++++++++--------------------
>>   1 file changed, 872 insertions(+), 855 deletions(-)
>>
> 
> This brings some new DTC warnings:
> arch/arm/boot/dts/exynos4210-origen.dtb: Warning (simple_bus_reg):
> Node /soc/video-phy missing or empty reg/ranges property
> arch/arm/boot/dts/exynos4210-origen.dtb: Warning (simple_bus_reg):
> Node /soc/pmu missing or empty reg/ranges property
> 

The above warnings seem to be old. We just don't have "reg" property in video-phy.

> arch/arm/boot/dts/exynos4412-itop-elite.dtb: Warning
> (interrupts_property): interrupts size is (32), expected multiple of
> 12 in /pmu
>

These warnings occured, because "pmu" node was redefined in exynos4412.dtsi. I 
have missed it in the previous patchset. I'll fix this in a new patch.

> Best regards,
> Krzysztof
> 
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
