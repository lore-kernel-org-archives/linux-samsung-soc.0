From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 4/5] ARM: dts: add pinctrl support to Exynos5410
Date: Tue, 02 Jun 2015 21:59:09 +0900
Message-ID: <556DA89D.5010104@samsung.com>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de> <1426456834-6308-5-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:35462 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759032AbbFBM7P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 08:59:15 -0400
In-Reply-To: <1426456834-6308-5-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

W dniu 16.03.2015 o 07:00, Andreas F=C3=A4rber pisze:
> From: Hakjoo Kim <ruppi.kim@hardkernel.com>
>=20
> Add the required pin configuration support to Exynos5410 using pinctr=
l
> interface.
>=20
> Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
> [AF: Rebased, style changes]
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v2 -> v3:
>  * Added wake-up IRQ controller node (Tomasz Figa)
> =20
>  v1 -> v2:
>  * Filled in Sob from Hakjoo Kim
> =20
>  arch/arm/boot/dts/exynos5410-pinctrl.dtsi | 406 ++++++++++++++++++++=
++++++++++
>  arch/arm/boot/dts/exynos5410.dtsi         |  36 +++
>  2 files changed, 442 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5410-pinctrl.dtsi

Changes look fine:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
