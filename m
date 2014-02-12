From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 11/14] regulator: s2mps11: Add opmode for S2MPS14
 regulators
Date: Wed, 12 Feb 2014 09:21:08 +0000
Message-ID: <20140212092108.GT15081@lee--X1>
References: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
 <1392123837-5517-12-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:36134 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751164AbaBLJVR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 04:21:17 -0500
Received: by mail-ee0-f50.google.com with SMTP id d17so4256164eek.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2014 01:21:16 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1392123837-5517-12-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>

> S2MPS11/S2MPS14 regulators support different modes of operation:
>  - Always off;
>  - On/Off controlled by pin/GPIO (PWREN/LDOEN/EMMCEN);
>  - Always on;
> This is very similar to S5M8767 regulator driver which also supports
> opmodes (although S5M8767 have also low-power mode).
>=20
> This patch adds parsing the operation mode from DTS by reading a
> "op_mode" property from regulator child node.
>=20
> The op_mode is then used for enabling the S2MPS14 regulators.
> On S2MPS11 the DTS "op_mode" property is parsed but not used for
> enabling, as this was not tested.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> ---
>  drivers/regulator/s2mps11.c         |   98 +++++++++++++++++++++++++=
+++++++++-
>  include/linux/mfd/samsung/s2mps14.h |   17 ++++++
>  2 files changed, 114 insertions(+), 1 deletion(-)

<snip>

> diff --git a/include/linux/mfd/samsung/s2mps14.h b/include/linux/mfd/=
samsung/s2mps14.h
> index c4bfb8edc836..69582ae4c971 100644
> --- a/include/linux/mfd/samsung/s2mps14.h
> +++ b/include/linux/mfd/samsung/s2mps14.h
> @@ -149,4 +149,21 @@ enum s2mps14_regulators {
>  #define S2MPS14_LDO_N_VOLTAGES	(S2MPS14_LDO_VSEL_MASK + 1)
>  #define S2MPS14_BUCK_N_VOLTAGES (S2MPS14_BUCK_VSEL_MASK + 1)
> =20
> +#define S2MPS14_ENCTRL_SHIFT		6
> +#define S2MPS14_ENCTRL_MASK		(0x3 << S2MPS14_ENCTRL_SHIFT)
> +
> +/*
> + * Values of regulator operation modes match device tree bindings.
> + */
> +enum s2mps14_regulator_opmode {
> +	S2MPS14_REGULATOR_OPMODE_OFF		=3D 0,
> +	S2MPS14_REGULATOR_OPMODE_ON		=3D 1,
> +	/* Reserved for compatibility with S5M8767 where this
> +	 * is a low power mode. */

Sorry to be an arse, but can you use proper multi-line comments
please?

The preferred style for long (multi-line) comments is:

        /*
         * This is the preferred style for multi-line
         * comments in the Linux kernel source code.
         * Please use it consistently.
         *
         * Description:  A column of asterisks on the left side,
         * with beginning and ending almost-blank lines.
         */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
