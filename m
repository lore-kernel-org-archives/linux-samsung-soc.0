From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/9] Exynos 4210, 4412 DTS cleanup
Date: Mon, 5 Feb 2018 09:31:40 +0100
Message-ID: <CAJKOXPcnsHsF0XJa9agvEH5dvkjp9rzz4v0UX-zSLYRUdmHP3A@mail.gmail.com>
References: <CGME20180205075723eucas1p1e14d59501a636903262aee195348d53c@eucas1p1.samsung.com>
 <1517817428-7898-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517817428-7898-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 5, 2018 at 8:56 AM, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi all,
>
> this patchset performs cleanup of exynos4 series DTS. The main goal
> is to prepare them to add "soc" node just like it is done in other
> exynos DTS. Basically those patches use labels wherever possible
> instead of redefining nodes, which have been defined in
> exynos4.dtsi, exynos4210.dtsi or exynos4412.dtsi.
>
> Best Regards,
>
> Maciej Purski
>
> ---
>
> Changes in v2:
> - squashed patch #3 and #4
> - move interrupts, reg and status properties to exynos4.dtsi
> - put nodes in alphabetical order in exynos4412-odroid common
>   and exynos4210-universal_c210

Thanks, all look good! I'll take them after merge window.

Best regards,
Krzysztof

>
> Maciej Purski (9):
>   ARM: dts: exynos: Use pinctrl labels in exynos4210-pinctrl
>   ARM: dts: exynos: Use pinctrl labels in exynos4412-pinctrl
>   ARM: dts: exynos:  Use labels instead of full names in exynos4210
>   ARM: dts: exynos: Use fimc labels in exynos4210-trats
>   ARM: dts: exynos: Use labels instead of full names in
>     exynos4210-universal_c210
>   ARM: dts: exynos: Use camera label in exynos4412
>   ARM: dts: exynos: Use camera label in exynos4412-odroid-common
>   ARM: dts: exynos: Use labels instead of full names in
>     exynos4412-trats2
>   ARM: dts: exynos: Use camera label in exynos4412-itop-elite
>
>  arch/arm/boot/dts/exynos4.dtsi                  |    6 +-
>  arch/arm/boot/dts/exynos4210-pinctrl.dtsi       | 1680 ++++++++++----------
>  arch/arm/boot/dts/exynos4210-trats.dts          |   73 +-
>  arch/arm/boot/dts/exynos4210-universal_c210.dts |  115 +-
>  arch/arm/boot/dts/exynos4210.dtsi               |  101 +-
>  arch/arm/boot/dts/exynos4412-itop-elite.dts     |   16 +-
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi |   12 +-
>  arch/arm/boot/dts/exynos4412-pinctrl.dtsi       | 1914 +++++++++++------------
>  arch/arm/boot/dts/exynos4412-trats2.dts         |   73 +-
>  arch/arm/boot/dts/exynos4412.dtsi               |  237 +--
>  10 files changed, 2114 insertions(+), 2113 deletions(-)
>
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
