From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 7/7] ASoC: samsung: Add missing #sound-dai-cells
 property documentation
Date: Tue, 13 Feb 2018 08:27:33 +0100
Message-ID: <CAJKOXPe8ALV_E=Z0z3=cnNPENot22EQf3DKSLAuGH0QRXogn1w@mail.gmail.com>
References: <CGME20180212161711epcas1p2285c5a778cf12ab00211063b1b4a0fc3@epcas1p2.samsung.com>
 <20180212161538.22669-1-s.nawrocki@samsung.com> <20180212161538.22669-8-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180212161538.22669-8-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 12, 2018 at 5:15 PM, Sylwester Nawrocki
<s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> The #sound-dai-cells property might be helpful in selecting primary
> or secondary CPU DAI and it's already present in i2s nodes for some
> exynos SoCs so let's add it to the DT binding documentation.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes since v1:
>  - the property moved to the "Optional SoC Specific Properties"
>    paragraph.
> ---
>  Documentation/devicetree/bindings/sound/samsung-i2s.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
