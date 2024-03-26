Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14111F606
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 16:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711472058; cv=none; b=KUBT1eQ3uQhpMlkAdyKtcXTG3XZK3EqpPuinXXsjPnaJ4m34lL2U4uuS3FeqCSIJ57fT5SHQKvtlpXWBXKbNRD1lYydO2lwIT/npWnbjPKctDinym8TRFIQc+GGTiN1gnpNgbw2GVIx4L8mG8mvoXy2tbHVySQb2szvTRPdjtW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711472058; c=relaxed/simple;
	bh=dAPiRo6EKZ0GJbRem2h3QKmGNumGT58ATjERpW1nkZw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DQ+hwCwAEYOyl1W6+ImoJW1JGrwpvnJtWuhIGRj1z+itEHgx8jqGL80CWTppU+FRwwW5b3XpoWi+V8lDZ5uwHGoflEPouRvvn+DE1M9hWDEcsfZrHmNi5xtqZyoiVVH5HwizzK+ZSVIl0EtsQw2eeltoQNjB3pnGnA6xI77fljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dD2PjWvS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dD2PjWvS"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-515a81928a1so4379873e87.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711472055; x=1712076855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wv2qyZiJW3rhsfMocz5xAdPhBZSACPMqswxeiiKx6rM=;
        b=dD2PjWvSPo7Yenb3tAYRAhr9g4GsNbRgtVLccLqP3u+V6Z+hI634rzM+N6IAOlYApo
         w7GtOzgZrL/ajDd08T/175rxurKMHMAwozQz94FYTdkDeAJI1vv9UKhvPWT1FpCaYqW1
         kE0jvmudzBtBaiAzkjVzDRWmW9dcP72kBukD/LMQjT1YlsyK3L29iGw9aWHnDqeXJRkV
         UnfxXt6hLdyo8gtOw+Pwjb80C+I8DYgg3TJraLA7fFF4tI0nl9Mwsh7BCcuHjJh3+8qZ
         eqd68OblB0f0bD8qRhXv2t3BdXqe37IYt01bO1xMO7aKJ3xbv8xgeFsPTOGu6cymxEo5
         mx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711472055; x=1712076855;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wv2qyZiJW3rhsfMocz5xAdPhBZSACPMqswxeiiKx6rM=;
        b=DX/uaIYrOaI3sZfkIDoE6IPgTcTvAJGJr4UgOkteYKxTSNJd+s3jVLP3JJQ032A+yI
         L+Tmh5khL/zMYruqpUHycsglIWM6uv3VgwA1upoq3PBE4E/7hHoyVnVIFoVx3YCeH1sd
         McAsPYIv/fMDjJHEKjHnkWcs5/07Mu+walf+SLxtpJYIymgxMXVshYoLwztVxFvSqXGi
         jOj4njML4QmB1unELK42mkPi8hwWocFLwCimdW32RXWe51qhxnzz1G2bqRlAy5dfOgWm
         3nL5q0fbjjvD3S11pOq6yTzeEQzTk6a5PL59sIomKv871k8jDjrgao5VKhfm/GDxwl2e
         LKbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSiY0wqwTvos15gbFXaKfIhH8wEKNp58IRFXGKGcuf44W1YZ+bhwDV8II8R3a1b5/gWtIKkFNpZFldmh6YaQqaQhR7stI7KVhuwKKkntklvus=
X-Gm-Message-State: AOJu0YxPsGNjkl5qUMAAFXjG+IQ/QBoTcyHOejnlqsAxixiSMZ9Sb5XJ
	EDFsP2C2VnChBEOZUp/LUPlEiXKy+F9Y24ZMKDOmZSP2De+LWATbUQzZbnRHzbSM1iOKs2y4w/0
	i
X-Google-Smtp-Source: AGHT+IFjDDsVihyBu7OYkASnulfwdX39S0/WKKAK4kHDTgGoAo5D0BhXUAFl1ZDrAcfKm6wlGhFt9w==
X-Received: by 2002:ac2:4d92:0:b0:515:ad80:c227 with SMTP id g18-20020ac24d92000000b00515ad80c227mr108290lfe.56.1711472054791;
        Tue, 26 Mar 2024 09:54:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id le13-20020a170906ae0d00b00a47464a6ee4sm4043708ejb.173.2024.03.26.09.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 09:54:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Artur Weber <aweber.kernel@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20240217-tab3-limit-usable-memory-range-v1-1-49cc9c86a5cc@gmail.com>
References: <20240217-tab3-limit-usable-memory-range-v1-1-49cc9c86a5cc@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos4212-tab3: limit usable memory range
Message-Id: <171147205364.149174.1041854841396715933.b4-ty@linaro.org>
Date: Tue, 26 Mar 2024 17:54:13 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 17 Feb 2024 20:02:47 +0100, Artur Weber wrote:
> The stock bootloader on the Samsung Galaxy Tab 3 8.0 provides an
> incorrect available memory range over ATAG_MEM. Limit the usable
> memory in the DTS to prevent it from doing so, without having to
> disable ATAG support.
> 
> 

Applied, thanks!

[1/1] ARM: dts: exynos4212-tab3: limit usable memory range
      https://git.kernel.org/krzk/linux/c/7bff1d35c1294c011b0269b8eaeb8f930df386fe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

