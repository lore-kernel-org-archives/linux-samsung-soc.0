From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/5] Fix the parse_dt of exynos dsi and remove the OF
 graph
Date: Mon, 20 Feb 2017 16:07:45 +0900
Message-ID: <58AA95C1.4020809@samsung.com>
References: <CGME20170209012715epcas1p3dbe1788b864c50d339dcfd791c0900ec@epcas1p3.samsung.com>
 <1486603601-26826-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1486603601-26826-1-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Can you merge patch 2 and 5 to your tree so that they can go to mainline? Otherwise, I can merge them to my tree if you give me acked-by.

Thanks,
Inki Dae


2017년 02월 09일 10:26에 Hoegeun Kwon 이(가) 쓴 글:
> Hi,
> 
> The dsi + panel is a parental relationship, so OF grpah is not needed.
> Therefore, the current dsi_parse_dt function will throw an error,
> because there is no linked OF graph for case such as fimd + dsi +
> panel.
> 
> So the 1/5 patch parse the Pll, burst and esc clock frequency
> properties in dsi_parse_dt and modified to create a bridge_node only
> if there is an OF graph associated with dsi.
> 
> Also fixed the dts, which depend on the 1/5 patch. So removed the
> ports node and move burst and esc clock frequency properties to the
> parent (DSI node).
> 
> Changes for V2:
> - Added the clear explanation for commit. (1/5 patch)
> - Fixed it to the same subject as the actual work. (2/5 ~ 5/5 patches)
> 
> Best Regards,
> Hoegeun
> 
> Hoegeun Kwon (5):
>   drm/exynos: dsi: Fix the parse_dt function
>   arm64: dts: exynos: Remove the OF graph from DSI node for exynos5433
>     dts
>   arm: dts: Remove the OF graph from DSI node for exynos3250 dts
>   arm: dts: Remove the OF graph from DSI node for exynos4412 dts
>   arm: dts: Remove the OF graph from DSI node for exynos4210 dts
> 
>  arch/arm/boot/dts/exynos3250-rinato.dts            | 23 ++--------------
>  arch/arm/boot/dts/exynos4210-trats.dts             | 23 ++--------------
>  arch/arm/boot/dts/exynos4412-trats2.dts            | 23 ++--------------
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 16 ++---------
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 32 ++++++----------------
>  5 files changed, 16 insertions(+), 101 deletions(-)
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
