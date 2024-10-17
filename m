Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15981DF26A;
	Thu, 17 Oct 2024 16:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729182375; cv=none; b=ijkwY9CmsUA55X73x1eg/dZGlcqD5lYup/ZHpkNI+aBhGXV3EOdePocnMymhPhnbxcabobwyepHZiwAemcVyLEapemVhQjnxpwMsfyEUv9gXB0tsHrFMnK/egSZ6u/EHiIOrytKi017VImbzTPvCwRuiJvvIYXFYzRnN2eKM8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729182375; c=relaxed/simple;
	bh=VF8QIqn/4pfgrEstD6So2AH/mIP2xJc5DvAFvI3mGVQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Aberpgl8h5di6yHfoem/mlGNVU+SdqFdAqX7IsOA8lLz+2CqRl+K/+CPLfkASIgB0Y/qpyUyNKBmg72R5B9P34vKTlXK0rkQuf2+D7s4bG/5tXNDemHvQGDsF62whRpFq0XoqcrZj9BQPYq55+96IiNGgI0nG6YviZ5+Kj5/EdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/BEC4bJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/BEC4bJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100BDC4CEC3;
	Thu, 17 Oct 2024 16:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182374;
	bh=VF8QIqn/4pfgrEstD6So2AH/mIP2xJc5DvAFvI3mGVQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=V/BEC4bJH+gE5MtiIZwnnBpdmieE69ZEbTaebfVUjhOOIGkuCS2Dbqnvuu0/j4eXg
	 pFC3CDq9Z94l7pFvoDFlD7Xw7kD0oZvIdbbC7bobiE8Af6tqfmPHf7gDpxgHR5nbrN
	 XhTuo157DEwAlSJkNqZ3jZq8PjEAi7+L/dYf9QHC5Q7nTeFfNe2VkLqNjgGBwD88yz
	 a9ONgY6fFUKKSjQCBdIOST9Wm+czbzU5hHn6cWquF0p6ostRXRukHGdZxrA5D6GmnN
	 wY1Fx2E3ybeS2DyHQkqQGLd1/OrhyCg1y0fxUKGICSaFkmsdqU09j7IVyYq3miaAP1
	 goXJqvQxkO8oQ==
Date: Thu, 17 Oct 2024 11:26:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20241016154747.64343-1-igor.belwon@mentallysanemainliners.org>
References: <20241016154747.64343-1-igor.belwon@mentallysanemainliners.org>
Message-Id: <172917870796.3589876.17005849369898378683.robh@kernel.org>
Subject: Re: [PATCH v3 0/6] Add minimal Exynos990 SoC and SM-N981B support


On Wed, 16 Oct 2024 17:47:41 +0200, Igor Belwon wrote:
> Hi folks,
> 
> This series adds initial support for the Exynos 990 SoC and also
> initial board support for the Samsung Galaxy Note20 5G (SM-N981B)
> codenamed c1s.
> 
> The Exynos 990 SoC is also used in the S20 series, as well as in the
> Note 20 Ultra phones. Currently the device trees added are for the
> Exynos 990 SoC and c1s. The device tree has been tested with
> dtbs_check W=1 and results in no warnings.
> 
> This initial bringup consists of:
>  * cpus
>  * pinctrl
>  * gpio-keys
>  * simple-framebuffer
> 
> This is enough to reach a shell in an initramfs. More platform support
> will be added in the future.
> 
> The preferred way to boot the upstream kernel is by using a shim
> bootloader, called uniLoader [1], which works around some issues with
> the stock, non-replacable Samsung S-LK bootloader. For example, the
> stock bootloader leaves the decon trigger control unset, which causes
> the framebuffer not to refresh.
> 
> Device functionality depends on the 2nd patch series:
> "Add Exynos990 pinctrl and chipid drivers"
> 
> [1] https://github.com/ivoszbg/uniLoader
> 
> Changes in v3:
>  - Move pinctrl DT nodes from the 2nd patch series
>  - Resend patches to the correct lists.
> 
> Changes in v2:
>  - Added acked-by tag by Rob Herring
>  - Fixed two stray newlines in SoC and device DTs
>  - Fixed commit message for the c1s device tree
>  - Changed osc-clock to clock-osc and ordered nodes in SoC DT
>  - Fixed ordering in the gic node in SoC DT
>  - Fixed memory node unit address
>  - Fixed memory node reg properties, to map all available RAM
>  - Moved pinctrl binding commits to the 2nd patch series.
> 
> Kind regards,
> Igor
> 
> Igor Belwon (6):
>   dt-bindings: arm: cpus: Add Samsung Mongoose M5
>   dt-bindings: hwinfo: exynos-chipid: Add compatible for Exynos 990
>     chipid
>   dt-bindings: arm: samsung: samsung-boards: Add bindings for Exynos 990
>     boards
>   soc: samsung: exynos-chipid: Add support for Exynos 990 chipid
>   arm64: dts: exynos: Add initial support for the Exynos 990 SoC
>   arm64: dts: exynos: Add initial support for Samsung Galaxy Note20 5G
>     (c1s)
> 
>  .../devicetree/bindings/arm/cpus.yaml         |    1 +
>  .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
>  .../hwinfo/samsung,exynos-chipid.yaml         |    1 +
>  arch/arm64/boot/dts/exynos/Makefile           |    1 +
>  arch/arm64/boot/dts/exynos/exynos990-c1s.dts  |  115 +
>  .../boot/dts/exynos/exynos990-pinctrl.dtsi    | 2195 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos990.dtsi     |  251 ++
>  drivers/soc/samsung/exynos-chipid.c           |    1 +
>  8 files changed, 2571 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-c1s.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990.dtsi
> 
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y exynos/exynos990-c1s.dtb' for 20241016154747.64343-1-igor.belwon@mentallysanemainliners.org:

arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@10430000: failed to match any schema with compatible: ['samsung,exynos990-pinctrl']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@10730000: failed to match any schema with compatible: ['samsung,exynos990-pinctrl']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@13040000: failed to match any schema with compatible: ['samsung,exynos990-pinctrl']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@13c30000: failed to match any schema with compatible: ['samsung,exynos990-pinctrl']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@15580000: failed to match any schema with compatible: ['samsung,exynos990-pinctrl']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@15850000: failed to match any schema with compatible: ['samsung,exynos990-pinctrl']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: wakeup-interrupt-controller: compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-wakeup-eint', 'samsung,exynos850-wakeup-eint', 'samsung,exynos7-wakeup-eint'] is too long
	'samsung,exynos990-wakeup-eint' is not one of ['samsung,s3c2410-wakeup-eint', 'samsung,s3c2412-wakeup-eint', 'samsung,s3c64xx-wakeup-eint', 'samsung,s5pv210-wakeup-eint', 'samsung,exynos4210-wakeup-eint', 'samsung,exynos7-wakeup-eint', 'samsung,exynosautov920-wakeup-eint']
	'samsung,exynos990-wakeup-eint' is not one of ['samsung,exynos5433-wakeup-eint', 'samsung,exynos7885-wakeup-eint', 'samsung,exynos850-wakeup-eint', 'samsung,exynos8895-wakeup-eint']
	'samsung,exynos990-wakeup-eint' is not one of ['google,gs101-wakeup-eint', 'samsung,exynosautov9-wakeup-eint']
	'samsung,exynos7-wakeup-eint' was expected
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@15850000/wakeup-interrupt-controller: failed to match any schema with compatible: ['samsung,exynos990-wakeup-eint', 'samsung,exynos850-wakeup-eint', 'samsung,exynos7-wakeup-eint']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@15c30000: failed to match any schema with compatible: ['samsung,exynos990-pinctrl']





