From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] clk: samsung: Add dt bindings for Exynos4412 ISP
 clock controller
Date: Fri, 13 Oct 2017 17:03:36 -0500
Message-ID: <20171013220336.vsnvodjffg4xxkbo@rob-hp-laptop>
References: <20171011092515.1698-1-m.szyprowski@samsung.com>
 <CGME20171011092521eucas1p12fa702013b7bdbb4f9250e9da3fda8a1@eucas1p1.samsung.com>
 <20171011092515.1698-3-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171011092515.1698-3-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 11, 2017 at 11:25:12AM +0200, Marek Szyprowski wrote:
> Some registers for the Exynos 4412 ISP (Camera subsystem) clocks are
> located in the ISP power domain. Because those registers are also
> located in a different memory region than the main clock controller,
> support for them can be provided by a separate clock controller.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/exynos4-clock.txt    | 43 ++++++++++++++++++++++
>  include/dt-bindings/clock/exynos4.h                | 35 ++++++++++++++++++
>  2 files changed, 78 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
