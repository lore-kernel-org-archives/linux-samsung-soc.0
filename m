From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] MAINTAINERS: add an entry for the Maxim MAX77802
 PMIC drivers
Date: Thu, 23 Jul 2015 15:45:06 +0100
Message-ID: <20150723144506.GE3436@x1>
References: <1437121078-26409-1-git-send-email-javier@osg.samsung.com>
 <1437121078-26409-3-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:37477 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753330AbbGWOpL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jul 2015 10:45:11 -0400
Received: by wibud3 with SMTP id ud3so222660492wib.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2015 07:45:10 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1437121078-26409-3-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org

On Fri, 17 Jul 2015, Javier Martinez Canillas wrote:

> I added support for the max77802 drivers and have been maintaining th=
em.
> So add an entry for these drivers to make tools like get_maintainer.p=
l
> to work and make people submitting patches add me to the CC list.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20
> ---
>=20
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index d802d19a4ecc..5d964568f207 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6570,6 +6570,14 @@ S:	Supported
>  F:	drivers/power/max14577_charger.c
>  F:	drivers/power/max77693_charger.c
> =20
> +MAXIM MAX77802 MULTIFUNCTION PMIC DEVICE DRIVERS
> +M:	Javier Martinez Canillas <javier@osg.samsung.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Supported
> +F:	drivers/*/*max77802.c
> +F:	Documentation/devicetree/bindings/*/*max77802.txt
> +F:	include/dt-bindings/*/*max77802.h
> +
>  MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
>  M:	Chanwoo Choi <cw00.choi@samsung.com>
>  M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
