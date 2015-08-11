From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/4] mfd: max77686: Use a generic name for the PMIC
 node in the example
Date: Tue, 11 Aug 2015 12:48:40 +0100
Message-ID: <20150811114840.GC18282@x1>
References: <1438252327-28427-1-git-send-email-javier@osg.samsung.com>
 <1438252327-28427-3-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:38905 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933981AbbHKLsq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Aug 2015 07:48:46 -0400
Received: by wicja10 with SMTP id ja10so65297148wic.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Aug 2015 04:48:45 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1438252327-28427-3-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org

On Thu, 30 Jul 2015, Javier Martinez Canillas wrote:

> The ePAPR standard says that: "the name of a node should be somewhat
> generic, reflecting the function of the device and not its precise
> programming model."
>=20
> So, change the max77686 binding document example to use a generic
> node name instead of using the chip's name.
>=20
> Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20
> ---
>=20
> Changes in v3:
>  - Fix typo in ePAPR document name. Suggested by Sergei Shtylyov
>=20
> Changes in v2: None
>=20
>  Documentation/devicetree/bindings/mfd/max77686.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Doc=
umentation/devicetree/bindings/mfd/max77686.txt
> index 8221102d3fc2..d2ed3c20a5c3 100644
> --- a/Documentation/devicetree/bindings/mfd/max77686.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77686.txt
> @@ -48,7 +48,7 @@ to get matched with their hardware counterparts as =
follow:
> =20
>  Example:
> =20
> -	max77686@09 {
> +	max77686: pmic@09 {
>  		compatible =3D "maxim,max77686";
>  		interrupt-parent =3D <&wakeup_eint>;
>  		interrupts =3D <26 0>;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
