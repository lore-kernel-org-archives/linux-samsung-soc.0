Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BD9285070
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242334; cv=none; b=MEFSaTZTMp+8mAQyZIdxdPILmUpcBr32ghE4BPlu7mswmh8OG/sPu2HZNIR8QlGw3CKPc3HXEQPSBpMx/afptQtpIxgzqIytxHG+Sw1ic2oOg9PD/cO99jYlr/ckNSwC8mG1F71opHmW37dGnuPmRk7j+LQu2XAGl1ixH2yZJ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242334; c=relaxed/simple;
	bh=WBj/VFHzpOBMITsYRlX2s8PzOuHxOLyagX79hheuk3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZIS4RDKRYqZ0hhnVXMor2ZfoTsZ9RDJ2qNXsEUQ+UhSPQxN7tDZCjLLFocOXuBLHHxBV2AjlDGu0pYkczy+Qp+Gda+VSTLgEskLjX5EHxqy3VvYTXSANYrXop/wOz1pxyYdhqMiIxoN9AozXNX3QnaOZMQCGLFzstcvKGzTvySk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AriadzGw; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AriadzGw"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so392088f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750242331; x=1750847131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aooWiy38peBjxv+9KQHPPSmI2vOz+cAS4Yak4J02roU=;
        b=AriadzGweMggYAAAVqJWvi23A76s7KtF8a3Oj2lZmFYRlHpy5aA1ntLmWgUu8qjLpb
         KSclMBpgpM37NpkUcfmd29VqIUFgNn1KjEiXPaXhbq6BCFpFFUXj5Hl1gQLlJ7h9ixPx
         gca1Q252jOK3IsDZqeKAXMiVFsm8paIFBsu8XjJKN35lgdBe2s6m8AKN1Yv+j6PJtp5o
         lDTF3jYzD5wKXzK9hyTrAIamA0frzYfLnQApqIEqQaHr4OfOUnoxdd1DAi+Ink9dVta8
         EED1m4cOs/trbEnAyr/Fyno9VLkSYgex8LGvGjzlumbIjMTJ3clmTOfLuVC+F5cTYy2e
         puog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242331; x=1750847131;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aooWiy38peBjxv+9KQHPPSmI2vOz+cAS4Yak4J02roU=;
        b=usBT2ez28nvrWYeF5EVM1yOCW+/ifgQUjdZ6YEH0gsRetoKPf4B2Y7wJ7tOBWuQDFL
         4Sa4045fHZKrUGuakji8vA3JFSyz18z7S6wmXsKyvMEMu0bqsEaD1h34ck5DtohYVgUW
         o4ApVMsevTtjpy6OEYHaRBXdXHhO+U5ZAMsxD6D+3JTn4KlV1BJeKzGYXJDLQlr/0gEY
         qTbHAS6B8Yo+Kl0yEagdcGa2K/3nGQ9eA0vDGnRHbVtdxaJB1/csKhUSGV8BW1gIMfkg
         Hcfz4uhIB6sKphmLExC4KAeymdT8AXBFtcJGRhM25+adM/f63ZFgvte8AlXqfE2uiGet
         DepA==
X-Forwarded-Encrypted: i=1; AJvYcCUMrIHysoywRLXf3H5G782SJP0MTWzInz5P4fSU0ErZt4icwnjvOtR6x/Q2chSAybb2FNKNxtuok9G5EgkdaumTPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmHPj/IeS90+0ozLa7vhZuEC5wFbyBtjyErPN94zDoyD12hAPG
	0tTmW3TYTna9AuBoEFpPKjHDa+WzYcpZtiIb3OexzauccQ2L6kT9fOm1uuzOFjGG7awazzR8evE
	Z28lT
X-Gm-Gg: ASbGncu9wf1gRcbUrOX75+LzByUDMumFC07/Q2eeJ2UnzFxekdoADfr/WKEbgFlZ4Tr
	+F4Gy2WwGkqBjUFhNFILu1ZHjUHLCfVkEyQIB/4SSJ24In00sheoGjlh20bkyTswuGsLXDT2Xq3
	fwwiZs3WA4qVrepxjKxtBrzaAxioRNVolhHSh1TQDvL4we7yhiS42h9jl5c0mgX5AXtnqkzxVY4
	PcyB9d80FflVB0fPcCEzgyl0DFyiqEuETEdTGN9bp9E5vRaqad4lsM4FkQmmisl4k8fLhF0yx92
	mevLtWi9Z9H+xdGycsP1mzGNg6TIqT6TsK5YAYEZinbDhCE/QJH5hR7SpP0q7VMWa/CFBu5bFgC
	ztpUTc9g=
X-Google-Smtp-Source: AGHT+IHJc2gsfkafUzYDEVgL2gH8eVceTDIyYVW64SCKXWQQR0AR9QQt8oTeByDjnRB/rhjrFb0byg==
X-Received: by 2002:a5d:584c:0:b0:3a4:def8:1465 with SMTP id ffacd0b85a97d-3a585f73c82mr2051598f8f.9.1750242330796;
        Wed, 18 Jun 2025 03:25:30 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e256630sm208260265e9.29.2025.06.18.03.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 03:25:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 alim.akhtar@samsung.com, Faraz Ata <faraz.ata@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rosa.pila@samsung.com
In-Reply-To: <20250613062208.978641-1-faraz.ata@samsung.com>
References: <CGME20250613061230epcas5p12c0a029edba39133fc0be22cb0aa1e09@epcas5p1.samsung.com>
 <20250613062208.978641-1-faraz.ata@samsung.com>
Subject: Re: [PATCH v1] arm64: dts: exynos: Add DT node for all SPI ports
Message-Id: <175024232949.57697.16977719390655455377.b4-ty@linaro.org>
Date: Wed, 18 Jun 2025 12:25:29 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 13 Jun 2025 11:52:08 +0530, Faraz Ata wrote:
> Universal Serial Interface (USI) supports three serial protocol
> like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> Add spi nodes for all the instances.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: Add DT node for all SPI ports
      https://git.kernel.org/krzk/linux/c/134442a04bb9a6981923cbb24f041b5f5690bda6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

