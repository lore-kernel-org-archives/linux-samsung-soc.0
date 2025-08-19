Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DA53375B0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605436; cv=none; b=UI5g2MmD0/EyZf/bsmVkomQ1mar2gNDKHii+26d64ocNPgzJVlqwdincLhEtGo0j3wCtwzcLlSMCgnU8WmHlhxvQrA1D7Gzo30vvayc+P/kTd3+j0yFbH9CORBi6H6nL5ku1H77XmxBzH8LJqLArFj0i1WS5xpaRjJJ6SM/S8B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605436; c=relaxed/simple;
	bh=a6PZI+tjZrmUg6w8G2uTeLCpE/pt0ZaCvCKU3fNi5Gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DDUyL3D1wW9V9ShPGYCjNECTTBG2nHH6pcWb3TA0G97jsVD/eYzkUPvCzIIoU1UK9XVHX/psYBKWzBTR4UnBGIlFbhcVx8vCmvRQWykX8kNMB64eKbU/lA9i26j+XIHLN+SqmdrvGY/jfVeAxXPHJGqz/Y2N66cGfJ3qqYnnFkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WQj44Mu4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQj44Mu4"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e414252dso2506129f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605432; x=1756210232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo5OW2N+fFWT46bTnXRh3LxSjEG1Sg+/vJAfEv3O438=;
        b=WQj44Mu4V1M0ZYr2IUJ7BA4FcRTh3nQZF0qVox9+egzrbuOPzx/+bg64N8k37wzme+
         /4sny1q7cF64w3Tn8hkU20TxJWr++DlDENi24lkOJG2J2o/tISXvKJwSbzG4cv44zFiq
         iP6waOeOsZl26YCo7/gKNPqEnJ4cwH0OFyzEv/Rh8AvtkK733miUZPHgrzeHTOk4LmR4
         X/Gntu3XAAlN3wOvFEohK0j0/78Z2+n3vBnY1rL3TtK3uzCoxLgBYPm/EA1n1sZ+1rc6
         LzNh0hWWp7rEenJ8sMq59KruCr3tVgOhOU9uF7mr7ete3OcYF9pqO8hdxkH1jJTVOkgZ
         klTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605432; x=1756210232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fo5OW2N+fFWT46bTnXRh3LxSjEG1Sg+/vJAfEv3O438=;
        b=h36kwxS3zIUrbW+bTxxTSAoI2cG3GoFn8SRXOoiI9IHlfNrnSmn0i/SDjqW6UtYo1b
         p25DQ3vvs0lUlB5UR33oNCpWtivrQqKA2eiLbkICX3ET43rbzEQv8balPeLDO2rSe/h/
         +s9KpWHJTThtQ+bnWuf6uHvyg31qGh4g3j4uAwo/8AuRNDFDKtVRtjHPyCY+dPlljEFO
         vEhfW/Ooyy88hRGqMsc+xwvoUp2WZE6Js1if/GzXGNNJ2REhMAnU0kSTDiMMQU9GS8Fe
         gdl0EkHYThVWOL0IKitDVsZXvdK5muGSiyap+mJtmq6ULqKct5K/eNcKzkHK7XNaWJ6B
         RIfA==
X-Forwarded-Encrypted: i=1; AJvYcCXjQtg06oHw1utpbnCZqKL2IegToixO3D/SFXqNYqhbnqKcw5Q1uWjk7sfeVTaBr1E7aSLoMUFFb+pihMXgm9TsBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTTKYVSZS7kUaoe6eUM8olgEuX4J7Lrq9tON/+H+eNpmrO7Rh
	1KFTZ7dkgbQHoaJeYY9k+cCGbvQAjXh7nS72IUxh7pN7lJwKkaATb+kr3MW6d3eVUg4=
X-Gm-Gg: ASbGnctrwu/Hawfh6oQ2CdZbrfKf3VYWsfCyrvYF1VY9V3Vr9rs55LjEcidjYgKp5KP
	KatIt07f60CifLglTVfe3syYJosAnWFI5eIa7hv1f7+wwNigALc8ccl4rFiSq2SJNIHEaydiC+W
	kVs21XP5OlrbaNImq9Wrt64eL3Z4bQn4CfR+7N7XTSTWVfN4l3V26GFY/1wf7lglNjml/i5oCJp
	GzkmicNwQh3jCvhkRdfxmqGcPe7bdnb8Wfx68QsPN94a0OSVCIvJTPXX4yJpcC2mHa6ClTv4vry
	/QXmkr0noOhlJcKFny8dUbLYGx7c6Lz1w4zNymuazqxPucgmxKy1PjzRoiPv+plEjuvZlMlJcKe
	ATUrGKmcVVFwPiQYyZfV44Y851EpSV8ZBY0eybROk38MTo9h2lkWjVjt4w9pj4Ht3ZjRNk7s/YZ
	gz5Q==
X-Google-Smtp-Source: AGHT+IE+TigsoESUPEvEdx0SMj9TNE4WhIFMdtlTxF/XQWw9NIeo2Xu1D9pgQ3QTkx9YGaISinGf5g==
X-Received: by 2002:a05:6000:2212:b0:3b7:889e:2b2b with SMTP id ffacd0b85a97d-3c0ed1f2fbbmr2090455f8f.47.1755605432231;
        Tue, 19 Aug 2025 05:10:32 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43b9asm3464410f8f.24.2025.08.19.05.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:10:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 12:10:22 +0000
Subject: [PATCH 3/3] arm64: dts: exynos: gs101: add OPPs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-dvfs-dt-v1-3-4e38b95408c4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755605429; l=8502;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=a6PZI+tjZrmUg6w8G2uTeLCpE/pt0ZaCvCKU3fNi5Gw=;
 b=VHVnXzOLTTEgHy3PRapQ2DpiSk2f3PV2HmXhzrM77UxMkHCaAnS1joG5fcZS2vcpK5NnKpJ08
 YAM+PFCydyaBXyqSkyULZ629pZxk+fLLr7xvwiO6rmdO0pwi4Kg5QOM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add operating performance points (OPPs).

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 275 +++++++++++++++++++++++++++
 1 file changed, 275 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 42926f8bde8889ec99ecf9fc551629a0453e788f..b2303b3a3d176ef9b825d24bbe0bb0d51ef81246 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -77,6 +77,7 @@ cpu0: cpu@0 {
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu1: cpu@100 {
@@ -88,6 +89,7 @@ cpu1: cpu@100 {
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu2: cpu@200 {
@@ -99,6 +101,7 @@ cpu2: cpu@200 {
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu3: cpu@300 {
@@ -110,6 +113,7 @@ cpu3: cpu@300 {
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu4: cpu@400 {
@@ -121,6 +125,7 @@ cpu4: cpu@400 {
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
 			dynamic-power-coefficient = <284>;
+			operating-points-v2 = <&cpucl1_opp_table>;
 		};
 
 		cpu5: cpu@500 {
@@ -132,6 +137,7 @@ cpu5: cpu@500 {
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
 			dynamic-power-coefficient = <284>;
+			operating-points-v2 = <&cpucl1_opp_table>;
 		};
 
 		cpu6: cpu@600 {
@@ -143,6 +149,7 @@ cpu6: cpu@600 {
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <650>;
+			operating-points-v2 = <&cpucl2_opp_table>;
 		};
 
 		cpu7: cpu@700 {
@@ -154,6 +161,7 @@ cpu7: cpu@700 {
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <650>;
+			operating-points-v2 = <&cpucl2_opp_table>;
 		};
 
 		idle-states {
@@ -191,6 +199,273 @@ hera_cpu_sleep: cpu-hera-sleep {
 		};
 	};
 
+	cpucl0_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <537500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-574000000 {
+			opp-hz = /bits/ 64 <574000000>;
+			opp-microvolt = <600000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-738000000 {
+			opp-hz = /bits/ 64 <738000000>;
+			opp-microvolt = <618750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-930000000 {
+			opp-hz = /bits/ 64 <930000000>;
+			opp-microvolt = <668750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1098000000 {
+			opp-hz = /bits/ 64 <1098000000>;
+			opp-microvolt = <712500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1197000000 {
+			opp-hz = /bits/ 64 <1197000000>;
+			opp-microvolt = <731250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1328000000 {
+			opp-hz = /bits/ 64 <1328000000>;
+			opp-microvolt = <762500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1401000000 {
+			opp-hz = /bits/ 64 <1401000000>;
+			opp-microvolt = <781250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1598000000 {
+			opp-hz = /bits/ 64 <1598000000>;
+			opp-microvolt = <831250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <862500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1803000000 {
+			opp-hz = /bits/ 64 <1803000000>;
+			opp-microvolt = <906250>;
+			clock-latency-ns = <5000000>;
+		};
+	};
+
+	cpucl1_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <506250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-553000000 {
+			opp-hz = /bits/ 64 <553000000>;
+			opp-microvolt = <537500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-696000000 {
+			opp-hz = /bits/ 64 <696000000>;
+			opp-microvolt = <562500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-799000000 {
+			opp-hz = /bits/ 64 <799000000>;
+			opp-microvolt = <581250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-910000000 {
+			opp-hz = /bits/ 64 <910000000>;
+			opp-microvolt = <606250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1024000000 {
+			opp-hz = /bits/ 64 <1024000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1197000000 {
+			opp-hz = /bits/ 64 <1197000000>;
+			opp-microvolt = <662500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1328000000 {
+			opp-hz = /bits/ 64 <1328000000>;
+			opp-microvolt = <687500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1491000000 {
+			opp-hz = /bits/ 64 <1491000000>;
+			opp-microvolt = <731250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1663000000 {
+			opp-hz = /bits/ 64 <1663000000>;
+			opp-microvolt = <775000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1836000000 {
+			opp-hz = /bits/ 64 <1836000000>;
+			opp-microvolt = <818750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1999000000 {
+			opp-hz = /bits/ 64 <1999000000>;
+			opp-microvolt = <868750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2130000000 {
+			opp-hz = /bits/ 64 <2130000000>;
+			opp-microvolt = <918750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2253000000 {
+			opp-hz = /bits/ 64 <2253000000>;
+			opp-microvolt = <968750>;
+			clock-latency-ns = <5000000>;
+		};
+	};
+
+	cpucl2_opp_table: opp-table-2 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <500000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-851000000 {
+			opp-hz = /bits/ 64 <851000000>;
+			opp-microvolt = <556250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-984000000 {
+			opp-hz = /bits/ 64 <984000000>;
+			opp-microvolt = <575000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1106000000 {
+			opp-hz = /bits/ 64 <1106000000>;
+			opp-microvolt = <606250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1277000000 {
+			opp-hz = /bits/ 64 <1277000000>;
+			opp-microvolt = <631250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1426000000 {
+			opp-hz = /bits/ 64 <1426000000>;
+			opp-microvolt = <662500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1582000000 {
+			opp-hz = /bits/ 64 <1582000000>;
+			opp-microvolt = <693750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1745000000 {
+			opp-hz = /bits/ 64 <1745000000>;
+			opp-microvolt = <731250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1826000000 {
+			opp-hz = /bits/ 64 <1826000000>;
+			opp-microvolt = <750000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2048000000 {
+			opp-hz = /bits/ 64 <2048000000>;
+			opp-microvolt = <793750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2188000000 {
+			opp-hz = /bits/ 64 <2188000000>;
+			opp-microvolt = <831250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2252000000 {
+			opp-hz = /bits/ 64 <2252000000>;
+			opp-microvolt = <850000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2401000000 {
+			opp-hz = /bits/ 64 <2401000000>;
+			opp-microvolt = <887500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2507000000 {
+			opp-hz = /bits/ 64 <2507000000>;
+			opp-microvolt = <925000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2630000000 {
+			opp-hz = /bits/ 64 <2630000000>;
+			opp-microvolt = <968750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2704000000 {
+			opp-hz = /bits/ 64 <2704000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2802000000 {
+			opp-hz = /bits/ 64 <2802000000>;
+			opp-microvolt = <1056250>;
+			clock-latency-ns = <5000000>;
+		};
+	};
+
 	/* ect node is required to be present by bootloader */
 	ect {
 	};

-- 
2.51.0.rc1.167.g924127e9c0-goog

