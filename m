From: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM64: dts: exynos5433-tm2: enable HDMI/TV path
Date: Fri, 06 Jan 2017 13:51:46 +0900
Message-ID: <20170106045146.5e4bxymtq73c7kyk@gangnam.samsung>
References: <1483629943-31183-1-git-send-email-a.hajda@samsung.com>
 <CGME20170105152604eucas1p12c1a964b5299a5a41305b00b80a09f36@eucas1p1.samsung.com>
 <1483629943-31183-3-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-disposition: inline
In-reply-to: <1483629943-31183-3-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej,

On Thu, Jan 05, 2017 at 04:25:43PM +0100, Andrzej Hajda wrote:
> TV path consist of following interconnected components:
> - DECON_TV - display controller,
> - HDMI - video signal converter RGB / HDMI,
> - MHL - video signal converter HDMI / MHL,
> - DDC - i2c slave device for EDID reading (on hsi2c_11 bus).
> 
> The same path/configuration is used by TM2E board and is
> automatically applied thanks to dts file inclusion.
> 
> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 71 +++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index 060adbf..0a87670 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts

same here, this patch will conflict with the previous patches on
the exynos5433-tm2.dts

Could you please rebase them on top of this one:
https://lkml.org/lkml/2017/1/5/887

which is rebased on top of:
https://lkml.org/lkml/2016/12/29/319

Thanks,
Andi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
