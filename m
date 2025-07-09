Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA8C1EA84;
	Wed,  9 Jul 2025 14:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752069627; cv=none; b=i4oaEQOm04G1tFrjAnzz4mvVarNDzaX7DxyAldFvvX+K9fCvwViO1XaJxrosaNGfKn6enWJGpaOSRg+LwUgzorm1lgKnjVYGDSZq01cHJGdBgGbfnaNuHjhXaJ9sEeVRp/whfDOMEzkfNWCPDXCBtP+cq76LJKglsEPFfwtqGek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752069627; c=relaxed/simple;
	bh=J5gFOJygzZbOqjQq3B0bcOtL5rvp4e6QlwCd4fMhZRA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FkD+mszQdu0deaaKUldXRW0qUPcIAJbBdA8b1T5ETTC0rf3aVn+2+IAXWF58Q6V8jXey8n4LmmIQlZqvYQedxH+Dn2g6Z+NF63SEHOkt2okagmROW1cr18NMjhY8Ffc/bCbSWDE5riCVnm6SXBZJb2DGEcSk6MUHZBR6eCSQwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6TttmSt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6TttmSt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8A6C4CEEF;
	Wed,  9 Jul 2025 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752069626;
	bh=J5gFOJygzZbOqjQq3B0bcOtL5rvp4e6QlwCd4fMhZRA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l6TttmSthsVbAFS4ZMnLJxgMwQ5k+tvu1X346JYTBya/qber1UFbCrgVe0t8YkARn
	 UGX/Azl/pePjEafUfbHiuwl2/mhdZYPAKc3l700E4hME664m2xgUurbPkxYmoB+G7G
	 o2+H3AiYyu2mgBgQb2Nv2474x/CLsWZuqAaFhvd2m54YBlkXBnge6TOIcKXWwUNLob
	 Xez7tDb1eok4lw1MpxyOFAgyV6r5efwfpJO0gYyZ/Ij26svJugrf3XGMUx2vCxrKKV
	 dKxJof7qztNJCKxXlBcGPHJGnWEPrqzEkKnyBCG3xX+WkVB63RXfCsPNJXU7VS/X0x
	 kdGbanfe0NiYw==
Date: Wed, 09 Jul 2025 09:00:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 alim.akhtar@samsung.com
To: ew kim <ew.kim@samsung.com>
In-Reply-To: <20250709001210.379418-1-ew.kim@samsung.com>
References: <CGME20250709002408epcas2p25248bf1a397fc308d91ffef3889c41d5@epcas2p2.samsung.com>
 <20250709001210.379418-1-ew.kim@samsung.com>
Message-Id: <175206957118.3267462.9769889827847502379.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: add abox generic for
 ExynosAutov920


On Wed, 09 Jul 2025 09:12:10 +0900, ew kim wrote:
> Add a node for Abox generic. This driver, exynosautov920, connects to
> the SoC and allows you to configure a sound card.
> 
> Signed-off-by: ew kim <ew.kim@samsung.com>
> ---
>  .../boot/dts/exynos/exynosautov920-audio.dtsi | 20 +++++++++++++++++++
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |  1 +
>  2 files changed, 21 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi
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
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250709001210.379418-1-ew.kim@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi:18.3-10: Warning (ranges_format): /abox_generic@generic:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: / (samsung,exynosautov920-sadk): 'abox_generic@generic' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /abox_generic@generic: failed to match any schema with compatible: ['samsung,abox_generic']





