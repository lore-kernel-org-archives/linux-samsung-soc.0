Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85939340DBD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298544; cv=none; b=LkG2deOAOsDJA/FxwDkEIClJBULLVQOzQcT+yNxgUPB3g19byvgQeX+rDbbu3sGTYobmgzruZ2TijWCIzCPMQ1rJdC0SEh0tqIF/dOjir9Zkow8+pZrAubJpaa2V0A7lHUzmjHKfyjp0qZzTWu+u9eevqTQmXNSZoAl9npGE6mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298544; c=relaxed/simple;
	bh=ivbLWWSo2AaBA+S6bzVV0jpPuv1cVq4qNDd5/EibisY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ixwX40CErZl3l2eN8jSAGw+8VOBuk4900sfSeixrctrs5+47wYTLKy3raeDVeZ6qd6qqa/BmTjT4sG/vyNSXzofyfiDbGFWfq7KYH3mM4iXHVNsJofiW0YxWwYGmy5n5iUd+2anotH41cCQ8t6JOcS9a1xWVwUzxAqeaOSFUk5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=woekt0vK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="woekt0vK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b618b7d33so26746395e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 05:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298537; x=1756903337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDye+gKIi/Rk3nYVOD84e7fdc0ZI2E6vHlmVYEwZkRM=;
        b=woekt0vKI/uu3QbE31cnhdrXNLQnjOd+Uf8H3NUndQVjON7AUEqUBBniISscj+ZKZd
         KlNj1Z6hpKZNuyTtB1nbw5mrrcrPzz2Hvtq4e219hzZkwcZSfTL2IqzQvL8z0IKCh5yF
         DI/kVE3RM0v3Le1gxxZ2GOtFU63F1tMllKVvmKhBgullNKOP6HC9uqpiSrgdd36/Sutp
         GyYg3FXW+ftownRaKiTal9500uhKBRJ8Rerwhp7HCoVy6qRrd8DWJveiV6DcEh1y09/d
         lnMeKNwH0Cn69XjTR1dcMmR8LH+UZsWT2AjJICd8MeclPkdgxCUGP6nzmUl6zjlRZCuD
         Mpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298537; x=1756903337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDye+gKIi/Rk3nYVOD84e7fdc0ZI2E6vHlmVYEwZkRM=;
        b=pjyKvR45RaqLc7k0HPf0MW4STTJ9WDTiAEI9pX5CGv1bFAvOSTQIiPoGAAuAPQv0df
         gnPeuBMi/VNRGur6KF8t9Tn+iFgD+NLWMbXCCWFlm72g+7SJQdhQjDkdWiXBPCUbJPvM
         gSg32FB+y9nEHsEzeuISfK5PCRkXaqIZWVk2O5oMURWo5YIeas6N4KapOyvJUkGWvILZ
         A6rjcwaSVwRmdzfnjiIFAMmJNogp1QiblCdSiYtS0owiE6ugSePLh+ES9LLGr6xinUvR
         8jWI/GxX4pif7iVGyoFGM0iRVvE2bmxpL1eZ5W7UkaOiseNtvEjA+FkgBrVEroSDLuoJ
         heTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7gsfW9RcC4xZxZqULM9j5hNGgbneryTyNQwPjEUp3dHGdzSbQc8HnGdhtPbg3TyijNJ/icGdLPlayR0Pmz0cOfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTLo8uglbGUPJgXa4mDP75nZZnxnKhzh0wBY2nq2a2MpdHPFWn
	OnEaike+swzNbDRevVbl1hsNGBYtG+VI38rINwAiMuFAoFiOw3DoudLDwQ8Lekv/1I0=
X-Gm-Gg: ASbGncuSCGUVUnFloDn8pag2oebrUVn8q2vbzp6N4OvucpaXhpeS2ONliC61cdX9egz
	k1RslyBm+ifSfFK7O+drjmXx3/Exg4BsSp92aSLlTivI5mdZ0Eb/8STCwaFGkv97gnQgrEMg5CC
	cGAghVoWi59lqA6gOjjB8cpA0zLmReDP/tisA3DW0caYzuxnVPoCpDtvSlYXsmYVIc0n6Yk7xBc
	koYa5xIWwN6g0TLwAzV7TZCTo81HGokKFcsFfaW0YvO2r8BA0NxzyiAtZ0+NNixr6Q3oiLte9JE
	gD649/0mPpwpekNk7wFJ5MbD+zz+YbDryWuIDZOVHiP3vJt7QslEW+1VQf4MlP98lRQHz11OVz3
	un8Y9j8dX15kvrwkwcqwjPyKmKMs1dfnwl3Z0hxHFLjRD9G7ISyihn27qgXb3UiRfrrfM0WgAQr
	Ltrg==
X-Google-Smtp-Source: AGHT+IGJa/ivtNwr9Cn8nr8S19TCpPlSe2lNev3w6PEXYrBlk05kENqWzqwjRqOSSx/1cACZlesaXw==
X-Received: by 2002:a05:6000:1a88:b0:3c4:bc55:65d8 with SMTP id ffacd0b85a97d-3c5dd7b4175mr15803099f8f.62.1756298536777;
        Wed, 27 Aug 2025 05:42:16 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:16 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:42:11 +0000
Subject: [PATCH v2 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 #clock-cells
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=2754;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ivbLWWSo2AaBA+S6bzVV0jpPuv1cVq4qNDd5/EibisY=;
 b=jl6fjNfftMkX+rPDiw2pF9HsB0qXrHHMzr8xpgTmZfEOJY03K4MIPCWkyzWB/j3LgkvZrBT68
 GDx/C3dBu+4A66KQUUz7VWUAOuuKPFIsClt1SzgoiSICpAyQE4+ChYq
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The firmware exposes clocks that can be controlled via the
Alive Clock and Power Manager (ACPM) interface.

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference its
clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml          | 11 +++++++++++
 include/dt-bindings/clock/google,gs101.h                  | 15 +++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..d3bca6088d128485618bb2b538ed8596b4ba14f0 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -24,6 +24,15 @@ properties:
   compatible:
     const: google,gs101-acpm-ipc
 
+  "#clock-cells":
+    const: 1
+    description:
+      Clocks that are variable and index based. These clocks don't provide
+      an entire range of values between the limits but only discrete points
+      within the range. The firmware also manages the voltage scaling
+      appropriately with the clock scaling. The argument is the ID of the
+      clock contained by the firmware messages.
+
   mboxes:
     maxItems: 1
 
@@ -45,6 +54,7 @@ properties:
 
 required:
   - compatible
+  - "#clock-cells"
   - mboxes
   - shmem
 
@@ -56,6 +66,7 @@ examples:
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
+        #clock-cells = <1>;
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
 
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 442f9e9037dc33198a1cee20af62fc70bbd96605..f1d0df412fdd49b300db4ba88bc0b1674cf0cdf8 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -634,4 +634,19 @@
 #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
 #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
 
+#define CLK_ACPM_DVFS_MIF				0
+#define CLK_ACPM_DVFS_INT				1
+#define CLK_ACPM_DVFS_CPUCL0				2
+#define CLK_ACPM_DVFS_CPUCL1				3
+#define CLK_ACPM_DVFS_CPUCL2				4
+#define CLK_ACPM_DVFS_G3D				5
+#define CLK_ACPM_DVFS_G3DL2				6
+#define CLK_ACPM_DVFS_TPU				7
+#define CLK_ACPM_DVFS_INTCAM				8
+#define CLK_ACPM_DVFS_TNR				9
+#define CLK_ACPM_DVFS_CAM				10
+#define CLK_ACPM_DVFS_MFC				11
+#define CLK_ACPM_DVFS_DISP				12
+#define CLK_ACPM_DVFS_BO				13
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */

-- 
2.51.0.261.g7ce5a0a67e-goog

