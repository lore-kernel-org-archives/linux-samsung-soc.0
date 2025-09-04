Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341772D6629
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993571; cv=none; b=bDA0tKodSiUGbXYoOht5UjdiaB/jtHhfdcoQlmwDSaangURsUCxrfkDoOqwRpqy1y9nXH/vqVbaa+5a/aoId7UrtebEAeut+HIxat4wLSiGKlG16oQACTgPfMIsADV7FIpZo4t18zluXzB+7hafxuekdS/s2RqXoeW4cEogd3VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993571; c=relaxed/simple;
	bh=YbXtY+bB9UCcFJGSj880JfkrzUoWKkND3HjhqJeIUYY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hdzLTRNNOaLqLUSE0soerVMF6Nn1/H8O14ShzJR3VDAcD5J1NgMXvliB01+7uHEQEXHnfKH47NnBnEixMSL0GYryKGKjijbrex4ZGkEi3prkt1E4e7smyM0Ye1FlKLri5/JeoIWtmEMrI3esUlrNZCe+h2BjZ3WWv6RpWSb1mtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=syF9QHH0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="syF9QHH0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b046b086599so14480966b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Sep 2025 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993568; x=1757598368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUVOYaTKR2BcmefABwOjJaCKklr+SYDWM8eaXKmt/FA=;
        b=syF9QHH0McR/jqRpSI5sBRPGCPal/w787PnnRWyhhNSuaENu/RSB9q0FV3cCQhMA9b
         f3E1+sZeqdPvflTr1EsK8/NPb5MsPkWpzdl3U9AtWWbr1opm4lW+jNvhfG+mFW2h4AFR
         qqhSghMzBh6uKwtc0NgYkPU/V0SwpM1o3APoxDYWsWuhcRjcWwW9p9jPMFWh9yCOsICS
         g2y7nfhntRbBLMPyAcGE9S5RzL3IiET8Z2CeeCxjpW19zEaj0Oo6b0IdQIxCz4S06GKN
         EqIAscX3Zx3iV/4NQDArKC2Y9LLj0djfPzl4QS+QPbypbPyPX87BMcIIjWTlhP3oTxnd
         BaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993568; x=1757598368;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUVOYaTKR2BcmefABwOjJaCKklr+SYDWM8eaXKmt/FA=;
        b=VEG9k/1zoaW2q4xH/88rrLVsSFo2//61C1DxoC/zg/4O8StjEkyYRdAxIS8YgBP/T9
         Zr199bXbAju1hBt/yvQZZewteQwS2rcYYblDMJ12i+7djdYVOU8sq17Y+j5F5zSGf0rS
         lbB4ctwBKZTGXICKnD/2BENBa2esKng6fu0CZILiK4elZMjXtov1rRlxvTsrKVDQBCgC
         eeliVSEXJnIbQmSz5GcgMij+wMbx1OVaCIAE6Khd9fH0/WJC9RXkeqPgj2yrJW38zB4/
         +76Y7wJKh/PWIg7mJWck+yr+FIjQasvo8FM3yPGMKIyT49cREwybDCpHiP9vTyl1dYa8
         QAlg==
X-Forwarded-Encrypted: i=1; AJvYcCU592Kbv0iqUApZbtFv7/JsXgy6zkKq3dg5aiUYfUIlcmf1tG3BdjmZqvQ39dWEmBIUgsAjhwAOKvwcVezrXOdU+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWZLjJJcab3K3Bj/jVDZIJM56Omz3jgqpSQ2gUhnnsBVIeCCTu
	eMA/PAi356/3JmPrhY5Y3fXx0DNiRX8LnPUz1Qy+ADW3tyayJmODxq2Gm9rMVPUjysg=
X-Gm-Gg: ASbGncvZKS9rRcXFplD8nd0zmFKrtQRrR0sIOFwQFOLdIGPjm0+XvySAgfHdKxJghRf
	QesmOrlOajkNMe6ViuZx/eaDQQqvwDc8rlwODu8o53Vng2Hw5tGTjSWWHmorZbCPI/2AtmX8TVi
	5OddQ1FU7P+dUUqJ2GaeIsApNdyLx71EgCgn4YPcTHX4b4WoxdYH3AmKu67e9m5KEFDPQXweAwC
	5eZ+BUI9ShCgWJ05zks11LFr3IbsZktVzA//eZSJT9A3E4oSy9X3bfCjfhIQat8Mwkstw3FQOPr
	qf0Yiz+IKdy8AKxCF8xPpPD4U4phmHyv/kDZxLid3C0oR3ISbU4vng1SGpd6iJf5NNoDxn30Bij
	Y9a/a78QK3I7CnxBNerg3MRQa6rh6xnnNmk2l3YM=
X-Google-Smtp-Source: AGHT+IHR5XB2P+9jpNOyHwbkAht1wt06oHD5IV8g09IEd8azHiDpTqXuJszFXYr9m5Jzcbq7eoSIFg==
X-Received: by 2002:a17:907:26c3:b0:af9:3758:a85a with SMTP id a640c23a62f3a-aff0ee81aa2mr1052139466b.5.1756993568421;
        Thu, 04 Sep 2025 06:46:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm1180634266b.35.2025.09.04.06.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:46:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, shradha.t@samsung.com, inbaraj.e@samsung.com, 
 swathi.ks@samsung.com, hrishikesh.d@samsung.com, dj76.yang@samsung.com, 
 hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250901051926.59970-4-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054249epcas5p483e898d45e072cb0faa79a681f73f0d8@epcas5p4.samsung.com>
 <20250901051926.59970-4-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 3/6] dt-bindings: arm: axis: Add ARTPEC-8
 grizzly board
Message-Id: <175699356578.171312.4960170053878609185.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:46:05 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 01 Sep 2025 10:49:23 +0530, Ravi Patel wrote:
> Document the Axis ARTPEC-8 SoC binding and the grizzly board
> which uses ARTPEC-8 SoC.
> 
> 

Applied, thanks!

[3/6] dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
      https://git.kernel.org/krzk/linux/c/604a932fa924e7b15be47c6208a305f289cfa309

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

