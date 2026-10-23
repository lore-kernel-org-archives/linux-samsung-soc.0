Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749679;
	b=RZUsvz2E8leiXR67Evg3KSVCgaPa0Tpff4n/LGt3bA+IUIASaG7zXo2tU9+TZHTvOFbW
	 83+KVS2aTKdN/9oBgA1MuNEmXvXYW7s2ELM6RtZ623GKKVOwguj0116zveGS2ebTOepv6
	 xKioX42UskB2DhMifwgtkjWKoP3WcLztZfjFr60LhjTg0+ZjNLn3bCW+Vhp1n6ygJ3HdY
	 u8gexh1g+g6ZqBerqul/9mIjZRnxipwkciSlVhPyFc5G+MPlK4CJCyXXdZQX4efzVC8Gj
	 5SQ/3fOPhelg85CgaFFZbDtKydOzTpiJxIjNVuQIZTOLNsOAU8XpswYI1p1u9XKGkRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749679;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=M0s3SFlMeOGNR0VjX2ZhF+zTIKdV5x/45iKV7UcMLG0=;
	b=5UCx7F7/7HrCuLvNnkKuDKnaKm0kgRwq/Mj6CM/hb9M5yttgSlDfdcDQ5jyuW8vp6yNz
	 S8sxRg+lN1GTkjSmGa+FVkjVOGMULeRIcIdwYOwx6DNUBWsEsHDc7LhqgPsEsNqbHWd0B
	 KiyNRIOizq6L2qqjHJbqRGHEo4mEcHg3OmKtNBDICK2PkLDBnZxqN0R/qSVaXFXt1bTE6
	 gRrpjyyPUjTd6sUeADabgAtkHeSWUhsKmt4CHphUUDmIxHWMTbD7mQKsKjUPzslZGpEZ8
	 3Mmc6bhYIs2nHlDlDDbAvtpRMczNGraXnZh2dQKk8BrNVj7xVqQvZvqgfcGIBSEHtyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grimler.se;
	spf=pass smtp.mailfrom=grimler.se;
	dkim=pass header.d=grimler.se header.i=@grimler.se header.a=rsa-sha256 header.s=key1 header.b=l1z0FiUo;
	arc=none smtp.remote-ip=95.215.58.197
Received: from mta1.migadu.com (out-197.mta1.migadu.com [95.215.58.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F412B606A31A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2026 10:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F412B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=grimler.se header.i=@grimler.se header.a=rsa-sha256 header.s=key1 header.b=l1z0FiUo
X-Envelope-To: linux-samsung-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Sl832lwWv9q0+uztm4xFM++41k7qXCoKfbSb4C6WYFM=;
 c=simple/simple; d=grimler.se;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792749675; v=1; x=1793354475;
 b=l1z0FiUo0EzYZ5/WiXjcU/n8db2gMYv3Qs5CzXmz7x4paclekKYJAoHmd7N4F4YdsfRr8B1d
 C+8jrLNs7HRHRWIIuKmawALtuA8BNR7m2CP731aCH6I5o1ILx0mUWcuzPLOLgA7Xw/sm7uL5RlO
 frNihZP4Fv0p8gCGuz2/Vhhg=
X-Envelope-To: linux-samsung-soc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 6fe652901f52c9d0;
	Fri, 23 Oct 2026 10:01:15 +0000
X-Mizu-Trace-ID: 6fe652901f52c9d0
X-Migadu-Flow: FLOW_OUT
Date: Fri, 23 Oct 2026 12:01:10 +0200
From: Henrik Grimler <henrik@grimler.se>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Message-ID: <20261023100110.GA24541@localhost>
References: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
 <20261022055208.17746-3-pepe.schlehofer@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022055208.17746-3-pepe.schlehofer@gmail.com>

Hi Josef,

On Thu, Oct 22, 2026 at 07:52:08AM +0200, Josef Schlehofer wrote:
> ODROID-U2 is a single board computer from Hardkernel based on the
> Samsung Exynos4412 Prime SoC with 2 GB of LPDDR2 RAM. It is the
> predecessor of the ODROID-U3 and shares most of its design:
> - microSD card slot and eMMC module socket
> - SMSC LAN9730 10/100 Ethernet on HSIC0
> - SMSC USB3503A hub on HSIC1 with two USB 2.0 host ports
> - micro-HDMI port with CEC
> - MAX98090 audio codec with a 3.5 mm headphone jack and an on-board
>   digital microphone
> - MAX77686 PMIC
> - 2-pin header for an optional PWM controlled cooling fan
> - blue heartbeat LED
> 
> Unlike the ODROID-U3, the micro-USB port has no VBUS supply switch, so
> it can only work in peripheral mode, and there is no expansion header
> with SPI. The 3.5 mm jack is headphone only and the speaker outputs of
> the codec are not connected.
> 
> Add a device tree for the board that includes the ODROID-U3 one and
> describes only these differences, as the ODROID-X2 does with the
> ODROID-X, and update the comments in the common dtsi, as the LDO22 and
> BUCK8 constraints are now also used by the ODROID-U2.
> 
> Also route "HiFi Capture" to "Mixer DAI RX", as on the ODROID-XU3. The
> odroid sound card driver adds only the playback routes for boards with
> a single CPU DAI, so without it the DPCM capture path to the I2S
> back-end is incomplete and recording from the digital microphone fails
> with "no backend DAIs enabled for Primary".
> 
> Link: https://www.hardkernel.com/shop/odroid-u2/
> Link: https://www.hardkernel.com/blog-2/odroid-u2-u-schematics/
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
> ---
>  arch/arm/boot/dts/samsung/Makefile            |  1 +
>  .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
>  .../boot/dts/samsung/exynos4412-odroidu2.dts  | 42 +++++++++++++++++++
>  3 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
> 
> diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
> index e0143ee8c82d..2a173e4b3e1a 100644
> --- a/arch/arm/boot/dts/samsung/Makefile
> +++ b/arch/arm/boot/dts/samsung/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
>  	exynos4412-i9305.dtb \
>  	exynos4412-itop-elite.dtb \
>  	exynos4412-n710x.dtb \
> +	exynos4412-odroidu2.dtb \
>  	exynos4412-odroidu3.dtb \
>  	exynos4412-odroidx.dtb \
>  	exynos4412-odroidx2.dtb \
> diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
> index 93ddbd4b0a18..b56b92c78c1d 100644
> --- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
> @@ -414,8 +414,8 @@ ldo21_reg: LDO21 {
>  
>  			ldo22_reg: LDO22 {
>  				/*
> -				 * Only U3 uses it, so let it define the
> -				 * constraints
> +				 * Only U2 and U3 use it, so let them define
> +				 * the constraints
>  				 */
>  				regulator-name = "LDO22";
>  				regulator-boot-on;
> @@ -486,7 +486,7 @@ buck7_reg: BUCK7 {
>  			buck8_reg: BUCK8 {
>  				/*
>  				 * Constraints set by specific board: X,
> -				 * X2 and U3.
> +				 * X2, U2 and U3.
>  				 */
>  				regulator-name = "BUCK8_2.8V";
>  			};
> diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
> new file mode 100644
> index 000000000000..bc14df9be9f7
> --- /dev/null
> +++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hardkernel's Exynos4412 based ODROID-U2 board device tree source
> + *
> + * Copyright (c) 2026 Josef Schlehofer <pepe.schlehofer@gmail.com>
> + *
> + * Device tree source file for Hardkernel's ODROID-U2 board which is based
> + * on Samsung's Exynos4412 SoC. The board is the predecessor of the
> + * ODROID-U3, so only the differences from it are described here.
> + */
> +
> +#include "exynos4412-odroidu3.dts"
> +
> +/ {
> +	model = "Hardkernel ODROID-U2 board based on Exynos4412";
> +	compatible = "hardkernel,odroid-u2", "samsung,exynos4412", "samsung,exynos4";
> +};
> +
> +/* No VBUS supply switch on the micro-USB port */
> +/delete-node/ &vbus_otg_reg;
> +
> +&hsotg {
> +	dr_mode = "peripheral";
> +	/delete-property/ vbus-supply;
> +};
> +
> +&sound {
> +	model = "Odroid-U2";
> +	audio-routing = "Headphone Jack", "HPL",
> +			"Headphone Jack", "HPR",
> +			"DMICL", "DMIC",
> +			"DMICR", "DMIC",
> +			"Mixer DAI RX", "HiFi Capture";
> +	samsung,audio-widgets =
> +		"Headphone", "Headphone Jack",
> +		"Microphone", "DMIC";

Should be no need for newline after = for
samsung,audio-widgets. Writing it as:

	samsung,audio-widgets = "Headphone", "Headphone Jack",
				"Microphone", "DMIC";

gives max width of 62 wide chars. With that fixed:

Reviewed-by: Henrik Grimler <henrik@grimler.se>

Best regards,
Henrik Grimler

> +};
> +
> +/* No expansion header with SPI */
> +&spi_1 {
> +	status = "disabled";
> +};
> -- 
> 2.54.0 (Apple Git-157)
> 
