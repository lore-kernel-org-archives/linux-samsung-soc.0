From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 7/9] drm/exynos: Add driver for Exynos Scaler module
Date: Mon, 23 Oct 2017 19:39:47 -0500
Message-ID: <20171024003947.h2xxnnkh4czo7guv@rob-hp-laptop>
References: <20171017110752.25096-1-m.szyprowski@samsung.com>
 <CGME20171017110814eucas1p11e7519e68e67c0d75aa20e97a35acac5@eucas1p1.samsung.com>
 <20171017110752.25096-8-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171017110752.25096-8-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tobias Jakobi <tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 17, 2017 at 01:07:50PM +0200, Marek Szyprowski wrote:
> From: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> Exynos Scaler is a hardware module, which processes graphic data fetched
> from memory and transfers the resultant dato another memory buffer.
> Graphics data can be up/down-scaled, rotated, flipped and converted color
> space. Scaler hardware modules are a part of Exynos5420 and newer Exynos
> SoCs.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/gpu/samsung-scaler.txt     |  26 +

In the future, please split bindings to separate patches.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/gpu/drm/exynos/Kconfig                     |   6 +
>  drivers/gpu/drm/exynos/Makefile                    |   1 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.c            |   3 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |   1 +
>  drivers/gpu/drm/exynos/exynos_drm_ipp.h            |   4 +
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c         | 717 +++++++++++++++++++++
>  drivers/gpu/drm/exynos/regs-scaler.h               | 426 ++++++++++++
>  8 files changed, 1184 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.txt
>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_scaler.c
>  create mode 100644 drivers/gpu/drm/exynos/regs-scaler.h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
