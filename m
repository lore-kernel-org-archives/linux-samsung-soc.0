Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F086A2DE211;
	Fri, 27 Jun 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033193; cv=none; b=itIip6SXlDTux3CJkflWYvUMsWdlmOn5XLU0Ue9DIvFxSCGRAFiPSE8Dtce1TMdMuwHt9TGPLvr+VOXLuTbUQ0lb7HtZjZWDiCCXU4KsLOrVc/j9jhrwjdg2mHzP39KI0LyTiEQBdDwwRSB9XUPUzpcMG1jhEb/fSKiIMXAZCo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033193; c=relaxed/simple;
	bh=cx3cfDqYfml9hV1dbrF3BBDdYHzNauZUQLohSd44LWI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RhRessquWG0Yun5AFotwVXQLs0m1RI5ocq780OwBUe77XTRmNqq9SgEX5bwdTrp90cLRvqjvWPzpXviBa4gpMBIxlwtRSgkAUZUZPWPNjiE2+p69yJ2/1ZJVybpwpUoQ6WwnDuooyGOcYxvMfXlvGV1f8QnYtZmnjRKY6QlfyGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLwD4NyA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLwD4NyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D0DC4CEED;
	Fri, 27 Jun 2025 14:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751033192;
	bh=cx3cfDqYfml9hV1dbrF3BBDdYHzNauZUQLohSd44LWI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eLwD4NyAv3OzHJZbC3TUTa9zbjGqUYr0wrSJ+Tz/zfIYnIhUNr6bpoWgADe+Q5ZZi
	 DBBgztSpx3jYcQl9m0cUhMhB4be1aLgSYnortrqAS1rH++fKo8+bhlC5LySlZ9GsXt
	 /WdozpPW85WUFjD26uWFt4J5m7IPe9qCjGN1MG79HYauafibsM1EFX4fkytxQEOUdy
	 myFZaDqyVQwEfGFE2PzH+SIICzk9C9W7gAFMxtwv9idi0VyiOVaOSCz4Bo6Tv73iET
	 H3xFuQv9yP35IuZxFDmtvR1x02xNcpfd4EcuOEW7MOmzK/x0LsXIP/VjZ9H9qSUni/
	 j+hBeg+iFzE7g==
Date: Fri, 27 Jun 2025 09:06:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
Message-Id: <175103315202.3220613.9523717145992109827.robh@kernel.org>
Subject: Re: [PATCH v2 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)


On Fri, 27 Jun 2025 01:43:23 +0530, Kaustabh Chakraborty wrote:
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
> exynosdrm-decon            - https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org
> exynos7870-mipi-phy        A https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
> exynos7870-mipi-phy-fix    - https://lore.kernel.org/r/20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org
> exynos7870-dsim            - https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org
> panel-samsung-s6e8aa5x01   - https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org
> panel-synaptics-tddi       - https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
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
>       dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode
>       arm64: dts: exynos7870: add DSI support
>       arm64: dts: exynos7870-on7xelte: enable display panel support
>       arm64: dts: exynos7870-a2corelte: enable display panel support
>       arm64: dts: exynos7870-j6lte: enable display panel support
> 
>  .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
>  .../soc/samsung/samsung,exynos-sysreg.yaml         |  2 +
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 52 +++++++++----
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 49 ++++++++----
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 51 ++++++++----
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 90 ++++++++++++++++++++++
>  6 files changed, 206 insertions(+), 39 deletions(-)
> ---
> base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
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
 Base: using specified base-commit 1b152eeca84a02bdb648f16b82ef3394007a9dcf

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org:

arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4300-panel']
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4101-panel']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['samsung,s6e8aa5x01']
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#





