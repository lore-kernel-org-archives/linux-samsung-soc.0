Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30031DF986;
	Sat,  1 Mar 2025 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740840610; cv=none; b=mOx5k637wt34vJpqwWEImbtv4p5m+ANJhXMQdnTd1eus3pHJ26SDpqEfgofbH5ym7jDouukfaZiV6dMXtx7Ekv9coQINsK31DnrvxNPCmzflPH03XKsw2YNRJVJCYc9TDRfGMgfHLLaLo5UrmNVvVeRB0CrkTD/SHR33X9799tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740840610; c=relaxed/simple;
	bh=dv6x0iYtgHNQ2ns9yHnsJFTE8xqU4p8nlVAKsdKx4Xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1lhHE5i4awL00/NpxlFeLJZ1buXcKBMzKWpiErUfbURJ2SxLZbzHYtp4HOKEJ3FILR2lH2MfAQkOktvjyyJrByqGDa1REarBBda9YeyxhC+8KMjjho7Xgznft6RuPA9wTTt109QonhlvKQkX2ghkIvDe3ZHsLxn9Rc4NUrz078=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tv0DE8Sb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tv0DE8Sb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FCCC4CEDD;
	Sat,  1 Mar 2025 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740840609;
	bh=dv6x0iYtgHNQ2ns9yHnsJFTE8xqU4p8nlVAKsdKx4Xw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tv0DE8SbU2QXAMEqip5cL2lbVT6xFD3q9xX8RfadIMDcBw00+f5b6/Ew+22qYEm8A
	 ylulnSRt2tKpVGIC18KazaMLIAoL+CF7pIvhdh3S/SwtzjwTSMJih07IDm0U1glzbm
	 zQ9j/5HzyI3spU/Cly8qqndz5a4tyGkd4W83x6CezsPUGo9BhrP2FUPdmkU3sfpxx3
	 2WswbIuLqHvpW/HkSDmI46gBCu668l1no73tIDX1bmdsJB1h09mqngBIZFBAdWX2DG
	 J0JBsre7jnDr2EY25S/UdC0hac1jXjKxhUA5CDxyypae7h6k+j/0KLKwqeCrbHp5tN
	 37TiC46dS9T3Q==
Message-ID: <7cd3bc4c-318e-4327-a00d-bfe42d4504c9@kernel.org>
Date: Sat, 1 Mar 2025 15:50:03 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223123044.725493-5-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250223123044.725493-5-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/02/2025 13:30, Ivaylo Ivanov wrote:
> Add maintainers entry for the Samsung Exynos2200 SoC based platforms.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e4f5d8f68..7da20faf7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20937,6 +20937,18 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
>  F:	Documentation/devicetree/bindings/sound/samsung*
>  F:	sound/soc/samsung/
>  
> +SAMSUNG EXYNOS2200 SoC SUPPORT
> +M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
> +F:	Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
> +F:	arch/arm64/boot/dts/exynos/exynos2200*
> +F:	drivers/clk/samsung/clk-exynos2200.c
> +F:	drivers/phy/samsung/phy-exynos2200-usbcon.c

Please add separate entry for the PHY driver.


Best regards,
Krzysztof
