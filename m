From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 03/10] ARM: dts: exynos: Add camera label to exynos4
Date: Sun, 4 Feb 2018 18:02:56 +0100
Message-ID: <20180204170256.ukelttf3dyshfzzh@kozik-lap>
References: <1517586235-16603-1-git-send-email-m.purski@samsung.com>
 <CGME20180202154406eucas1p203f36842997cdb703d08bd07388ec8af@eucas1p2.samsung.com>
 <1517586235-16603-4-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1517586235-16603-4-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Feb 02, 2018 at 04:43:48PM +0100, Maciej Purski wrote:
> In order to avoid redefining camera node in exynos4* boards, define
> camera label in exynos4.dtsi.
> 
> Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos4.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This should be squashed with patch #4 because it is too small and does
not have sense on itself.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
