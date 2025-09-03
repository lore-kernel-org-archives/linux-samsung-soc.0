Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ABF30EF71
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909484; cv=none; b=IN0T2CHng8gIGnRGO0Ib9awlMpqaUiV3d9Detg80WDngGNC7UnM0+VxpDFc7QEiZR74WV4sjpUcMGc4Ex2/f+LX0ltzXt4G9BgXOqUWXHQGa6Q/wIkvbf9O5egI6z9WjeEaGpFRdX7qulTLzksKPt88ewlgNUbB8eoQdU6XuhYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909484; c=relaxed/simple;
	bh=DvCybsMaaovaYrXT+kGukCydj98f0jObaOksmSKLE7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C00x1RxvgNWiR3t4vvKa/yZcuByF6AAAB95cHN2lwAkdb2DAww5Ny7XPRHQe1V693PkPXfdxcNZ5QktbpoTmCTyw0En9GqXjSYqLAiGqnZyVmXDRQU0acFgWGpe1E0KHFdmjM4B71pt4u18vn2xQYiBjwE/zNWV+sygQpe3awNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0ie7+si; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0ie7+si"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b8b8d45b3so32401275e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Sep 2025 07:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756909481; x=1757514281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEi2/PQdoB49OMbTqw0F1qOk8kSvaGQNIH9qtvm23Bk=;
        b=o0ie7+siFogBJjNrH4W80fsw2iNjR21hc6Ssw4FoITWrTxF3agQmtM172K8MTvsrg5
         vuxwyIRNWGTrmvs8BJe/ga8MMpPT1wpYZ0WyrxmDBM1lQyNjgl4/RP6xVwEtFFOyCuXa
         CdFfXP7+Ff44Acw/ybPEVbkP3y2IyhFAskYB4fmAPQ0AwkpBgDm9ZPNc+XWFV9iMD8ZZ
         IViaw5g/x1VuQ+jPUkoQ45/Op5KGIHj7jKis6Ba0ffsHCrZR7vcldMmZoDWwe0DfWLDy
         7ZbJJQ6UOZ1oBgXTBB14ZCT0q0CD/k1Zm1RzJdm2b7uKU8RxwALP5AM+cbFashCrEAdX
         pgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909481; x=1757514281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEi2/PQdoB49OMbTqw0F1qOk8kSvaGQNIH9qtvm23Bk=;
        b=YYPuN00azO52RaV+ynSsM8RO1POFOEc/6HwOE0LkDf1ya+3HvDWrINUnCZ158cO6gl
         6Cw5j9En36OpM/3V9Eo1Y3DAL4hJf9dUinTSKCz7CcWwrGrv1DVgIVdsXy0GmLDIpHxp
         RFVemWrcLnYvyeMCocpZ/iMQkqgDw5zvoTqYfDfv187L3DktmnxZ3cAtViZlQSRf0NTy
         toqnbKW9m4mMNdSAn6X2rBlFznvqmdTh/HxY5urfrLFxSYImbcWbeeS6y4hHYdfc4dvT
         zRHj2hlqmzmlMZKQWbO6Xx9UhOfnsH8j0bMFRR6pVJgAM0PV9yWAu5d691xrwpugLWG4
         /kvA==
X-Forwarded-Encrypted: i=1; AJvYcCWGDKW4YhJmp2Z7YgrHeIm1A0RLFda00RJeep0f1vwJMQyuK19FtwrYpJXZxRLKeeY4TIsQpt3VcQl46GOQlb7xmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Du5q9A89z/3TIwxjGDrhFVizEN3uPWLfuyoXmqKD0oAXm0y7
	296p2Up5vCbXUtOx4ofNOmr2sCwJlltf4kQ9eqyRQL1xvFXbFUmryvp+0iAtTleJ6GE=
X-Gm-Gg: ASbGncsmyAKlhdXFfm8ObCjTSAV04G4SIwPOHJUFxXhiQZIuS3YnfiLtP0BGgFRG2J0
	qw6/zfNdXgtSoCdzQSQ6tG6/0QoUCz6cNPPJbw7iLsWVmz2tGoUKgSogGj6mdCvsJqxc1rHwzEO
	q4eKNiZRiEMNaqkFaj54CcFMd3rEtBmbKgydhH9FsId+A6g8gyfLRPtOVemxwDnkvFLTS595c7U
	SB2/VVXmrYsRgubghU0GxfGsKwryPPyr0dQw1Iqz5L6Lw0Ps6U+OAprb4sky6Bro1Kot8jjwxBy
	hdcmLr2ZLlmVqjW/BAj9a7OX/tkxRLoBliTz1iLgI+ltkKLyQP3vMVB0I0ZKEyJ2DhgHc86Grij
	uPg/dnKJ5KpO6B6i2IiDmtKQSFtCj7jjwrYCd70w9USTa9R8jt/2wYJw3OzFflen2kcMfUulJCC
	GikT8R3bVNSz1u
X-Google-Smtp-Source: AGHT+IGrRziJjTMwT25c2OkVilDIuZjFn9L5MCkwO866+qwMljC5rb2HmLajCHH5hfA9aOIzCWZjeQ==
X-Received: by 2002:a05:600c:3143:b0:456:1c4a:82b2 with SMTP id 5b1f17b1804b1-45b8555d6fbmr141415125e9.10.1756909480609;
        Wed, 03 Sep 2025 07:24:40 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm3996035f8f.33.2025.09.03.07.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:24:39 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 14:24:36 +0000
Subject: [PATCH v3 2/3] arm64: dts: exynos: gs101: add CPU clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-dvfs-dt-v3-2-f24059e5cd95@linaro.org>
References: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
In-Reply-To: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756909477; l=3055;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=DvCybsMaaovaYrXT+kGukCydj98f0jObaOksmSKLE7g=;
 b=pVxjq+o735XuRTrAp24zmkgSEQyM98WPeI5CRx0F32McSQr5++j2fb9E7h3fx6kzQhtnAPJ9Z
 MQlithbin71DJfR1JpELcCBTH3/EWVBxgk3BV+R9iKiPVX/zygYfDLi
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the GS101 CPU clocks exposed through the ACPM protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index f00754692bbac39fd828ebd4ef7c269f746f2522..e355fafe2276fdfbcb573600474cbdd26a654e7c 100644
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
2.51.0.338.gd7d06c2dae-goog

