Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3F12FE567
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 21:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763672789; cv=none; b=M78XdljhhJLv2jtmg6cTCLMhUOgMU0dqtQUxmIwTdqvHbl7Ec517nlv4BIJt1Bf8HvBVNsTBrQ5KQRfaslLF1BTvYQ/S/Cd284A0gOIA2ip1rCvYIil9Y35TChh8pU46DZH4z4qa82RvpLxBXSYCZNBQz/BYPJN5vJp8lBuUwOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763672789; c=relaxed/simple;
	bh=hy/K6BGPw/RHqXahng2GeGBJJaR09CDU5bF5fZ2rVfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcNgzPuofGPYkxMHvKYoTKVkN8cnaeCvjxlJ9p/HIxuJvy1KtRAesH0vCSdbi4+vxWP8XvTZkE53axIxwwG28h9jxcz+kBrgYTQc2c4PV2GNw/oAl3f9lPFhz/7VuTMFOSt2ofqg7mLUIRGqPU+o0hIu9TmFo3u1G6hS5N481K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ksY/XdeT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ksY/XdeT"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42bb288c219so1251190f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 13:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763672786; x=1764277586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGrpLSO7RqibWTIvvE58el48N4AMLKKXatRNlJSRkbc=;
        b=ksY/XdeTq12K5zcwXZXCAyyQ1GpS9oIl5WW+JfRFrHInfHHKRyXkeZ/y5/3NlF6LHT
         pJLiGPcM95lDO0RL/s3NwzAkqHAJAQQ1//bYMsytQr+BCvtkKNhHf+XeNnBRMrwD7yNd
         scGDD+5D0+Ex/4xhMIRfhUfrMqu7FtzRUMvIRVauK4+5s0BJciHpB3HiCyImeaovdjjo
         YLauLeLlUfntlC2QkVBV7Dzr6c4LyFWBFSvyFdM5wdxlBwvZT0M/K9vSxkC2j15madjb
         MHVr0Of7w446jxcsTlk/0tOWFUdXnikpRXqGTyawgmhX3Kk7O43hd6dI7EDUfW/oCXNf
         1z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672786; x=1764277586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jGrpLSO7RqibWTIvvE58el48N4AMLKKXatRNlJSRkbc=;
        b=krinZfW8hzzhn0EW6x64Ju78qB9sOrt7Enyeu5ho6rD08mot+UoctFhPu9ytGRs7nb
         JaNgXmx0/ma6TASkR2OzD5NLPShEmCgN0cnl3hLNC8LpSFIFpkGG7ZQSHbARsl3aZon7
         k82T7WQFTZ5bN8mqL1ZJuX4hTB5gA8RCtk/luMtvvNgH8XLkcL/zFz0pdau1lfnvFKgJ
         AeiqWJAsb4VN0okcEzY8bZIBR7CLZdjvReeiGsVj3gQC/Lgb2tOA9PvX+g63LPg2uHDs
         2HOudVK5R/UyoP4G9RrJuh0RtitaSrikbgZFAK/SY92Q9H0nQDBNzNNTul7ctAA1QCFi
         7GOA==
X-Forwarded-Encrypted: i=1; AJvYcCUnuoJ7xDB6q1joP+09+6NRyTxugGqeC/xzoIj8gbWNmqq42PgyONscSjq318YGPPE6T42lQVqktCBRMzHPUS1cCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZARbCs7Ro+vEI2kDTq8dpprc15rHJXV5fhCWRoyeLDR3Ss4y4
	TNCW0+qqjBt2YAnrC3MmK4aHungerc1kOOUBQtG7TBGH3ap6x6Q/pgdTgBfFlP6Fcgs=
X-Gm-Gg: ASbGnctBPw5LQpE/H8WuI1FMdna/+4rA2gqBDMy02lMUWOD6NQM2L/EDVyNg4OceJYD
	gxZnPwaaC/9x7sQPE+dpJ4dqUEOjz7w++hhLVrFe9go+Eoyyj8VpFtF8WnivK+Iitpr6d5M1dKo
	y9558cKw73M5KCZtbID6jf/BWoedAEWNlaXNBAd1QnDpy149uTeEPhi7BLw2f52oTs0XFsuYpMh
	KH+pz5KhjlR9ShZ0CcPod93vQzKqrYioZacYIHxCrLvtL7b1Otu1yiEqgyTS7ARV3Ip2Zh3xUTF
	D3+XNR/ZpUg4nSuB9cKfSn/GPNUDc7PaeHjJ5vgJ9DdUhAyCUxRRKE9Ewzr4UdG9WmJgGtHGcJA
	NMs/b0estSqRsM7qra9KSmYZm+xckJZIG2VcJmx77SU+TSRCPQFDsQZXLcbwbAnpXJgYA3K2YY2
	gDwcBJAmaFztxyEVtt7xP0oTb16bU4UXoUi2nSSOA=
X-Google-Smtp-Source: AGHT+IGRh9YI5GYMBjiLuiPtf2I0mkD9KZvk950BHI0yExr1aKpde6+NDWQM8tzXu5YIrtApVzQJ6A==
X-Received: by 2002:a5d:5f96:0:b0:42c:a449:d68c with SMTP id ffacd0b85a97d-42cbfb0864cmr837159f8f.30.1763672785635;
        Thu, 20 Nov 2025 13:06:25 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm7321287f8f.1.2025.11.20.13.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:06:25 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 20 Nov 2025 21:06:12 +0000
Subject: [PATCH 2/4] dt-bindings: samsung: exynos-sysreg: add gs101 dpu
 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-dpu-clocks-v1-2-11508054eab8@linaro.org>
References: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
In-Reply-To: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=hy/K6BGPw/RHqXahng2GeGBJJaR09CDU5bF5fZ2rVfM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpH4LKmGf5AQvj6tGjpwDAMh3/sbxlKcWzGEccy
 rqgIKhyMUeJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaR+CygAKCRDO6LjWAjRy
 ug9pD/92Ed6TgocOI6TPwbPNBdeEnDmaN0qY7edZYHy4zhr+Gqir3v12M4hhu2ud2IAwFzx2Y2Q
 rGB1UHYXGMZkAMdhKqNZodUw6eopkvqUaqtyCrEtcRsaAxRgATFlHrpu7RxfrUgtmq1W6rMFGbY
 SnbW69Q5TzevSTfcEI3RoMQs5U9D37YZDj8eIcJ27UD5q3E2yrHdcDhZteWBSMAsU6X/9d4PMZ4
 Fcyxk4TYEvasQHtPlhVEZ+ZrLIDkhjtr9DNkrWjsySnF465j8RnQScishN/C8gkOnUovNnTe/kT
 XyWOuuFHXSVCVSNFMLyZ9a2z+JtcgHqeT97ZOe2mnCLsM0WgeJC42acNdWBf3FieyO4eHrPVcUb
 RhHWgjj2v5FGWMXSJvL9O3Vrh1SpYsALsP6PQV66oxlynFV98xm6aGn3EEHIcrejftac5aYvT6X
 L9xSwuphPBxze2APX9E7DdxP13V5vOkHEnt5IcVPEnvdYEJDwnSezTOZ3a2oo93E0czHmthuKE+
 I6YeT6WOhIeWn5oTVEax8H/vgA79Ge/jStIgofj1dc6ZhvvM0W7Dq6iPNovAZqle9yxuR80L4Jj
 18skMFYo5GvGaFvc1MSaZ5I8biqifpLFNJK6xEgwZMgMnNB/qpNCNuZ5Xu+uymKPKldanRA2G8S
 qS21wV5IaZNh13g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add dedicated compatibles for gs101 dpu sysreg controllers to the
documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 5e1e155510b3b1137d95b87a1bade36c814eec4f..9c63dbcd4d77f930b916087b8008c7f9888a56f5 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg
@@ -92,6 +93,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg

-- 
2.52.0.rc2.455.g230fcf2819-goog

