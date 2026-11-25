Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605269;
	b=5IRTYx3nMPUnAPw/Yfpw34bUKKKL1KP8pemB/ruWcRLhcsVtaOdyE4/YInkSlfDSOG5K
	 /M9dTqS7pABsiahOSSt46QAXIJcgiOvxbIgqYB1p9TY3IP/EO/CUPkVxFaJIrj7jLTubi
	 hQuLG+PvIDYoszJrs9ZBX5lgJxnakFcWRfibznBLXsRFZoR1Ofk3sExF1PSa8ayBl5Q07
	 AHBGOC60Fv+QlvccM1PHfrlr/Nv/mZwubW+TOlk362GbNkZNUivV6VvGPr0fBrw4WZy56
	 gb0Lhf2L5ZE/Gf7/Gx8cOiuaQM+o0wwSiTxW1HRcHLFVHsAexbUKvBHFUE1TygvnITA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605269;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=7fI1oJyEyMEPT3m/RhXsKcyH/DScXen1rQTS+jBBulM=;
	b=CqjVgIWjeT9iPtmljgTfxx2YZ5zGQMpPTytb//bTB61XmT5a35o3dZg/1OvY83/5AANl
	 lK5B4jLiu16I43COfNLMp7etWgXzPGHBsgu8rr8um8YzJN+zjxRnLodVAB04ccKQUcF4Z
	 hQ+Bv4j8rnP1zsp2KJO822Ln66A/smS4p7brckUoeRUsumkeTMQv3wtmOH649KQrkH2w4
	 VUzVvio20tSHkAadnsLu8wsx106kol1mdFIkqo4xfyQPpxcBnqBoROnqge58ojjgau5AG
	 R2h7CkUFzx21Dwh1879u4deqSsRVQEMzKKxb60LdkMhtX+Shzy2MLmvDgvjUpji36eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g7UzI0Bv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C48606A321;
	Wed, 25 Nov 2026 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g7UzI0Bv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE50D1F000C6;
	Wed, 25 Nov 2026 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605268;
	bh=7fI1oJyEyMEPT3m/RhXsKcyH/DScXen1rQTS+jBBulM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=g7UzI0Bv+XVOMgsXSCGzwstBwZWt1kz35H/2jUMHmO79mNmISW/9egzFTA1Z3NncL
	 XetDK27JjoiWxVkT4drHSWzjHXTo2PLFElJJf7EgT/jEwSRiUf7u1IgTarxYH+8OaS
	 ibw8oLJkWjG+sDFQ6Z5GC5vKlSrd5YxR1M4yOf0/HV0t6ixZOtM7UyLuslUn+sirN1
	 ghxWTu1tIdDMgOIhcrpcXJPvzdnlCT9ZS0K/f1e8vk5lRXGq+oWIaUel38Pfo4THir
	 qu0lhy/izO9xKeVMe3mZfWrakbMsQlWzR4QjnzLIr4bmWk53y32HdwKVscI3jzB1uW
	 xsix9iZDbDQVw==
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos: exynos7885-jackpotlte:
 Enable USB support
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Virag <virag.david003@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261123092244.1792040-6-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
 <20261123092244.1792040-6-virag.david003@gmail.com>
Date: Wed, 25 Nov 2026 12:14:23 +0100
Message-Id: <179560526392.84329.18350547013510228112.b4-review@b4>
X-Mailer: b4 0.17-dev

> The Samsung Galaxy A8 (2018) has an USB-C port capable of USB 2.0
> speeds, used both as host and device, and is used for charging the
> phone.
> 
> The physical port is directly connected to an S2MU004 IC, but until we
> have support for it, we can still use the USB device funtionality.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - None
> 
>  .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> index 4b1961ca365b..5550b21e4113 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> @@ -59,6 +59,12 @@ power-key {
>  			wakeup-source;
>  		};
>  	};
> +
> +	/* TODO: Remove this once PMIC is implemented  */
> +	reg_dummy: regulator-0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dummy_reg";
> +	};
>  };
>  
>  &mmc_0 {
> @@ -112,3 +118,17 @@ key_power: key-power-pins {
>  &serial_2 {
>  	status = "okay";
>  };
> +
> +&usbdrd {
> +	status = "okay";

dt-check-style, this goes to the end.

> +	vdd10-supply = <&reg_dummy>;
> +	vdd33-supply = <&reg_dummy>;
> +};

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
