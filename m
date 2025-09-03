Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E780930DEDF
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907808; cv=none; b=YzdEQybfU/GowDHGmsrYDvbTD2ewwGRPsS47CDwcf6MwPcNAgmLqTzIZvOhScnPt+7Sw88mrjgKSjW5aCV81iEWT5yV5FkrXLI2CZdiJFHm9FIcveZp2iba3p1EST7hBNJNZ9BCc0cJ3KLNlAEi8VWuXoMspdsBe3nCGd6AH/8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907808; c=relaxed/simple;
	bh=ZAh+jVEjk+p7IOugFLPfvW1C8t+Wsd6E695/908UhEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rt+d54Fjq6GWzKZlPHX8AfMhorODz8LCurp3uT84/hlyRyuPw6VRekMiZSWs2JWxhfwqO7g6eS8Nq93z/Fn/OTadZ6xmJiJfqFskAmTJAGCETFaIKhbo7VmyhIq60W/pYbVaXbe4uaDi2nlpwac7D6eZvg0dc2o5L4UULoAszIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PG7Zix3X; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PG7Zix3X"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso13059405e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Sep 2025 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756907804; x=1757512604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdN66op9i3NFpyozSjSkCRDl8+TcoAJ7grYzdeqCoIA=;
        b=PG7Zix3XLWyWOeBLSpOiXd6QypdNYxG3Eu4uskAN7Qo/HgNGGTVMjPSN9rMKtXsbMs
         aemI6LkC2vRE2vPkLlo3r4YZWX8d9DumxUEJD9RLgDtLEBNhdonigswYr4fSWHXPGWwf
         0f74ZnYa8cIVEKaUZiT0IPQbcMwzmFSZo/tZS9mzffqII3j0tQoXzTd55ftEiiwPTY+e
         G0Ph4Eyq7gspRHAljEFCBnKNWs0qIQfAc+HYZ4iKTpwBZodM6XH806GxZxiviPdzoRVm
         hBcSgLhUle91aDc7Atoc95Wb7aNqPcpPIU0RHpV15qp2zFEOWW3g3ESiucuQhwaxAUQD
         XlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907804; x=1757512604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdN66op9i3NFpyozSjSkCRDl8+TcoAJ7grYzdeqCoIA=;
        b=bs7kLL50JZd3/9ubB8wsb+1p1/R7id6WISWrXf7BmUARZ3lt2pzEQxQXayBramjgN2
         tSYnx553rKVd5jiJeG6dYryCTKSiMtTsYpg9iLPtySwxWQekBpziRGHp3bf3Prj7LjiT
         x71AWvWO5591yrpbVsio26KU8GkfHSuQsidwfiwbaF6BveGlYWtirl46d23168lAEI12
         ZzxDyM24G9NwrNWgbVzs1MsaV06n/8M7q7GktTLWaB7JX0eYOQGFs2DQ9D0mQ+BLHzMv
         wGTBnT51fPZygWc2LzMavQ3iSnMezkYTnXQh6bwHHychL/D0Is22EGgyFQhCOjDhIgw/
         U26w==
X-Forwarded-Encrypted: i=1; AJvYcCVAP6WYHQQFT28GzJiWFdg9Gq9uZhvBXGV/cXEegXJ7T0HtmJtcc8GVRvxm+DVFnI81dP6n6EleFjHNzB3qTec+EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Q4vBX6WcgrSZLJRjALKxBsr3UM7c1/qJGwKJmqSz6k04i6It
	IJK97JdkpwXSuu7WUlirkWYs0pY6wXcW85BVlbhHlwH8UjU92OmglZzlkP7khDwrfm4=
X-Gm-Gg: ASbGncvm11t6B5TxZyG4R/Ufy5GLMDkckEkZdr5mfPTyeK3KNBlKRd3ecmVTWTZwxTr
	aXGa0z2NztiLWsrhWX7Y+7ehW2LLoAASe0bOMSD/ORHyGuhrTljcCcnsCWGYcJsKwhekuZDBNd4
	QzxJdPFLj7zAxeFdxr2nPF79bIWACNzGRJU20+DNiJ/jEnsnYhgxKYs8hbUtnz0f6XjPNC8cxOf
	8dM0gQbS/JYT+h/TabD36d2yLyuwLndRw6/CqFAF6ORhut+rsImsX0fUVrP0BALD10JmCQpXc1T
	Tf5N62OzJxRJDOddY7OR/ZqgAvUHuVDZ+cNaSgIXnEPxiIsZ1Nq7d/rmVkq9onQ1pnNZbNjW4wx
	8qc6v2TDWtLth7osQCy2IbkLacVHGqZX+xxKtq6gOUnJMFspeUvRwwHEixTSdqNFNKXt3oYx/cT
	jvSw==
X-Google-Smtp-Source: AGHT+IECR6paJMgzBY3Zw3h8Wf7Abdm7g6RlBanKKC46/zidpsFpNnDAQ1oCeBfUT0qxZEn5rcCT3Q==
X-Received: by 2002:a05:600c:a41:b0:45b:627a:60cf with SMTP id 5b1f17b1804b1-45b8559b8edmr151397345e9.24.1756907804169;
        Wed, 03 Sep 2025 06:56:44 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87632365sm197257135e9.16.2025.09.03.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:56:43 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 13:56:38 +0000
Subject: [PATCH v3 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 ACPM clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-clk-v3-1-65ecd42d88c7@linaro.org>
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
In-Reply-To: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756907802; l=3056;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ZAh+jVEjk+p7IOugFLPfvW1C8t+Wsd6E695/908UhEY=;
 b=LdelR0stuthQLZnXmrirVmjYcak2/o60K97PRS1iSdMsSt8ME/KFQNZUxXFvFnn3X+yQ10ki7
 84Cj4pTH5pdA4SKB7iyec3ofdfwJhKl3k+3XqAq5yNxcOimpT2VF11S
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The firmware exposes clocks that can be controlled via the
Alive Clock and Power Manager (ACPM) interface.

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference its
clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 11 +++++++++
 include/dt-bindings/clock/google,gs101-acpm.h      | 26 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

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
 
diff --git a/include/dt-bindings/clock/google,gs101-acpm.h b/include/dt-bindings/clock/google,gs101-acpm.h
new file mode 100644
index 0000000000000000000000000000000000000000..e2ba89e09fa6209f7c81f554dd511b2619009e5b
--- /dev/null
+++ b/include/dt-bindings/clock/google,gs101-acpm.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Device Tree binding constants for Google gs101 ACPM clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H
+#define _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H
+
+#define GS101_CLK_ACPM_DVFS_MIF				0
+#define GS101_CLK_ACPM_DVFS_INT				1
+#define GS101_CLK_ACPM_DVFS_CPUCL0			2
+#define GS101_CLK_ACPM_DVFS_CPUCL1			3
+#define GS101_CLK_ACPM_DVFS_CPUCL2			4
+#define GS101_CLK_ACPM_DVFS_G3D				5
+#define GS101_CLK_ACPM_DVFS_G3DL2			6
+#define GS101_CLK_ACPM_DVFS_TPU				7
+#define GS101_CLK_ACPM_DVFS_INTCAM			8
+#define GS101_CLK_ACPM_DVFS_TNR				9
+#define GS101_CLK_ACPM_DVFS_CAM				10
+#define GS101_CLK_ACPM_DVFS_MFC				11
+#define GS101_CLK_ACPM_DVFS_DISP			12
+#define GS101_CLK_ACPM_DVFS_BO				13
+
+#endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H */

-- 
2.51.0.338.gd7d06c2dae-goog

