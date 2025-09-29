Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60572E54A0;
	Mon, 29 Sep 2025 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759140307; cv=none; b=Vkb5CCJFJ2etZPMQJANigdYu0mxN9flQr/RNZc3wDodto36RziGkKN8Uz8obdjGv/FxDC6ECdm5ErkZfFVZNvm12g0A6C/2XC3UDEWdicBIOjZNsraWbKrYLvF5WTBEyNOifwjE5gIJMuxRZPELToYM5s+j3kSSjdZ8w3tivABc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759140307; c=relaxed/simple;
	bh=RJmH0t/e9RqRoeOEExml5h6rWYvFYX1Evpup5hMd1Q0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=I4tPVETqyW12zCSQy1U6gO14eNsl960VQl160WY01SYnWT1ptwN6IX537k4NVeuWBieByeeX4f5IlWW2+r6n4rjtehGrCbE0hcJI+dKtArlgl4/CUdOPfCOEf/rGSAOTkbU0xvR+VAudWqyveo6fiG4BmKAdbmQ6kuJjf2A2HiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Kx2dQB1+; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Kx2dQB1+"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 24C92208D4;
	Mon, 29 Sep 2025 12:05:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tg-2Lw0uafqf; Mon, 29 Sep 2025 12:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759140302; bh=RJmH0t/e9RqRoeOEExml5h6rWYvFYX1Evpup5hMd1Q0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Kx2dQB1+WZ4qnbocJoIEF5MigdG7ofBUuODkSjKGyV4p0GNTYm8pCuDkBTV2i3nrS
	 31Vngit30JYzaBJQ+KoQPUoBJKBcCjxhprEdwTxa+MtGF1sVml4kM3N3eLK5q/vooA
	 NO9+mQfeMBb2eWaghL0P/GqGj9voQBIFaOqX5AjLPJSbNAx5o0MzXodr4dUoTtUP2C
	 pJqKwqafdTNooBLD+QmTYFfXm6i69ekufk9Btv/bckOYwCCyYLTmx83RWODfqgMKw4
	 UUqph+FQejWWNMPfusXCNPX2nLgKQ86IqNStTJ+7BEsa08b/cpoAVfp9oZxmQFqv2n
	 dGT3F6maeFCzQ==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 29 Sep 2025 10:05:01 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
In-Reply-To: <175911189634.2556697.2474466935066391775.robh@kernel.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
 <175911189634.2556697.2474466935066391775.robh@kernel.org>
Message-ID: <32036b3916a944be9450e48b6be30dc0@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-29 02:14, Rob Herring (Arm) wrote:
> On Sun, 28 Sep 2025 23:26:34 +0530, Kaustabh Chakraborty wrote:
>> Exynos7870 has a IP subsystem in its architecture dedicated to display
>> management. Notably, this block includes the Display Enhancement
>> Controller (DECON), and the DSI Master (DSIM).
>> 
>> The following series and its sub-series implement all components for a
>> functioning display pipeline. All vital information which helped 
>> shaping
>> up the patches have been retrieved from Exynos7870 vendor kernel 
>> sources
>> as provided by Samsung.
>> 
>> Testing has been done on all three devices available upstream, i.e.
>> Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2 Core
>> (samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte). 
>> Regrettably,
>> I've only been able to test the functionality on video mode, as none 
>> of
>> the devices have panels working in command mode.
>> 
>> This series implements changes in the SoC subsystem, which includes
>> devicetree additions. It depends on all sub-series listed below:
>> (Legend: [R]eviewed, [A]ccepted)
>> 
>> exynos-sysmmu-resv-regions A 
>> https://lore.kernel.org/r/20250712-exynos-sysmmu-resv-regions-v1-1-e79681fcab1a@disroot.org
>> exynos7870-mipi-phy        A 
>> https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
>> exynos7870-mipi-phy-fix    A 
>> https://lore.kernel.org/r/20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org
>> exynos7870-dsim            A 
>> https://lore.kernel.org/r/20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org
>> exynosdrm-decon            A 
>> https://lore.kernel.org/r/20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org
>> panel-samsung-s6e8aa5x01   A 
>> https://lore.kernel.org/r/20250721-panel-samsung-s6e8aa5x01-v5-0-1a315aba530b@disroot.org
>> panel-synaptics-tddi       - 
>> https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>> Changes in v3:
>> - fixed minor issues with devicetree in regards to compliance
>> - added memory-region to framebuffer region for decon device
>> - added related patchset to list: exynos-sysmmu-resv-regions
>> - replaced exynos7870-pmu with exynos7-pmu compatible to the list
>>   allowing a MIPI PHY subnode (krzk)
>> - updated compatible string and dt node for j6lte's panel
>> - reorder properties: ${x}, followed by ${x}-names (krzk)
>> - Link to v2: 
>> https://lore.kernel.org/r/20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org
>> 
>> Changes in v2:
>> - modified compatible hierarchy to use non-deprecated syntax (krzk)
>> - fixed subject prefixes of [v1 2/5], [v1 3/5], [v1 4/5], [v1 5/5] 
>> (krzk)
>> - removed simplefb nodes instead of disabling it (krzk)
>> - added dt-bindings patch to allow mipi-phy node under PMU
>> - changed clock names of dsim node
>> - Link to v1: 
>> https://lore.kernel.org/r/20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org
>> 
>> ---
>> Kaustabh Chakraborty (6):
>>       dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
>>       dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode 
>> for Exynos7 PMU
>>       arm64: dts: exynos7870: add DSI support
>>       arm64: dts: exynos7870-on7xelte: enable display panel support
>>       arm64: dts: exynos7870-a2corelte: enable display panel support
>>       arm64: dts: exynos7870-j6lte: enable display panel support
>> 
>>  .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
>>  .../soc/samsung/samsung,exynos-sysreg.yaml         |  2 +
>>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 57 
>> +++++++++++----
>>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 38 ++++++----
>>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 57 
>> +++++++++++----
>>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 84 
>> ++++++++++++++++++++++
>>  6 files changed, 197 insertions(+), 42 deletions(-)
>> ---
>> base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
>> change-id: 20250523-exynos7870-drm-dts-87ccab731ba9
>> 
>> Best regards,
>> --
>> Kaustabh Chakraborty <kauschluss@disroot.org>
>> 
>> 
>> 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in 
> this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the 
> warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to 
> reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 
> 262858079afde6d367ce3db183c74d8a43a0e83f
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for 
> arch/arm64/boot/dts/exynos/' for 
> 20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org:
> 
> arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: 
> /soc@0/dsi@14800000/panel@0: failed to match any schema with 
> compatible: ['syna,td4300-panel']
> arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: 
> /soc@0/dsi@14800000/panel@0: failed to match any schema with 
> compatible: ['syna,td4101-panel']

Note: This affects patches 4/6 and 5/6, rest should be mergeable.
