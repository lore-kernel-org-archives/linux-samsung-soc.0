Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89FB207DF0
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 07:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739430660; cv=none; b=VfKRI8esPecDANuodDYlmaO7CGVcWbycVGstDh8EgpN4i/Bk9AFtCSqMjEqta87vZ+4oNJbKiamFe1msxY5CSdvx6yjidaaCjULsT8mTGGNYyXZKRFb/UwjjXexmGaFt8hJSCh0GKEU15WeQT2Gcpbd7xtdxQQhrJsTtczvdEtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739430660; c=relaxed/simple;
	bh=1JzLXGxL0QmiLI5Q7L2Av98JRC5DJw0hUHJfC6Qg2Bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZEzSZ3JuYsDtuIdXkP16WtUWm4B8IpN2JvJOSEJySVz44Lfm8qzKJD6uMOVlOTMG8cbz0iTMUKq1r3187cFXzeljhM+cFtvpZXHd3tPsthyW9cUx0uYGRG8idP/9h1ptKqYxNwXsUBcZUV5L3JxX1cNhRRilVHZErhAuzPmKnUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=um1hTdoP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="um1hTdoP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaecf50578eso118796866b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2025 23:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739430657; x=1740035457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fM8nRNJfG7rUd02T8erTfV5HvN4Rbdhc15q2XjlMewU=;
        b=um1hTdoPBVMHAK/ZiGthqfaEd0BOvHcMehdhyGzNN+ELhG8nX3Q+kt3fSJ+4jMuN1W
         14UgncLJRs71GaPq/kRoZ9MFvParFrkUvKnRC3aa9ZRDiOYGsSJZZiKYqlqaWE81sF+I
         Frfj2avDxONZP9QTmKgXCAND2AAJQiTLtreLza8ti+GeLfHuX24jPqEHFWeKCoekWnE1
         awRAfC5weqdh+orzdee16f3p9X8Bfc9uIpd0ia46JMAa2aRishrNo4tx3T8nOoBc63ln
         oBPnrxrAOcKAlxlaSraoHGr6d+pSY5Ab4E4GJ+NL1HXvy7chia+tqOPQP9Uy2gUn9JiT
         jIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739430657; x=1740035457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fM8nRNJfG7rUd02T8erTfV5HvN4Rbdhc15q2XjlMewU=;
        b=I7QqlJ4QmlJbrUduQfXd1+k5FMu3p1daUaqLrIToEO93vNWzPJQE0yb9R8J7u/QPm4
         7R7HcDAwK5lgPEFtapnwokobVLtAqGRiiy6D1IWeUeLBcNFo5di7gDGXPkukHFYWKDkK
         vNao+Gh6AovoTUP6UcHthDKX/w9wCa2FBZghuvZLatINWApJu81yW7Zx5GCDssVky3tb
         y3xgPZ87PDgLFNlNjr4+BGBVx/Z1SP7nzP0tiI++idJo+oSRTimXQu9UPqsoTaBEnmlV
         2H4qk4t5JvRcF5lVyyn4Bpvt49dwxkrif5at16BcBIp9wrzxuD+yYG2+lp968lF4Hnul
         duXA==
X-Forwarded-Encrypted: i=1; AJvYcCXl+IzgFi8ofH2vcLVmoDkf1KVkeHwHrddLEx79NKwrcDuOtB2Zjh1KD5XjUPruUGCfjzy6tMntZmcabEgj0GNGqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywef8DdH/ZOl9DuliRr37LIkdfu+AEAwWIe3ldBGE/S53rdB0VY
	AmVZYyK83pGbKH7T73SrOGBbE26UPSHyD6IPaqGAM/GSwWvp6E1R9yFjV4ZNK7I=
X-Gm-Gg: ASbGncvGTS9/WVHdPnapco2M065PvzT2Rp3pTsIby80GRnugZgtjg3eftQvmxml/ZuR
	dXVfsz75Tc7lAArDEjo+YcOtuKKhXnTdzpIsGviviQJc2ewbm0OjnyqY8LdQYunBifQZUFM2wg3
	JLWbuzNNKFzDtPAIeMB6esrzx53pmgo7v0OIOYyKSXeWbOvE97sIJX1RMzcbRXC+h/rNMw7/auZ
	6tQqpOBO0c0+RzeOMJ6TeD1gbFP8XmNF0PPY78H3+ry8Z2ToTcxBVHpeuoBUVHUyZeSiyPj61ZL
	GtEXeJ2EssBxj2x5cbFdPGHU
X-Google-Smtp-Source: AGHT+IHtrPRE46nXKkFCt4DHjiN8hmdANTLc5iX661OAdX/npX13cIu7Ky0HIkuVU57aNRMuRQab9w==
X-Received: by 2002:a17:907:3d93:b0:ab7:8520:e953 with SMTP id a640c23a62f3a-ab7f34d4f0dmr512307166b.55.1739430657085;
        Wed, 12 Feb 2025 23:10:57 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d349esm659748a12.33.2025.02.12.23.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 23:10:56 -0800 (PST)
Message-ID: <feefbcf2-e441-4cd1-a3de-40bfd4d7197a@linaro.org>
Date: Thu, 13 Feb 2025 07:10:54 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] spi: s3c64xx: add support exynos990-spi to new
 port config data
To: Denzeel Oliva <wachiturroxd150@gmail.com>, andi.shyti@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, peter.griffin@linaro.org,
 andre.draszik@linaro.org, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250212191241.280-1-wachiturroxd150@gmail.com>
 <20250212191241.280-3-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250212191241.280-3-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/12/25 7:12 PM, Denzeel Oliva wrote:
> +static const struct s3c64xx_spi_port_config exynos990_spi_port_config = {
> +	/* fifo-depth must be specified in the device tree. */
> +	.fifo_depth	= 0,

have you tried testing without specifying the fifo_depth in DT?

You'll probably hit a divide by zero at:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/spi/spi-s3c64xx.c#n664

I assume the controller can work with 0 sized FIFO depth, and if so, the
driver has to be updated to allow 0 sized FIFOs.

btw, how did you test the set?
