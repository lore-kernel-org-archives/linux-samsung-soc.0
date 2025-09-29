Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1781FF7BC;
	Mon, 29 Sep 2025 02:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759112057; cv=none; b=qcIKHb1UQrnRJKIN8NNtgCIHbqCuG7wzPdXy3PiPyuRl/jn47og5tWA0uwk1JnfisRqfLqFwy+LTNQK+gh3874sG1mWF6N2MNziqWVW6chGC/QFm1/REW4DjnHay6n8sSq6/DfOt2k5Nz0QZHKbQTiNA5lKOUrn6Y07KY8kBcSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759112057; c=relaxed/simple;
	bh=G5w/Gi7/SywoEXrdoaNmBLuZNS13bH4Gh3+sacTDOqU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GuJFacqNcoGIOCpelkcaLAglsiljwyf3nBu/rxb/PCHEsdKmjUOXme7Zau1znUEECL6I/ACs0/ytjPGBzUl2yjeIykwOir7Sj2bz6hnxqZ137f4XCbniS7WLxpiIMOk2SuepAsJN3yhqP0N+X2if4ZdgOoEqr5Hq7QDjqb/CIrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7QZgRO9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7QZgRO9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F43C4CEF0;
	Mon, 29 Sep 2025 02:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759112057;
	bh=G5w/Gi7/SywoEXrdoaNmBLuZNS13bH4Gh3+sacTDOqU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=H7QZgRO9jlFpt/b7/QIxRVfffjqoQ28juW/5XEHB6ytdiHMLchCAaBfJvadIyH+Es
	 UzblBJQRUQtn3ZB19UHXCCytA1SErbAHerieNMlCdY4A0dwLbUpiLg8PsCYWV+OGYU
	 456TBVc8PlMe+Zjk+AClajsA0TXETgUbhZy3QMNdxx+rd2rc1nEFHP3F4Ujha8LLxh
	 MuX70wXlVtgwMcH5/DyEZym9Xc2Zm2g5RVMW1uhoD1E8rPQc62DMNskkhd4cAj1up1
	 iS0TeLsKMmfhbj0pgRbGulvdM3JROc1h5H/osUnOv/M4GfFDMasvheK96mlCP4oN/5
	 YccAtXFJbSRjA==
Date: Sun, 28 Sep 2025 21:14:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
Message-Id: <175911189634.2556697.2474466935066391775.robh@kernel.org>
Subject: Re: [PATCH v3 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)


On Sun, 28 Sep 2025 23:26:34 +0530, Kaustabh Chakraborty wrote:
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
> exynos-sysmmu-resv-regions A https://lore.kernel.org/r/20250712-exynos-sysmmu-resv-regions-v1-1-e79681fcab1a@disroot.org
> exynos7870-mipi-phy        A https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
> exynos7870-mipi-phy-fix    A https://lore.kernel.org/r/20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org
> exynos7870-dsim            A https://lore.kernel.org/r/20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org
> exynosdrm-decon            A https://lore.kernel.org/r/20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org
> panel-samsung-s6e8aa5x01   A https://lore.kernel.org/r/20250721-panel-samsung-s6e8aa5x01-v5-0-1a315aba530b@disroot.org
> panel-synaptics-tddi       - https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v3:
> - fixed minor issues with devicetree in regards to compliance
> - added memory-region to framebuffer region for decon device
> - added related patchset to list: exynos-sysmmu-resv-regions
> - replaced exynos7870-pmu with exynos7-pmu compatible to the list
>   allowing a MIPI PHY subnode (krzk)
> - updated compatible string and dt node for j6lte's panel
> - reorder properties: ${x}, followed by ${x}-names (krzk)
> - Link to v2: https://lore.kernel.org/r/20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org
> 
> Changes in v2:
> - modified compatible hierarchy to use non-deprecated syntax (krzk)
> - fixed subject prefixes of [v1 2/5], [v1 3/5], [v1 4/5], [v1 5/5] (krzk)
> - removed simplefb nodes instead of disabling it (krzk)
> - added dt-bindings patch to allow mipi-phy node under PMU
> - changed clock names of dsim node
> - Link to v1: https://lore.kernel.org/r/20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org
> 
> ---
> Kaustabh Chakraborty (6):
>       dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
>       dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7 PMU
>       arm64: dts: exynos7870: add DSI support
>       arm64: dts: exynos7870-on7xelte: enable display panel support
>       arm64: dts: exynos7870-a2corelte: enable display panel support
>       arm64: dts: exynos7870-j6lte: enable display panel support
> 
>  .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
>  .../soc/samsung/samsung,exynos-sysreg.yaml         |  2 +
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 57 +++++++++++----
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 38 ++++++----
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 57 +++++++++++----
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 84 ++++++++++++++++++++++
>  6 files changed, 197 insertions(+), 42 deletions(-)
> ---
> base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
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
 Base: using specified base-commit 262858079afde6d367ce3db183c74d8a43a0e83f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org:

arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4300-panel']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4101-panel']





