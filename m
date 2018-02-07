From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Add soc nodes to exynos4 series DTS
Date: Wed, 7 Feb 2018 10:37:27 +0100
Message-ID: <CAJKOXPesCyrc5ALunOgNhjFV-bWQDN8NP0p9EO2f0-okXQ2v2A@mail.gmail.com>
References: <CGME20180206113006eucas1p148766268255c129223e32f221afc1b94@eucas1p1.samsung.com>
 <1517916582-13814-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517916582-13814-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 6, 2018 at 12:29 PM, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi all,
>
> this patchset adds soc node to exynos4, exynos4210 and exynos4412
> DTS. The main goal for these changes is unification of all exynos
> DTS. Soc nodes are already present in for example exynos5 series.
>
> Best regards,
>
> Maciej Purski
>
> ---
> Changes in v2:
> - rebased onto "ARM: dts: exynos: Use pmu label in exynos4412"
>   in order to fix pmu warning
> - move "cpu0_opp_table" outside the "soc" node
>
> Maciej Purski (3):
>   ARM: dts: exynos: Add soc node to exynos4
>   ARM: dts: exynos: Add soc node to exynos4210
>   ARM: dts: exynos: Add soc node to exynos4412

All look OK, thanks. I'll take them after merge window.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
