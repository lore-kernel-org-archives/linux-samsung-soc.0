From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: Extend Samsung MFD drivers entry and add
 myself
Date: Thu, 7 May 2015 08:40:16 +0100
Message-ID: <20150507074016.GD12484@x1>
References: <1430889576-7779-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430889576-7779-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 06 May 2015, Krzysztof Kozlowski wrote:

> Extend the entry for Samsung MFD drivers for PMIC devices (Power
> Management Integrated Circuit) with bindings documentation, clock
> (clk-s2mps11.c) and RTC drivers (rtc-s5m.c).
>=20
> These PMIC devices are used on many Exynos-based boards like Arndale
> Octa (S2MPS11), Gear 2 (S2MPS14).
>=20
> Add myself as a supporter for reviewing them.
> I am not the author of these drivers. However I have recently
> contributed to most of them and I have access to datasheets and hardw=
are.
>=20
> Cc: Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> CC: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> CC: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> CC: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
> CC: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> CC: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> CC: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> CC: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  MAINTAINERS | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

I can't see anyone having an issue with this.

Applied, thanks.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index e278814388f7..fc01dc9f96af 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8533,14 +8533,20 @@ L:	linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  S:	Maintained
>  F:	drivers/video/fbdev/s3c-fb.c
> =20
> -SAMSUNG MULTIFUNCTION DEVICE DRIVERS
> +SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
>  M:	Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> +M:	Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>  L:	linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +L:	linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  S:	Supported
>  F:	drivers/mfd/sec*.c
>  F:	drivers/regulator/s2m*.c
>  F:	drivers/regulator/s5m*.c
> +F:	drivers/clk/clk-s2mps11.c
> +F:	drivers/rtc/rtc-s5m.c
>  F:	include/linux/mfd/samsung/
> +F:	Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
> +F:	Documentation/devicetree/bindings/mfd/s2mp*.txt
> =20
>  SAMSUNG S5P/EXYNOS4 SOC SERIES CAMERA SUBSYSTEM DRIVERS
>  M:	Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
