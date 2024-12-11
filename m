Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE161DC197;
	Wed, 11 Dec 2024 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733934590; cv=none; b=JNRVTKeYBqxNmTZ4S2rvVkkx6Ehk4zE8jWkwY80q6m8jS9vXJUcRpCoJTQOVkfnXSyTLi3xMwHOsqro/EV4kj5S2ler3KuG0YjF8KRuMrPuhYceFscdmMmSssZEJ3nYM8gfHUbOCACns1W29EptJplcDCn0uSkhiUHIrgKM4LSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733934590; c=relaxed/simple;
	bh=GbTFieq30Tp3qpHIb/Fq1WHJxQBwEO2fnhKu6VM3Pg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1sP1fKSMvAF8cM5/zI3xVXGRH4YGDzLXpD1tQn3zob1zLdl4lxgAQ519Xv9FYRig3//GKBZf779JCtKv4ztPZhPNW7g3rhZlMsMprP42TqJALD6BGa1XkV8+GGGs3SpKeQlWHZTyET0iKC2tOaiMnRDtMYXMYzfTnH3QJ5PiUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlE0rn1S; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlE0rn1S"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa543c4db92so616306666b.0;
        Wed, 11 Dec 2024 08:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733934587; x=1734539387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZXwQI7YS6Q3F5RUIqA6y7OiUdvPTyw1jR4jWoj37sI=;
        b=JlE0rn1SnWPSEPfAu41yusjMaoz5J/R6RKVPIt8bVmLLtyazTl7JKlYUlbeZz5jyUb
         LR6THBGFBch+rZQ52LOLd7QEMNGe8vU6/5c7jn6knmR24fY51T+UZl8zkkvWLrvsuooR
         stKb90ZBkYZsk8PY63MOT3ssLfmBRUeH5NPGN0A/QgkvZI0DqDtXAOLGbXlL2DYBgDCT
         3AA7fjooMK4IH2ViIqkyVTVfxWS1Ip3cocWMG1Y1XRgxTcJ9Xv+lSCB1M12GdNUmyTQK
         ratDpJOhBxpknMonwpzyA3sepLXqPNpqcnpl5ZR/bkTryjxVzaHnHdbW0LinE2bZmJs2
         Q2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733934587; x=1734539387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZXwQI7YS6Q3F5RUIqA6y7OiUdvPTyw1jR4jWoj37sI=;
        b=ROGhFbYBpFp7Bvd7eTK6t/oZVPZ4MJEy9xdP48GIRJLA+L3bGWunD9ABA9msDo3WTf
         2s9CbSlx2uc0ddflkF1Vpmuf1etC+IrA/7tIewK/El26yjel1sj08CWb3ofxlfGjkTiH
         ZH+jaIjbJDjCNLzhzWIVJt/fXyj4quy+hmYFF9OYPVl2BDQK2qeRxaj7xQlEDooWYiZz
         7Ew4FaN0ikR7T/fq7fkrrY1cuxbcigY4CnuF31Bp96oaxbdwiyCJtgEcqg1o23IEHE6s
         HxBKfY2/tKA3ALz/NJX9p2yb2Wl7mMR1g9C5wZUYi1mF9YxE3TjZnVYLZLHWKJLmy9cn
         rO1w==
X-Forwarded-Encrypted: i=1; AJvYcCUGP+ScJD18iDeqkpU6AdlaUw/3aBP7ibRTLL5oJbq+xzXr0hCb9leLl82gdjmCdYTi/yNk6xZbPZk7WDfO@vger.kernel.org, AJvYcCXZG1PhHV9PDCvbhX15h+jhVMFDQ6Qsw4+bZytFjsgQKopil65Q9B51ugClYlHR/V/cq+eJ/Xgj5poI@vger.kernel.org
X-Gm-Message-State: AOJu0YzE6WA3CsP3S2HlozjxQMp88jk84N8mlkUoXQLT9XFRfs/BDcK+
	6jQKZo/vrwBKcajRjN2ztlqyHmWArndC5ehOKW4WemkvA78EOIfk/8EPNqh+
X-Gm-Gg: ASbGncv5ouS2L4lNcPm72nqBNLzrBUQEJYsGLFw+5tBPGzAbOouQpGdUXNu7a0NYVtG
	IqLPnbpi3JUrtel0b54JpPi8TMlE8GwT6fWCsHGBJPsDRJzeE2lLpPtVpqNBm0EW0ZQCRUshfoT
	/g8KHPFdqCsnwSU54tYIAgX6ezcpVbvffXofPtBP6s3TPIzI5oq5iZ+E8ef0/EAeP/xXqke6dvn
	Zd1RttyX9muzxioOAb7IvBLuJHPBGLXuYHt+is0Jo61Qd7zapQaT8OoWXX6TjXFOWa2AZmxp6xw
	VBOxWmrmSTdeDkH9YIew2WSxvx/dVA==
X-Google-Smtp-Source: AGHT+IF89Azw7R+LBtZ5j/GcwiiT1UcuEZB17VWqEacuhbhtSs2qPWqHLMZjnAqNMgw3+9T0X8dl2g==
X-Received: by 2002:a17:906:59a6:b0:aa6:c169:4e21 with SMTP id a640c23a62f3a-aa6c1694ecamr50424066b.6.1733934587197;
        Wed, 11 Dec 2024 08:29:47 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa663334906sm678451866b.72.2024.12.11.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:29:46 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: exynos8895: Add a PMU node for the second cluster
Date: Wed, 11 Dec 2024 18:29:42 +0200
Message-ID: <20241211162942.450525-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211162942.450525-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241211162942.450525-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we have a PMU compatible for Samsung's Mongoose cores now, drop
the comment that explains the lack of it and define the node.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index ee393f4f0..90b318b2f 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -38,7 +38,17 @@ arm-a53-pmu {
 				     <&cpu3>;
 	};
 
-	/* There's no PMU model for the Mongoose cores */
+	mongoose-m2-pmu {
+		compatible = "samsung,mongoose-pmu";
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu4>,
+				     <&cpu5>,
+				     <&cpu6>,
+				     <&cpu7>;
+	};
 
 	cpus {
 		#address-cells = <1>;
-- 
2.43.0

