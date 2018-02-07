From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: Add soc node to exynos5440
Date: Wed, 7 Feb 2018 10:35:11 +0100
Message-ID: <CAJKOXPd8RNe9sa4br6hKTr5-9WCy+xEhiDDqT1_KmK9oajJUxw@mail.gmail.com>
References: <CGME20180206113158eucas1p1c5cb146fb80116232d0d79634a48d210@eucas1p1.samsung.com>
 <1517916710-13970-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517916710-13970-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 6, 2018 at 12:31 PM, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> The exynos5440 device tree is the only one left, which does not use
> "soc" node. Add a "soc" node to exynos5440.dtsi in order to make it
> compatible with other exynos DTS.
>
> Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> ---
> Changes in v2:
> - move the "thermal-zones" node outside the "soc" node
> ---
>  arch/arm/boot/dts/exynos5440.dtsi | 514 +++++++++++++++++++-------------------
>  1 file changed, 261 insertions(+), 253 deletions(-)

Looks OK, thanks. I'll take it after merge window.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
