From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/4] Documentation: bindings: mfd: cros ec: document
 vbc EC property
Date: Wed, 23 Sep 2015 01:34:01 +0100
Message-ID: <20150923003401.GB16510@x1>
References: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1442842703-5309-3-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:33497 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759696AbbIWAeE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Sep 2015 20:34:04 -0400
Received: by pacex6 with SMTP id ex6so23717100pac.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2015 17:34:03 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1442842703-5309-3-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio.lopez@collabora.co.uk>
Cc: gregkh@linuxfoundation.org, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux@roeck-us.net, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Mon, 21 Sep 2015, Emilio L=C3=B3pez wrote:

> Some EC implementations include a small nvram space used to store
> verified boot context data. This boolean property lets us indicate
> whether this space is available or not on a specific EC implementatio=
n.
>=20
> Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>
> ---
>=20
> Patch is new in v3, split from 3/4
>=20
>  Documentation/devicetree/bindings/mfd/cros-ec.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Docu=
mentation/devicetree/bindings/mfd/cros-ec.txt
> index 1777916..136e0c2 100644
> --- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
> +++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
> @@ -34,6 +34,10 @@ Required properties (LPC):
>  - compatible: "google,cros-ec-lpc"
>  - reg: List of (IO address, size) pairs defining the interface uses
> =20
> +Optional properties (all):
> +- google,has-vbc-nvram: Some implementations of the EC include a sma=
ll
> +  nvram space used to store verified boot context data. This boolean=
 flag
> +  is used to specify whether this nvram is present or not.

Is there no way to check for this at runtime?

>  Example for I2C:
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
