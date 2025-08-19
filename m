Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAA532C302
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603957; cv=none; b=rQy8QRjitKwJKos91ZcAi+aY2J2WM7RD3AvozOHoqv19Zo3cynDlGHfTe6NLAT3u3dBf4BuDCilJW+TPOBZJJcBEF0MGOBbiirxY137VUUG9Li/Zw8SGwsH19PZ8ak72aEI3zP/83y3DhrKS1SlOb4AWMIJM3PBTddgybYvafnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603957; c=relaxed/simple;
	bh=RHgzxERFqXBJayCLtp1I/QWWv579hP721Hv537Vxp6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=twUO1UWTvmUhkXHkKacE7GDx4XM4XxcAGpYeWV1Jp3WzPeWIXn5gspEBtjHF8lt57om00CH4b1ylubmTP8KaqbMZG6bGC+DjOnYZ2wSA8NqhFo/1fdN+uKuWsPT+Mb4EG561TL2QHW3IRhHqrLXI023KEBi70W579LFcgjqduJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMnhn/jn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMnhn/jn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so41705085e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 04:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603954; x=1756208754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQC/lHj8toc5TCrfcLhMJT3E3jz1/e+YpE7xJHN8Uxc=;
        b=mMnhn/jnB0TOfLsAGsa0OIw/Krg4lwJOUyMntBVx6SrwwTzFp3Ow1CdFNCC6/XPiUG
         n1aI3UVolCTCYie36baKz1GA7n3NjG8SyjYlq6WUWVCPFftHOi3XrEMB+GuSZC2Sy0B3
         J1jjx49YgjMBf3dvtstTZlkx3ddd2tl3Dcb5b/87RioSrwQQGBQ3Hv60za/ANQeM9A1t
         Nh9uz3MpDDPDrc/pHZyDug1X4aoMPndgmO5KEHAiITIJkKIa3Ekuw+/eSy2nK58/UqU/
         o962eY1/U6TZNMpAhhNGRpTjo90GVUp/lv2C423oa8s+lXy5hYEcoS1f2sIBD2NeQxbX
         H7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603954; x=1756208754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQC/lHj8toc5TCrfcLhMJT3E3jz1/e+YpE7xJHN8Uxc=;
        b=ovY69Sr9NwukVJkYI61+xdpOqpaSoSrGI3HvDDUFhx+W7K5bOhzMw4b88UZhcdxHu6
         RwxNV0LgptXBIxT8n6fgtrEDYmc1633pU/6cLNRF/jHbKaSqrOypqpnZmnFiEWorWoQg
         +n0/v5dLXZ9/4NMWRS/N6ZZvZRbRk1dq9dGQ7PqCbj4MysZk9IbBh3tDufX+9kRhiXTB
         Fq/nKcSw/01SbbmPMBN6S1WHDEqa/0kNW2gQ+75sfH3TSFShUu4PshGJnuN8baDJfzUs
         zaWPSCW9xfoCMhOlbjr1jPLuT8ybFly5g0eHKNAjHJzIDeiUs0fSCOhNaxcpdgeRlP55
         otug==
X-Forwarded-Encrypted: i=1; AJvYcCX72hc/FgBHjyBnA3NlwKpgu14CvOi9oOsTKJHFXV2T/HzCiaZHCKhi509P2a/UnSNnx4+KkgEFqC+rN770xby9cA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2hwaICZu8Zg75zXFUGdHQOCrDI2gu/aqzvKQkfRkOvxMiE6Y3
	Kh94E0MjJIN48xjBFjtVreCkxFGH3eJPXHRH01oIj5ZnCSfXrAvYHj062dYz1e+BMYs=
X-Gm-Gg: ASbGncv7sg+5AjA9MAtnks1ORTyEOLkL62YhLiF/YalOxqKBrCAdhVawR+99euhMEKw
	frZOPIsAmOr9QsL05rsypUPBsYSo+amGRctedKndDFA3+ubf2EkOCGGKfADOGKx5E1nHfoDIrHK
	yDG9ypLyccVu6h95AQBjCmB1hSoRDCaSGyuNe4hkMB1zEYAr86GAmul8XfPF+GiaHVN1eqIwQUr
	yTd9ewJQcMNyr04o9nQRdjt09ENhWqq9wIPq23mAer1dWGoEHqc4g2NOzhySYcJ7Zwvw9dVgQv5
	+OIPtTRd0G5teeZQH6KnUkEipOCGB2CZSRhCCheZndPk+nNliLf65eANLUr9EfHIyUb3bcD9Z0C
	RKD6HtPWs0sM8Hj5wJk6vVyojJAFrQh5yqhSoEtD4A3ZF/0Vo3Pm6mR/VLqHDDNXWkX1XSbGA7s
	VvlQ==
X-Google-Smtp-Source: AGHT+IF3fExSedP+rhMqtDX0FAinw193ciSJFQj94UbY/WOxq/Wu+sbuY/lPivyxNBf7lI4vygbdfg==
X-Received: by 2002:a05:600c:1d2a:b0:458:b01c:8f with SMTP id 5b1f17b1804b1-45b43dc68a8mr15298175e9.8.1755603954043;
        Tue, 19 Aug 2025 04:45:54 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm3430817f8f.48.2025.08.19.04.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:45:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 11:45:36 +0000
Subject: [PATCH 1/3] dt-bindings: firmware: google,gs101-acpm-ipc: add
 clocks node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
In-Reply-To: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755603952; l=2971;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=RHgzxERFqXBJayCLtp1I/QWWv579hP721Hv537Vxp6E=;
 b=0VhemtYEBOAIemXpjyQfMxDu+WLHs0AJDariMAZ3V8vjYybaLCcOrMVRTwR064RJ8oH8Qlkro
 INmqzkQoG67CliO24U9NMFfvexZ3ErbbkxnpAIzvSJXbHEqDgAb42pu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The firmware exposes clocks that can be controlled via the ACPM
interface. Describe the clocks exposed by the APM firmware.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 28 ++++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           | 15 ++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..27cdf9c881ca680e78e77a0e14ffcffeba970871 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,29 @@ properties:
   mboxes:
     maxItems: 1
 
+  clocks:
+    description:
+      Clocks that are variable and index based. These clocks don't provide
+      an entire range of values between the limits but only discrete points
+      within the range. The firmware also manages the voltage scaling
+      appropriately with the clock scaling.
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: google,gs101-acpm-dvfs-clocks
+
+      "#clock-cells":
+        const: 1
+        description:
+          The argument is the ID of the clock contained by the firmware
+          messages.
+
+    required:
+      - compatible
+      - "#clock-cells"
+
   pmic:
     description: Child node describing the main PMIC.
     type: object
@@ -59,6 +82,11 @@ examples:
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
 
+        clocks {
+            compatible = "google,gs101-acpm-dvfs-clocks";
+            #clock-cells = <1>;
+        };
+
         pmic {
             compatible = "samsung,s2mpg10-pmic";
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
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
2.51.0.rc1.167.g924127e9c0-goog

