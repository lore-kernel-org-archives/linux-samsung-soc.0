Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4A936CE04;
	Thu, 22 Jan 2026 17:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102141; cv=none; b=VX66WQpIsEPHrh02BFHKrM7D4g+rjNsaoEbg609kOtaPGsLqtrK4Ha3EBFTfR6kB9/4++MNj2AwSxaIKF1BTX0kowEwCHbzJHOCu4is8iiUmgDNlMtl5W71vRQYd2RbqgqeB1jEILaIQpISoBTX3iXMQnRqkxTqc2fVwXWdLxdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102141; c=relaxed/simple;
	bh=Y3D9E7japclI7UuExtcL6bPuCRUqGKopPtgcI3tpo7Y=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=QCnNHd66kCM2CODr6fdrAPNnhhtgTxzUXVo5p4Z3Lk3pEPJsrQKi4WDT+ufxX68qQ5qusQ8+I999gOtT/1PSYD9+u1mMsE1FasXB/U5qZ1vyArTD0N4cJ6JZDgg5NLFfx1Y054ZpOiBLQP0H2GlORzIlpS2FmvlGFgt2v0f8CnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTQTg8Gu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTQTg8Gu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC466C116C6;
	Thu, 22 Jan 2026 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769102139;
	bh=Y3D9E7japclI7UuExtcL6bPuCRUqGKopPtgcI3tpo7Y=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=jTQTg8Gu2G1yoe/UvGnuAwgLgBGxCYlqGnyfSceJG959OW2YlVwhPsA/PR0l2qA9w
	 8zdYytO9RmmHcwx7lGtPhbxjvtUszkOMmSk1gGd6xSGHTwNbK0/jXMHjM9ZgqksdNJ
	 zOoWhDmtS6HdKUpqyb4zk5SwropokIu3Y5vEX2eWIbg82ohHpB8RHiVQaa8qtSK7GG
	 OkB7ha3F1qdqLg2DlrHm76NbY4Guja+oBX3TWdgSnvlH2THT/rCgYDER3Kv3JSPVmX
	 vGrfH7RiYDRIWz5zden6QseDozqL/maNI66WE4Y73NorzzXTGu3KGnglxL4eU8yLgP
	 wg6bKKvp7MGgQ==
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Jan 2026 11:15:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: alim.akhtar@samsung.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, rosa.pila@samsung.com, 
 selvarasu.g@samsung.com, linux-samsung-soc@vger.kernel.org, 
 muhammed.ali@samsung.com, faraz.ata@samsung.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dev.tailor@samsung.com
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
In-Reply-To: <20260122130721.205664-1-pritam.sutar@samsung.com>
References: <CGME20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2@epcas5p4.samsung.com>
 <20260122130721.205664-1-pritam.sutar@samsung.com>
Message-Id: <176910209177.2703219.7993114273484886473.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add and enable USB nodes for ExynosAutov920 SoC


On Thu, 22 Jan 2026 18:37:18 +0530, Pritam Manohar Sutar wrote:
> This SoC has 2 USB typeC and 2 typeA ports those are DWC3 DRD
> controllers and among them, one single USB3.1 DRD combo phy and three
> USB2.0 only phy controllers. This patchset adds and enables USB and
> USB-PHY nodes in dts.
> 
> PMIC is not implemented yet, we rely on USB LDOs being enabled by the
> bootloader and used dummy regulators for now.
> 
> To drive vbus for host mode, it needs GPIO pin to enable vbus regulator.
> GPIO expander is present in the dts, we used it to enable the regulator
> using GPIO.
> 
> USB ports are configured as OTG, and default mode is configured as
> peripheral. It will be changed based on requirements.
> 
> changelog
> ----------
> Changes in v2:
> - As v1 was pushed 3 months back, resending this patchset.
> - Since dependencies are merged, removed links from coverletter.
>   link for v1: https://lore.kernel.org/linux-devicetree/20251024114845.2395166-1-pritam.sutar@samsung.com/
> 
> Pritam Manohar Sutar (3):
>   arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
>   arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
>   arm64: dts: exynos: ExynosAutov920: Enable USB nodes
> 
>  .../boot/dts/exynos/exynosautov920-sadk.dts   | 160 +++++++++++++++++
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 162 ++++++++++++++++++
>  2 files changed, 322 insertions(+)
> 
> --
> 2.34.1
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
 Base: tags/next-20260121 (exact match)
 Base: tags/next-20260121 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20260122130721.205664-1-pritam.sutar@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy0 (usb-nop-xceiv): '#phy-cells' is a required property
	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy1 (usb-nop-xceiv): '#phy-cells' is a required property
	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy2 (usb-nop-xceiv): '#phy-cells' is a required property
	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy3 (usb-nop-xceiv): '#phy-cells' is a required property
	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml





