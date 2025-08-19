Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284E8335BCC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605434; cv=none; b=XkURopndxQB/4TsaLMEVyS+JiUCyOeVHUz98eNYXF6QGxSAXTxyXe95C1OAYrHhxruhjxUskPyBZRZAXm8H5qCS70xh0MKQ9QfaJjU+wNrUbdp9KFiuAgkJWE7ytVnKTAajGN0PNRdhypXfBJSbpFj0FQLZGBSTLAEcqPpjPIl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605434; c=relaxed/simple;
	bh=nqRaXwOYUnbNG0j2pkHNtlxp7R1a7PqyphjeUytPpmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sR04ePA9ntnEOWaIytpkrcWft2E7PXNoKjdXXD8NehaimBFdXxT2l9frUz7I1NrtK0DUvthRXtZlgcoMhsyJSi5iUiOI4ej3H3u+56cvEazVyGwArSq8Br16zCJYCuWywlilSxE2MUa17d3ggyjhKxEho7EYCIQrXafnlX8QGvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MrRgKEKm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MrRgKEKm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso3648572f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605431; x=1756210231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2R8D30km/KSA0O4LJJjN/QUo92gPxApdF/JdH5YvZSM=;
        b=MrRgKEKmifbADj5O9EzoyijMXjJ3Ds00E8WZjlEqINctrzxGyyATb67UO3k1lwpdr/
         F+df57i7A0XP/RyYehUgvy1PEHw3ap7h00FVQtKztNUZGcXCwVKK5cezF3wP9E46E6E1
         9n57cHM0aOESOJMoQARsmFLtgFtcRMYeDzl+b6O4aFd9WCUogXfazcpei1esjjcialp/
         S/TRaRXNZg7EWuvSBsG9Tfz+O/x2zaXpW+uHErt6NoYvbjavwXcFhZVJGO1hWNq/yJGU
         4HfiLvvGmhZl9WYMXP04OjbfAncWtzu06xNQxzwQw0GbH60Y9z6zHnuP1EUVp3fhfKO6
         x+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605431; x=1756210231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2R8D30km/KSA0O4LJJjN/QUo92gPxApdF/JdH5YvZSM=;
        b=XCO5IBbQa7CTn0odS/9eY8bDB1iXlLD3Om56ISqWEb5WfOM55AObEDe53AjWrfYOAf
         LoQD6501bA7XtTNIueN2h8LpG0q/gRQF4cRy4xTluwBqH+b1JHq/PoPc3A1G7crXrO+e
         Q6x6JBLqq1zERq8ezTvsSX5JmHTnJ5ycc+jldfKwbYPLLwapRWjMQshIKTOLLIiQPz2N
         7RrPBRcMovfoWCB2ssHbX2WQR/q5PuCCe38KMVALDSS4lauMa7gGvR085IYIDRBzKDzN
         tf63+6OVyD4tT1DFE67pYz55uL4mubMN48qPUq8kKT2UVzWM2UuMOCOJgTqUgrCA82Wk
         BgaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyYk9Cj7fUD3mFSx0oGW5WIjkHH19m1gVfnGyH08pL5hcUWkQqIOQX/LAMFcN4c2TUsYpTblmzMUIb3D3jCW2TlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/wKQHgkIV1A2Edbu8O9UBt3VFpEQGYpGZ7Vp6p14bOb6zb9O
	m+57G1yFF/43rhYCPye7nFdcGkW603lJ7enLlalqrqGMtKK6EWloZTqM8X9S8V9RLjM=
X-Gm-Gg: ASbGncud3lRI4Cu1E2XQIVNChppmPZ6lI6wNBSRd9xEeJ8ry4ksFoGWdfLXjhyhCglN
	xsax/bRD/BLDOv3I9ar1aAd6baCvpBcM3SFRQ83HcDKljoORVEC6keNBU/Azous7BsfncTLTGHG
	QfpcPuVAeoUU0GWm/+RR5cbuE0W2ywEKRCFhSREBmGFWPESR7YIOw0fCKWWzP7NJRxBVCaTAdUx
	kCYhXDnk57+HKZhggmYYS7TKlcYT+nFkg4uVnJvOeGDT8uBXBcbEOH1/M3V/jS8fh9RcYpsziyo
	9HrkJhoeOugE06ihZdFJYkCWPLyU9XfsDC5KDb/zZz4ZIVVtWGqXlZP3dv7YtSs/06RaDpqcRvu
	quo0uxhRvYThuawL7KSiIyv36A2fBKqMt399Pip2NU/9gpSO/7R3pOKlmtDEXV6bke4XlZgV7S/
	Ehzg==
X-Google-Smtp-Source: AGHT+IFppDDMa2VTL2CIGZHM9gzBH35t1wQZSmplPnzJjHi59FMlVUz9oCZUMUh1Ng+uHKmRdhHOVw==
X-Received: by 2002:a5d:5d0a:0:b0:3b7:8acf:1887 with SMTP id ffacd0b85a97d-3c1333b5d05mr1714373f8f.13.1755605431436;
        Tue, 19 Aug 2025 05:10:31 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43b9asm3464410f8f.24.2025.08.19.05.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:10:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 12:10:21 +0000
Subject: [PATCH 2/3] arm64: dts: exynos: gs101: add CPU clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-dvfs-dt-v1-2-4e38b95408c4@linaro.org>
References: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
In-Reply-To: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755605429; l=2818;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=nqRaXwOYUnbNG0j2pkHNtlxp7R1a7PqyphjeUytPpmQ=;
 b=pFUBFj/DVmeY+1QROIBAVpK6j8hChOM2KVuU6gLsrewVj4sNAL6TBghVOuWhfLXWLQ2nbVtIP
 K8YHpySm5NaC08vEfS1NamJQbC18pPnsZa5Tc0q0R/snEt9EkN0plWQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The GS101 CPU clocks are exposed through the ACPM protocol. Add them.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d010b8ffc4e09562519d6796691fe573c68b7ac7..42926f8bde8889ec99ecf9fc551629a0453e788f 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -72,6 +72,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -82,6 +83,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -92,6 +94,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -102,6 +105,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -112,6 +116,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -122,6 +127,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -132,6 +138,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -142,6 +149,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;

-- 
2.51.0.rc1.167.g924127e9c0-goog

