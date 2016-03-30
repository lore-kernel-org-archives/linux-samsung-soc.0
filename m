From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: exynos: Add timer node for exynos5420
Date: Wed, 30 Mar 2016 14:17:55 +0900
Message-ID: <56FB6183.8030701@samsung.com>
References: <cover.1459167385.git.bugs.a.b@free.fr>
 <9c3c2a79cbaabd460131270e8a422bfa787b923a.1459167385.git.bugs.a.b@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37505 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751958AbcC3FSA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Mar 2016 01:18:00 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O4U00MED6PWZD60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Mar 2016 14:17:56 +0900 (KST)
In-reply-to: <9c3c2a79cbaabd460131270e8a422bfa787b923a.1459167385.git.bugs.a.b@free.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Adel Belhouane <bugs.a.b@free.fr>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org

Hi Adel,

On 2016=EB=85=84 03=EC=9B=94 28=EC=9D=BC 23:08, Adel Belhouane wrote:
> This patch adds timer node for exynos542x/5800.
> Generic Timer Architecture is needed by KVM.
>=20
> Signed-off-by: Adel Belhouane <bugs.a.b@free.fr>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/ex=
ynos5420.dtsi
> index 48a0a55314f5..4663006d15ab 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -1140,6 +1140,16 @@
>  		power-domains =3D <&disp_pd>;
>  		#iommu-cells =3D <0>;
>  	};
> +
> +	timer {
> +		compatible =3D "arm,cortex-a15-timer",
> +			     "arm,armv7-timer";
> +		interrupts =3D <1 13 0xf08>,
> +			     <1 14 0xf08>,
> +			     <1 11 0xf08>,
> +			     <1 10 0xf08>;
> +		clock-frequency =3D <24000000>;
> +	};
>  };
> =20
>  &dp {
>=20

Did you test this arch_timer after deleting the MCT Device Tree node fr=
om dts file?

As I knew, the generic arch time uses same H/W with MCT device in Exyno=
s SoC.
So, If we remove the MCT device-tree node from dts, the arch timer is n=
ot working.
Just, I tested it on Exynos3250 SoC.

Best Regards,
Chanwoo Choi
