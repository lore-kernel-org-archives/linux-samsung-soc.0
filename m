From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v3 4/4] ARM: dts: Enable EC vboot context support on Peach
 boards
Date: Thu, 08 Oct 2015 07:31:05 +0900
Message-ID: <56159D29.3090801@kernel.org>
References: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk> <1442842703-5309-5-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:58509 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751275AbbJGWbN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Oct 2015 18:31:13 -0400
In-Reply-To: <1442842703-5309-5-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?RW1pbGlvIEzDs3Bleg==?= <emilio.lopez@collabora.co.uk>
Cc: gregkh@linuxfoundation.org, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux@roeck-us.net, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 09/21/15 22:38, Emilio L=C3=B3pez wrote:
> The Peach boards use the EC to store the vboot context information,
> so add the corresponding properties on the EC node to indicate so.
>=20
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Acked-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>
> ---
>=20
> Changes from v1:
>  - none
>=20
> Changes from v2:
>  - collect tags from Krzysztof & Javier
>=20
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 1 +
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/bo=
ot/dts/exynos5420-peach-pit.dts
> index 8f4d76c..ac02fb4 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -935,6 +935,7 @@
>  		pinctrl-0 =3D <&ec_spi_cs &ec_irq>;
>  		reg =3D <0>;
>  		spi-max-frequency =3D <3125000>;
> +		google,has-vbc-nvram;
> =20
>  		controller-data {
>  			samsung,spi-feedback-delay =3D <1>;
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boo=
t/dts/exynos5800-peach-pi.dts
> index 7d5b386..b60dec0 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -898,6 +898,7 @@
>  		pinctrl-0 =3D <&ec_spi_cs &ec_irq>;
>  		reg =3D <0>;
>  		spi-max-frequency =3D <3125000>;
> +		google,has-vbc-nvram;
> =20
>  		controller-data {
>  			samsung,spi-feedback-delay =3D <1>;

Applied, thanks.

- Kukjin
