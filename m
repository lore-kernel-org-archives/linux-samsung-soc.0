From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 02/14] mfd/regulator: dt-bindings: max77686: Document
 of_compatible for regulator
Date: Mon, 3 Nov 2014 17:00:42 +0000
Message-ID: <20141103170042.GC12011@x1>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
 <1414668053-31370-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:64136 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752326AbaKCRAw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Nov 2014 12:00:52 -0500
Received: by mail-ie0-f178.google.com with SMTP id rp18so5708964iec.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2014 09:00:51 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1414668053-31370-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>

On Thu, 30 Oct 2014, Krzysztof Kozlowski wrote:

> Document new required property for regulator driver: of_compatible. T=
he
> property allows MFD core to bind the driver to node with regulators a=
nd
> this simplifies parsing regulators init data from DTS
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  Documentation/devicetree/bindings/mfd/max77686.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

I want a thumbs-up from Mark on this before applying.

> diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Doc=
umentation/devicetree/bindings/mfd/max77686.txt
> index 75fdfaf41831..f4010a9f66eb 100644
> --- a/Documentation/devicetree/bindings/mfd/max77686.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77686.txt
> @@ -18,8 +18,11 @@ Required properties:
> =20
>  Optional node:
>  - voltage-regulators : The regulators of max77686 have to be instant=
iated
> -  under subnode named "voltage-regulators" using the following forma=
t.
> +  under subnode named "voltage-regulators".
> +  Required property:
> +  - compatible : Must be "maxim,max77686-pmic"
> =20
> +  Optional properties: For each regulator use following format:
>  	regulator_name {
>  		regulator-compatible =3D LDOn/BUCKn
>  		standard regulator constraints....
> @@ -49,6 +52,8 @@ Example:
>  		reg =3D <0x09>;
> =20
>  		voltage-regulators {
> +			compatible =3D "maxim,max77686-pmic";
> +
>  			ldo11_reg {
>  				regulator-compatible =3D "LDO11";
>  				regulator-name =3D "vdd_ldo11";

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
