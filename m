Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ED7AD31;
	Thu, 23 Jan 2025 00:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737593140; cv=none; b=QCT0k1iVhHLrirYyyx0WDyRIsuyc2zKbZ76kYMcm0xgSVd3d723I3r6uu7NlSkuS5OA0bbTzaAn1vqN3V+ZDodEJEoByr8xOGWWKFWwZBkrLvvo0E/USC+wmPuwqwjx1bAE68f8xb1paaDHMNfWQ6RPx8XZZoyBdxwpr840dzDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737593140; c=relaxed/simple;
	bh=PL54X05pCf40I9tsMTWV0cjMHPF5vdKWLeZrz4TaVnA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=YUKzd4A3asCQ4N5PggIvFX9Z0xoU4oevH0iuw8VdMckcvLBvM/99R9U41dlXYl8pUPW3Mirof/ALaIWV2MJYtxRzwubgpgdQvoVjRzQtLfBSBy7ewolN9hGg41GBgi6Wm2yvFzBKNjTqXXwDvoNBlz/zJzsywwKAqr/W2pBADKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlqTgHmo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlqTgHmo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AA2C4CED2;
	Thu, 23 Jan 2025 00:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737593139;
	bh=PL54X05pCf40I9tsMTWV0cjMHPF5vdKWLeZrz4TaVnA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SlqTgHmoVAs9/bpQrFRl1ryumnJ3+n1UEmRI4jUMyv9Mv/7RBbqICelMhQSXEuhip
	 d1W8Ydsb831awHXoMn93xLpOBa0dAzaHR2jSk878jq0BEiNsxmfYsj6cAggP3rfNba
	 xfh/CyXVmB29nD380pns+g18zbJqAxrepRXoIIVW6yYT8eOS/2rmuyE1qNR16JA6Tu
	 qc51bwXQR7kRse1rvkqgfhZGALvNZDHp3zZyeciHxcREHDpApVOt1Fouukx9gq4EDo
	 JYDLRzYPkRyJgOm/4RBhzI/bf4Jky2pdLVLNzbdFcFM3bt4WcrefvQ7a4GNgcy9hgx
	 IOLTYRyxxEtKg==
Date: Wed, 22 Jan 2025 18:45:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Will McVicker <willmcvicker@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
Message-Id: <173759296157.1990846.4942587066779906613.robh@kernel.org>
Subject: Re: [PATCH v4 0/4] Google Pixel 6 (simple) framebuffer support


On Fri, 17 Jan 2025 17:09:53 +0000, André Draszik wrote:
> Hi,
> 
> This series enables simple framebuffer support on Google Pixel 6 and
> Pixel 6 Pro.
> 
> Even if simple-framebuffer is deprecated and DRM should be used
> instead, having it available in DT is beneficial for several reasons at
> this point in time (the phone uses an OLED display):
> * energy consumption goes down significantly, as it changes from white
>   (as left by bootloader) to black (linux console), and we generally
>   don't run out of battery anymore when plugged into a USB port
> * less of a burn-in effect I assume
> * phone stays cooler due to reduced energy consumption by display
> 
> Since Pixel 6 and Pixel 6 Pro use a different resolution display, this
> is the time to separate them into their respective DTs, and provide one
> for each of them. There are other differences between the two, like
> battery design capacity, but they don't matter at this stage due to
> incomplete upstream support.
> 
> * dependency note *
> 
> None (anymore) - earlier versions of this series had dependencies, but
> those are all part of linux-next already, so none remain.
> 
> * dependency note end *
> 
> For those who want to try this out:
> The stock bootloader disables the decon hardware trigger before jumping
> to Linux, preventing framebuffer updates from reaching the display. We
> have added a work-around in our Yocto BSP layer for the time being
> (until a proper display exists upstream). An alternative might be to
> port and use uniLoader from https://github.com/ivoszbg/uniLoader, as
> seems to be done for some other Exynos platforms.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> Changes in v4:
> - fix an unintended whitespace error introduced in patch 4 in v3
> - Link to v3: https://lore.kernel.org/r/20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org
> 
> Changes in v3:
> - back to using separate DTBs for Pixel 6 and Pixel 6 Pro (Krzysztof)
> - update name of common dtsi file (Krzysztof)
> - use 'memory-region' property from the start in patch 2, don't
>   introduce it as change in patch 3 (Krzysztof)
> - Link to v2: https://lore.kernel.org/r/20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org
>   and https://lore.kernel.org/r/20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org
> 
> Changes in v2:
> - We now have a generic gs101-based Pixel board DT, which can work on
>   any Pixel 6 / 6 Pro / 6a
> - Pixel 6 (Pro) are overlays onto that one.
>   This has the advantage that all boards can be supported without
>   having to have a full copy of the DT for each of them. We still
>   instruct kbuild to create merged DTBs (in addition to the DTBOs) so
>   that existing scripts can keep working while giving the option to
>   just apply the overlay before boot (e.g. by the bootloader).
> - The binding has been updated according to the above points
> - I've changed the simple-framebuffer node to specify the memory via
>   memory-region instead of reg, as that avoids unnecessary duplication
>   (of the size), and it avoids having to specify #address-cells
>   and #size-cells in the chosen node (and duplicating this in the
>   DTSO), which is otherwise necessary to keep dt_binding_check happy
>   and DT validation working in general.
> - sort overriding/extending nodes ordered by label name (Krzysztof)
> - format patches with diff.renames=copies (Krzysztof)
> - dependencies have been updated, see below
> - Link to v1: https://lore.kernel.org/r/20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org
> 
> ---
> André Draszik (4):
>       dt-bindings: arm: google: add gs101-raven
>       arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
>       arm64: dts: exynos: gs101-oriole: move common Pixel6 & 6Pro parts into a .dtsi
>       arm64: dts: exynos: gs101-raven: add new board file
> 
>  Documentation/devicetree/bindings/arm/google.yaml  |   3 +-
>  arch/arm64/boot/dts/exynos/google/Makefile         |   1 +
>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 267 +--------------------
>  .../{gs101-oriole.dts => gs101-pixel-common.dtsi}  |  22 +-
>  arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  29 +++
>  5 files changed, 58 insertions(+), 264 deletions(-)
> ---
> base-commit: 4e16367cfe0ce395f29d0482b78970cce8e1db73
> change-id: 20241216-gs101-simplefb-8aae80278ed7
> 
> Best regards,
> --
> André Draszik <andre.draszik@linaro.org>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org:

arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: phy@11100000: 'orientation-switch' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy.yaml#





