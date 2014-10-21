From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/4] mfd/regulator: dt-bindings: max77686: Document
 regulators off in suspend
Date: Tue, 21 Oct 2014 14:40:58 +0100
Message-ID: <20141021134058.GE4939@x1>
References: <1413897595-28752-1-git-send-email-k.kozlowski@samsung.com>
 <1413897595-28752-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:53169 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932631AbaJUNlH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Oct 2014 09:41:07 -0400
Received: by mail-ie0-f174.google.com with SMTP id x19so618213ier.33
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2014 06:41:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1413897595-28752-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>

On Tue, 21 Oct 2014, Krzysztof Kozlowski wrote:

> Add information which regulators can be disabled during system suspen=
d.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Suggested-by: Javier Martinez Canillas <javier.martinez@collabora.co.=
uk>
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.u=
k>
> ---
>  Documentation/devicetree/bindings/mfd/max77686.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

This has been applied already.

> diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Doc=
umentation/devicetree/bindings/mfd/max77686.txt
> index 678f3cf0b8f0..75fdfaf41831 100644
> --- a/Documentation/devicetree/bindings/mfd/max77686.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77686.txt
> @@ -34,6 +34,11 @@ to get matched with their hardware counterparts as=
 follow:
>  	-BUCKn 	:	for BUCKs, where n can lie in range 1 to 9.
>  			example: BUCK1, BUCK5, BUCK9.
> =20
> +  Regulators which can be turned off during system suspend:
> +	-LDOn	:	2, 6-8, 10-12, 14-16,
> +	-BUCKn	:	1-4.
> +  Use standard regulator bindings for it ('regulator-off-in-suspend'=
).
> +
>  Example:
> =20
>  	max77686@09 {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
