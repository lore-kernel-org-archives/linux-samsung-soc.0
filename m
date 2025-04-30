Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246A20C489
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998125; cv=none; b=gHvtQdRHafQhKaz9qWMIXZvpCV2t7MiTrO+X67T1GAGFIoSoXB+wd3yWWPDMchyw0PwFiZexeQj+kisjDcJQHLlWe0WJ0mB1foCdGjzXpBCdKwue3f2+ltQfIB+MdXGdH9YIg8DZqDAaexmOps0ZNnh209UlMWncXfwRGHr9Ak4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998125; c=relaxed/simple;
	bh=DMPBebC/TSzA2g62eZmB7bECxsG0d/WX1GH9o31fkOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OOWYEY6ryIVAd7ojKpxU0k6qn1Ly9VSw62Y7MkwIfHi+AVST/e0otHm/HlGWt650Ak6RYiw9Po1mrZgCt4zKeja8OutbWKH/n23EAzA3wSJyNAa5XBCyDczZ9trjGOV683E57KLNenAegfkmtxUV4pNoAmjbzKz4K2M1lMrYtog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NjXCyseA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NjXCyseA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cee550af2so4753735e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998121; x=1746602921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8p7Pv/AQU5RzinQRXhOmBpGF3PncV2+ClGXaJ1wYs8w=;
        b=NjXCyseA36j3K8G3+mwlog4nnX7oku7uB1tA4rqjWcLYckk6TpiiT5vOskKUgUW546
         6X46N3aogp0M2gzUfbi0w1F5OtAfN7/kQCFacxOsf4XAgEuzViN8A1TqUfIZbL1sxu8Q
         8XVj5pzn18/hMzBhpAAUsARVmTIGqUKfPjMomS2fPcO4VkwQue/iAzZatMJAjrxfw1DH
         WJntckLBzkAFyhx2EsdV5+A6bn5x1/N0WZJxUi3sQgQLRQOLr4tDRdL9TSOVRVV/dXvk
         a91OJvpJAqbXEOXuF4LmTgvQFxG/UheBsgZYsZ+0W4CUYFhkGy62VX8Ahn40ccQ6v80R
         yuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998121; x=1746602921;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8p7Pv/AQU5RzinQRXhOmBpGF3PncV2+ClGXaJ1wYs8w=;
        b=swkE65awECXFblZA9givaJqn6tOjkNXa08B38PiBIeoBrYUCsnuCfWGq/t3z67R2Nx
         Xjn8yHM5BHI4YW8Q2WatXUouw9zolAPE+l5rlCv0gDfdToK7aUHXpjwhXejuPAuGXXQi
         pjPmcXaAXVe9WOMiUPcooDuAqZ+UYnL6NowWTbAwdPM1k7GRMBvtmMGq4U3mT+sN4L7H
         DQp9uo2IN0JoSqaRr+bqmSav+Jhm5CICRJfuc1UwF6XWE4agYqtKt3HgDQcIo5vlkizG
         YGshF9Jh2epSF15XLP0T46kxs9Ou7Zs/msKfnoidwiOtYXDHzviWNpNCu07p+nvL+jjq
         HrUw==
X-Gm-Message-State: AOJu0Yxu0QDhWYz1PbhYR329zYQc161eiu1RAghQj34ixCnUaKEHIx6q
	/eVzA8b8y/9uktDVnVnO91RtK365XU5+s5U7ibG5Xw9gE4/1yY6wOik4nfBWnl8=
X-Gm-Gg: ASbGncuS++ARaXJUjAU+FATLp8P4lzfKIfXsN08QVvQcpIsTYqT/wJQAXWIlJmuKxE+
	fefZaD4r7cnkGs1ELfO/NpAiwN9LqhUm3kneZ5rnqfZiFUMgP4cekThkxAVFEggL9E+vzB1noPx
	HxWndO+/VVfv2i7rgI/Zw/NrCmyt2EHjBG60+2wfxJqrY3/dxEBt9NnwIYPYf4Rjuh49ZE9VG/Q
	TlxB6KotqftJM2+fICAv32ZjOmEsN1GbsEh1DObdBd4m5PHqPkDlLFA8Myv8Cw20Q5tAbsLvKSF
	g7WwUQT9Y7TbSzzqMRJ3+I+Wh/yRv+HP/pOuv89r3Rn7uSsX74hSduwr5gM=
X-Google-Smtp-Source: AGHT+IGrVsof/wIDybs3QwM9wHFkyf2SoOTy/a2O4W4oYL7B1nHSN5cZorob92KX44pZ56YDgWr94w==
X-Received: by 2002:a05:600c:4f07:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-441b2df81d6mr3954545e9.6.1745998120821;
        Wed, 30 Apr 2025 00:28:40 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a6asm13905525e9.11.2025.04.30.00.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:28:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428113517.426987-3-shin.son@samsung.com>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113555epcas2p2416815cf6a41e0004f56c0a26b7be5f4@epcas2p2.samsung.com>
 <20250428113517.426987-3-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 2/4] clk: samsung: exynosautov920: add
 cpucl1/2 clock support
Message-Id: <174599811943.45412.14873339958379580394.b4-ty@linaro.org>
Date: Wed, 30 Apr 2025 09:28:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 28 Apr 2025 20:35:15 +0900, Shin Son wrote:
> Register compatible and cmu_info data to support clock CPUCL1/2
> (CPU Cluster 1 and CPU Cluster 2),
> these provide clock for CPUCL1/2_SWTICH/CLUSTER.
> 
> These clocks are required early during boot for the CPUs,
> so they are declared using CLK_OF_DECLARE instead of being registered
> through a platform driver.
> 
> [...]

Applied, thanks!

[2/4] clk: samsung: exynosautov920: add cpucl1/2 clock support
      https://git.kernel.org/krzk/linux/c/84d36f26d0314a089405af3df9e213dcfb8ecbc0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

