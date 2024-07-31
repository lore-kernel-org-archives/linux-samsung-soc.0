Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5721C193079
	for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jul 2024 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722435661; cv=none; b=mfIGObQIAKQere7+E+Ko4Rs5IoJjDuggj16juq8gNDzSe8920I4wVHbJs1vCMm4gx8gWXwgwEFQXePvzYCe6mS4BIh3q3uQOlQrFZFSoRmmEygSV//XfotneFp21tNdvJmmhhj1m5wHgVGcBwc3pEQPpqkRK+pJeY7Ye3G7A8OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722435661; c=relaxed/simple;
	bh=ytvkCSgLKlKnXnV2Hzh3Ns/9Jy05DqiloCwaHB1hxzI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T2S6ewf3oTvMoJSEsQIHAyxBJdWzqAWXrXjETnjE/w6W/zn8nyvMC6zaZnTP4WxJyyEFXTFhxevIfllRMIH0ITD13ZA/nR0g4IaLszkm/3AN5iTetl5gXXOhG7Grlt8oiPIJzRgY2sZJIlhlOs1Da8FFX0Z86wn9oZnwF4jTlo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mc8UuMdW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mc8UuMdW"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3685b9c8998so2518301f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jul 2024 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722435657; x=1723040457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSqOaofEO5POC+mJL3PUsgfCrvCN5J6u6ZevBKAvHRU=;
        b=Mc8UuMdWXpeCBj8ossOCq4MFPvTwTLnDaOpM+OFH16yUN/iPVDln12fg1w+E/8ittV
         f34384WqFIgYZqUq6a1csuMGq5Djz8AZP0l9GgPZQVE818v6qVg3fT+uraKXbr/l6lH0
         tnOyoC946e37iCNa25sFqsXAIhjyuHWiPk6UHTGTHk8ehAjXXcj45Vg+si4fLYNIZ9s9
         2b1lcQ6zBjk3Zfyf9WpSRD/H8HFkK/ftaACUmB3d0xmQSgTgUh3CcwS+UD57hWBkKvwM
         2sP+G/qQw6s1K/CQP4/oeYFAcBTOeQTvOqXzmf9/Uua/82DeGbe6zKYjdmFRwSK3xge5
         eW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722435657; x=1723040457;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSqOaofEO5POC+mJL3PUsgfCrvCN5J6u6ZevBKAvHRU=;
        b=wzeTukTMuvqd1A4Hn5jRuuiS9GOuRwzIju7y2VZa6Q6vvN/HY7QRFzVFJltWdGvt6j
         pfW3uH1y6TTe12fqCFlwbCOCwXFbggBjJMSQFYMH4IyxlSxVIzuEgA2Uo1aKT+q0oR8u
         skZlHSUagfua3S/r4+s8ZMuD+i0hwt1w7wIWb5fyD4dXhsasiGg3Wmt0wfFAFONzMsX7
         1Joe7UIR0ejOPefk9XU0Y9hR/z21R7mT1KlWwe/RbBw0VPk3+hh3NUSmn9z/XebfYqNG
         5mtjN6zU+OdNQv386Q9HXjVmHJGuoTTrXGB5TUSrLQGxv+JhFnj+8WYBOPg7z5Kkc8tv
         LcJA==
X-Forwarded-Encrypted: i=1; AJvYcCWioICAB01dFebvFFB3UNJm4pOMb8L6Hr+LCLSeJY2kBzbHFk99f/KJe38PS4SvI6Mt2C1VxWGPi++VduhL/gZ3Nw2JPTFDxhShKiuRFFClCCQ=
X-Gm-Message-State: AOJu0YzDdeCaIk9GM8hUlPbH1p1kz/PowpJKIq5/ds5HWJ1VG3xBzQz6
	oWbTyd1Uzhk/JnsdtcYErslQSfUo9R1lX8E6wqXCoBFcYEpL9egICzUOtPJvItBuRAGfbiOu3mR
	z
X-Google-Smtp-Source: AGHT+IF8cZAUIzwi2BdvTEoaAp7Ev+Xb+P31buCoG7nk0jYrnENn135x7PpsFSsL2dKIwhDwVzjNAw==
X-Received: by 2002:adf:e30d:0:b0:368:87ca:3d85 with SMTP id ffacd0b85a97d-36b5cf00512mr8502223f8f.29.1722435657126;
        Wed, 31 Jul 2024 07:20:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c02b1sm17292561f8f.9.2024.07.31.07.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 07:20:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Mateusz Majewski <m.majewski2@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20240723163311.28654-1-semen.protsenko@linaro.org>
References: <20240723163311.28654-1-semen.protsenko@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: exynos850: Add TMU clock
Message-Id: <172243565547.42492.1072397968108986657.b4-ty@linaro.org>
Date: Wed, 31 Jul 2024 16:20:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Tue, 23 Jul 2024 11:33:10 -0500, Sam Protsenko wrote:
> Add a constant for TMU PCLK clock. It acts simultaneously as an
> interface clock (to access TMU registers) and an operating clock which
> makes TMU IP-core functional.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: exynos850: Add TMU clock
      https://git.kernel.org/krzk/linux/c/01ce1bf22adc0d09d906319787091ce784cb9914
[2/2] clk: samsung: exynos850: Add TMU clock
      https://git.kernel.org/krzk/linux/c/79b918aa997acd5066c7962502b1daaae76b6911

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

