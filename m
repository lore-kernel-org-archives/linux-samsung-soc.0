Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54D71A7AE0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 11:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724239743; cv=none; b=JEI2PsQN7/XWS/e+Fp6Y/VI36kvePPsKBSk9bhKRPNCTVzq8Cp1YRFdvmJqwEl+NgpAUsqpdD7thufJzxmMpbgl0H2YWlxD8MEahMvqCTS0/sUsEfAmgD1DaiJQ2y7/KoqKn1AXsOif40wJGrNmsoK37yZz9OTUtSfe0AhcDXiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724239743; c=relaxed/simple;
	bh=533wRt7wl8s+Xq1V94rO71Jq/CuUXXPLqXQYc44C2tc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jpi/VSadQ+5TdFYtU+X8+H5MvNl6XLkUHetegGXA4nWo8XkSedfY/4v7JMQoNh6PUlHtdCeVWFL0H1axkxs4pDlJCmW6gUmyAa+6saeZCd4mqUrturj/Gx4B0/I9eEspqg0hmQTGq4l805Vfucsv6xmRiTHostpqn9hMawCOYSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GXircaAq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXircaAq"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-371a939dab9so113766f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 04:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724239740; x=1724844540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnVkYJTcDOKtCLQwYqRu5j6J/gYl7QtS84vF+23ZA/g=;
        b=GXircaAq8JrydHyqXWFAaTHZI/GSkQJAh/AJEdWJ42N3RyZZXRQojmka5iWxI4dRjX
         V0GGdfXQ5nNHbhltxxAhA/hSwQbY9zwrqzY3VkPFUE8BM6BrDqL5ElmAw7jaIQbFCfmA
         9E+ZFWfDWS4DIiSsUr3kO74IzwhU4YUxWH0ZKn9gHPvED/2DkKnJxCfy3VxaLfHaxKJl
         avsT2pgHKF9O+EHyqnaXE23lIjtRkjgxT1XcH5HiNGhHu78inwvnNgd/rt9CszCQi/a8
         jK5ecD4egJ1X3lURSV8GUXwSG5wO39M+FuSQrxnMOOFMkkEvRdVzsCNFTXGSMwp0nMu6
         /8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724239740; x=1724844540;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnVkYJTcDOKtCLQwYqRu5j6J/gYl7QtS84vF+23ZA/g=;
        b=jIKi03W1k1+k8b4Bt1133aP8/xNINcRlkqmfpOqxsgmUOkqMrGuWnj0iRbH4wv+JDI
         5ixIVBzMxHybQ8MqR+iWKALjIZ2wVJ/pfbjdm/TCX6Wuaz25xK7Ps6J52KahdOGrEiQm
         Ziw8FsvOW4RjzEN0PtmeyjWiSV2kLnJHJO65P/wRoxhO7BZ3zkJkPAoMkOblCTorwBCc
         PslsGjIYCHf9PAxm1etxsF57AS+2AJFrA5gpcUFvOXcVKpI41ydh1Aw2y8adWpQn2BVk
         iak4c3QKjjuVKapTNfBuzj6q49+FiE7r/Ks+zQ+d/n0tMH5mO0sPGbyIuMoAQ3DxRCr2
         yW/w==
X-Forwarded-Encrypted: i=1; AJvYcCVCy2uLxErdq7yXO78yAraLyU2aE1sTLLdy2uRa3TA1pbkCcnxJeFeK27wpgEzywJPd/oi80JaI8iBLJntgYXtNgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylSdhUzilvyiGNl7egNMHSTQslPWEO31/gFJAsg4NV/i89ggOK
	iEVRVpHo21cAjk2Owth+8q8bm/+p2lR7u69qqCRiYAPuwMmrItJW9Q8xcRuuirE=
X-Google-Smtp-Source: AGHT+IEAlDPnqiiYjouX6YpiJgvfNheccSjha8iIvn391TYIQoiP3HQ77uaLB0NYQG+2NQDUUUCucg==
X-Received: by 2002:a5d:6d01:0:b0:35f:2584:76e9 with SMTP id ffacd0b85a97d-372fd584827mr841459f8f.2.1724239740101;
        Wed, 21 Aug 2024 04:29:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189897926sm15446926f8f.87.2024.08.21.04.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 04:28:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kwanghoon Son <k.son@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240819-add_sysmmu-v1-1-799c0f3f607f@samsung.com>
References: <CGME20240819075546epcas1p355a3c85ffcea2c43e8f1b2c69a0f3b4e@epcas1p3.samsung.com>
 <20240819-add_sysmmu-v1-1-799c0f3f607f@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynosautov9: Add dpum SysMMU
Message-Id: <172423973836.252925.2617927566866963313.b4-ty@linaro.org>
Date: Wed, 21 Aug 2024 13:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Mon, 19 Aug 2024 16:55:45 +0900, Kwanghoon Son wrote:
> Add System Memory Management Unit(SysMMU) for dpum also called iommu.
> 
> This sysmmu is version 7.4, which has same functionality as exynos850.
> 
> DPUM has 4 dma channel, each channel is mapped to one iommu.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynosautov9: Add dpum SysMMU
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

