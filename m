From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v8 06/17] dt-bindings: add document for analogix display port driver
Date: Wed, 28 Oct 2015 21:02:58 +0100
Message-ID: <103292898.nCEg51kmfI@phil>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com> <1446020793-10532-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446020793-10532-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-deve
List-Id: linux-samsung-soc@vger.kernel.org

Hi Yakir,

Am Mittwoch, 28. Oktober 2015, 16:26:33 schrieb Yakir Yang:
> diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
> index 7a3a9cd..9905081 100644
> --- a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
> +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
> @@ -31,45 +31,31 @@ Required properties for dp-controller:
>  		from general PHY binding: the phandle for the PHY device.
>  	-phy-names:
>  		from general PHY binding: Should be "dp".
> -	-samsung,color-space:
> -		input video data format.
> -			COLOR_RGB = 0, COLOR_YCBCR422 = 1, COLOR_YCBCR444 = 2
> -	-samsung,dynamic-range:
> -		dynamic range for input video data.
> -			VESA = 0, CEA = 1
> -	-samsung,ycbcr-coeff:
> -		YCbCr co-efficients for input video.
> -			COLOR_YCBCR601 = 0, COLOR_YCBCR709 = 1
> -	-samsung,color-depth:
> -		number of bits per colour component.
> -			COLOR_6 = 0, COLOR_8 = 1, COLOR_10 = 2, COLOR_12 = 3
> -	-samsung,link-rate:
> -		link rate supported by the panel.
> -			LINK_RATE_1_62GBPS = 0x6, LINK_RATE_2_70GBPS = 0x0A
> -	-samsung,lane-count:
> -		number of lanes supported by the panel.
> -			LANE_COUNT1 = 1, LANE_COUNT2 = 2, LANE_COUNT4 = 4
> -	- display-timings: timings for the connected panel as described by
> -		Documentation/devicetree/bindings/video/display-timing.txt
											^^ display/display-timings.txt
otherwise this patch does not apply.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
