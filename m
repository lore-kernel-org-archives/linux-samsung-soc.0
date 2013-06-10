From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: Enable RTC by default on Exynos5440
Date: Mon, 10 Jun 2013 17:04:29 +0900
Message-ID: <0e9901ce65b1$2203bc50$660b34f0$%kim@samsung.com>
References: <00b201ce63f0$e96033e0$bc209ba0$%nam@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:41897 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752072Ab3FJIEc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Jun 2013 04:04:32 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO6005UR3REUMG0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Jun 2013 17:04:30 +0900 (KST)
In-reply-to: <00b201ce63f0$e96033e0$bc209ba0$%nam@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ks_c_5601-1987?B?J7Oyv7W5zic=?= <youngmin.nam@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

=B3=B2=BF=B5=B9=CE wrote:
>=20
> This patch enables RTC on Exynos5440 by default.
>=20
> RTC is a basic feature of Exynos5440.
> But it was disabled by issue that comes from Exynos5250.
> (commit id: 522ccdb6fd0e9689fbdc005ce95a42d70ec81629)
> That issue only applies to Exynos5250 not Exynos5440. So, there is
> no issue with enabled RTC on Exynos5440.
> This change was tested on Exynos5440.
>=20
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5440.dtsi |    1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi
> b/arch/arm/boot/dts/exynos5440.dtsi
> index f6b1c89..93e9028 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi
> @@ -214,6 +214,5 @@
>  		interrupts =3D <0 17 0>, <0 16 0>;
>  		clocks =3D <&clock 21>;
>  		clock-names =3D "rtc";
> -		status =3D "disabled";
>  	};
>  };
> --
> 1.7.10.4

Looks OK to me, applied.

Thanks.

- Kukjin
