From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 07/10] ARM: dts: Clean up exynos5250-arndale
Date: Sat, 02 Aug 2014 15:02:02 +0200
Message-ID: <53DCE14A.3020108@gmail.com>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de> <1406940750-15880-8-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406940750-15880-8-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan van Schaik <stephan-zGZ7W/ttz6xN8Ch2cx6nig@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 02.08.2014 02:52, Andreas F=C3=A4rber wrote:
> Use the new style of referencing inherited nodes, use symbolic names,
> tidy indentation and reorder includes.
>=20
> Goal is the alignment of all exynos5250 based device trees for compar=
ison.
>=20
> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v5 -> v6:
>  * Updated for mfc node label
> =20
>  v5: New
>  Aligns with SMDK.
>=20
>  arch/arm/boot/dts/exynos5250-arndale.dts | 929 ++++++++++++++++-----=
----------
>  1 file changed, 466 insertions(+), 463 deletions(-)
>=20

Diff in resulting dtb:

> --- exynos5250-arndale.dtb.dts	2014-08-02 14:54:15.102905920 +0200
> +++ ../dtbs.post/exynos5250-arndale.dtb.dts	2014-08-02 14:54:15.10490=
5920 +0200
> @@ -1977,7 +1977,7 @@
>  		clocks =3D <0x2 0x158 0x2 0x88 0x2 0x89 0x2 0x9f 0x2 0x400>;
>  		clock-names =3D "hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy",=
 "mout_hdmi";
>  		samsung,syscon-phandle =3D <0x7>;
> -		hpd-gpio =3D <0xc 0x7 0x2>;
> +		hpd-gpio =3D <0xc 0x7 0x1>;
>  		vdd_osc-supply =3D <0x31>;
>  		vdd_pll-supply =3D <0x32>;
>  		vdd-supply =3D <0x32>;
> @@ -2104,15 +2104,9 @@
>  		};
>  	};
> =20
> -	usb_hub_bus {
> -		compatible =3D "simple-bus";
> -		#address-cells =3D <0x1>;
> -		#size-cells =3D <0x0>;
> -
> -		usb_hub {
> -			compatible =3D "smsc,usb3503a";
> -			reset-gpios =3D <0xc 0x5 0x1>;
> -			connect-gpios =3D <0x10 0x7 0x1>;
> -		};
> +	usb-hub {
> +		compatible =3D "smsc,usb3503a";
> +		reset-gpios =3D <0xc 0x5 0x1>;
> +		connect-gpios =3D <0x10 0x7 0x1>;
>  	};
>  };

Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
