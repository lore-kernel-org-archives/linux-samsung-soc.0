Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC0421FF3B
	for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Sep 2025 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757236448; cv=none; b=o/jf/COx0QBMVeTIyze14tqUBPBcZixb6c3gRYmfn3faTNi1ITitluZunUsMAsefjWVwW2HtbIGysldPV8Lxmy5y75oOKy7sRZ7KzdBUXiTiwsN+Kvz9DEOZZXdH6b7mTmTRHXj8BVwxyRR0byEyU1wEhsqLlKI5T39gGSS0SgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757236448; c=relaxed/simple;
	bh=sU7+/OKR3H0AJm7QtOcIJdDLNqhe68RVRMMpjau/P+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pn2VpoE3FqQVFRyUiOFbYuG6Fm3SkLZOQBeNnzDX0Qu78cYb09DIiITDwMS16lqwxVP0WcoKxsyvJvkIbRwNAP4HLkK1x8pqI+fAf+8jvEeXjmR7aeRm8YqDHF9u91iGW+AiBCkqwGg3sGSic8y014wO7hbLRnvj1zqAkHX5Jho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDTv/Lne; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDTv/Lne"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dd7583194so2594955e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Sep 2025 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757236445; x=1757841245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h09TDfJ0VCIYwMjqv+nUCRRx8qKcN59ZJYX5ff84mD8=;
        b=DDTv/LnerbbkADMhaf0ViJTmnp0va3tlnP3KfUkxQW08vIRYDEbbg90JTkoeWBxHx1
         aC8fVjv74oV00AMw+fg0q6La1qcsKlsJ/lnEkccvbJg/kzDDh+2jAlbmjDuQn/08jAnF
         q1TwFkT4VMiBU1zWeCcrcfoykhIytvS0tKB/1m441AwAp7N4NcGuril7uPmZAyODtmj7
         OdMYif0Bo6wEnjSRYnJtyQHkFR2u0PNEq4AAPrvdM0L8m7r8xhnCwKHzwCpwzOBAneq6
         Fo9rlW1LY3wiA67CVBR1ndTbdxlKcjzRdPw3lhUUW1+tHFJkcnQJ6AAkgswaspx1vv6X
         H0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757236445; x=1757841245;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h09TDfJ0VCIYwMjqv+nUCRRx8qKcN59ZJYX5ff84mD8=;
        b=fLt6eAU/PG+gKFF9440FNBK3MG4tWHWmBSSCLZOek3j7dlvlY04tQp6efMqaMGHTpk
         OmKIllcFU0kCg/KGlQhclNK/WxoIgJogKE1ecCfzBvrh4S/OY2yl2v75t8uh6aG/OSgB
         fkxDbbvbO5MJr1t+O2aezO9AS/B+sON0/sfT6lsnJKHRjXSY8uupHjiG/v4imjk61CGS
         VCxPNfu2oj6yPSrt1cIL6bdEbbMbvigjBJgHACVuVLYfCYmZ6x7/YARMo8u0Owdn/Wmg
         RMBpTf8wK7wOasxMG8GqYxh8UpXNB6y+BftqS/EdA7JvDPle1Ajg0CzV2YpNzdw6+L2+
         LITw==
X-Gm-Message-State: AOJu0YwsTwRaeue2YV1yoUmrcL0WWBUeICtSH0Exk+Oia5f1f9TOmzov
	o7cSJazWE8KVc1yrG1W1J+KOd8xErg3IvIU5BnpT6qTHxeg6dIdBgC7dVT06Va/nqsw=
X-Gm-Gg: ASbGncun3LeCkbh52q337KRGFqtCTRPubrUgZAFQdIKxAMtCs3pqJGclU6VABicRbxC
	/1iPUcSUcMfHdkrEdTv17daZBHuQDgHIUGekkV+qD89kbiC6Pfvupx4of9S98ZmHSqj2M/i45+3
	3AT5lk2dKKTct0/MG6gC0ZiSQum6XswbIZs+C4bTMcPpqICVaM0rntEIFna23fNlX437Pv9nZPw
	7JfL308QB2cAVWLJpNQWmUsqHOhACwzWxD9w1LydKmpyT/UYPDB5xBezrSjqqrE0yEDf/4QwsPH
	35bM7b58LrMQzNZiZ0pHT2QEgx9f4VRbp/wiL9gYrW2cWcgJlcTzAzaeFEMt7E3eScAQB3lAeTx
	zX2M5um6lTnBpH1d6HoojFLvNqGmkG1x8mzvjKf0=
X-Google-Smtp-Source: AGHT+IEs+zHj+nZWtDLKO7AMy5vUsh2MOF4u8kwkXxf2nwQ+E1nf9C+MVn+vLhdElVbV4Wh2U+33Gw==
X-Received: by 2002:a05:6000:4107:b0:3e6:e931:b428 with SMTP id ffacd0b85a97d-3e6e931f97dmr1115038f8f.10.1757236444776;
        Sun, 07 Sep 2025 02:14:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e21e4c0e6fsm10918962f8f.17.2025.09.07.02.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:14:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20250904-perics-usi-v3-1-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-1-3ea109705cb6@gmail.com>
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: clock: exynos990: Add
 PERIC0 and PERIC1 clock units
Message-Id: <175723644300.30719.16385900171586342437.b4-ty@linaro.org>
Date: Sun, 07 Sep 2025 11:14:03 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 04 Sep 2025 14:07:11 +0000, Denzeel Oliva wrote:
> Add clock management unit bindings for PERIC0 and PERIC1 blocks
> which provide clocks for USI, I2C and UART peripherals.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: exynos990: Add PERIC0 and PERIC1 clock units
      https://git.kernel.org/krzk/linux/c/43bd82eb33b2ac33232724a8ddb9e07cde492328

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

