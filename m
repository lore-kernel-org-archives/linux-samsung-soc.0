Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A7B1DF248;
	Thu, 17 Oct 2024 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183040; cv=none; b=HJVn4fbqPuwYfkg5UnIripKx4fW8huWewR3ETkSp+bIkxjNMwFxATDVPCTpSNRXQucxRc47aR0wyhnpjIMezMlS4NDRCa2DDe3PdIAlbP1ybAJgpWaCouW34MwttzV8cF0VWqUy8KMIHO+bLQKKCto9YFCzI5ZLmpMleQ8SvJ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183040; c=relaxed/simple;
	bh=CEiB9cNRryFmSq8BO4x2uWed/4gyYXaefvhIACsgfhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0YsOt8TX0JdQ7ZRf4sPKCDX7I98jM3AeBFv2U09pexmolrB7nTMMax6j04bvJV2MOkVLPvzQwy2QJHmw7Vxl3K3Rhebclzr0hNeBuVuwOp+qMfdNuB0NVeqxtfs9K92tqhZOPWtax2L/DUNsFphuJMVr89HlSOLMZCZt1wZltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrcqDbOc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrcqDbOc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3009EC4CEC3;
	Thu, 17 Oct 2024 16:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729183040;
	bh=CEiB9cNRryFmSq8BO4x2uWed/4gyYXaefvhIACsgfhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nrcqDbOcQQX290gs+m9Yrv1lmt1W/Zp4PnM/jH9pXeA+Zd4iqZ5Dd5e5cyEedzYbI
	 4kW4C4cQHZz/7dhIYSUvgpmYDAQolSZAO0bVS69i7Ll8Gf/CgOnT6oco96oRnrtHeU
	 i+emPLiEuBegZedtTR4IjlR7ZKa1U80qY0xsy3eR29TbJDL1Lw+c5nIC6HBMkh96cg
	 zMaOW4xxJrGnm4KjMY2RRFigV++70GF2Exi3B4dH7WsYTU3C+zG77mxfUiat+A1Le8
	 /hqbco5Nl9i3TvHtoAdC9dDAdzDcJ54eEAKSaZZaq8vCBYmv2hkrmdFa4RNQ+r+F+c
	 QpxbSxifN8GxQ==
Message-ID: <a1025cc1-b9e1-489b-b452-c3a729d0300e@kernel.org>
Date: Thu, 17 Oct 2024 18:37:14 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add minimal Exynos990 SoC and SM-N981B support
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Conor Dooley <conor+dt@kernel.org>
References: <20241016154747.64343-1-igor.belwon@mentallysanemainliners.org>
 <172917870796.3589876.17005849369898378683.robh@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <172917870796.3589876.17005849369898378683.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/10/2024 18:26, Rob Herring (Arm) wrote:
> 
> On Wed, 16 Oct 2024 17:47:41 +0200, Igor Belwon wrote:
>> Hi folks,
>>
>> This series adds initial support for the Exynos 990 SoC and also
>> initial board support for the Samsung Galaxy Note20 5G (SM-N981B)
>> codenamed c1s.
>>
>> The Exynos 990 SoC is also used in the S20 series, as well as in the
>> Note 20 Ultra phones. Currently the device trees added are for the
>> Exynos 990 SoC and c1s. The device tree has been tested with
>> dtbs_check W=1 and results in no warnings.
>>
>> This initial bringup consists of:
>>  * cpus
>>  * pinctrl
>>  * gpio-keys
>>  * simple-framebuffer
>>
>> This is enough to reach a shell in an initramfs. More platform support
>> will be added in the future.
>>
>> The preferred way to boot the upstream kernel is by using a shim
>> bootloader, called uniLoader [1], which works around some issues with
>> the stock, non-replacable Samsung S-LK bootloader. For example, the
>> stock bootloader leaves the decon trigger control unset, which causes
>> the framebuffer not to refresh.
>>
>> Device functionality depends on the 2nd patch series:
>> "Add Exynos990 pinctrl and chipid drivers"
>>
>> [1] https://github.com/ivoszbg/uniLoader
>>
>> Changes in v3:
>>  - Move pinctrl DT nodes from the 2nd patch series
>>  - Resend patches to the correct lists.
>>
>> Changes in v2:
>>  - Added acked-by tag by Rob Herring
>>  - Fixed two stray newlines in SoC and device DTs
>>  - Fixed commit message for the c1s device tree
>>  - Changed osc-clock to clock-osc and ordered nodes in SoC DT
>>  - Fixed ordering in the gic node in SoC DT
>>  - Fixed memory node unit address
>>  - Fixed memory node reg properties, to map all available RAM
>>  - Moved pinctrl binding commits to the 2nd patch series.
>>
>> Kind regards,
>> Igor
>>
>> Igor Belwon (6):
>>   dt-bindings: arm: cpus: Add Samsung Mongoose M5
>>   dt-bindings: hwinfo: exynos-chipid: Add compatible for Exynos 990
>>     chipid
>>   dt-bindings: arm: samsung: samsung-boards: Add bindings for Exynos 990
>>     boards
>>   soc: samsung: exynos-chipid: Add support for Exynos 990 chipid
>>   arm64: dts: exynos: Add initial support for the Exynos 990 SoC
>>   arm64: dts: exynos: Add initial support for Samsung Galaxy Note20 5G
>>     (c1s)
>>
>>  .../devicetree/bindings/arm/cpus.yaml         |    1 +
>>  .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
>>  .../hwinfo/samsung,exynos-chipid.yaml         |    1 +
>>  arch/arm64/boot/dts/exynos/Makefile           |    1 +
>>  arch/arm64/boot/dts/exynos/exynos990-c1s.dts  |  115 +
>>  .../boot/dts/exynos/exynos990-pinctrl.dtsi    | 2195 +++++++++++++++++
>>  arch/arm64/boot/dts/exynos/exynos990.dtsi     |  251 ++
>>  drivers/soc/samsung/exynos-chipid.c           |    1 +
>>  8 files changed, 2571 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-c1s.dts
>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-pinctrl.dtsi
>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990.dtsi
>>
>> --
>> 2.45.2
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y exynos/exynos990-c1s.dtb' for 20241016154747.64343-1-igor.belwon@mentallysanemainliners.org:
> 
> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@10430000: failed to match any schema with compatible: ['samsung,exynos990-pinctrl']
> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@10730000: failed to match any schema with compatible: ['samsung,exynos990-pinctrl']
> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@13040000: failed to match any schema with compatible: ['samsung,exynos990-pinctrl']
> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/pinctrl@13c30000: failed to match any schema with compatible: ['samsung,exynos990-pinctrl']

These are expected, coming via different tree.

Best regards,
Krzysztof

