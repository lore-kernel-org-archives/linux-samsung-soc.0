Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E3B2DF145
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759769018; cv=none; b=J23h4KEAS15vR9N9mHR4ASxEosSX24MmRgEhppwos/OTXSty/gHOI2k9z1X2kOvP6hASwGb1Dr1BS0AI3qATyyFdd7HmT0u73MG2QLM/Iayu0IghWzst8LCk0LDXMphCeTS6BM97ADJDxwNxnJeIhYJI67lsETzPYQs+AJHS87o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759769018; c=relaxed/simple;
	bh=WRwzPyOkvSFyJq+EK+JnNwxrggXXpznQVjTj0iqWREM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oSPudrOfjF82jxFoQJ8wm016hJYAxIcDVJ57L0ncUC4s/2t6Aq9KUNxgm7vgKRPextKhh9L3OqiO/HIsmWNT+hjfoVI0rLY+Ja5476GQoK5HKy7Ge8/c0RyBQwitR0kO11iyMc6fmaQJKTwjQe8x77n22YdW9lsiNT7wYRsTL54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zRiEdQXS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zRiEdQXS"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3d50882cc2so990542866b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769013; x=1760373813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioPTwS2f0Ag/7Xgv7v9kcfqmqd+rCK/VtVviQkcgWcs=;
        b=zRiEdQXSknS7fB2cddTuE5q9MzVvGJwUp/JOTgXRQUoXa+vg3b8sTWlvoiZGlA9IKQ
         JGNxx+G4nTEpWdG23yVi5wtsv2J3uOS9U4TL+0RWW6dgcB66wFoXZf4rzJrTO+0EX8pz
         ejY5AN52URLHsLhxKT7hMkzc8/AadDO6pd4Lb9p/bpFGIqGLYYUR+FKmJAd+iK/VhXkA
         Y39vCGliEI7MnVjnpq/p65XmoI+CKUlRtkdwvSKQ52tsyJYEA1HFT7xR1RHePXonj2+l
         61NlnT1PRMr99HsFQzmd8DPO50VJgezn6ayjLNycASWa+HZqyQoAjPDxcSR05J3lLkpr
         6xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769014; x=1760373814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioPTwS2f0Ag/7Xgv7v9kcfqmqd+rCK/VtVviQkcgWcs=;
        b=Y/hLPOQIAYak8ZtIpXA/+DIxQ9AvWssjnYxfTd7qxaAqsvJzZNBLg+UYXXx2FlniE8
         vhYK/odK2DByvwyvu6xpoR2l9vkuzoLxxBB2hJ5jOvc73DZYkFK4xJYcwiHd8Od3gwqj
         R2+R8eaZfYp6/wR1Nj6iSjXqqeqfoqPKc6IOfvI7EkqQALE8Hw8/IauKJBrONWCcdPFQ
         tLu/JvhHYaytRs93A1Zp/elwRS6xpTdsVSLar6HgN/VN5E5cWaQrHdJyWoe/261pPUZI
         l4Fs+rCs90oOGyyl8mvp3UsFbiEprJZYKw0z82oKGYhiMWxZpPeO1If+zCKT4ba1Ps6f
         egnw==
X-Forwarded-Encrypted: i=1; AJvYcCVAzfPCJlS3E4R6k/Y+R97syvx/ZVYFDosbb3Zz68cKKbBe72FBFxaSHkqNwqEBOgs5T7sfMzcbIpGRB32f+LzOtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt981M5+21fAZx4f9XlircW+NU4slcH3AzjH4ISpNyPj1Sl3av
	IRrl5wXbTGXtIZGn8zSpofs8ACsheeT7e9UGw+7mD/dIGOws6pV31k2AEhgdtc5hsNU=
X-Gm-Gg: ASbGncsqBHXKpkQyrDoHYFKXlYIZBwEiRNK1JgWJwgNxIcQuJsKxD97VzLT329WZ+eT
	qDig/IaBS176P/tCsI6EJ9SVQsS4zghJiEcCmNAjjjm/Ahdu2lFhan/f6wykcqyT6tvFvEmyRUv
	ffzaY81UKIv7+kQvzFOMVoYM8t5IK5gFS8glzXm2a5UpvkywvAuo4+rGhV0hJiQWzqlIEm10XK1
	OmxY2vEgj16Rm21xWsFncWhVFyoQVMlxjb2a++pLUKkY6kraZSGMpdcJ/Y8J6MsreAM5uAKzjK/
	aySJj/wxPTb1js6Z2L0+iLMUPjamYZmfcO85CAbp7GGQF5bGNfqiOFdAfm4fRKDLCh2SAaxEyxV
	2jZbvNSNgU2yEwp32D30H+EEjAQlfHJ4fpj5Y098+IFWf/O981CDc4eOhk1MyACjPRfbGFebgns
	D8kpFDDeoqrgV9wVJEHxpbLuDU8bFY9j5TnmN7vlF1Org+gYts5rg=
X-Google-Smtp-Source: AGHT+IE5SECCGzL2stnGeMyacolLo8BRZWSL0FXQl2+Uco37ci1RopzDCJHNu/u5f/tWpHXHwAHqpw==
X-Received: by 2002:a17:907:d90:b0:b3c:3c8e:1896 with SMTP id a640c23a62f3a-b49c47ad11bmr1593290866b.42.1759769013168;
        Mon, 06 Oct 2025 09:43:33 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:36 +0100
Subject: [PATCH 10/10] pmdomain: samsung: add support for google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-10-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Compared to other previous designs supported by this driver, the status
is just one bit. There is nothing unusual here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 06e1b0eaca18205a549c8e8136ee15279eb3089d..9e62da2162884fbc1f4b3809cdd89181fb534095 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -81,8 +81,15 @@ static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.need_early_sync_state	= true,
 };
 
+static const struct exynos_pm_domain_config gs101_cfg = {
+	.local_pwr_cfg		= BIT(0),
+};
+
 static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{
+		.compatible = "google,gs101-pd",
+		.data = &gs101_cfg,
+	}, {
 		.compatible = "samsung,exynos4210-pd",
 		.data = &exynos4210_cfg,
 	}, {

-- 
2.51.0.618.g983fd99d29-goog

