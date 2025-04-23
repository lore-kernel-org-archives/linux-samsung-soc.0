Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CA3188CB1;
	Wed, 23 Apr 2025 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415460; cv=none; b=DA7CARRUSxzUbj2w+xgCyvh/JRzeIt2ULG+ZUsQjADpRvKt9gKIjQP+twLkK9O5hTcCR7RrqiauVE0lFjRQV+OippxexUTsvgZme869U/zPNL5zv5J+L/SQ6USHlr/ok3QrnRY8gQbINlqSLKrk2f4VNLabillT9zWo19SUy49E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415460; c=relaxed/simple;
	bh=KhlYkEqRWOy+NUA8qYmqopvVILH6QfgOFe66Bi46DeE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dUq8/kwRsnoCZud7OQmZHK1xnipmEtPfNbCnrcDgf6n5wgPYFq8qQGh6I4fisVssGIFUFt/dmj1SZ5bRzN3ZGoS8m49zazCRYMpyBJZCAVIbmkf7ntzMpuvbqntCJ5fhqx39cgFz9kzPzbly7eGGR5Qn37Y57B7QzhFZdW6Q2Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhyAb8iG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhyAb8iG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F384CC4CEE2;
	Wed, 23 Apr 2025 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745415460;
	bh=KhlYkEqRWOy+NUA8qYmqopvVILH6QfgOFe66Bi46DeE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JhyAb8iG4C5NZlsDnjgyvBm9RfxuzisolYd5qChiFgNy83amnUcie66wIdpJCGLlK
	 fET0xRvjHri7RkCPDSs2bZPs0cBvmYH8gJmWVUennym0MjSW+UbxqHG1k28jRNHdIa
	 zo7R3dRCV4G8W8+eGzAv3zgkclx/N4linJyyF0xTz9yooRzsdXstxXsx8OAiCyuYiY
	 q3A/yI1kbBIEmhW1Zv3skfAHcwzhp1r5W8uFJiHkmOzeWAV0aZ8xJd/vJeeH8H2g6O
	 ZlAX+3/LYpD2KHyyykyHl6Bv+DnM/uj1Myx4Cb++9GOc1RQ+ejno2d91gZqVCp1nDs
	 PHzV5qiQpxc0w==
Date: Wed, 23 Apr 2025 08:37:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 niyas.ahmed@samsung.com, linux-kernel@vger.kernel.org, g.naidu@samsung.com, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, cs0617.lee@samsung.com, 
 linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com
To: Yashwant Varur <yashwant.v@samsung.com>
In-Reply-To: <20250423060034.973-1-yashwant.v@samsung.com>
References: <CGME20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a@epcas5p2.samsung.com>
 <20250423060034.973-1-yashwant.v@samsung.com>
Message-Id: <174541475597.315167.13886111857775924354.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: Added the ethernet pin
 configuration


On Wed, 23 Apr 2025 11:30:34 +0530, Yashwant Varur wrote:
> This patch adds the ethernet pin configuration.
> 
> Signed-off-by: Yashwant Varur <yashwant.v@samsung.com>
> Signed-off-by: Changsub Lee <cs0617.lee@samsung.com>
> ---
>  .../dts/exynos/exynosautov920-pinctrl.dtsi    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
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
 Base: tags/next-20250423 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250423060034.973-1-yashwant.v@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: pinctrl@10830000 (samsung,exynosautov920-pinctrl): 'eth0_pps_out0', 'eth0_pps_out1', 'eth_extpll_avb', 'eth_phy_reset' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: pinctrl@16c10000 (samsung,exynosautov920-pinctrl): 'eth0_mdc_mdio', 'eth0_pps_out', 'eth0_rgmii' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#





