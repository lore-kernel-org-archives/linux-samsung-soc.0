Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0141C2DECC5;
	Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759150; cv=none; b=oZnZRINd+NjYO5rgD/xRWo5KvIaIDdpaSAw1N8qLt1sEzgqixYiNoHw7kW2LJOHOZ3RfIAZVkpt9YVxOKMCeFgfa4r9yahGAWkE6SVTSRWqbxBaPOlKVzSJmql9YohB0AUWjwJlPHtM/p+eTbAafToSpc/FdE2rZZf5/oPo2CL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759150; c=relaxed/simple;
	bh=sLxW/2gM/xqjmwMF98veHA/94KEa5ynyyYmqAzwLAQk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Dn2LwSlF6XYY+JiLGCEEkcMk67IgnPWqCz/4sCZNXnWUNUFb/YEUXMvpP1OXwBO0CAWaEjj1X3OwNRb2ItYobTmpveBlWFQOjerr6ts2beZQ9MuxrPM/6fpDqjnwOB9QmFuW0wgxc7ktKTUV4UtYo4BJRfaWi/caa+VHVpsZqoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xt0LIvRF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xt0LIvRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7DBC4CEED;
	Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759149;
	bh=sLxW/2gM/xqjmwMF98veHA/94KEa5ynyyYmqAzwLAQk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Xt0LIvRFtNEdszKSMxfx0SHkf4CXLdrEB8u0VRJPpGTd5cqGqlzku5M3Qm1bPm4B/
	 POaxPoE6fOGMo2iKzgOJkYrdJCSQlS/zCmHK37UAZj/5ob+oquaXRjIXAvxgUsC4I3
	 L6nbpjlL4FKMIhTYg0pYm4KJSNrzrX5lz6ZwlLJfwZwddwIhS8QFe5lOn8jVwAW6vt
	 4Xn1TqmV4LccpdsaRQ9xHa9Go/BXQzunnGrHV+WSsPv7JSfv3almt4rky4y1cxjS4y
	 A15oJVNrVzKdF9W5pmA704lE21yKGaFignM+cYUGscM8A3GHiuNAYcWoMMzvITNLSx
	 234fWPDag6aag==
Date: Thu, 12 Jun 2025 15:12:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
Message-Id: <174975871931.2916531.8899085865861205227.robh@kernel.org>
Subject: Re: [PATCH 0/5] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)


On Thu, 12 Jun 2025 20:53:36 +0530, Kaustabh Chakraborty wrote:
> Exynos7870 has a IP subsystem in its architecture dedicated to display
> management. Notably, this block includes the Display Enhancement
> Controller (DECON), and the DSI Master (DSIM).
> 
> The following series and its sub-series implement all components for a
> functioning display pipeline. All vital information which helped shaping
> up the patches have been retrieved from Exynos7870 vendor kernel sources
> as provided by Samsung.
> 
> Testing has been done on all three devices available upstream, i.e.
> Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2 Core
> (samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte). Regrettably,
> I've only been able to test the functionality on video mode, as none of
> the devices have panels working in command mode.
> 
> This series implements changes in the SoC subsystem, which includes
> devicetree additions. It depends on all sub-series listed below:
> (Legend: [R]eviewed, [A]ccepted)
> 
> exynosdrm-decon            - https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org
> exynos7870-mipi-phy        - https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
> exynos7870-dsim            - https://lore.kernel.org/r/20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org
> panel-samsung-s6e8aa5x01   - https://lore.kernel.org/r/20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org
> panel-synaptics-tddi       - https://lore.kernel.org/r/20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Kaustabh Chakraborty (5):
>       dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
>       arch: arm64: dts: exynos7870: add DSI support
>       arch: arm64: dts: exynos7870-on7xelte: enable display panel support
>       arch: arm64: dts: exynos7870-a2corelte: enable display panel support
>       arch: arm64: dts: exynos7870-j6lte: enable display panel support
> 
>  .../soc/samsung/samsung,exynos-sysreg.yaml         |  6 ++
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 41 ++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 38 +++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 40 +++++++++
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 94 ++++++++++++++++++++++
>  5 files changed, 219 insertions(+)
> ---
> base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
> change-id: 20250523-exynos7870-drm-dts-87ccab731ba9
> 
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
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
 Base: using specified base-commit 0bb71d301869446810a0b13d3da290bd455d7c78

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org:

arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: False schema does not allow {'compatible': ['samsung,exynos7870-mipi-video-phy'], '#phy-cells': 1, 'samsung,disp-sysreg': [[12]], 'samsung,cam-sysreg': [13], 'phandle': 73}
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam-sysreg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam0-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam1-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy:compatible:0: 'samsung,exynos7870-mipi-video-phy' is not one of ['samsung,s5pv210-mipi-video-phy', 'samsung,exynos5420-mipi-video-phy', 'samsung,exynos5433-mipi-video-phy']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: Unevaluated properties are not allowed ('compatible', 'samsung,cam-sysreg' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/system-controller@10480000/mipi-phy: failed to match any schema with compatible: ['samsung,exynos7870-mipi-video-phy']
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4300-panel']
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: False schema does not allow {'compatible': ['samsung,exynos7870-mipi-video-phy'], '#phy-cells': 1, 'samsung,disp-sysreg': [[12]], 'samsung,cam-sysreg': [13], 'phandle': 73}
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam-sysreg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam0-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam1-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy:compatible:0: 'samsung,exynos7870-mipi-video-phy' is not one of ['samsung,s5pv210-mipi-video-phy', 'samsung,exynos5420-mipi-video-phy', 'samsung,exynos5433-mipi-video-phy']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: Unevaluated properties are not allowed ('compatible', 'samsung,cam-sysreg' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/system-controller@10480000/mipi-phy: failed to match any schema with compatible: ['samsung,exynos7870-mipi-video-phy']
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: False schema does not allow {'compatible': ['samsung,exynos7870-mipi-video-phy'], '#phy-cells': 1, 'samsung,disp-sysreg': [[12]], 'samsung,cam-sysreg': [13], 'phandle': 72}
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam-sysreg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam0-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam1-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy:compatible:0: 'samsung,exynos7870-mipi-video-phy' is not one of ['samsung,s5pv210-mipi-video-phy', 'samsung,exynos5420-mipi-video-phy', 'samsung,exynos5433-mipi-video-phy']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: Unevaluated properties are not allowed ('compatible', 'samsung,cam-sysreg' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/system-controller@10480000/mipi-phy: failed to match any schema with compatible: ['samsung,exynos7870-mipi-video-phy']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4101-panel']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['samsung,s6e8aa5x01']
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#





