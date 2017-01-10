From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/3] arm64: dts: exynos5433: add DECON_TV node
Date: Tue, 10 Jan 2017 21:09:16 +0200
Message-ID: <20170110190916.k3tek4zuvhggbuc6@kozik-lap>
References: <CGME20170110082433eucas1p2f7cb7b0974987e2c8294509960468fd3@eucas1p2.samsung.com>
 <1484036664-15951-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484036664-15951-1-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 10, 2017 at 09:24:22AM +0100, Andrzej Hajda wrote:
> DECON_TV is 2nd display controller on Exynos5433, used in HDMI path
> or 2nd DSI path.
> 
> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Tested-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> 
> Hi Krzysztof,
> 
> These patches are based on latest patches separating tm2 and tm2e and
> touchscreen patches. I hope this is good base.
> Thanks all for quick response/review.
> 
> Regards
> Andrzej
> 
> v2:
>   - replaced magic numbers with macros,
>   - removed power domains,
>   - removed 0x prefixes from node names
> 
> v3:
>   - order nodes by address
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 43 ++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>

First, I applied your fix for unit addresses. Then I wanted to apply
these... no, it does not apply.

Okay, so maybe unit address confuses git-am (it is not that smart as
cherry-pick etc) - let's try the other way. I applied these three
patches, fixed that damned subject in each commit and I wanted to apply
the fix for unit address. Nope. It won't apply.

I do not know how you rebased your work.

As of now, the fix is applied. Please fix the subject and rebase.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
