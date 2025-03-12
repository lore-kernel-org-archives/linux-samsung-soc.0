Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217861E9B26;
	Wed, 12 Mar 2025 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741765358; cv=none; b=MW1U8NJJ0lQrrpjyOkRG4bx6mBEJ8xNhoPJ0rucqgkrD4yGlMQXd/UHv/zbRygxVGuIBZ0LT8857UsXZx/AL/YFdHbOUfnMz0HwEfFt1PpGEwcGurLrn9gbpK9GiqXt2PSFd+5svWS0/3I/QVKl23J26BwHrE8QwWRHOZsbD8Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741765358; c=relaxed/simple;
	bh=0+3K1JjGv2ZJrwUF1z9sb+pJtYMDd/9MvBQOFtkSPC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DIbc4C2hGq+um+9AGRIsxbMRmals6jnhzJw0TSe5EUOQ7geyJVwCeOh1erfMrIGphLxdfDijyWZr72cea9fZFNDwdPtDGUvdPg3G4dHNvnJCmttWY1SxQiWa5Ssr2zdSSdPLZS/dQiYCOAinf1jfxAjk2OhtlbuaxDdMpQ3hte4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txgwx8YB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txgwx8YB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9F5C4CEEA;
	Wed, 12 Mar 2025 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741765358;
	bh=0+3K1JjGv2ZJrwUF1z9sb+pJtYMDd/9MvBQOFtkSPC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=txgwx8YBgYcFxrslUIdfZfFXJkwdkSd9coCamnFyUj6fcSrDTulfb83N9fwH5Ax+k
	 TJFfUXLRPpIQdQILPHEef//By6iwF2TlstxxHpJiydbBjqAjuNWDoxIk1xpK5157pj
	 qM7DTi/U1vPQtOf+E4QyMhG4dK6PER/s33V4FTzcWbDr3fLR/Fkh/d/dvLZxzZzPUZ
	 J1hBuYEH+K5S+ctprwYn5fHsoyvdLTISiNcBOWhh93wToMN+anZBXePJ2hqp3cm2FB
	 WaXGkCDHqRaeI67GG2MKTxxOAELSw/SScBYb7I0UvkkXoj3GjXihOY3qfhBgmVwgTh
	 hF5jQgSEKHBlA==
Message-ID: <5b68a9c2-9145-4131-9fa3-10810c51691f@kernel.org>
Date: Wed, 12 Mar 2025 08:42:29 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: exynos: Add DT node for all UART ports
To: Faraz Ata <faraz.ata@samsung.com>, alim.akhtar@samsung.com,
 dev.tailor@samsung.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rosa.pila@samsung.com, suyash.bitti@samsung.com, abhijeet.s23@samsung.com
References: <20250312061932.1797993-1-faraz.ata@samsung.com>
 <CGME20250312061058epcas5p3ccf293213fe883129358833572b17d92@epcas5p3.samsung.com>
 <20250312061932.1797993-2-faraz.ata@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250312061932.1797993-2-faraz.ata@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/03/2025 07:19, Faraz Ata wrote:
> Universal Serial Interface (USI) supports three serial protocol
> like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> Add all the USI DT node and subsequent uart nodes for all the instances.
> 
> Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> ---
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 494 ++++++++++++++++++
>  1 file changed, 494 insertions(+)


Please do not combine DTS changes with serial patches, ever. DTS has to
go via separate tree.

...

> +
> +		usi_17: usi@10d800c0 {
> +			compatible = "samsung,exynosautov920-usi",
> +				     "samsung,exynos850-usi";
> +			reg = <0x10d800c0 0x20>;
> +			samsung,sysreg = <&syscon_peric1 0x1040>;
> +			samsung,mode = <USI_V2_UART>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
> +				 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
> +			clock-names = "pclk", "ipclk";
> +			status = "disabled";
> +
> +			serial_17: serial@10d80000 {
> +				compatible = "samsung,exynosautov920-uart",
> +					     "samsung,exynos850-uart";
> +				reg = <0x10d80000 0xc0>;
> +				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&uart17_bus>;
> +				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
> +					 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
> +				clock-names = "uart", "clk_uart_baud0";
> +				samsung,uart-fifosize = <64>;
> +				status = "disabled";
> +			};
> +		};
> +
> +

Just one blank line.

>  		pwm: pwm@109b0000 {
>  			compatible = "samsung,exynosautov920-pwm",
>  				     "samsung,exynos4210-pwm";


Best regards,
Krzysztof
