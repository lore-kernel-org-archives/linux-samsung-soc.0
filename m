From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: add binding for clock-controller of
 s3c2443 and following
Date: Mon, 09 Dec 2013 18:03:51 +0100
Message-ID: <6031022.c4eBMggiUt@amdc1227>
References: <201312031619.58062.heiko@sntech.de>
 <201312031623.10187.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:31126 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755798Ab3LIREE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 12:04:04 -0500
In-reply-to: <201312031623.10187.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org

Hi Heiko,

On Tuesday 03 of December 2013 16:23:09 Heiko St=FCbner wrote:
> Starting with the s3c2443 the s3c24xx series got a new clock tree
> compared to the previous s3c24xx socs. This binding describes the
> clock controller found in the s3c2443, s3c2416 and s3c2450 socs.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../bindings/clock/samsung,s3c2443-clock.txt       |   46 ++++++++++=
++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,s=
3c2443-clock.txt
>=20
> diff --git a/Documentation/devicetree/bindings/clock/samsung,s3c2443-=
clock.txt b/Documentation/devicetree/bindings/clock/samsung,s3c2443-clo=
ck.txt
> new file mode 100644
> index 0000000..a3eb4ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,s3c2443-clock.t=
xt
> @@ -0,0 +1,46 @@
> +* Samsung S3C2443 Clock Controller
> +
> +The S3C2443 clock controller generates and supplies clock to various=
 controllers
> +within the SoC. The clock binding described here is applicable to al=
l SoCs in
> +the s3c24x family starting with the s3c2443.
> +
> +Required Properties:
> +
> +- compatible: should be one of the following.
> +  - "samsung,s3c2416-clock" - controller compatible with S3C2416 SoC=
=2E
> +  - "samsung,s3c2443-clock" - controller compatible with S3C2443 SoC=
=2E
> +  - "samsung,s3c2450-clock" - controller compatible with S3C2450 SoC=
=2E
> +- reg: physical base address of the controller and length of memory =
mapped
> +  region.
> +- #clock-cells: should be 1.
> +
> +Each clock is assigned an identifier and client nodes can use this i=
dentifier
> +to specify the clock which they consume. Some of the clocks are avai=
lable only
> +on a particular SoC.
> +
> +All available clocks are defined as preprocessor macros in
> +dt-bindings/clock/samsung,s3c2443-clock.h header and can be used in =
device
> +tree sources.

I believe this driver needs some external clocks to be defined as fixed
rate clocks using generic bindings. It should be noted what clocks are
needed here in the documentation.

Otherwise the patch looks fine.

Best regards,
Tomasz
