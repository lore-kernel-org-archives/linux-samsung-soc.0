From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 07/14] ARM: dts: exynos_dsim: add exynos5420 Soc compatible
Date: Tue, 15 Apr 2014 13:39:02 +0530
Message-ID: <CAK9yfHwew_O57FuYiwohQUB1nhs5PJ5mg7TiPcPOvpbp=6sFgQ@mail.gmail.com>
References: <1397540862-21359-1-git-send-email-yj44.cho@samsung.com>
	<1397540862-21359-8-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397540862-21359-8-git-send-email-yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 15 April 2014 11:17, YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch adds exynos5420 SoC support.

This patch just updates binding documentation :)

> Signed-off-by: YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/video/exynos_dsim.txt      |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
> index 33b5730..9bbf82b 100644
> --- a/Documentation/devicetree/bindings/video/exynos_dsim.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
> @@ -1,7 +1,9 @@
>  Exynos MIPI DSI Master
>
>  Required properties:
> -  - compatible: "samsung,exynos4210-mipi-dsi"
> +  - compatible: value should be one of the following
> +                       "samsung,exynos4210-mipi-dsi" /* for Exynos4 SoCs */
> +                       "samsung,exynos5420-mipi-dsi" /* for Exynos5420 Soc */
s/Soc/SoC



-- 
With warm regards,
Sachin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
