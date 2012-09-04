From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/2] ARM: Exynos4-DT: Enable pinctrl driver support
Date: Wed, 05 Sep 2012 06:58:41 +0900
Message-ID: <226f01cd8ae8$7236eb60$56a4c220$%kim@samsung.com>
References: <1345721098-32459-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36915 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757696Ab2IDV6n convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 17:58:43 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9U00491IDTK930@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Sep 2012 06:58:41 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9U000DTIDTWQ30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Sep 2012 06:58:41 +0900 (KST)
In-reply-to: <1345721098-32459-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, patches@linaro.org

Thomas Abraham wrote:
>=20
> This patch series enables support for pin controller driver for Exyno=
s4210
> SoC
> based device tree enabled platforms. The first patch in this series a=
dds
> the
> pin group nodes for each of the three pin controller instances, but i=
t is
> not
> a exhaustive list of all possible pin group nodes. As the coverage of
> pinctrl
> driver is extended device drivers used on Exynos4210 platforms, addit=
ional
> pin group nodes can be added as required.
>=20
> Thomas Abraham (2):
>   ARM: dts: Add pinctrl node entries for Samsung Exynos4210 SoC
>   ARM: EXYNOS: Enable pinctrl driver support for Exynos4 device tree
> enabled platform
>=20
>  arch/arm/boot/dts/exynos4210-pinctrl.dtsi |  457
> +++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210.dtsi         |   37 +++
>  arch/arm/mach-exynos/Kconfig              |    2 +
>  3 files changed, 496 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos4210-pinctrl.dt=B3=C4

Looks good to me, will apply this series with Linus Walleij's ack.

Note, this will be applied on top of v4 pinctrl driver will be submitte=
d by
Thomas.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
