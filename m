From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] Documentation: devicetree: Fix s2mps11 and s5m8767
 typos
Date: Mon, 23 Jun 2014 09:15:26 +0100
Message-ID: <20140623081526.GA8847@lee--X1>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
 <1403486483-4063-2-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:46100 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722AbaFWIPd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 04:15:33 -0400
Received: by mail-ig0-f180.google.com with SMTP id h18so2673938igc.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 01:15:33 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1403486483-4063-2-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Mon, 23 Jun 2014, Andreas F=C3=A4rber wrote:

> It's LDO2, not LD02.
>=20
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt                 | =
2 +-
>  Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt | =
2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mps11.txt
> index d81ba30..55ab4f4 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -81,7 +81,7 @@ as per the datasheet of s2mps11.
>  		  - valid values for n are:
>  			- S2MPS11: 1 to 38
>  			- S2MPS14: 1 to 25
> -		  - Example: LDO1, LD02, LDO28
> +		  - Example: LDO1, LDO2, LDO28
>  	- BUCKn
>  		  - valid values for n are:
>  			- S2MPS11: 1 to 10
> diff --git a/Documentation/devicetree/bindings/regulator/s5m8767-regu=
lator.txt b/Documentation/devicetree/bindings/regulator/s5m8767-regulat=
or.txt
> index d290988..2019131 100644
> --- a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.t=
xt
> +++ b/Documentation/devicetree/bindings/regulator/s5m8767-regulator.t=
xt
> @@ -86,7 +86,7 @@ as per the datasheet of s5m8767.
> =20
>  	- LDOn
>  		  - valid values for n are 1 to 28
> -		  - Example: LDO1, LD02, LDO28
> +		  - Example: LDO1, LDO2, LDO28
>  	- BUCKn
>  		  - valid values for n are 1 to 9.
>  		  - Example: BUCK1, BUCK2, BUCK9

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
