Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE8F2F83CA;
	Sun, 17 Aug 2025 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755441649; cv=none; b=GfBtoIyL5Y0+aCn86uYmitoXcuKEdN+OMo6ndvc+PecB1wgad0Y6k4/M++X2rpWgHLKpnrAYgG3iTwfT/mRNoGPgIj0UH60X4WP5cXoeVIX2vHsDGbeU4+tJ6czG5fg9ELZRko75c9jPm1gHm+omSEXzKWM8aqKnfhHLj3sfZYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755441649; c=relaxed/simple;
	bh=C5O+EoyOlPQcNHOMGrGy4W+Ta3zzOZ7A+ckXJmSQiJM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=DMN1FVhW6f9t96//Si2skd35YHbnxO4vnO6EASu0+Gp3rTEWeGjzqxnKwivaVa3CllEv4O+UwjJzFgfHTRco2IuNjQzCFs/J9xmhHLxHUXTAEdOoCFGKbAvRdcFxJchkG+HIVskw+gqR0iq2PHtnn0MuIqp3/elSailGug6JgrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=DcvrLON4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="DcvrLON4"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AB83D20E7F;
	Sun, 17 Aug 2025 16:40:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhqNozXW2LyZ; Sun, 17 Aug 2025 16:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755441643; bh=C5O+EoyOlPQcNHOMGrGy4W+Ta3zzOZ7A+ckXJmSQiJM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DcvrLON4F3fL35nfNmHCEDN0tx/MKWxtBImknCbtLG5RtYWzvoSIjdegdBeHwfhUn
	 cqDgfyYD07SN+4pQBHv0W088Ul6PVjUT1QpQkRrxx5WsfYECGTRQo2KYtKKMk9wUPC
	 eJVvnGhhB541xeSCejMEQhxwllUilGdn1JH8uYeKMuoMUMpYOo/JD1bExy06JHiTkw
	 0oFx4LkHHPXvl0lDDg7o0282ZEWFE2USxRHwZXXlwkeLMP6Txkw22Z7E8QarZpuHV5
	 eMpAscHXQeg8K1bOadu4EY4gScUPOjffolyAFzKinvVCpGN39/jNuJHN0iPgWeQzSG
	 l3Anlo/R3u9vQ==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 17 Aug 2025 14:40:42 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: exynos7870: add DSI support
In-Reply-To: <6f0451ee-ddb8-4ded-8f0a-b491de9cc308@kernel.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <20250627-exynos7870-drm-dts-v2-3-d4a59207390d@disroot.org>
 <6f0451ee-ddb8-4ded-8f0a-b491de9cc308@kernel.org>
Message-ID: <00240935c664edaec3092354a303a91f@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-13 07:56, Krzysztof Kozlowski wrote:
> On 26/06/2025 22:13, Kaustabh Chakraborty wrote:
>>  			reboot-mode {
>>  				compatible = "syscon-reboot-mode";
>>  				offset = <0x080c>;
>> @@ -674,6 +682,83 @@ cmu_isp: clock-controller@144d0000 {
>>  				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_VRA>;
>>  		};
>> 
>> +		syscon_cam0: syscon@144f1040 {
>> +			compatible = "samsung,exynos7870-cam0-sysreg", "syscon";
>> +			reg = <0x144f1040 0x04>;
>> +		};
>> +
>> +		dsi: dsi@14800000 {
>> +			compatible = "samsung,exynos7870-mipi-dsi";
>> +			reg = <0x14800000 0x100>;
>> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clock-names = "bus", "pll", "byte", "esc";
>> +			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_BUS_DISP>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_APB_DISP>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_TXBYTECLKHS_USER>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_RXCLKESC0_USER>;
> 
> First clocks, then clock-names, please. Same for phys here and in all
> other place.

x-names followed by x approach is followed by the entire dts.
I will apply your suggestion in the next rev, and will also send a
separate patch for the same in all other places.

> 
>> +
>> +			phy-names = "dsim";
>> +			phys = <&mipi_phy 1>;
>> +
>> +			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					dsi_to_decon: endpoint {
>> +						remote-endpoint = <&decon_to_dsi>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		decon: decon@14830000 {
> 
> node name: display-controller@

This was preemptively changed, thanks.

> 
>> +			compatible = "samsung,exynos7870-decon";
>> +			reg = <0x14830000 0x8000>;
>> +			interrupt-names = "fifo", "vsync", "lcd_sys";
>> +			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clock-names = "pclk_decon0", "aclk_decon0",
>> +				      "decon0_eclk", "decon0_vclk";
>> +			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_PLL>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_ECLK>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_VCLK>;
>> +
>> +			iommus = <&sysmmu_decon>;
>> +
>> +			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					decon_to_dsi: endpoint {
>> +						remote-endpoint = <&dsi_to_decon>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		sysmmu_decon: sysmmu@14860000 {
> 
> iommu@

Also preemptively changed.

> 
>> +			compatible = "samsung,exynos-sysmmu";
>> +			reg = <0x14860000 0x1000>;
>> +			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
>> +			#iommu-cells = <0>;
>> +
>> +			clock-names = "sysmmu";
>> +			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>;
>> +		};
> 
> 
> 
> Best regards,
> Krzysztof
