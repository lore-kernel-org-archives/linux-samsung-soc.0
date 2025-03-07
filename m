Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26CE21B9F7
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Mar 2025 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741359991; cv=none; b=HpCiBIva7pd9CXIOQtiwWh4t7GNRwRhRDTb+GUhGdUMtO3YabiNhzginOpq8XwWXW9prvb9K6fnW4OU/MkEmRknA7rarbeYP9mUr7puu6pE4DgiaPfr+Fu6rCSStDQJUZXyQR2J+LwH2c8VosI0PLbmtqjzS8/j31vXkPQRKc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741359991; c=relaxed/simple;
	bh=9Y/Y73m9zuvLRA6vGtkNTS7BPX54Zx9NPuwy9xoTbQo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m79GHlrQ8V0m1r3gbWPAH/8RcNWz6JqoWvu9lGqikc9DoWq4M56Okx+wsQS8tvi/nithiIvtn15pnR0LYidnqXAZ17BCOpN2/K+MaEqsiizvjBT3rLckWnpt4TJK8s8hDS5NmgLu1hol88liNV20bdxu4ZofgTY4uZHe61HxNPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wxd9Q4Ml; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wxd9Q4Ml"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912a28e629so66616f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Mar 2025 07:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741359988; x=1741964788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iArDif38+fZWZHkgSuOxfgSy+rEDqBvDc+u/YR4aXK4=;
        b=Wxd9Q4MlVmNFiwwtrfqzzFBBOnHB7G46pBet8K0p9sePNyrr6/7UwxCZQQEV7OlTuO
         qR83GWnJ7XYmaK/ecey4kFtw0xG/+H70Xq9jZoXcDeU8SFH5OFyR46M7ep0RFez4Dc1w
         pZKHEX7BxLg5kNIkmyASxTi89/lr5hEMDZkCpXDFHlB1Eqgfd33DSVoGxRDECSfFZtTN
         xVHMABYa7cj5GLnUjb+TujiurC+PNun83ubzA1DINnvS7aMWh/N//TNXUfSWmWL8zBv+
         RJjq4hvbwr1SWz//MwkvsiSbCu4hIYFRnrbOdlCEmmnkKzQaqeEKf9E1sef9q67rRwzR
         oekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741359988; x=1741964788;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iArDif38+fZWZHkgSuOxfgSy+rEDqBvDc+u/YR4aXK4=;
        b=TzaNfR5YqCjsgsDxlavlRIZoGVp5SKsXfXBSjC6+HInhnWKfw3YQoIxQ/sc72Xrcr/
         T1J/K42J47vQI2S0sGZ/OooXB74ISWN2A1Xm8dLCdTGy/aQBeYInjrsTOSv842qUNFo8
         d8hUw0bPeubCkZ/YmXgcZEBtunf3M82Aj/AOhgotbQC/y6tqPR9XKzrlzEjhL6YzRx9P
         5HCR4qVq4qHcIDZpZChquGsLkZ5FQWGuBozM6rkqYZu9DNhk6HoXBsuKEqvrym33RBkK
         N5WrmL7DPxs+sEncPVkz5CwEmmQx9jvq6BA31HnOjUlmizaD1hqkNGSbwIQIaBX3Ssb1
         beWw==
X-Forwarded-Encrypted: i=1; AJvYcCWO9vHOFIKtMpuUu9oVYLnrCK0Is8VnwhDVCrbtxL+1BGUEVLbMqhFoC1cTMntTOqxYTQ4NPWiF5bcJxHCn6U975Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/2CEz/Pqmpp0uL5npkYORM4Xjraawi+P0SDb2z1HZqpl+74Ze
	O1wiW/S6k9qnJpdbCjqHQpETpMP+exj83XQ1c24vs6CtxYpFdjUHUn1evoR8tpk=
X-Gm-Gg: ASbGncsEaNSXWirrpk6R6bgfnbWmrBZNn7PVyofBPkUdXx7IZe8p7RCsFc6ufMEnSgP
	q3fyODK9Ytpce/is/zBZGB59cn49oFo9o0IN6oQr1Je1NRl6u1XsYbZYXomEQYVkpYlhI+Oyvzt
	Yk/G+g7v9qZRITgfQf0Wi/2d4wA6YwNZ9plbjYl0TH8lJAxBteb+6naGhhJNq0+USG3qj0UA5hu
	ac6TcZf1aARQsnX1chRzDqql4XJfRT7ThHJ4884QTTO+lAuZVFdVL//A4n2cBJBjSz0L0avIN4S
	9ic0ZUznMGBHlvsECWjXWhTH+sak85uW4ir+gWwZSmHk3Uoy8+2mlm2zUhO+
X-Google-Smtp-Source: AGHT+IEepjQ7imgYoD7q4HWijAiTHHIHKB+RaF8r7Ya6WdH9B4Go9g4Q6bd0zl6386Q12ZEaV7KLTg==
X-Received: by 2002:a5d:5f92:0:b0:38f:2b3c:569e with SMTP id ffacd0b85a97d-3913a8b4205mr53814f8f.11.1741359988167;
        Fri, 07 Mar 2025 07:06:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e4065sm5694633f8f.62.2025.03.07.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:06:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-fsd@tesla.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
References: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: gs101: Change labels to
 lower-case
Message-Id: <174135998630.202917.16887190642980215810.b4-ty@linaro.org>
Date: Fri, 07 Mar 2025 16:06:26 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 19 Feb 2025 09:57:25 +0100, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase.  No functional impact.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
> 
> 

Applied, thanks!

[1/2] arm64: dts: exynos: gs101: Change labels to lower-case
      https://git.kernel.org/krzk/linux/c/73fd2bb607387a77b2dde43a2c47db2b71c65a96
[2/2] arm64: dts: tesla: Change labels to lower-case
      https://git.kernel.org/krzk/linux/c/056106b030b73c7d53749469bd1cdbc89b4d2daf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

