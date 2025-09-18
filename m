Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A321E1DF2;
	Thu, 18 Sep 2025 00:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758155971; cv=none; b=gpr6HIFWJYcRJNoXTDwDkCvjaBx652ACSw2IhkLl8rmjfjbGhkbq5c9Ou15IYkGejX0yLOxafFgb/YkV4XIS2T4E+RGmfXm4x3Cd//J8Z0asOzNILAWii6i9D3X2RO9ciNk2Uv8Ezyrmj5csRW5Y9xolqQOaezsH/rFNFhoTYqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758155971; c=relaxed/simple;
	bh=wCEJTBS5uIVfDBDzT/2Z5MMI5evfx/hh621pvrQxQLE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PMiSN7PrbmmiwkRo/pdMtVEFV4o7J7xotsxcs961Vaf/T9dAdwXxTp2ilx3tQeA5+g7cqK1BZJiDyeACIzX9eTviJNnOU81w8zAq9qPXIGrDgzl0TrTmeJHCX+7UbzSnd4cXsDIMF484JGZ88RPnQYcBqfA+ZJv37vq2afZnuEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqxK6uqJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqxK6uqJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F89DC4CEFB;
	Thu, 18 Sep 2025 00:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758155971;
	bh=wCEJTBS5uIVfDBDzT/2Z5MMI5evfx/hh621pvrQxQLE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FqxK6uqJmMN9Zg7D3ZQgs2RhF5MMCneizh7omKZrTu+TEjdVCS+LMexuWv9EWxJR4
	 xONha/Kvj3IB56BjvKOKSNdgBzM/fgovjQmPSfGV9hBtWNH/ObnoAhSoiXz6k9Mlgf
	 lIQo9zhf7CrsAnIY78jt8jtgJjsOYCBMEYdbtV9b0+86InRC902wYLMo+Nl9m/kWIr
	 TsGEVMNkdbFFtW/XJqhNKg1P5S1HSfW+MT0elZmUjy7DPbmGqNZv3hvROz7V2wv3ie
	 MYo0lkRJDLljjMFAI5a5MkwFBs5Z1PXG04Sg5QMGjKoM/39YmNQXdDq/FfDpYdU9bA
	 0nj8eHYVfSI3w==
Date: Wed, 17 Sep 2025 19:39:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: gwk1013@coasia.com, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, sboyd@kernel.org, 
 krzk+dt@kernel.org, s.nawrocki@samsung.com, shradha.t@samsung.com, 
 swathi.ks@samsung.com, kenkim@coasia.com, linux-kernel@vger.kernel.org, 
 lars.persson@axis.com, devicetree@vger.kernel.org, jspark@coasia.com, 
 cw00.choi@samsung.com, bread@coasia.com, ksk4725@coasia.com, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 krzk@kernel.org, mingyoungbo@coasia.com, limjh0823@coasia.com, 
 pjsin865@coasia.com, smn1196@coasia.com, lightwise@coasia.com, 
 alim.akhtar@samsung.com, hgkim05@coasia.com, mturquette@baylibre.com, 
 jesper.nilsson@axis.com
To: Ravi Patel <ravi.patel@samsung.com>
In-Reply-To: <20250917085005.89819-1-ravi.patel@samsung.com>
References: <CGME20250917085019epcas5p273ef86028a90e78ada55cde48a28a949@epcas5p2.samsung.com>
 <20250917085005.89819-1-ravi.patel@samsung.com>
Message-Id: <175815587241.3804330.15494043939076166560.robh@kernel.org>
Subject: Re: [PATCH 0/7] Add support for the Axis ARTPEC-9 SoC


On Wed, 17 Sep 2025 14:19:57 +0530, Ravi Patel wrote:
> Add basic support for the Axis ARTPEC-9 SoC which contains
> 6-core Cortex-A55 CPU and other several IPs. This SoC is an
> Axis-designed chipset used in surveillance camera products.
> 
> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> 
> This patch series includes below changes:
> - CMU (Clock Management Unit) driver and its bindings (patch #1 to #3)
> - PMU bindings (patch #4)
> - Basic Device Tree for ARTPEC-9 SoC and boards (patch #5 to #7)
> 
> The patch series has been tested on the ARTPEC-9 EVB with
> Linux Samsung SoC tree (for-next branch) and intended
> to be merged via the `arm-soc` tree.
> 
> NOTE: This patch series is dependent on following floating patches:
> 1. https://lore.kernel.org/all/20250917070004.87872-1-ravi.patel@samsung.com/T/#t
> 2. https://lore.kernel.org/all/20250917071342.5637-1-ravi.patel@samsung.com/T/#u
> 3. https://lore.kernel.org/all/20250917071311.1404-1-ravi.patel@samsung.com/T/#u
> 
> GyoungBo Min (3):
>   dt-bindings: clock: Add ARTPEC-9 clock controller
>   clk: samsung: Add clock PLL support for ARTPEC-9 SoC
>   clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC
> 
> Ravi Patel (2):
>   dt-bindings: arm: axis: Add ARTPEC-9 alfred board
>   arm64: dts: axis: Add ARTPEC-9 Alfred board support
> 
> SungMin Park (2):
>   dt-bindings: samsung: exynos-pmu: Add compatible for ARTPEC-9 SoC
>   arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support
> 
>  .../devicetree/bindings/arm/axis.yaml         |    6 +
>  .../bindings/clock/axis,artpec9-clock.yaml    |  232 ++++
>  .../bindings/soc/samsung/exynos-pmu.yaml      |    1 +
>  arch/arm64/boot/dts/exynos/axis/Makefile      |    3 +-
>  .../boot/dts/exynos/axis/artpec9-alfred.dts   |   36 +
>  .../boot/dts/exynos/axis/artpec9-pinctrl.dtsi |  115 ++
>  arch/arm64/boot/dts/exynos/axis/artpec9.dtsi  |  277 ++++
>  drivers/clk/samsung/Makefile                  |    1 +
>  drivers/clk/samsung/clk-artpec9.c             | 1224 +++++++++++++++++
>  drivers/clk/samsung/clk-pll.c                 |  184 ++-
>  drivers/clk/samsung/clk-pll.h                 |   17 +
>  include/dt-bindings/clock/axis,artpec9-clk.h  |  195 +++
>  12 files changed, 2282 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
>  create mode 100644 drivers/clk/samsung/clk-artpec9.c
>  create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h
> 
> --
> 2.17.1
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
 Base: tags/next-20250917 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250917085005.89819-1-ravi.patel@samsung.com:

arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: timer@10040000 (axis,artpec9-mct): compatible: 'oneOf' conditional failed, one must be fixed:
	['axis,artpec9-mct', 'samsung,exynos4210-mct'] is too long
	'axis,artpec9-mct' is not one of ['samsung,exynos4210-mct', 'samsung,exynos4412-mct']
	'axis,artpec9-mct' is not one of ['axis,artpec8-mct', 'google,gs101-mct', 'samsung,exynos2200-mct-peris', 'samsung,exynos3250-mct', 'samsung,exynos5250-mct', 'samsung,exynos5260-mct', 'samsung,exynos5420-mct', 'samsung,exynos5433-mct', 'samsung,exynos850-mct', 'samsung,exynos8895-mct', 'samsung,exynos990-mct', 'tesla,fsd-mct']
	from schema $id: http://devicetree.org/schemas/timer/samsung,exynos4210-mct.yaml#
arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: /soc/timer@10040000: failed to match any schema with compatible: ['axis,artpec9-mct', 'samsung,exynos4210-mct']
arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: /soc/pinctrl@141f0000: failed to match any schema with compatible: ['axis,artpec9-pinctrl']
arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: /soc/pinctrl@14430000: failed to match any schema with compatible: ['axis,artpec9-pinctrl']
arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: /soc/pinctrl@14c30000: failed to match any schema with compatible: ['axis,artpec9-pinctrl']
arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: serial@14c70000 (axis,artpec9-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['axis,artpec9-uart', 'samsung,exynos8895-uart'] is too long
	'axis,artpec9-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
	'axis,artpec9-uart' is not one of ['samsung,exynos2200-uart']
	'axis,artpec9-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
	'axis,artpec9-uart' is not one of ['samsung,exynos7885-uart']
	'axis,artpec9-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
	'axis,artpec9-uart' is not one of ['samsung,exynos7870-uart']
	'google,gs101-uart' was expected
	'samsung,exynos4210-uart' was expected
	'samsung,exynos5433-uart' was expected
	'samsung,exynos850-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: /soc/serial@14c70000: failed to match any schema with compatible: ['axis,artpec9-uart', 'samsung,exynos8895-uart']





