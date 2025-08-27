Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61F03128A2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756299594; cv=none; b=aUNA+SwQ+hCkcLtQxY6VF0X8e+AzP9jXuHtbdSV5VeXNsZfGdXES7R7+iV6nPR1VXQVLV7NSLejvLeKaL5jAzhGL/6icLFtbbaSpRvDZrI6yKoiVRU0+CeiZ16DJ6AdGXpto+CeyBNTe0b7Wd+Y6+kzqUAAI+Bh1awiF9SLo8X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756299594; c=relaxed/simple;
	bh=uoqgJ3OhNeN6asyWKYrHarA0VMYib5B/PdW+OT7cv0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGjO6Jsd5lzJG4lPke7QOKvvyxvtzhgYNvBDU7UilyRsiBI8suGSi1t2zWyW7RGWmBqK+uiefkPzP3MiKkHS1x1VKHVviCKeqjhc1lp9AQqYQmnLp8ZPlZnxXEe9F+MR/dE8aR1V6UQx3h2DFQZ/brn6hz8dieMwlmN3OwDwUFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/gC66OC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/gC66OC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so39594465e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299591; x=1756904391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjK6OpIk8kyuSL5lFjeicimOy3JEve15WbehlqoxKGY=;
        b=h/gC66OCfB1RPBkJ9usBZQrAPpBfc55SUL7i5ZXrZMBFl0QKndqvPmDyiB7iyGr7vU
         t8k54017UuMo1SEdbpKnkuoLl64fKKhBeDrCBLDQyUJ4FXS4T7dOFZCAdG6FgoavUx8+
         w7zqKgE9qw+fxN6lt7ZMQZXjFpZUygNPqTTOY7TIB8T3z6b62NWlM+coLbi59YQ569zj
         l/VJjL0gblVlDcYGDM2J+UQL+RyYBIKMuQnmx2zb+8N0cFFhc3yUmej+EW8XsOFvdbeJ
         8ia1VeIM97g3LRERSZdSspf69gBLAssH3j4Lj/w1jUud0EAkyg5zk3E24CkShBkEKovJ
         EJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299591; x=1756904391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjK6OpIk8kyuSL5lFjeicimOy3JEve15WbehlqoxKGY=;
        b=OfJvJIrBshX1JEhMRx6+cDPig9E+qQhGWTTUafLishik98Mm63q9QEME5cCeHfzqBe
         HjNfSZYNC+fqCRhb43KnQ5vepUYUNQqf8L5xylQL3faFf+k4ZX9SAtoYAt6cFX8lH3JB
         5gdk97iJgM2YFZHwxBlaN2xd7X8Yn4HitVFBOhml/Du+ZMaTqPwwdVNTrPAb9a32B2R8
         Epu7zFPzWZmBPjK+W6HQ1AvQI+A7ZO2RHO7up3DjSqV5yNnvG3Arqx1MsMUPrB+hKKZ0
         qHEMrZWC8c6qrCMTNARis/4dfdmFdRdECXAq4KSyZq/sKzBF5C9RxqZZo2n6XdgicuMM
         bwuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy+H2/D7n1cEuoLatJFBZePvsH86Ph4p2ZMPp7MXHWRZ2pb2plOBqO/+1G2x2T4m81q8WfHzZSo8CdQj7IDGN65Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMiD7Bl3FZoc47rQQryB1KQpEuzRbyRAfZGkL65ddO6VrA8Giq
	147Xh7ebZZHOoWIdTqThypnFEy5UddmgU4QbkQYobFVk+qp+ah2pMhcnZVilzx2/cqc=
X-Gm-Gg: ASbGncvoF0UhZvMCkeAJNDpEa2nlgKkhXiNsi+UODWP1HeD6eUlz3nOlmRrSkA6A908
	JOiTYkg3svwzCdo7Yr5ZK4IQsZ6l09DMiliOeyAO58TyOhxWtH7+qqONy53x4WYkxZ61G0/Filz
	2RlIDhOm4nq4YPc/btud01LLEJCXtawGUfjQG808bewt93WJTHG33dZET6sWYEPI4IgUKlzTFSy
	CN1Z+oGcyMgPRgvgy+Snv9ZixOp3elKtwAc5KqeVG0rE8clHnA/YmOdJA7GE1FeoG2b2UhKGXtB
	o1qoG0Qgxu3dxEGKJy4/fCkWWhVDdetQFaDJ5BytJ6519gOlp6JveGNSP1uuzBj2/4UOlAd3KG5
	X9Jr8R+sH6/RHplq19rhNBedVyFaEkXdzluyK2qbMmoxgdZ9H4KxnsVtjqQG1VYyTeInMItjuDM
	Re5spiBTSsyH0D
X-Google-Smtp-Source: AGHT+IHPwrsF3Jtd95IZMfDq3CXcF1TLGO6gNbOm6NJUOa4ZfiI/Wp4VmFA1B9k12eMcZCO8op0PEw==
X-Received: by 2002:a05:600c:4689:b0:458:bc3f:6a72 with SMTP id 5b1f17b1804b1-45b517954femr168350295e9.4.1756299590870;
        Wed, 27 Aug 2025 05:59:50 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc890b178bsm3272069f8f.52.2025.08.27.05.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:59:50 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:59:47 +0000
Subject: [PATCH v2 2/3] arm64: dts: exynos: gs101: add CPU clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-dvfs-dt-v2-2-e1d2890d12b4@linaro.org>
References: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
In-Reply-To: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756299588; l=2740;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=uoqgJ3OhNeN6asyWKYrHarA0VMYib5B/PdW+OT7cv0M=;
 b=vnVVuPmKG+UU58DxmUVjQUGxPgldzUS4A/j/jb9225yIdT/j7J7EUC0BGjTM1lU6pntynAPaO
 KdDzTE4di3OCQQZG6n3zIstYLljRQ4YZMRzjMl2OPkxhUs7ftmOMYdd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the GS101 CPU clocks exposed through the ACPM protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index f00754692bbac39fd828ebd4ef7c269f746f2522..746b7d8ecdc90fd746015b8322924bac66c6e363 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -72,6 +72,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -82,6 +83,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -92,6 +94,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -102,6 +105,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -112,6 +116,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -122,6 +127,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -132,6 +138,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -142,6 +149,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;

-- 
2.51.0.261.g7ce5a0a67e-goog

