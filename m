From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v3] Documentation: devicetree: Fix tps65090 typos in example
Date: Fri, 1 Aug 2014 01:51:13 +0200
Message-ID: <CABxcv==gNo84M7uFK04MiJp=Wn-n3uS4xH3QzxMNoKuOirH0VQ@mail.gmail.com>
References: <1406755767-5910-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:46670 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751759AbaGaXvP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 19:51:15 -0400
Received: by mail-wg0-f45.google.com with SMTP id x12so3422866wgg.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jul 2014 16:51:13 -0700 (PDT)
In-Reply-To: <1406755767-5910-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, open list <linux-kernel@vger.kernel.org>

Hello Andreas,

On Wed, Jul 30, 2014 at 11:29 PM, Andreas F=C3=A4rber <afaerber@suse.de=
> wrote:
> Specification and existing device trees use vsys-l{1,2}-supply,
> not vsys_l{1,2}-supply. Fix the example to match the specification.
>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Fixes: 21d2202158e9 ("mfd: tps65090: add DT support for tps65090")
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v2 -> v3:
>  * Added Fixes header
>  * + regulator and mfd maintainers
>
>  v1 -> v2:
>  * More verbose commit message (requested by Mark Rutland)
>
>  Documentation/devicetree/bindings/regulator/tps65090.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/regulator/tps65090.txt=
 b/Documentation/devicetree/bindings/regulator/tps65090.txt
> index 340980239ea9..ca69f5e3040c 100644
> --- a/Documentation/devicetree/bindings/regulator/tps65090.txt
> +++ b/Documentation/devicetree/bindings/regulator/tps65090.txt
> @@ -45,8 +45,8 @@ Example:
>                 infet5-supply =3D <&some_reg>;
>                 infet6-supply =3D <&some_reg>;
>                 infet7-supply =3D <&some_reg>;
> -               vsys_l1-supply =3D <&some_reg>;
> -               vsys_l2-supply =3D <&some_reg>;
> +               vsys-l1-supply =3D <&some_reg>;
> +               vsys-l2-supply =3D <&some_reg>;
>

True, these also matches the .supply_name used when registering the
LDO[1-2] regulators in the tps65090 driver. So clearly the example was
wrong while the property specification is correct.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
