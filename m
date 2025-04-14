Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC591A2380;
	Mon, 14 Apr 2025 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634553; cv=none; b=jFQpt1sYRY5qA/uJULxM5o9Bci+8htpJPpQbJAnYrU6Nz+g0GT+iNZnm5Wec0ibixUkg20UUh2Wp+VLGNw6mrOV82jzsDuTclOXRwrLoWgVFf0Ry1SzQ4FXUozeyN4iY3+utX6VppzR4rXr+LGmWhHXIlKlw4U/cNP+eWCqGydA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634553; c=relaxed/simple;
	bh=o09OELAddsi8bCdV3+5IJmIdA4i1w0bEWAJwIwGctBk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iBVVE2eqIb4XQZ/m4SW6qUGxUkuCzGOlg81R8Wa1fMLiZmp5HuTsrzR7exyGnG1URFDBsWuJV/ntXDWYxJjS7WG0zjliQirAAHbJUfSpOdWI7rigklwu72TMVxghJjmqKXH2SOQjCkb6EQGI2HMgb+3NP3FiHfJvQpRcWbN+rzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufMWvOO5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufMWvOO5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24450C4CEE9;
	Mon, 14 Apr 2025 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744634551;
	bh=o09OELAddsi8bCdV3+5IJmIdA4i1w0bEWAJwIwGctBk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ufMWvOO54+JWbV2ME33aWUd0siSmj/zBYCbvPgoW/Fw1vAbRUoROWRAsmmD+pbH1q
	 p6rS1yawyJ3TtwBPkIfhrH8e2nJSyhJgl/FKyur/zK8aqJm06EfMGxaHSunpjOe3J7
	 aexYqDLN0zNkt3PPZx2N+FoPH7ysRlhdUE6dtgDU5aB08RXrsGKwSpBnwdnDRHuYsA
	 RfRT4m9dbb2/3h0nJvYudqPI5Z4XSE3ziX3yf6pJM1rr2zRnKhyrp8pwa6MUY4c4Gm
	 vPL0GYEF/j4VgvQfhnNLCnHMYSi66CyUkDhgld+AOGBqn2iQ4EV9TJyyC4odCHAWHE
	 4+nlwJqjmnsHQ==
Date: Mon, 14 Apr 2025 07:42:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Tony Luck <tony.luck@intel.com>, linux-hardening@vger.kernel.org, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
References: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
Message-Id: <174463433283.154575.16025374701126076484.robh@kernel.org>
Subject: Re: [PATCH v6 0/5] Add support for the Exynos7870 SoC, along with
 three devices


On Mon, 14 Apr 2025 00:28:41 +0530, Kaustabh Chakraborty wrote:
> Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
> announced in 2016. The chipset was found in several popular mid-range to
> low-end Samsung phones, released within 2016 to 2019.
> 
> This patch series aims to add support for Exynos 7870, starting with the
> most basic yet essential components such as CPU, GPU, clock controllers,
> PMIC, pin controllers, etc.
> 
> Moreover, the series also adds support for three Exynos 7870 devices via
> devicetree. The devices are:
>  * Samsung Galaxy J7 Prime	- released 2016, codename on7xelte
>  * Samsung Galaxy J6		- released 2018, codename j6lte
>  * Samsung Galaxy A2 Core	- released 2019, codename a2corelte
> 
> Additional features implemented in this series include:
>  * I2C	- touchscreen, IIO sensors, etc.
>  * UART	- bluetooth and serial debugging
>  * MMC	- eMMC, Wi-Fi SDIO, SDCard
>  * USB	- micro-USB 2.0 interface
> 
> Build dependencies are in these sub-series:
>  * pmu-clocks		A https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org/
> 
> Other related sub-series:
>  * gpu			A https://lore.kernel.org/all/20250318-exynos7870-gpu-v1-1-084863f28b5c@disroot.org/
>  * i2c	      		A https://lore.kernel.org/all/20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org/
>  * mmc			A https://lore.kernel.org/all/20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org/
>  * pinctrl	  	A https://lore.kernel.org/all/20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org/
>  * pmic-regulators	A https://lore.kernel.org/all/20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org/
>  * uart			A https://lore.kernel.org/all/20250318-exynos7870-uart-v2-1-b9dcf145ae87@disroot.org/
>  * usb			A https://lore.kernel.org/all/20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org/
>  * usbphy		A https://lore.kernel.org/all/20250410-exynos7870-usbphy-v2-0-2eb005987455@disroot.org/
> (Legend: [R]eviewed, [A]pplied)
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v6:
> - Append the following trailers:
>   [v5 1/5] dt-bindings: arm: samsung: add compatibles for exynos7870 devices
>     Acked-by: Rob Herring (Arm) <robh@kernel.org>
> - Link to v5: https://lore.kernel.org/r/20250411-exynos7870-v5-0-6b319ae36c36@disroot.org
> 
> Changes in v5:
> - Drop the exynos7870-bootmode patchset for now.
> - Add card-detect-delay and cd-broken properties in sd-mmc nodes.
> - Drop the following applied patches:
>   [v4 1/7] dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
>   [v4 3/7] soc: samsung: exynos-chipid: add support for exynos7870
> - Link to v4: https://lore.kernel.org/r/20250301-exynos7870-v4-0-2925537f9b2a@disroot.org
> 
> Changes in v4:
> - Drop merged [PATCH v3 1/7].
> - Explicitly mention sub-series having build dependencies.
> - Include the following patch from the pmu-clocks series:
>   - dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
> - Adjust clock header file name to match changes in pmu-clocks.
> - Change regulator node names to match changes in pmic-regulators.
> - Remove non-removable flag for the SDCard's mmc node.
> - Link to v3: https://lore.kernel.org/r/20250219-exynos7870-v3-0-e384fb610cad@disroot.org
> 
> Changes in v3:
> - Added patches from https://lore.kernel.org/all/20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org/
> - Fix devicetree formatting according to the devicetree style guide.
> - Take over ownership of patches by the co-author, upon their request.
> - Link to v2: https://lore.kernel.org/r/20250204-exynos7870-v2-0-56313165ef0c@disroot.org
> 
> Changes in v2:
> - Redo a few commit descriptions.
> - Split patchsets into multiple sub-series, subsystem-wise.
> - Link to v1: https://lore.kernel.org/r/20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org
> 
> ---
> Kaustabh Chakraborty (5):
>       dt-bindings: arm: samsung: add compatibles for exynos7870 devices
>       arm64: dts: exynos: add initial devicetree support for exynos7870
>       arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
>       arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
>       arm64: dts: exynos: add initial support for Samsung Galaxy J6
> 
>  .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
>  arch/arm64/boot/dts/exynos/Makefile                |    3 +
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  630 ++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  618 ++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  666 +++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1022 ++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  713 ++++++++++++++
>  7 files changed, 3660 insertions(+)
> ---
> base-commit: 29e7bf01ed8033c9a14ed0dc990dfe2736dbcd18
> change-id: 20250201-exynos7870-049587e4b7df
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
 Base: using specified base-commit 29e7bf01ed8033c9a14ed0dc990dfe2736dbcd18

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250414-exynos7870-v6-0-039bd5385411@disroot.org:

arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/phy@135c0000: failed to match any schema with compatible: ['samsung,exynos7870-usbdrd-phy']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/phy@135c0000: failed to match any schema with compatible: ['samsung,exynos7870-usbdrd-phy']
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/phy@135c0000: failed to match any schema with compatible: ['samsung,exynos7870-usbdrd-phy']





