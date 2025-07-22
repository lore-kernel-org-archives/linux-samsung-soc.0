Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B77821E097;
	Tue, 22 Jul 2025 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201085; cv=none; b=gdpbT1qHZ2hP9F5G8LnK3zzMlN/aw43nlnkSdCg0K626Jt8qGdNolYVa2fBtq3y6unHUQmUmlyPXHRLrpB9uZyebrX5WIgL/RjEwsGeTkVLqpKISmg2dXgPIscSZn9VBnQ80nMU3FWIoLZX0FwK1uKOn2OkU/jeCMReGCAXCz1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201085; c=relaxed/simple;
	bh=tnZrFOICevwVVJIGMe/h+0P6SJ8O/8++cdi/KC8dVs4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kDMHlWynlZCbCSWgyE7U3bmjY8j1UTXIun22qDa2JXuvi+VcwZwsWA2YBoNEoGqY2d14m222nlEAIg0VPyjdb/Mn4Y7YkQtRvZasDM+v2PrgL96V4CLUNwAOlOZhmn2NLNG0i1Ucg704/W+kZez3OyRdNLstADrY8CzCzlSQPyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5Bh81Fx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5Bh81Fx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4A2C4CEEB;
	Tue, 22 Jul 2025 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753201085;
	bh=tnZrFOICevwVVJIGMe/h+0P6SJ8O/8++cdi/KC8dVs4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l5Bh81FxDrcKyzhziyB92CyxEVV8o9GU5Kl6lg307si42yb5RiQekx9Gtxesmx8cf
	 EJ1ds4cV152rMtWFdH5H15bqeqAqp238vpY45d4XU5dxAoyVXHtERw5fbT/VmShsCH
	 IwsxR7OMO5Sxf0x9NVO1KTyfJxEjs1NpVtrp+uljDdMuIgoky9thyCz+2EBcn8Ms3b
	 lqQ3BhNsFAno7XBV1I5OVNdJAQ5oWlsjDBS0vbSzAfnuOQpnj7btp38NhpYD4tjNYc
	 H7TG0gfI4tXz3Lg/FkHYoD/d2/dls47h3sbGIsi4pN4wzEeEqCWv+/xpTbOfL3QiXC
	 OgveN/acljeww==
Date: Tue, 22 Jul 2025 11:18:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <175320094956.3955121.12851363012982327262.robh@kernel.org>
Subject: Re: [PATCH v1 0/4] arm64: dts: exynos2200: introduce serial
 busses, except spi


On Tue, 22 Jul 2025 15:23:46 +0300, Ivaylo Ivanov wrote:
> Hey, folks!
> 
> Before anything, this patchset only has binding dependencies, without
> which it will have undocumented compatibles. They are the following:
> 
> [1] - https://lore.kernel.org/all/20250722120859.443283-1-ivo.ivanov.ivanov1@gmail.com/
> [2] - https://lore.kernel.org/all/20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com/
> [3] - https://lore.kernel.org/all/20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com/
> 
> This patchset adds serial busses, implemented in usi, as well as serial_0
> and serial_1 for exynos2200. It's missing spi, due to me having troubles
> with reads when testing.
> 
> Best regards,
> Ivaylo
> 
> Ivaylo Ivanov (4):
>   arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
>   arm64: dts: exynos2200: increase peric1 and cmgp syscon sizes
>   arm64: dts: exynos2200: add serial_0/1 nodes
>   arm64: dts: exynos2200: define all usi nodes
> 
>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1391 ++++++++++++++++-
>  2 files changed, 1390 insertions(+), 3 deletions(-)
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250722 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com:

arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105000c0 (samsung,exynos2200-usi): i2c@10500000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105000c0 (samsung,exynos2200-usi): serial@10500000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105000c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105000c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105000c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@105000c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@10500000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@105000c0/i2c@10500000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@10500000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@105000c0/serial@10500000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105100c0 (samsung,exynos2200-usi): i2c@10510000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105100c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105100c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105100c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@105100c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@10510000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@105100c0/i2c@10510000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@10840000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/serial@10840000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109000c0 (samsung,exynos2200-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109000c0 (samsung,exynos2200-usi): serial@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109000c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109000c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109000c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109000c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@10900000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@10900000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109000c0/serial@10900000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109100c0 (samsung,exynos2200-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109100c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109100c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109100c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109100c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@10910000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109200c0 (samsung,exynos2200-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109200c0 (samsung,exynos2200-usi): serial@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109200c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109200c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109200c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109200c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@10920000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@10920000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109200c0/serial@10920000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109300c0 (samsung,exynos2200-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109300c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109300c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109300c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109300c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@10930000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109400c0 (samsung,exynos2200-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109400c0 (samsung,exynos2200-usi): serial@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109400c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109400c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109400c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109400c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@10940000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@10940000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109400c0/serial@10940000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109500c0 (samsung,exynos2200-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109500c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109500c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109500c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109500c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@10950000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109600c0 (samsung,exynos2200-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109600c0 (samsung,exynos2200-usi): serial@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109600c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109600c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109600c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109600c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@10960000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@10960000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109600c0/serial@10960000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109700c0 (samsung,exynos2200-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109700c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109700c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109700c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109700c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@10970000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@11c40000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/serial@11c40000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d000c0 (samsung,exynos2200-usi): i2c@11d00000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d000c0 (samsung,exynos2200-usi): serial@11d00000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d000c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d000c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d000c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d000c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11d00000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d000c0/i2c@11d00000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@11d00000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d000c0/serial@11d00000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d100c0 (samsung,exynos2200-usi): i2c@11d10000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d100c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d100c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d100c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d100c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11d10000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d100c0/i2c@11d10000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d200c0 (samsung,exynos2200-usi): i2c@11d20000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d200c0 (samsung,exynos2200-usi): serial@11d20000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d200c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d200c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d200c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d200c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11d20000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d200c0/i2c@11d20000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@11d20000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d200c0/serial@11d20000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d300c0 (samsung,exynos2200-usi): i2c@11d30000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d300c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d300c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d300c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d300c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11d30000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d300c0/i2c@11d30000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d400c0 (samsung,exynos2200-usi): i2c@11d40000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d400c0 (samsung,exynos2200-usi): serial@11d40000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d400c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d400c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d400c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d400c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11d40000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d400c0/i2c@11d40000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@11d40000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d400c0/serial@11d40000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d500c0 (samsung,exynos2200-usi): i2c@11d50000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d500c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d500c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d500c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d500c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11d50000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d500c0/i2c@11d50000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d600c0 (samsung,exynos2200-usi): i2c@11d60000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d600c0 (samsung,exynos2200-usi): serial@11d60000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d600c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d600c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d600c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d600c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11d60000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d600c0/i2c@11d60000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@11d60000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d600c0/serial@11d60000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d700c0 (samsung,exynos2200-usi): i2c@11d70000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d700c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d700c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d700c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d700c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11d70000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d700c0/i2c@11d70000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d800c0 (samsung,exynos2200-usi): i2c@11d80000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d800c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d800c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d800c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d800c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11d80000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d800c0/i2c@11d80000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d900c0 (samsung,exynos2200-usi): i2c@11d90000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d900c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d900c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d900c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d900c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11d90000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11d900c0/i2c@11d90000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11da00c0 (samsung,exynos2200-usi): i2c@11da0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11da00c0 (samsung,exynos2200-usi): serial@11da0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11da00c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11da00c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11da00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11da00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11da0000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11da00c0/i2c@11da0000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@11da0000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11da00c0/serial@11da0000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11db00c0 (samsung,exynos2200-usi): i2c@11db0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11db00c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11db00c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11db00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11db00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11db0000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11db00c0/i2c@11db0000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11dd00c0 (samsung,exynos2200-usi): i2c@11dd0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11dd00c0 (samsung,exynos2200-usi): serial@11dd0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11dd00c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11dd00c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11dd00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11dd00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11dd0000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11dd00c0/i2c@11dd0000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@11dd0000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11dd00c0/serial@11dd0000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11de00c0 (samsung,exynos2200-usi): i2c@11de0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11de00c0 (samsung,exynos2200-usi): serial@11de0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11de00c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11de00c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11de00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11de00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@11de0000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11de00c0/i2c@11de0000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@11de0000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@11de00c0/serial@11de0000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f000c0 (samsung,exynos2200-usi): i2c@14f00000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f000c0 (samsung,exynos2200-usi): serial@14f00000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f000c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f000c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f000c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f000c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14f00000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f000c0/i2c@14f00000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@14f00000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f000c0/serial@14f00000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f100c0 (samsung,exynos2200-usi): i2c@14f10000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f100c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f100c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f100c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f100c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14f10000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f100c0/i2c@14f10000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f200c0 (samsung,exynos2200-usi): i2c@14f20000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f200c0 (samsung,exynos2200-usi): serial@14f20000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f200c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f200c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f200c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f200c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14f20000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f200c0/i2c@14f20000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@14f20000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f200c0/serial@14f20000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f300c0 (samsung,exynos2200-usi): i2c@14f30000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f300c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f300c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f300c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f300c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14f30000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f300c0/i2c@14f30000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f400c0 (samsung,exynos2200-usi): i2c@14f40000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f400c0 (samsung,exynos2200-usi): serial@14f40000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f400c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f400c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f400c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f400c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14f40000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f400c0/i2c@14f40000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@14f40000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f400c0/serial@14f40000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f500c0 (samsung,exynos2200-usi): i2c@14f50000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f500c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f500c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f500c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f500c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14f50000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f500c0/i2c@14f50000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f600c0 (samsung,exynos2200-usi): i2c@14f60000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f600c0 (samsung,exynos2200-usi): serial@14f60000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f600c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f600c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f600c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f600c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14f60000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f600c0/i2c@14f60000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@14f60000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f600c0/serial@14f60000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f700c0 (samsung,exynos2200-usi): i2c@14f70000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f700c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f700c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f700c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f700c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14f70000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f700c0/i2c@14f70000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f800c0 (samsung,exynos2200-usi): i2c@14f80000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f800c0 (samsung,exynos2200-usi): serial@14f80000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f800c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f800c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f800c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f800c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14f80000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f800c0/i2c@14f80000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@14f80000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f800c0/serial@14f80000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f900c0 (samsung,exynos2200-usi): i2c@14f90000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f900c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f900c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f900c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f900c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14f90000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14f900c0/i2c@14f90000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fa00c0 (samsung,exynos2200-usi): i2c@14fa0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fa00c0 (samsung,exynos2200-usi): serial@14fa0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fa00c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fa00c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fa00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fa00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14fa0000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fa00c0/i2c@14fa0000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@14fa0000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fa00c0/serial@14fa0000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fb00c0 (samsung,exynos2200-usi): i2c@14fb0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fb00c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fb00c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fb00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fb00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14fb0000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fb00c0/i2c@14fb0000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fc00c0 (samsung,exynos2200-usi): i2c@14fc0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fc00c0 (samsung,exynos2200-usi): serial@14fc0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fc00c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fc00c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fc00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fc00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14fc0000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fc00c0/i2c@14fc0000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: serial@14fc0000 (samsung,exynos2200-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-uart', 'google,gs101-uart'] is too long
	'samsung,exynos2200-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7885-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'samsung,exynos2200-uart' is not one of ['samsung,exynos7870-uart']
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	'samsung,exynos8895-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fc00c0/serial@14fc0000: failed to match any schema with compatible: ['samsung,exynos2200-uart', 'google,gs101-uart']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fd00c0 (samsung,exynos2200-usi): i2c@14fd0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fd00c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fd00c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fd00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fd00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14fd0000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fd00c0/i2c@14fd0000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fe00c0 (samsung,exynos2200-usi): i2c@14fe0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fe00c0 (samsung,exynos2200-usi): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fe00c0 (samsung,exynos2200-usi): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fe00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fe00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: i2c@14fe0000 (samsung,exynos2200-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos2200-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usi@14fe00c0/i2c@14fe0000: failed to match any schema with compatible: ['samsung,exynos2200-hsi2c', 'samsung,exynosautov9-hsi2c']





