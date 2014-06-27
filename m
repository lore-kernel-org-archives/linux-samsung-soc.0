From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH V3 0/7] drm/exynos: Support DP CLKCON register in FIMD
 driver
Date: Fri, 27 Jun 2014 19:24:58 +0900
Message-ID: <53AD467A.1030005@samsung.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30756 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753189AbaF0KZQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 06:25:16 -0400
In-reply-to: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, cpgs@samsung.com


+ DT mailing list


On 2014=EB=85=84 06=EC=9B=94 27=EC=9D=BC 19:12, Ajay Kumar wrote:
> This series is based on exynos-drm-next branch of Inki Dae's tree at:
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>=20
> Changes since V2:
> 	Add DT property to know the type of FIMD output interface
> 	as per Inki's suggestion.
> 	Add samsung,output-type DT property in FIMD node for all boards
> 	supporting DP interface.
>=20
> Ajay Kumar (7):
>   [PATCH V3 1/7] drm/exynos: Support DP CLKCON register in FIMD drive=
r
>   [PATCH V3 2/7] ARM: dts: Add FIMD output property for snow
>   [PATCH V3 3/7] ARM: dts: Add FIMD output property for peach_pit
>   [PATCH V3 4/7] ARM: dts: Add FIMD output property for peach_pi
>   [PATCH V3 5/7] ARM: dts: Add FIMD output property for smdk5250
>   [PATCH V3 6/7] ARM: dts: Add FIMD output property for smdk5420
>   [PATCH V3 7/7] ARM: dts: Add FIMD output property for arndale
>=20
>  .../devicetree/bindings/video/samsung-fimd.txt     |    1 +
>  arch/arm/boot/dts/exynos5250-arndale.dts           |    1 +
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |    1 +
>  arch/arm/boot/dts/exynos5250-snow.dts              |    1 +
>  arch/arm/boot/dts/exynos5420-peach-pit.dts         |    1 +
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |    1 +
>  arch/arm/boot/dts/exynos5800-peach-pi.dts          |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   23 ++++++++++=
++++++++++
>  include/video/samsung_fimd.h                       |    4 ++++
>  9 files changed, 34 insertions(+)
>=20
