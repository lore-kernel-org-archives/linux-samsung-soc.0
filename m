Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05F1946A;
	Wed, 11 Mar 2026 02:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773195154; cv=none; b=JBTqk1mntAXUlKoPZ03Z1oWtsY1Io6318OEA4dUoDJbcWmWgfWHF+eA2U+pCqrNtKKiMVOGHH9j8neaVjDjBNERQQ7ospbe4NpsoiwUt/iUnI5Un4H9m1QOJsuloifilOhkpn2RXgKEUh1wWdBpzWuBbkjFGjucq6f/8q/4hUqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773195154; c=relaxed/simple;
	bh=4CnovYDhNoNio5xEWsPkE1GeUH6w6lWSrJIetu2UlqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bCRBHZab/H2ipcYziKzB8AoexCst1TTixWLFbHXapL+AIf3HQ+ZH6XaaZW4sTPbgyS3MX5fXI7P3FlJHC2Aph7eNBRxlq3qU3zEBZA9Ax0dyccleZOIVl7SOSLhGYOmQVlXisXdlf5p4TlQwjN21h5W37R1HBsfT/gcUWSEDF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACL9ssfN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACL9ssfN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEA5C19423;
	Wed, 11 Mar 2026 02:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773195153;
	bh=4CnovYDhNoNio5xEWsPkE1GeUH6w6lWSrJIetu2UlqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ACL9ssfNiEmsJs0gEXwX5Fi1mKxQ7XWjCAL/GkRFhXCmTbFz4m+w2YgGvzsfVtYaU
	 FhscloNlnTwRc+pIRWGHtYayFZIoTatIQ0EEsMskA22NcugVW9eQAelo7a5xlp4N1X
	 VJifoQbj0w70CCGZDGF+35t81QoFS7dFAH/sEIv9gBiykpDIccxiSbdh9aM4tu2mjJ
	 gxt8W7XHt9ILn/IOWiqFA2SN94RjwnYtaxsM/YQBk1n09PqbGnDBq9GPS8RBli9dnb
	 MzLGYJaet7Z1NwDoAlIaMZIgcNMMZGFKA3U9yLoVjJ0YstnuGUpmEVEb5EpJMCgCTX
	 HzcPXz9ogRMAw==
Message-ID: <fee9a7fa-8195-43d3-b534-efeade00f275@kernel.org>
Date: Tue, 10 Mar 2026 21:12:30 -0500
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: intel: agilex5: Drop CPU masks from GICv3
 PPI interrupts
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Marc Zyngier <marc.zyngier@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <bdc7563fba133b600ad3e6c1ce8cb1e5856b1042.1772643434.git.geert+renesas@glider.be>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <bdc7563fba133b600ad3e6c1ce8cb1e5856b1042.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/26 11:11, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 352c96d144a84102..02e62d954e94905d 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -152,10 +152,10 @@ qspi_clk: qspi-clk {
>   	timer {
>   		compatible = "arm,armv8-timer";
>   		interrupt-parent = <&intc>;
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   
>   	usbphy0: usbphy {

Applied!

Thanks,
Dinh

