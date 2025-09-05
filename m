Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EF0374263;
	Fri,  5 Sep 2025 17:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757094305; cv=none; b=ZQOMPfnLT1r0ctGTxOCgSfBPKxBYK3VLebRgB8c46BqAlZjIGEfDUUCFiSNH2VHr6A7SYTUTTKLkQEdb2JsYet+GeNNXZ+uB9Vi1YmuWpAcI17SVO1WVhaXEdJAKX6PeHa4bcz40yqvjou/DjSCFnagImHSAkmpNwAA4/TK4VVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757094305; c=relaxed/simple;
	bh=ShW4ynV/xN7Qkcuoo1BUM92WZcCy7HNYZ6aPRk55ZSI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=E65b4kvhUk7DMfw4YrOODR5A34Aao8DawgRgnczyyXwOzl5axp13q+085GIuyyK8FtyDqDj+dTND4hV5ERvFhgC+JaKrLsvuiabHTbWZIH08doT5203JcMajcnfROu24q2nc3ZNrtQPp/LFkmvGmhsv0ZeZaI08Kfkre1DZp12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKKF3psD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKKF3psD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78A6C4CEF1;
	Fri,  5 Sep 2025 17:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757094305;
	bh=ShW4ynV/xN7Qkcuoo1BUM92WZcCy7HNYZ6aPRk55ZSI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CKKF3psD5nv+pSPjcucJx7gtDQCsbXLMo+Xi4PpS/xPk63IkJrgR4a9zHUKRE3A4N
	 fe8NmB/dniooVISwKp7jmTFnQhOObzg359pjar/64WkqfhF1t7Sd/1xj8SGTvOGr/u
	 BJFOlTmfmyAfRCBka+RG2I6KsNy8fAmu7AamT1T77OdzNnnRd6sVQTtq1LNaievQ/9
	 2H9XjV++tx/ZUqvS24zBRnWOfuwUD/XNecAIDDGkpffmF4blewIXq+rJrMOGg2Kn0K
	 Ytp1i3ZAAISEGBm4FcMjujM6/kcnDK+FC3wxD08SlU2C7qq/megpBWii2lq4JAAjrm
	 YU4oOEaGuMQ4A==
Date: Fri, 05 Sep 2025 12:45:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, rosa.pila@samsung.com, 
 alim.akhtar@samsung.com, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 dev.tailor@samsung.com, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: Faraz Ata <faraz.ata@samsung.com>
In-Reply-To: <20250905092452.1782227-1-faraz.ata@samsung.com>
References: <CGME20250905091549epcas5p21b34a659bd1032a7f91af783af8d3c34@epcas5p2.samsung.com>
 <20250905092452.1782227-1-faraz.ata@samsung.com>
Message-Id: <175709416258.988692.5502656914062665417.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynosautov920: Add DT node for all I2C
 ports


On Fri, 05 Sep 2025 14:54:52 +0530, Faraz Ata wrote:
> Universal Serial Interface (USI) supports three serial protocol
> like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> Add i2c nodes for all the instances.
> 
> Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> ---
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 845 ++++++++++++++++++
>  1 file changed, 845 insertions(+)
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
 Base: tags/next-20250904 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250905092452.1782227-1-faraz.ata@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108800c0 (samsung,exynosautov920-usi): i2c@10880000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10880000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108800c0/i2c@10880000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108900c0 (samsung,exynosautov920-usi): i2c@10890000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10890000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108900c0/i2c@10890000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108a00c0 (samsung,exynosautov920-usi): i2c@108a0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108a0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108a00c0/i2c@108a0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108b00c0 (samsung,exynosautov920-usi): i2c@108b0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108b0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108b00c0/i2c@108b0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108c00c0 (samsung,exynosautov920-usi): i2c@108c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108c0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108c00c0/i2c@108c0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108d00c0 (samsung,exynosautov920-usi): i2c@108d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108d0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108d00c0/i2c@108d0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108e00c0 (samsung,exynosautov920-usi): i2c@108e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108e0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108e00c0/i2c@108e0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108f00c0 (samsung,exynosautov920-usi): i2c@108f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108f0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108f00c0/i2c@108f0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109000c0 (samsung,exynosautov920-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10900000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109100c0 (samsung,exynosautov920-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10910000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109200c0 (samsung,exynosautov920-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10920000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109300c0 (samsung,exynosautov920-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10930000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109400c0 (samsung,exynosautov920-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10940000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109500c0 (samsung,exynosautov920-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10950000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109600c0 (samsung,exynosautov920-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10960000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109700c0 (samsung,exynosautov920-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10970000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109800c0 (samsung,exynosautov920-usi): i2c@10980000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10980000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109800c0/i2c@10980000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109900c0 (samsung,exynosautov920-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10990000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109900c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10c800c0 (samsung,exynosautov920-usi): i2c@10c80000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10c80000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10c800c0/i2c@10c80000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10c900c0 (samsung,exynosautov920-usi): i2c@10c90000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10c90000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10c900c0/i2c@10c90000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10ca00c0 (samsung,exynosautov920-usi): i2c@10ca0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10ca0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10ca00c0/i2c@10ca0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cb00c0 (samsung,exynosautov920-usi): i2c@10cb0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cb0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cb00c0/i2c@10cb0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cc00c0 (samsung,exynosautov920-usi): i2c@10cc0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cc0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cc00c0/i2c@10cc0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cd00c0 (samsung,exynosautov920-usi): i2c@10cd0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cd0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cd00c0/i2c@10cd0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10ce00c0 (samsung,exynosautov920-usi): i2c@10ce0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10ce0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10ce00c0/i2c@10ce0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cf00c0 (samsung,exynosautov920-usi): i2c@10cf0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cf0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cf00c0/i2c@10cf0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d000c0 (samsung,exynosautov920-usi): i2c@10d00000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d00000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d000c0/i2c@10d00000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d100c0 (samsung,exynosautov920-usi): i2c@10d10000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d10000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d100c0/i2c@10d10000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d200c0 (samsung,exynosautov920-usi): i2c@10d20000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d20000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d200c0/i2c@10d20000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d300c0 (samsung,exynosautov920-usi): i2c@10d30000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d30000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d300c0/i2c@10d30000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d400c0 (samsung,exynosautov920-usi): i2c@10d40000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d40000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d400c0/i2c@10d40000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d500c0 (samsung,exynosautov920-usi): i2c@10d50000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d50000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d500c0/i2c@10d50000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d600c0 (samsung,exynosautov920-usi): i2c@10d60000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d60000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d600c0/i2c@10d60000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d700c0 (samsung,exynosautov920-usi): i2c@10d70000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d70000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d700c0/i2c@10d70000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d800c0 (samsung,exynosautov920-usi): i2c@10d80000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d80000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d800c0/i2c@10d80000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d900c0 (samsung,exynosautov920-usi): i2c@10d90000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d90000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d900c0/i2c@10d90000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']





