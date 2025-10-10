Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EAA2F0C67
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760100410; cv=none; b=IK+rjsXEDizNXsVx0xWX6cNrJs4UhpIHHgpC1iSMHj2pxP9KRpBdlXjAInBvMhSpiD/HCGMlK2ty3vNivaZ8YpMPTNoFKdx/zGK5GK7ul0kf/0B2nz0JFx/qlk6BowSBdkbOH21rkkDcd8WjzA+GI3lGJRiyCtWH4F7VY5mZuqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760100410; c=relaxed/simple;
	bh=k+x7SigsMLhAqxwhOrFdeHdHMbo3VM9te/+155p1XOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWF6/jvN84LXV2iGons39lV7V830OgkAT9jWA9JiXE9RDBhn5kx0ET1qtutkSN0EFMSWDtZhR5K/3JidDv34vsDb0KDL1pwgUyA86fO9BuGCM2yDlKuyFn5D8kwx0jLT0aift/kkrPF/qjVPe9XhOdal6d2BIFSSKwuN/Mkplls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/rdbPli; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/rdbPli"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46b303f755aso16091185e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 05:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100405; x=1760705205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDFgROGNpwR6/oUQPsSAUdlelbgLvQg5uFC4b3ecjXY=;
        b=x/rdbPlijVLXPfAXL/BbEI/3WyI6gXYnW7fwE7GSAexsSfWYzYWDQMMMfRbNSPlORF
         oasyWWz+0n4ZudX9j1PLD3xNpvmJdLU3Cs/PiQ4hCUOEJd4bj6lIfVC7WaObDVWbkWEn
         VQw8g0muxqU2Uk10LPBAB/KKZlFbH8sfpeK+Ri+uB2h0rKSncjo3xN49pDViCkfUM2kF
         QoaZ71IyYsdfU465PtuY15j+EAHQoTJjhzJJXgHA3CHPRb3hM/+B33jjz8W4HQV4AZWW
         971jhF2z+pL9K5JKLiy9kv8LHRpgMXKSgiuH3jnyHgVDNLlroUpv6gbMYVypVkeU17ka
         eLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100405; x=1760705205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDFgROGNpwR6/oUQPsSAUdlelbgLvQg5uFC4b3ecjXY=;
        b=g6A0rApBc8LC7bNSPY9Q2W/E6zyi84JYhyh8sVho6sTP8vv3eNe6P0/Ve4me13p4gt
         AdCY8nvJgCzDAyRGoRNRmRpgYeLsvzLe0uYJ3XbnSzhcvoN5iQgE70UTAW1r7qC0rNA0
         z1cPoDqhkidKzrKG4Py7bj7qAussoqUKJ3I8W3SPbbxfgSnRGpPWF7L7Zo5/0oT2qeKW
         8BtLQVUJQ3AWdZdC+rVasiFudHlnhMmScBuH2JrA1kgLyGY8eIoNKjkrN1Eo+/V2fXjO
         X+zhnKB6Vj3ViZTjOAzn375G7cR03EUyRp3T7c9Jcc+77gJtBbNZriIGz4Uvs+Kv6B2h
         wOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwgFrL8ZINs+mYnOH8L4KBQSmzDTGUD5914zEd0iyrrzW96yNl7ZWBxP0Pe/D/YU4DB08QG50GXxU5O7hUVu9AAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUYQOc0PaFxsID+ZgmR1KgGNjq+M6fKPuYhNUmk6GbuU0P5CO+
	ZejYSbK9TAp3gUI4somuKblmUE4RWPG66CJAIg30ZgX+QRAZiOWMovZchc5L7pPGpiU=
X-Gm-Gg: ASbGnct0AwsMKjAjopaTd0sWfM83QKjb4PgsmEjehfyhK/R+v+ZtEBRFtV4WjNKXxaD
	aG+P46IHdGp+K1bBRvJu7Obifj2+3Ak7l4KL1DnpixOmB4NUBOzhjLuA1M0QsYNsPKh9rgBeZAd
	rQ1hbNbLZqNd91M69PyoXMWN0uRCoeyGAN0zUFu2ZodHqN6YSF50HCPEXOu0tSMnnVVFhT2qK6I
	LzzfU4n+X4CBFjGS6mjl6Y5QoAEB68nM0TllpwuRh1QnBAsRcY9RHU1xg9l0YS6XhSZhLYJWxtD
	TnRS3PqfYWvtuHuDBlLSdCOUSTv+SeP4XMvNztVC2OAyu0kepeaHvrdY2bj6zd/qfU60XvHPoJb
	EN6U3XaZoqeNMciepnjUvnE39tOMooAMDs8bMUHGjah73lrJOaMB4c31dfSW+yjIIZEF/jpxGYx
	SQBrZhTQ7mdeYdzuvfTcHnHA==
X-Google-Smtp-Source: AGHT+IE/dO3nGSvFVXAU6hqMkPw06wJHrP/9TuT1/Nqdw0LoISZ4HCImCFLqMx5Nn+/i3yWnu1kRZQ==
X-Received: by 2002:a05:600c:1c23:b0:45b:6b57:5308 with SMTP id 5b1f17b1804b1-46fa9a892a0mr78680205e9.7.1760100405274;
        Fri, 10 Oct 2025 05:46:45 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:43 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 10 Oct 2025 12:46:31 +0000
Subject: [PATCH v6 1/6] dt-bindings: firmware: google,gs101-acpm-ipc: add
 ACPM clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-acpm-clk-v6-1-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
In-Reply-To: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100401; l=3182;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=k+x7SigsMLhAqxwhOrFdeHdHMbo3VM9te/+155p1XOI=;
 b=Ke/Y7Sr2R6ZDIsHTXGrUwLhr0AJiQlmTDXWgSuvtAxvGhdnCBNAIsOUzS7BT6IzHX4xM9NWih
 ZirIzmZMcgBBRu6RrV74nBO4fITr2q9dLgKAtAHoVv99PcxDDN8jvck
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The firmware exposes clocks that can be controlled via the
Alive Clock and Power Manager (ACPM) interface.

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference its
clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
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
2.51.0.740.g6adb054d12-goog

