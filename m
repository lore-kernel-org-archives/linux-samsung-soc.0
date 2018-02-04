From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/10] Exynos 4210, 4412 DTS cleanup
Date: Sun, 4 Feb 2018 18:10:14 +0100
Message-ID: <20180204171014.twkorfgz5kkab2zn@kozik-lap>
References: <CGME20180202154402eucas1p2d9e49565542aeaa5ac08ba121cfa4496@eucas1p2.samsung.com>
 <1517586235-16603-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1517586235-16603-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Feb 02, 2018 at 04:43:45PM +0100, Maciej Purski wrote:
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

In general, everything looks okay. I had few minor comments to some of
the patches. The ones without my replies look okay.

Please send v2 for everything but no need to hurry as I will be taking
patches after merge window.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
