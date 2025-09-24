Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B21330DD37
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726925; cv=none; b=L6R0xzVMrfSHB/gwQJQ+onh471dPIjdFR+crCDEq+vM1y1Svk9+AO8aNj15zmTIkEuEHdougPYHjM9hqMqtVtX0NbehY70a00z0emzNwhfnUOmy0ry/eY54EuQjOQsBN2h5tDjjnqTpjraq4ZkUIX5AMEJJ0yY0jrr84/z0n1B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726925; c=relaxed/simple;
	bh=fbP+TlGg3NLAStwFGbaJsLnhS+YJCTLqAERnvsIlpbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ByA79Q9wLyd6V7Hg+S/L/47U9oiFf+CoixkmetweLw2u8D1u+c1lsNb3hHfIASntmX5s4AKAiOj/pCzJsiMsuCVBSmFJHFslhXx85EbuPn3eep+OfFXMW3J3i9opoRolNqrJe7VAFMCQAa7m+a9Mhw6nDInakoYuMMbcwgwUL+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IoN95KSI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IoN95KSI"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso4064485f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726921; x=1759331721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yH8er2WLBKFy2pvhJtg/nSPNfqLqFULuGIksUuRQwfc=;
        b=IoN95KSIwvcAZtzEgfb4Az9yz/3zwsa6R/01ugjV1orzswNz43zDNgPIbiPjslWYx0
         P07KSGPzjFuc+ZIws9Nk2whxl+ShBZraIQDCVsCVDbSyp0S+Ht91A0emE5r27Mg7/7Xa
         FzoZewr0Dmp6ZoJUPuWFkjobgXjVnH+6kR2QXlpe7Fuu7zhuMLGNAEvy7+sp3jZRdOvQ
         A6CfVr3KWRhgPfeBOsI/k4poj3GybLlPGVrD8QLoUqM/BJ/KvvFiO+km6OQBGxtE8SQq
         UeN/BFYK3yDJp0ZmxJcBIGKB7cfdjO/SNFsdTn73BNEJ6D4yfWyj//Q6QDSnsruKf5Bx
         7S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726921; x=1759331721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yH8er2WLBKFy2pvhJtg/nSPNfqLqFULuGIksUuRQwfc=;
        b=mfQIIkU+hS5sJ/dvoG5OeZw4RnzA93pb6UnLShsQ3/Zp1GG63PAgZUdBkeaVb/iTEL
         D7KAi24wTPjSXnl+k29BGRuRv+HdXJ6B/TLba89gNEA76RpcPezVWCHuCqtrjNelTroW
         BY3fqcPjHWVZccmh/RwRLmNb94rBiAYRZV+K6GwQAYIIDQIy3UByfwjIRZJiBR84LMD/
         zbGJAfehTXWVOOK3lAp6hrupCIprUr4BLgz9zme9eqz9S8rzLYYExL8uu723dzpQEdOB
         ubmCkffROSmSUNg7hU6mteT0ExlnBD5iOnLLaGMoZl/dlUuXgCOJg3UNrkbrfv+PNkRd
         JsZg==
X-Forwarded-Encrypted: i=1; AJvYcCVElJmBzfqHgMzCguxzkkyurVXsVkfdaEdeMkpQm44t8CDNDzft+1pmQ9SxNUwLIGQch6Gz62gUHMp2LqLEm7t1Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbE+yZUL0XSxbrHeVofSzYK9nP9Scph6I3BF8/W0hcL2wej1Yy
	WIOdgthX/qxuT+PwUurcYXT1foxw8QMFY9f9/pS20XxkgxVshKrLliAyvN3ByW0EA14=
X-Gm-Gg: ASbGncuffwBqnFTFPQUeqaRdaZN8BsdAgr3k1zuTHszQsI9GESqeMf9FsJN/0R/lCqY
	9yoT0ZsQ3O9qEFXOnCQF5krer36dr2ZKF0NXUi9x3m3fFBYR8tGD+iNVgBps0+bgm4hOXnC6Phq
	8DwqGN2NHRiq+xOUgc6eo/UwFdUHdevo76J+2WLD5aN5woGPfDWYaTC1Zn7TbwNJT2WJbNaq1J1
	jBPDO4YikS9hdZPuCQIczsWSAPjAtfWl8Na1KjwQnOjWBR7067an4qXNu/79foFm+1xZOTumtZ2
	wJJN9iWRWO2hBTkiln96+fsSl9ScF4ZyIx81K6qbYg388ztWh68eJi8oJdwWMugujQO4LY+xKES
	4An6yw+LKr4zjEpNn3rf2LAPLLUa8iNgbZO6qBapzwWOQZCtJSEtJWmCLKzfxr4Po7XyBs1SMiN
	E=
X-Google-Smtp-Source: AGHT+IGgDCS8ayniuFNQT5/k9DeS1jl9iWus2UZI/q9DVCjLLBthhuyhs6xf+tcMVx3nO1q2hjSHog==
X-Received: by 2002:a05:6000:1884:b0:402:a740:1edd with SMTP id ffacd0b85a97d-40e4ba3a51dmr315711f8f.39.1758726921493;
        Wed, 24 Sep 2025 08:15:21 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996bf1sm36541855e9.1.2025.09.24.08.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:15:20 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 24 Sep 2025 15:14:42 +0000
Subject: [PATCH v4 2/3] arm64: dts: exynos: gs101: add CPU clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-acpm-dvfs-dt-v4-2-3106d49e03f5@linaro.org>
References: <20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org>
In-Reply-To: <20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726918; l=3181;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=fbP+TlGg3NLAStwFGbaJsLnhS+YJCTLqAERnvsIlpbU=;
 b=jyG1osPC3rtt7uF+ad2Qp5/Or0/SPA2xOcoNoupHjypQ2VNpx8eT81G/wEh2mhALZVnNSsyJy
 50+W5DUMM9RDHBOJrxr2gCo10bcNTUDZHNDByUXpXYqFLmrF+p/kXCo
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the GS101 CPU clocks exposed through the ACPM protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index f88d45a368af7ef88e8cdc84b3a81a63a753832c..7326801c9ebf270496997839185594c3c1776577 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/clock/google,gs101.h>
+#include <dt-bindings/clock/google,gs101-acpm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
@@ -72,6 +73,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -82,6 +84,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -92,6 +95,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -102,6 +106,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -112,6 +117,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -122,6 +128,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -132,6 +139,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -142,6 +150,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;

-- 
2.51.0.536.g15c5d4f767-goog

