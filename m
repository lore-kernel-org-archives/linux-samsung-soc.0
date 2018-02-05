From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: exynos: Add soc node to exynos4210
Date: Mon, 5 Feb 2018 16:07:18 +0100
Message-ID: <CAJKOXPd1kPoR0RR8J0_GdRKTKXWJ+VCY6hFpAAwGsJjeN3TzvA@mail.gmail.com>
References: <CGME20180205112603eucas1p2ffaaa41a8181a76aec96c2f8c6e37945@eucas1p2.samsung.com>
 <1517829936-26311-1-git-send-email-m.purski@samsung.com> <1517829936-26311-3-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517829936-26311-3-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 5, 2018 at 12:25 PM, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Soc nodes are used in other exynos DTS. Exynos4 boards should use them
> as well.
>
> Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---

I agree with the idea of converting one DTS after another but did you
check carefully that there are no overridden nodes in exynos4210?
Otherwise after commit #1 two nodes would appear (one /soc/xxx and one
/xxx).

Also as in #1, please check for warnings (there should be no new warnings).

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
