Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A774400998
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155341; cv=none; b=WyhVWMJxQtNUztiQOmEZd5jnLhTU3oJrrRI809Nu3/ttUrx+wyX1b0r3VdvwgOnXHzP383xexYatjyAzIT4/0DbQRskMbYEtOWZ3tLoFm/fSOgil0grL1aA+qb0kWD58fJSD5bn/O/i02JcRRbpMh0m/MBuNxW6k4oM28GfC+Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155341; c=relaxed/simple;
	bh=oLOqVKG9UgKjxgeyZoIzdCt5yWA6kY2ND7SIK+hrPFQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YN4j3cZQ04NnbABxpe0vAlv4WjeCM57ycMhhyLE3n1oKd/iU7QLynwzkaJWNWCa/i4mnfrux0LO4qxt+RUulPtynYUpihBm5TEjPZRiXxU7tQZod7gaNWBM+1+BWxgzE0+puLCVU/IUwUrtUnNNpHQoBvC0mviwQ2DKC6UxeCSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GFLuKU6l; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GFLuKU6l"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso5173064a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785155335; x=1785760135; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g+XCkwCvaAAuIZkZZLVZsURFvoJh/USKiob5RH57mbY=;
        b=GFLuKU6l1JTdvez+np70k/IQqjYo9i4C1Ya12pvf8RpRyLB/qHP40Ly1F84c29DyT3
         ajghf38Eionj5y2dOGz6AwY9D96hrbRmUg/QSRAcprdtC0N/SNCf3ElQ2eaZKMrYJY21
         3xGQ4QmHFudKk7+gDeBXonhpc4OSlCvjSmVlsGiezRpPp5TrjWc5r4cv7c+B6ffPvbo7
         Bdywd9jGEynyImkgaq4d4cXpn3vvQa3JHHZsU7ANEf5b5+G2do70q95zjcWES1AnVimS
         gmDnyeuNMSMAu+1koyXBCjmoHUd3wT3kM83nl1GW0J5JVKdRSi/rBGuCIvVfY+bX6Tmf
         5v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155335; x=1785760135;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+XCkwCvaAAuIZkZZLVZsURFvoJh/USKiob5RH57mbY=;
        b=Y5pEt6tNbAkF8lcBwyNTYrEueU6ePeXnZ0khKrc94sBHxIDLx4EwPiU8wqzPMEVd8O
         lcdWT+QOG+6JOnduTVHVbrcTuKDYAAc9PNr5OsDn3TXrdSDBTXHHDLALBWzI0WjRb6RS
         pc1bDCMag3uJS4FooT2DdXAtSYRk7MvGxZsda5KfujBtAel7A40c3RtlWXJuJM0s7oz5
         /AV6HiRhAXkQTXpwyEJSwqzXhdCyZiqkDyFCRwEKutmGdiO/41vRw+Gtd768b/72/G5h
         puU03jzCMRcNSHHvQi99f2xk76laMQ3Oe02gGUVhT3cgECdzLKBV6jfKlEWVIPfyrcXq
         CGTw==
X-Forwarded-Encrypted: i=1; AHgh+RpZcXj+Uy+A4DutKjCCRasfI41k0VHNzUIQd+dK9CLMl12oEU+QKUuLIuqokoJ9NOOk8ezfy1XHL0CI6RwPzCfNJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs//8PhR43XOym1opJfTjcZjguha3HrGTbkzCZqdGal2yfMrLe
	ya0NAHgm07XLWXq1TD/KYWrQrl2jHsSIE2S3Zxhwuf/90ouMgLg5sS3n+k7LEsMfXRc=
X-Gm-Gg: AR+sD11ve8YpEo7iXSZcQJl6AZiO+aI6reo8UhGj6IRKrI4A1DW9RpRvtTg6kWFRKNI
	zGIeUvlGhGoaG6exqgfMM4nGfVrMsjgvjM3+N7/wDUlW4RET184cKrlbV0ZTeBLMHDzTTXSKxAu
	MQjskRc7oJiisDWD3G7yNomuBSNhjO8UEohlcGg0Wcd4M+Ivi0MSpjHg6SOTpSoTj7zn8ERtohv
	phfOi/xi4frbZ/I7HLpIVyGXoHZNBojYGKk2StZK7yJMmu+ZLQ/ZGKjcctloRbshdDyyCg3r0kT
	tc4wR/oo/5KwMDmDNSJpFF7AUrvLo+1dsl+c05v2P+GGbudIj2ExUQU2QIPEcNSeA3/pNxrEaTn
	nuPGkIneGx3rQJhtTE1M09qDc4qA4IlRIrQMqoITC58r3Cd4YkfzWpNI0AAfbfJ+4gi7I4McEn7
	HtNqI+BhUsWj8ybBoyANoR4rwlSdk90BMvpN+P9YcSTlzPmpwsTV8EfspQ8xRCcTFl
X-Received: by 2002:a17:907:3d10:b0:beb:d461:7b09 with SMTP id a640c23a62f3a-c1f1fc592a8mr419795266b.11.1785155335110;
        Mon, 27 Jul 2026 05:28:55 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:13d0:5c8:5900:a6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90b4dsm636270366b.35.2026.07.27.05.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 05:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 13:28:53 +0100
Message-Id: <DK9CR2QF1U9N.3UC55U0EM9EJJ@linaro.org>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos850: Add acpm SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
 <20260723-exynos850_sram-v2-2-c94968e52f42@linaro.org>
 <20260724-hissing-fascinating-terrier-6b754f@quoll>
In-Reply-To: <20260724-hissing-fascinating-terrier-6b754f@quoll>

On Fri Jul 24, 2026 at 9:38 AM BST, Krzysztof Kozlowski wrote:
> On Thu, Jul 23, 2026 at 04:29:47PM +0100, Alexey Klimov wrote:
>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>> information and configuration data. Add the SRAM node.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index 3881f573ec08..9a8d92aae9a8 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -917,6 +917,11 @@ spi_2: spi@11d20000 {
>>  			};
>>  		};
>>  	};
>> +
>> +	apm_sram: sram@2039000 {
>
> Looks oddly placed, suggesting this is not part of SoC, but all MMIO
> nodes must be part of the SoC if this is SoC. Compatible says this is
> SoC.

Thanks! Yep, I'll move it to SoC section then, in the beginning of it
according to sorting order and address.

Best regards,
Alexey
