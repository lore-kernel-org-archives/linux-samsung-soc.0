From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 09/14] ARM: dts: s6e3fa0: add DT bindings
Date: Thu, 17 Jul 2014 12:38:45 +0200
Message-ID: <20140717103844.GE17877@ulmo>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
 <1405587689-1466-10-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:53320 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756009AbaGQKiy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 06:38:54 -0400
Content-Disposition: inline
In-Reply-To: <1405587689-1466-10-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com


--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2014 at 06:01:24PM +0900, YoungJun Cho wrote:
> This patch adds DT bindings for s6e3fa0 panel.
> The bindings describes panel resources and display timings.

The commit message here should preferably say which platform this is
used on.

> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  | 46 ++++++++++++++++=
++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3f=
a0.txt
>=20
> diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt =
b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> new file mode 100644
> index 0000000..2cd32f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> @@ -0,0 +1,46 @@
> +Samsung S6E3FA0 AMOLED LCD 5.7 inch panel
> +
> +Required properties:
> +  - compatible: "samsung,s6e3fa0"
> +  - reg: the virtual channel number of a DSI peripheral
> +  - vdd3-supply: core voltage supply
> +  - vci-supply: voltage supply for analog circuits
> +  - reset-gpios: a GPIO spec for the reset pin
> +  - det-gpios: a GPIO spec for the OLED detection pin
> +  - te-gpios: a GPIO spec for the TE pin
> +  - display-timings: timings for the connected panel as described by [1]

display-timings should be optional. The panel driver should provide a
default mode. And only if you really need to override the default mode
you should provide the option of getting an alternative set of values
=66rom DT.

Thierry

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTx6e0AAoJEN0jrNd/PrOh+7YP/A5E1nBJ7DtVFrXymr/TE56R
vGE8bdMTsPQlVMXzCjR8p7PRsTlIGiORcEuJx4+nG0dpFatEKTAAfwAYoAcK4hOa
mwHNRINKdHI2lEF9/5dau0XgCIQ0T8vD85muiJXxQKculxOULpt7PChMcusnsoLz
wxkSzK55TXvzFZ5TD9/Ih94SYfHQqMO9PdFJq/89lC1WRc7iV0yY1aPU837sKic5
ZTJWhgVp8efNjEuDx7aHMial/AlpbROHVQDVs1XJbId40onM7VSPQ0gbRej9catx
tg3p7RhTJYjR7V9/pZKrMnCr2HUeHeRumlz8YVc9DSCOCPCY7cf/ThpFUntaUusV
0l9Uaoyy62e8wjErApc8Cu+FYHJxcRR8t7ja7UXayMvRvKtK14JzrVDsNS/8/XEa
8ilesbv4n6wb5Fd2+4Lrnb255LFV9u1Go8l9fMhdyV3NCWNlm2S4u4xuTx9VHa90
W/zMy/Aymc1Or1o2IIjHLEhQBMT+oMIi4T4nmt0tT1xzgnOczMMLIpB/K34qKCxu
W3I6rIkZJjW50Xoi8OHxp2kpUex5xleNW/yp6NMo2bUoqqkbXd4zf4WLNXouBPne
Torc4n0gIwOqxRyprENkIGwcRUy9kzMK970ytPXyHQMYKdwjO2xM73DFKuEQchrT
g7wyllXxaAb6qEOowoU8
=4Xd0
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
