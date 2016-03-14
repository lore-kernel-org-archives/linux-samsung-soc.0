From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 06/10] ARM: dts: exynos3250-artik5: Add MSHC0 dt node for
 eMMC device
Date: Mon, 14 Mar 2016 11:10:49 +0900
Message-ID: <56E61DA9.1030105@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-8-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39604 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932172AbcCNCKw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Mar 2016 22:10:52 -0400
In-reply-to: <1457921056-21257-8-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: k.kozlowski@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Dear all,

It is my mistake. Please ignore only this patch.
This patch is duplicate with patch[1].

[1] [PATCH 06/10] ARM: dts: Add MSHC0 dt node for eMMC device for exyno=
s3250-artik5 module

Best Regards,
Chanwoo Choi

On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 11:04, Chanwoo Choi wrote:
> From: Jaehoon Chung <jh80.chung@samsung.com>
>=20
> This patch adds MSHC (Mobile Storage Host Controller) dt node for Exy=
nos3250
> SoC. MSHC is an interface between the system and the eMMC device.
>=20
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot=
/dts/exynos3250-artik5.dtsi
> index 97d0087efb9f..75b291c10cdc 100644
> --- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
> @@ -277,6 +277,25 @@
>  	};
>  };
> =20
> +&mshc_0 {
> +	num-slots =3D <1>;
> +	broken-cd;
> +	non-removable;
> +	cap-mmc-highspeed;
> +	desc-num =3D <4>;
> +	card-detect-delay =3D <200>;
> +	vmmc-supply =3D <&ldo11_reg>;
> +	clock-frequency =3D <100000000>;
> +	clock-freq-min-max =3D <400000 100000000>;
> +	samsung,dw-mshc-ciu-div =3D <1>;
> +	samsung,dw-mshc-sdr-timing =3D <0 1>;
> +	samsung,dw-mshc-ddr-timing =3D <1 2>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
> +	bus-width =3D <8>;
> +	status =3D "okay";
> +};
> +
>  &xusbxti {
>  	clock-frequency =3D <24000000>;
>  };
>=20
