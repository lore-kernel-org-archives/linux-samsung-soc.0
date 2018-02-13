From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/9] ARM: dts: exynos: Use camera label in exynos4412
Date: Tue, 13 Feb 2018 18:44:51 +0100
Message-ID: <20180213174451.agnx4ahei5olelhs@kozik-lap>
References: <1517817428-7898-1-git-send-email-m.purski@samsung.com>
 <CGME20180205075729eucas1p151ca06d3f2dad9bafef3088af61a498f@eucas1p1.samsung.com>
 <1517817428-7898-7-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1517817428-7898-7-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 05, 2018 at 08:57:05AM +0100, Maciej Purski wrote:
> Camera label has been defined in exynos4.dtsi. Use it in exynos4412
> instead of defining a new node.
> 
> Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos4412.dtsi | 172 +++++++++++++++++++-------------------
>  1 file changed, 86 insertions(+), 86 deletions(-)
> 

Thanks, applied rest (6-9).

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
