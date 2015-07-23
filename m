From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: add Device Tree binding doc for
 max77686 regulator
Date: Thu, 23 Jul 2015 14:48:00 +0100
Message-ID: <20150723134800.GD3436@x1>
References: <1437121078-26409-1-git-send-email-javier@osg.samsung.com>
 <1437121078-26409-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:36725 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752613AbbGWNsG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jul 2015 09:48:06 -0400
Received: by wicgb10 with SMTP id gb10so144010978wic.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2015 06:48:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1437121078-26409-2-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org

On Fri, 17 Jul 2015, Javier Martinez Canillas wrote:

> The Device Tree binding documentation for the Maxim max77686 regulato=
rs
> has been moved from the Multi-Function Device DT binding section to i=
ts
> own Documentation/devicetree/bindings/regulator/max77686.txt file.
>=20
> Use a wilcard so both the mfd and regulator DT bindings are resolved.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>=20
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2af741410533..d802d19a4ecc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6583,7 +6583,7 @@ F:	drivers/extcon/extcon-max77693.c
>  F:	drivers/rtc/rtc-max77686.c
>  F:	drivers/clk/clk-max77686.c
>  F:	Documentation/devicetree/bindings/mfd/max14577.txt
> -F:	Documentation/devicetree/bindings/mfd/max77686.txt
> +F:	Documentation/devicetree/bindings/*/max77686.txt
>  F:	Documentation/devicetree/bindings/mfd/max77693.txt
>  F:	Documentation/devicetree/bindings/clock/maxim,max77686.txt
>  F:	include/linux/mfd/max14577*.h

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
