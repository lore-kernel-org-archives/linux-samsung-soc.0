Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F77A14A0A0
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Jul 2024 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719836865; cv=none; b=d6mszDO9aDqrPtlr9RPyv89XVh6qb9rpJ2sn4h9N0xOqVhiSnbAjCW8+BbCCzFy1yLicQQWnfXw8nzltq+ds0mu3swz8iP+1i7By6KCpQuSE/ycDiCM5VOALFMyN0jDcd/1z0tf+lcwfmrjInphDNaWteU+82c1I5NVxEHkw5dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719836865; c=relaxed/simple;
	bh=DKtxpPgVNtsn7K3hHeygsIzw1BFxEqTpvfTeM+AQT+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qgQrnaK/2e+Djiw/RUVJ6ALlKDwOpD4Amx0qUYts7Cnqg43EI9MKRr/zACPSxhQimediVNhkWbj9B8zxpzGPpqlydkvi6J94Uf+l9f1zdnQGmPQQuap3AfLwkBXFk6T9XOUuXW4Y5HjOh6xbWfJ4TCWr3xWWs3+IyvYFacrMA6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hb26X+hW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hb26X+hW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42563a9fa58so21456325e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jul 2024 05:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719836861; x=1720441661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbKJ1+fHrcfsxoNPssv5ufXQjSB4NnSOZ79R2VobUDs=;
        b=Hb26X+hWtdxku4kNvWXx2QTDnVXqfsxei5cJwNrLYvRB8BZ2vid8FHRGW1/UnU27Wn
         xe2aq0si6KQ8yIUcNgEjjh5rzdVDR6IYF96DmAPlgqLQmQBUMvX4TObcGPOu6GDpTXlN
         oOW5mq81QcpjRsP1Qo+Jg0xXqhSwcjw/uRZyAnridOfHTyifQzJIEQjIJUUesdsleCxS
         gS85qnhb6qErGTozxsyGFvGWCKuZ87UXCRvzp7CVnI+hhARkLLHSQP5/+ViLCr3PedNR
         MoxMmgkpqTs0ZWawGcL8g3j2ioyAh8atXsCfki+ZrFBNAPau9Fai1b/s8I+fsR8sajDj
         kRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719836861; x=1720441661;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbKJ1+fHrcfsxoNPssv5ufXQjSB4NnSOZ79R2VobUDs=;
        b=fbDLSFRnyvMXq2jv0kt4rq6s6Osp5em62xAwJl5XXECILydKOGLTsqawu9qnZURbY+
         7l198i8yvFq98HVj5TyARXvh98IX6/klrSuZrFlH1j45ZTqcR0iuPiBmnT0k23rEFAga
         EDEcs0SpK74UVvcOu49HmesXSVVIzNwrO7K2FnyyRM0s56ETpos4BJLgvyRk1CGNvNRg
         SC7gDHkrbD7Xm/PbcmkGJUSuqzXPWLfL5rrXS1aqabySr+UiyGwPoF4QOXc0QI/Wip+1
         MYL3VpCYy6NqmT+YCAF3z6TzUFa2d4JatbTOtjU8YDkCXnyl2kFmVR2Qg9UgGQeoSOPI
         nnwg==
X-Forwarded-Encrypted: i=1; AJvYcCV8zyCwixRsr/sbdG8CrAzAHHUz2QegADWUM0E83tCSlwbP8Q5qJbnpCCRyewsqkGEQxFcsb2z4yosPKhKqKoo8sVgEKWNacfCQ7QBa+yTM15g=
X-Gm-Message-State: AOJu0YyDAoLaCUaviw5sBXjVVjweKC7TVRTu9FH/FNPwPeKvau/e1yNl
	jWnO7qSbF20aCj2GgCOUZpyt2cgTx+wDg7WFayH2cqu1ba/0f0xxLCwq96OQ8vY=
X-Google-Smtp-Source: AGHT+IFH35xxvg5N4AtgQdVncudDweLagl90Mb/QWe2ODsQ64shBW9nGUOgVWRgqPVDQN+ts6wv3Yw==
X-Received: by 2002:adf:ab17:0:b0:364:a733:74de with SMTP id ffacd0b85a97d-367756a9394mr3104569f8f.28.1719836860636;
        Mon, 01 Jul 2024 05:27:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d90d5sm9961414f8f.31.2024.07.01.05.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 05:27:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Anand Moon <linux.amoon@gmail.com>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240618204523.9563-8-semen.protsenko@linaro.org>
References: <20240618204523.9563-1-semen.protsenko@linaro.org>
 <20240618204523.9563-8-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v2 7/7] arm64: dts: exynos850: Enable TRNG
Message-Id: <171983685912.414640.3760379043384228947.b4-ty@linaro.org>
Date: Mon, 01 Jul 2024 14:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Tue, 18 Jun 2024 15:45:23 -0500, Sam Protsenko wrote:
> Add True Random Number Generator (TRNG) node to Exynos850 SoC dtsi.
> 
> 

Applied, thanks!

[7/7] arm64: dts: exynos850: Enable TRNG
      https://git.kernel.org/krzk/linux/c/64c7ea42fcc2b972fc8d108642f4b8fabf0999c3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

