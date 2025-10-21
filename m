Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54686351FB4
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074832; cv=none; b=mCXGoyH0Yodtjfy+jd75hS2QVzb7QeHAKX/FDmkvUWQGaKJ/Pqv/QDCfexpKZQQzEEcRtQVJzahrM8TxO5HWO3npmnP95133H9vzV1N9DrBmJZkwLVFILiCLQzloAJb7icIaHo2EYR3RYVTP2B3SIPj9PlJB3jfPYRl/wvfTH0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074832; c=relaxed/simple;
	bh=DeJqDi9szQA8p7WmTtRsNFt70PHzVsGKe9eHiJ9l310=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t9viTO/7fTwc07UUhRS+h0rgtxqs/GxodXGQbMzJ66MYX7vWuEstIGArUUPqklbi2hHKfoDEYNQghelEQVcwB8ZyPt4vqdwkTCTD1IpC7HbpXcj1lOdyXbkIZ+gKGwt3bMh03zc1Fq55OiBX5n2Gd2OG19rc2My6DnkfqR8XmTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d+4Z/sSv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+4Z/sSv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3f4319b8c03so667984f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074828; x=1761679628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SCUkszQLT3jhOeJ8xWYrP1u+Oz6oVJ2BJ9Vl0R1XPo=;
        b=d+4Z/sSv4UIy80HAt4Mvgmb6afc92SvGkb6sUSlw75O1hOa7k2EmLGgiZTLFgU2C5j
         r0cb6sbWMY3N/HEJAwioAoOQimpSmvnej61OXXBLm81+epzjdSY5HBSmAplS6xoZDW2f
         1siwtTKbdKyLURAJNkZqR0lBGiapvFhVx3gl9xCV6S1v7uN9sQaj1nfg77ytqq/jDspu
         eP44b+xaU0wIRSTq/sbkC4SEO8XAJBOqaKC/0fuRtNlAgqWohUz7ya3a+slp01JIeR5P
         cC7OvgRIPtB3Ni60lou8A9ohsvQoC4AqgVWFJ5cv1hAhUUtJX2p50Xq5bJci8/it02Ui
         a4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074828; x=1761679628;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SCUkszQLT3jhOeJ8xWYrP1u+Oz6oVJ2BJ9Vl0R1XPo=;
        b=LgdJt6Cp9kOfIqpMGbEUTSwwSYyXXnpPJ0nYx7oMhBd+ZbWnFwlvMW3hmigTTiPud3
         acGr1b6LmQSGFm+8w+eBf3V0ZoNayu3/HdSQbmRY9OaV0rM5iwKKZ5mbgqkMpdAck2Mv
         wu1u7WE+lzUEwZBKWCqPxhRCqJ3no1TRWu1YmU1WK17oryaax5v3UaiqrOHHpLaRY9JW
         3EhrZzsW6IUptPaPHcIDqHCkPteEnq9dyydDjKonbHt47K9axpAWNt6FgyHDJ3431Cbk
         XHQdOegWew/e1h3B2zFFDc4GbNVj87dWHIeZ99j4ynISYVeZgGdm5swazgO8gVaFw9LE
         lKKg==
X-Forwarded-Encrypted: i=1; AJvYcCWCGayM+0YcLXdyulhAwPWuVVhY5gOOF3v9LdN3AVw2R9H5ShixQA3J/1oOsn4N1tBUk7136FV+QMb9X6lEcb6Z9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzi/PN6Ldo+tS60UVdQ1kpkNoRuuu04Xk8uHTLXI4Dp9l0ktuK
	mBsp4dJki6LlCdT5qEqHVwPM5sPTg9aAfP7RLOTsCLEDqVadyO/MBgpQsVfvaOIMnto=
X-Gm-Gg: ASbGnct8pMjGHJunBOA9niZq3ZadyGDJUyUTfehSp3dkJEdP0w/5vq0y/8ulEnz24Nt
	HeNY635sQvpuiO+deem+pqMc/tnJ40GcyL4TgcScmVD4eFmyFuCPXcP437yCd9ahMA7WGMf/1vK
	iy+F0d4WZ3PPsu6jwTixMvzlaB3xENO8aeEqz2J+OvUAyxN2PJ5PU3DVJrircVE36bqeDl1n/TF
	LVSKvTC7XPCWb0Nk/x2g32QeOsMo3V4sL1UycGG7fT2ziNHygxO5dQRlfAsq/kZnRiFEP4ZxEbA
	jxWTLEAzRLe7qyLVGh/LfDz06oOQ+r4CBowtZV1Iccvjw7knki+UUdOM9kbse4rR1xzyDaAG4p+
	FeKzWyNLcZjS9r4+nG0teUtGaaxQZrZEbVZ5R4v2ENEE9FvQfirMXK7wQP8Njj/VRZ67blWtPe1
	jzl/3uMptptYGyu8IX2Se8T8/Ss9srakykr2tXag==
X-Google-Smtp-Source: AGHT+IEyLv1lnWbFD6puUzU9WbOWyzqsLRxtSYF5/o3s87IaGKKi+zQdweoF9FjJ4w5n57/TykzA0Q==
X-Received: by 2002:a05:600c:458a:b0:471:1d8e:3c7c with SMTP id 5b1f17b1804b1-4749435b2b6mr19420285e9.4.1761074828560;
        Tue, 21 Oct 2025 12:27:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 3/9] arm64: dts: exynos: gs101: add
 sysreg_misc and sysreg_hsi0 nodes
Message-Id: <176107482703.33931.10968219434076858681.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:07 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 13 Oct 2025 21:51:32 +0100, Peter Griffin wrote:
> Add syscon DT node for the hsi0 and misc sysreg controllers. These will be
> referenced by their respective CMU nodes in future patchs.
> 
> 

Applied, thanks!

[3/9] arm64: dts: exynos: gs101: add sysreg_misc and sysreg_hsi0 nodes
      https://git.kernel.org/krzk/linux/c/08d9d0d9ae6f9f83bc1802a3f8ab2a4801ccd3e6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

