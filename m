Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8CD1C5F32
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694083; cv=none; b=GRps91gbk2dOa95tWA5HeSdvlqyLLKNv9GPV6TsqDpIhMS9EGy2yYwPC75ApC+lCGnJ2/N/mrIIX6ZXgphWEotqGjv0a1QWd3Vo/1m/UABZbk9jHaze7zx779Iq+aPOWd1kvT9VEJ9aYdp+CuD4maC9qCIzitZx85xnKLB3yW5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694083; c=relaxed/simple;
	bh=Z1Fdvmr/EBe2JBleWGaCfGElV0L0pkXxy27DY9A+b84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ex/Dzw7inNzhGvJIDVVsHnFALYjQgdGOf9H1+uLg+svyAPmaOV3NkBIPGsBKn6E/qB0g0G+3tC1e2aE5AG0MOmA7H4zJ8mQrUsYDWQ0Q5u+gpavzQOCPX1hry2JiAT+MFddq4HvTp8ulC6civ9JEJ7H5SsZs6MaIlFS+dQs0OMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vD0sD9BM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vD0sD9BM"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so256607566b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 03:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734694080; x=1735298880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhMGmKlGGOtZ2SvpqF+i7oaaEFRcqd8HwZsDBdF9tV0=;
        b=vD0sD9BMQRSMcsHV7ig/FLLvCGKZ9iEZiGJ3ogoycEtc1JQAse+QJyyzkm0hRe1DoB
         qvw6zstr6KI7DIF34gzB8BOkjk80WeLjBsFp96nNuzAi++5JnH2svcn9xzvQO2ECURpI
         3zHu526L1dzFEXJFjnoEhRJX+WSu5Jicemv3bcbSdiBE97G63heSv6a8kvIwzPWDtLHG
         9Dycv1fwQ2fXJ8WmFf/PQPg/M93pn0J6LKcWh8sYG5nzV2Nh4pgaPixy8TfnsU0A2SKd
         kcXXh/+hLP7/8cQrYkrNzI9AZp/Un4gw9AU4ZGqeYLk6MCVkeiKnX9yXUefFeFekeCUD
         QVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734694080; x=1735298880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhMGmKlGGOtZ2SvpqF+i7oaaEFRcqd8HwZsDBdF9tV0=;
        b=Uw3zm+3yimxYg0VSEREotBdN9xsts8jX/nkGYYXI/eohLpqh12T1TkRQsxs7s0DE1B
         0HjOXv+pgpeWNvhexRUbhZQlnoLh/n5br1BDIj02RElTcqf6IV9zNGQ31t1o4w/CxcNY
         o1uYbq8emddk8Qi0oG0vkTPMVd1lQZsyTBng7q9s1P360g2zv15Ynkr14mqdzKUdY4E/
         9qHVhCnKM8eNwWPHPPickNpCmsu1ZX/lGm5UK/ujpqQUXeiZDdhVCrvhybROKSiLn2eJ
         BlxZ7zoKTKGz120AlPexfjJJCjWStW/saXw7WnOV3g4xW1ZbZO5qnaYVwj7Rx3BUK/5r
         /1iA==
X-Forwarded-Encrypted: i=1; AJvYcCVNFt8JfbDSqVYBoDkFzCWT79OR66XAlBfrl1h8Xn69AlU7u4hCQ8Z4snd+jp+GcV0dJGdjifm2jwZ0sCMzop2hDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEGCPTiJk1evgR8mUAXGqsZV0D6MsNKwqTsK7CZGwU37wzqpcs
	I31vk6cdUcf57v/AWlzHz57HaH+SgXRw6eFec7gMcmcf8ndbRVKNmE66nsLFHVA=
X-Gm-Gg: ASbGnctSdfJUvaPgEylXBVMoXhDsFrSFPJcyCrvSeE5Py9FF9xT6VoyCaN4nOQJQJDF
	G3uePLzLh37d9c9MijRrBrIThWoqQcxfOI8uAZLQ6UbmCGm3ntw4xrxM+eezWOFn9pXImq0Neu2
	50T9H+0r76Tq8axET3aCXHqolvYDnA2reXNXlBhCR3YknW9JPjG0MUIPZ1Weugot84+0rp2IaAA
	YJUlg1cbW8aSZvRzXxu5YuQ7Jeuv9RgGjda+mwVNCc9y1KAbNcc7WpZV4Zi1JL1mcCpzoRRHLv9
	p1ibGoIXfUHb6ClN61bkZMS0zQebIsdIBRami909
X-Google-Smtp-Source: AGHT+IFU2H+Pw1Dmh9hoL+lth2FhsMr8S0vXuAclD0J3+yf3rw+Dc8UEEShqb5npXBaErUn+eaUhdA==
X-Received: by 2002:a05:6402:3206:b0:5d1:2377:5af3 with SMTP id 4fb4d7f45d1cf-5d81dd83b23mr5556412a12.5.1734694080230;
        Fri, 20 Dec 2024 03:28:00 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701abd1sm1632634a12.76.2024.12.20.03.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 03:27:59 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 20 Dec 2024 11:27:26 +0000
Subject: [PATCH v2 3/3] arm64: dts: exynos: gs101-raven: add new board file
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241220-gs101-simplefb-v2-3-c10a8f9e490b@linaro.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
In-Reply-To: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
(Oriole), this is also based around its Tensor gs101 SoC.

For now, the relevant difference here is the display resolution:
1440 x 3120 instead of 1080 x 2400.

Create a new board file to reflect this difference.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: MAINTAINERS doesn't need updating, it covers this whole directory
---
 arch/arm64/boot/dts/exynos/google/Makefile         |  3 ++
 arch/arm64/boot/dts/exynos/google/gs101-raven.dtso | 33 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
index 6e6b5319212a..bc6d600fda84 100644
--- a/arch/arm64/boot/dts/exynos/google/Makefile
+++ b/arch/arm64/boot/dts/exynos/google/Makefile
@@ -4,3 +4,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += gs101-pixel-generic.dtb
 
 gs101-oriole-dtbs := gs101-pixel-generic.dtb gs101-oriole.dtbo
 dtb-$(CONFIG_ARCH_EXYNOS) += gs101-oriole.dtb
+
+gs101-raven-dtbs := gs101-pixel-generic.dtb gs101-raven.dtbo
+dtb-$(CONFIG_ARCH_EXYNOS) += gs101-raven.dtb
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dtso b/arch/arm64/boot/dts/exynos/google/gs101-raven.dtso
new file mode 100644
index 000000000000..577f52a4fdad
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dtso
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Raven Device Tree
+ *
+ * Copyright 2021-2023 Google LLC
+ * Copyright 2023-2024 Linaro Ltd
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "Raven";
+	compatible = "google,gs101-raven", "google,gs101-pixel", "google,gs101";
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		splash@fac00000 {
+			reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
+			status = "okay";
+		};
+	};
+};
+
+&framebuffer0 {
+	width = <1440>;
+	height = <3120>;
+	stride = <(1440 * 4)>;
+	format = "a8r8g8b8";
+	status = "okay";
+};

-- 
2.47.1.613.gc27f4b7a9f-goog

