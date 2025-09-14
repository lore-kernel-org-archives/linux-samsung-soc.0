Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE75202963
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757859482; cv=none; b=q/S2cfXQaQhYTwRlRFLspCfypYKTMl+a62mHvXEKspx/yVc5dIHJoFMf6CMlhT20ICXhcgpE9Cn5AHPtMQlU7XQTenBPcSf82yLHCjD6v/20xYpfd4dm7xmBvMQHMkQWRbq4uM6VZloDwdwnOt+bwRSwEX0Wp0x/QfzNkKhEaRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757859482; c=relaxed/simple;
	bh=G/YgUWwYgipT54ZkK5S7t4iIid/jh16TP1NiVGcDIfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APpfIRl2kVEVtVc141rmyV0d8r6E2/6dpUsBtamaw84O6l4VoOuXJfkrMaV4as2o/G38AYtZk5Dz7Y9TtceLCzHmL0c0kFwZqvcDoW+G+Wf1CsT/ZLpSqphn0KXo4/gxcPA8RnLBgBe3ZcO7AIItCOVs+zNTK3mpMj6GS9pmJ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOaoBPDo; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOaoBPDo"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2349353f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757859478; x=1758464278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=;
        b=bOaoBPDoCiLOai8Urih7VD5ZEWw8uQOxpdMbaMY+nhC+HuQE3Dud2SrUjgYNtQSV5q
         LW/hJgq9/+3WwWrTZ92ulIbpbuuBugVDGEm6HcUB2vkdkXSkt6rXlinhkxU0vUk6ocY3
         7/YelEm+ubW3DIvMKH/aYJDcvPbXH6ZIR82fImPTd98hk6L1EfAxGe/r+IS4H0g09MIc
         lcR8Mh9DJO7dLO7vl3XEPeMY0+7Bqm3H+lydqVxzFto1gv2vp4OTh3EH8I2IabtYMm5d
         cOS6vmCDrzBjQw8cdFA/PdFlZ9EQWAptwSCMlK5IBd6Sy/hby7wqwiaHY0Y847ReFMA7
         tbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757859478; x=1758464278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=;
        b=L1rrjkwTuJ9th79P0dRtZKYprp6DXDgX6gEX6wRUZMtswl04Ku1uId0/P7+oB7Xp0M
         6uymPQeZxypTg7Gac2H1BBvXW0lB8oVrCOL/XYZvesk6+VQZity3f2pKkhnoV5brnZ43
         FXsVRWGPxX9Oq58/SP+rBloL99xEzA2oE0KAke82VIeulVEmbxedlZA1jRHYGAoqYq0M
         GGOqyvGb78JkNHtHUtS5dtCL00OFgu7ZP/4P6LkJUvTn3mDV43rwJ3qNUo+pEDw5j+82
         5XI81SFdfnaiy+Hjbf+m78JBRmp7UNlRLCYr0fabITgsfTatNz+wj4BKoCyWEViCMK/d
         dB5A==
X-Gm-Message-State: AOJu0YztIiwXTV0xXror0lDQxeHcah/jtKloFUJl+5C1qtZR+/FnUX9u
	reLxLTjEUTYNdkBbQkTqfAOkRYeaBXfcbB8Wk+Q62zHPunnWKd6jO2jJ
X-Gm-Gg: ASbGncua4PHh/jHDJH8X9ACeC1LlZ3xIe9nC7qnGrtmirlmatxH4c56KA9sUk1OFeee
	zzQVnY7V67S69bgWGidHUoeTOoU2tVqTGmynefFqWfxrz8deV6VPOeyLLyTN23ml9y/1FyRXbzb
	siecATc4v/Tid6iTzaAQ4I8To79/5ufzm0FFbwCpCe3hm6KzKDkK3dTehJNHseMsUDQ7CM4UNl+
	GwAyY3YOjQTyJ6u+8hMDtYXLLIUEayv7422qUCSAHXozbKpviyYmNqf58E1+XU6DfgDlkf3nIbO
	aY3ekhe70uvrv1AvLffK2xVKI5fjSQHjoJ5AMUqGBWog2pWvnRG2QEZ4A4QAGh4jyUAn6neJhBT
	e9ubw+xJu8Amva6QLyp1sWTRMPT+dY5TDtGkz38q+1irQ0z3fqK+A5HvQeVKyk2svYUlaq5retw
	==
X-Google-Smtp-Source: AGHT+IEVZ6Z6kRbK2/B6B8AOG5votgND2aiK+Fq2TrFsSb/gyiSqAj2GfqraBbQ0O5p8f224y8alHw==
X-Received: by 2002:a05:6000:420a:b0:3e7:5f26:f1f0 with SMTP id ffacd0b85a97d-3e765a13179mr8756668f8f.40.1757859478364;
        Sun, 14 Sep 2025 07:17:58 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e813eb46f3sm7319270f8f.23.2025.09.14.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:17:57 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: usb: samsung,exynos-dwc3 add exynos8890 compatible
Date: Sun, 14 Sep 2025 17:17:43 +0300
Message-ID: <20250914141745.2627756-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the exynos8890-dwusb3 node. It features the same
clocks and regulators as exynos7, so reuse its compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 6d39e5066..6ecbf53d8 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -21,6 +21,9 @@ properties:
           - samsung,exynos7870-dwusb3
           - samsung,exynos850-dwusb3
           - samsung,exynosautov920-dwusb3
+      - items:
+          - const: samsung,exynos8890-dwusb3
+          - const: samsung,exynos7-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
-- 
2.43.0

