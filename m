Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F411E5717
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733228037; cv=none; b=sGJ4XRGMOa5+LXQZNkgiZIt/mXIYk7PG4w4C8l0/saLa07Sf9uEB4X74r89XlwvuzC0e2tTrvM2ldz7gVmlkvK0uJp17dI9uzbenr4BtK3SBL0gqRaO2IBucvNubpBGaW30p2RY2EXZaVdvkqeR6fgQfvJNvtsJ28OWVqVGenOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733228037; c=relaxed/simple;
	bh=iFlGn8SYSQnS21b00+qwUeC5W1YHrazBnqPMlae/vqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QupDMx1zcUp9v2rjanBZKoT7AAouJ3vNx44RLvNo5y4A8jFImzci9b8wmAQ+4L1xyYSGOGru321tkp3X+8M9ezq3tLhepTmpSIQc4W0bKOW8Z1KbqpjpDY6+JpulmfP6AxiufwcdsVJvjZwwDhE824PLptGm1XjjkunOAc9NQ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=khGvRRRA; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="khGvRRRA"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so11280657a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228034; x=1733832834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M6cTvNs7V+xqyuwhG0n9JcP4Mq9Zi3RChVjlFoyS9c=;
        b=khGvRRRAuNhL0sFxFwZ1GIr6iN0J48Tf1EGXnGIpl2PvHS3hcKrs+Fz90LAuHhJwrY
         CgLfQd0nwXAUibnGIr/VXfwPGhxqadRmsnAcj7kWsDmIdllpaJRBPZGjjVtsIUMpAo1j
         y9/j4Lty94OzD1gyWyAcLgOFMcnmfM5lLLa9tFp/+Vk+GhrhjWren83wh2m9havX5KbR
         VUzP36rz8ngoAqsydUZncGi3qD9WJ4ibNtJIuN5qLUPzyTTrmJlnEINBij6UUILxVvw4
         2DhrELvbXpSTBcjGRx1viwnt0lWX6OcT0EeI3ka0MVXfHzCHDG1ZTGNI8rwfz/7tmfO+
         xo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228034; x=1733832834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6M6cTvNs7V+xqyuwhG0n9JcP4Mq9Zi3RChVjlFoyS9c=;
        b=sSn8gXS5ThUmMof9Y5B7IDqqoKr+FlRm3R3acEqjXNeRX0+L5us464ekeVTrtRBKS5
         oeWQ++oLzWMJoTNqqtK7Pz72SlgiW47OOxoggO2KbGHqbE5NhiNyUq9ryoAfXqchU3k7
         HcwO2usa3K7YMCGVtEzlSNjviXV6IK9/ZeLhm8XlBNTFip5M/apHDionlJpOLwo5Hr2P
         FCq3CvX/ToAGvvHZDFb8mK1/rAyeGgr4Oyq8PwE1K9jujVJx61I0+t3e35cFPdKSs9z/
         CP8h5SUVKmoWTAq+6J0gyxSEl4e7XgVAxj115qtDa+rQRRJ1uNff9Yeo7vKXxwbKZysH
         vB7A==
X-Forwarded-Encrypted: i=1; AJvYcCUbc+EbovoOTABBVjXE/IbGgo4+zYpgTQ9AmEyAR0C2uun8omBNTQ2KXAlETHbjGU6agaK77guTFU7b2HhSPNrgQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5MOECNIjkHGoG0qOrROcjfuCy3nRuja50/EjV+tYWoX6gdW4q
	CpMbic9r28RhHE6wt0kVA0cNFTw0tMJHJdiBwXr6nfyjKAjp9Pmt3MpsKRbyh8s=
X-Gm-Gg: ASbGncs2h7r5m6ai+T6EtmLo+PrMCk+L6KFUQC3KWrCVreWSC2Z9OA5fMHjI3kJOv7C
	1mffzwq4oAPJjF2+LrYiuec1OYRLAaG6t/txB+QzzNJ8dVdtYfdK/+fZDfMsoazsiCWnHkZssHf
	XGfztzKw2XFG9M2X19DkXCO7cU1MUDzUnEGS+xT8Yz5rdGjUNt2F6O4W71ZpoEFbXcakklTq3Ue
	AQNvuFBv365c7E2xsZku5vIs+afcG4kTOUGathReoeqtIAHudTnunTTR6Gqke2iTDFGc4Lyvvgf
	s03vdpBoz9znk3R3YmYAF+aZcrAFFINYPg==
X-Google-Smtp-Source: AGHT+IFmVCN79AgO12dD2PdCbqVnKblHT8yfYp2CBGY/43ZxpcqEVT7DluzFyun9DnuIF1YW27jRrA==
X-Received: by 2002:a17:906:d54b:b0:aa5:3fe7:4475 with SMTP id a640c23a62f3a-aa59453454fmr3031209566b.11.1733228033761;
        Tue, 03 Dec 2024 04:13:53 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:53 +0000
Subject: [PATCH v2 5/8] phy: exynos5-usbdrd: gs101: ensure power is gated
 to SS phy in phy_exit()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-5-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

We currently don't gate the power to the SS phy in phy_exit().

Shuffle the code slightly to ensure the power is gated to the SS phy as
well.

Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
CC: stable@vger.kernel.org # 6.11+
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* add cc-stable and fixes tags (Krzysztof)
* collect tags
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2a724d362c2d..c1ce6fdeef31 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1296,14 +1296,17 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 	int ret;
 
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		ret = exynos850_usbdrd_phy_exit(phy);
+		if (ret)
+			return ret;
+	}
+
+	exynos5_usbdrd_phy_isol(inst, true);
+
 	if (inst->phy_cfg->id != EXYNOS5_DRDPHY_UTMI)
 		return 0;
 
-	ret = exynos850_usbdrd_phy_exit(phy);
-	if (ret)
-		return ret;
-
-	exynos5_usbdrd_phy_isol(inst, true);
 	return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
 				      phy_drd->regulators);
 }

-- 
2.47.0.338.g60cca15819-goog

