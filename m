From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/9] ARM: dts: exynos: Use pinctrl labels in
 exynos4210-pinctrl
Date: Mon, 12 Feb 2018 20:15:57 +0100
Message-ID: <20180212191557.xsypxb5s35jbavk2@kozik-lap>
References: <1517817428-7898-1-git-send-email-m.purski@samsung.com>
 <CGME20180205075727eucas1p16ae3372cf985aaabb3899f0e030eb972@eucas1p1.samsung.com>
 <1517817428-7898-2-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1517817428-7898-2-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 05, 2018 at 08:57:00AM +0100, Maciej Purski wrote:
> Labels for pinctrl's are defined in exynos4210.dtsi. Use them in
> exynos4210-pinctrl instead of full names, as it is done in other exynos
> DTS.
> 
> Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos4210-pinctrl.dtsi | 1680 ++++++++++++++---------------
>  arch/arm/boot/dts/exynos4210.dtsi         |    3 +-
>  2 files changed, 841 insertions(+), 842 deletions(-)
>

Applied 1-5 so far. I'll go with the rest soon.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
