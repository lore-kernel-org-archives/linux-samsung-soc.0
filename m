Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2FF215787;
	Mon, 16 Jun 2025 21:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750110413; cv=none; b=aVcSDf9Jk1XpqJzSLfjc3taGQ2Qqa/jjSAD6Le4Zc53iLjCzOJZdk/d/wN5gEcv27ttF+RTCJhAsbkV5vUfwBAJlZkuDRVZKtX2G3n1tYsSew/sWxlk6nH+K/CVk4Z3KEKeKhO34BH+LhpnYv/6zUlNE4GFsO2pO5cvGH0oNG48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750110413; c=relaxed/simple;
	bh=P+l1gSKaL1N/vyV+DOT1UrSQ4fffm5IIUx8ooXOed1E=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=DB8zfgLzek1N7+HyPPb/VpjsC8/uTc/wouqm0Gq6Wvp9cGW2zTFvPpDEM2EfDfW1BkDAC12fcY0YKSPCKu3TdRmHBsaNRmBFlw2w8BgTISYN6xf7tH9Ro2H/oTbI49pAVWOZB3t7VcYJyTE9YK3D404kY2QdLMIV6edwxhoj9n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Szj//WWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Szj//WWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0563C4CEEA;
	Mon, 16 Jun 2025 21:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750110412;
	bh=P+l1gSKaL1N/vyV+DOT1UrSQ4fffm5IIUx8ooXOed1E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Szj//WWWSX7Egy9IV2n6oWiSAnYoeR2NqgHnX6qjBNb51Cg9RQjsjbFnJ3zztDe8I
	 mSliIgqysC/frhCJncjVf5IjJfwL3+RFTyNYEoeTZc9iZytlm25WR5L3oiIcwRLE+L
	 14FRqZkbLm985wPGnXuwRIHuqcqLEwognK039s6OIv+JrYUbBhHvCSNXBgy4fxshrG
	 v2VW/RkUuYvSAMdeiUXbcGOsntoaKQb+er/qIT3+19KN0J1w518JKZ1TbLzHQR/svV
	 PjoC8pLV80/inUonAbTvUn4eebPmKkQqh0MMu6Bz8+PE0wAREEtES8s7Y5EeJF8Jvf
	 7ov4q6jsw2+jw==
Date: Mon, 16 Jun 2025 16:46:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: rosa.pila@samsung.com, s.nawrocki@samsung.com, 
 linux-samsung-soc@vger.kernel.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
 linux-phy@lists.infradead.org, vkoul@kernel.org, krzk+dt@kernel.org, 
 faraz.ata@samsung.com, selvarasu.g@samsung.com, kauschluss@disroot.org, 
 ivo.ivanov.ivanov1@gmail.com, dev.tailor@samsung.com, 
 devicetree@vger.kernel.org, kishon@kernel.org, peter.griffin@linaro.org, 
 muhammed.ali@samsung.com, linux-arm-kernel@lists.infradead.org, 
 alim.akhtar@samsung.com, m.szyprowski@samsung.com
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
References: <CGME20250613055037epcas5p1ce00fda1b535dbeb9a98458d1f0a28ee@epcas5p1.samsung.com>
 <20250613055613.866909-1-pritam.sutar@samsung.com>
Message-Id: <175011004935.2433563.8726528182523156685.robh@kernel.org>
Subject: Re: [PATCH v3 0/9] initial usbdrd phy support for Exynosautov920
 soc


On Fri, 13 Jun 2025 11:26:04 +0530, Pritam Manohar Sutar wrote:
> This SoC has a single USB 3.1 DRD combo phy and three USB2.0 only
> DRD phy controllers
> 
>   - Combo phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
>     compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is added
>     to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data
>     rates. These two phys are combined to form a combo phy as mentioned
>     below.
> 
>    USB30DRD_0 port
> 
>      +-----------------------------------------------------+
>      |                                                     |
>      |           (combo) USB PHY controller                |
>      |     +-----------------------------------------+     |
>      |     |               USB HSPHY                 |     |
>      |     |  (samsung,exynosautov920-usbdrd-hsphy)  |     |
>      |     +-----------------------------------------+     |
>      |                                                     |
>      |   +---------------------------------------------+   |
>      |   |               USB SSPHY                     |   |
>      |   |   (samsung,exynosautov920-usb31drd-ssphy)   |   |
>      |   +---------------------------------------------+   |
>      |                                                     |
>      +-----------------------------------------------------+
>      |                                                     |
>      |                USBDRD30 Link                        |
>      |                  Controller                         |
>      |                                                     |
>      +-----------------------------------------------------+
> 
>   - USB2.0 phy supports only UTMI+ interface. USB2.0DRD phy
>     is very similar to the existing Exynos850 support in this driver.
> 
>     USB20DRD_0/1/2 ports
> 
> 
>       +---------------------------------------------------+
>       |                                                   |
>       |                USB PHY controller                 |
>       |    +-----------------------------------------+    |
>       |    |              USB HSPHY                  |    |
>       |    |  (samsung,exynosautov920-usbdrd-phy)    |    |
>       |    +-----------------------------------------+    |
>       |                                                   |
>       +---------------------------------------------------+
>       |                                                   |
>       |             USBDRD20_* Link                       |
>       |                Controller                         |
>       |                                                   |
>       +---------------------------------------------------+
> 
> This patchset only supports device mode and same is verified with
> as NCM device with below configfs commands
> 
> changelog
> ----------
> Changes in v2:
> - Used standard GENMASK() and FIELD_GET() to get the major version
>   from controller version register.
>   link for v1: https://lore.kernel.org/linux-phy/20250514134813.380807-1-pritam.sutar@samsung.com/
> 
> Changes in v3:
> - Updated dt-bindings for USB2.0 only.
> - Added dt-bindings for combo phy.
> - Added implementation for combo phy (SS and HS phy).
> - Added added DTS nodes for all the phys.
>   link for v2: https://lore.kernel.org/linux-phy/20250516102650.2144487-1-pritam.sutar@samsung.com/
> 
> Pritam Manohar Sutar (9):
>   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 HS phy
>     compatible
>   phy: exyons5-usbdrd: support HS phy for ExynosAutov920
>   arm64: dts: exynos: ExynosAutov920: add USB and USB-phy nodes
>   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo HS
>     phy
>   phy: exyons5-usbdrd: support HS combo phy for ExynosAutov920
>   arm64: dts: exynos: ExynosAutov920: add USB and USB HS combo phy nodes
>   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo SS
>     phy
>   phy: exyons5-usbdrd: support SS combo phy for ExynosAutov920
>   arm64: dts: exynos: ExynosAutov920: add USB and USB SS combo phy nodes
> 
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    |   6 +
>  .../boot/dts/exynos/exynosautov920-sadk.dts   |  53 ++
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 155 +++++
>  drivers/phy/samsung/phy-exynos5-usbdrd.c      | 529 ++++++++++++++++++
>  4 files changed, 743 insertions(+)
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
 Base: tags/v6.16-rc1-6-g8a22d9e79cf0 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250613055613.866909-1-pritam.sutar@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb@16600000 (samsung,exynosautov920-dwusb3): 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb@16700000 (samsung,exynosautov920-dwusb3): 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb@16800000 (samsung,exynosautov920-dwusb3): 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb@16900000 (samsung,exynosautov920-dwusb3): 'vdd33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#





