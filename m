Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E301B6CFE
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736957477; cv=none; b=K19+B16v4839fINtHbmaMnKKmxyvmJ5XqJbOf9mV1HZV3aqe8KGJ8gwD2Iw/FqSkRK602VWuLMHTdOupHFUZ4qI6jxc1FQVkSicF3+4fOMJJQST05RBMQ1L69QataVCeWfXtXkmO22ttpZ7DlexKaQo7YptrPMOBQ32rtJ7+FVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736957477; c=relaxed/simple;
	bh=l+s75NW0nEo9AS9gIRHhQuLeK1gPacQ/TcfCbcLQ9N8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dGAvbJ5dycjh3VbCP+/gzXmLYnk7qXSjqXvfoS9C+UFBsdFBgXlRaWAQanNWFmqvQXw+LNz8SHFC5id7RjdArUWjFvR+ZfLGYHKcCyDH/CpCc/PoXZptXU8jSPzDslij5E/adYXQptxloxvcIbgwsaHp5IhuROC+dkEVoS/xtrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qyCWDEfP; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qyCWDEfP"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so9652780a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 08:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736957473; x=1737562273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5pQlUERu30P4Ba0NRUoDkbhX6SQEcjoIl1O/J3MOl8=;
        b=qyCWDEfP6f4lNDOYFI1pS7/QCgB7jBv8Q2oLX/shKdLB/bO4QbpYWRjTx4I9Qj0Ppj
         TWywSWW+eLhT9V8/fculES2x0YOUHssh9LD0IqNhCOfD/QFckaXbkMW5jgg9T/lKvoaX
         rpjPck2edGK8ts/0sEAtlMAYA95zOOIb8ANOnYsyUlcCDFQq+hE3aX2muET4sPjpDzr8
         xTM8yLXENk62Yqy4df7PLM2UX0g1SPeqONO4YgXijKCF7ZrDyBXWz8/oHMCc7OSGHQQk
         WC5LujX9X1iqdKMzW9IiJXGc4ru2iKpFy6CVxZcv55ALlfHqUBOLzNXpgF4qxGmVRrz8
         Dmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736957473; x=1737562273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5pQlUERu30P4Ba0NRUoDkbhX6SQEcjoIl1O/J3MOl8=;
        b=gevxNJn7GqyJpmbSc3Fxc+Pa80hWwKb4oGeK/R3XnBRlol27fmTxx4llvOoiTNmrV5
         QvSrO4kIw2QbjuYXpZQAerEcxaAkmPQPxJhfHU2YK+sgDsrq5QGGodzwo+POAJfInu7b
         AjXDUjAbWEWQIl3hh47xNM222vBzKg4/0A7aDdBd2tznNwWaY5Hd61NRDG6y1QOTpSnM
         dknNjSVjnT6xb+bXhUZmqpwU9wN6RanJx0K/KY2Dn5+Nv7DfNEkF0RK3qn/WTmWNrKYj
         UNjP3z9zRfLGcyAh2+XMW/WrJbtPNa0rmba4w1HHGbT3b08reJjYUiQnGgtVYhkSktbQ
         8JbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgAbT7dJmzT2Q01eOje0pY6nfqPtEYtjuLmg3ljdAROdmEfvmJ1XTKz+Gf39v0ZObhS6SQXW4sRHJDExhnE0I6Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoV/hJu9rHh7R8vl6HULBkNaILiTwmIaMrFhjGgBHQyfUsIFXM
	tIZGhqQDOIYZXJaShFJ4J2ggvlflzRSQSW2yphUiTpVT5je1fnQ9uRF2nllREkI=
X-Gm-Gg: ASbGncsTawBEukZzOGoqjegmxYHOtMTmhIqilREr+0/AMq5zY2WNQebmHPpL0zueQTm
	mzZZy8yRiYnSXzMDrgm8WV+/83n7mV7MNs7gTtX785gKzzhLq/QbMIPAmlVXj7wWS2fmR7hsGNb
	c8g8a1xwKt2/WCDj4zTh6KVLh9T1A9GrzuKcgOjvqrdlKaebsmGdCSZIAi9GXp01p4691ZPmA+K
	rid22lDttU0z4p2l0XRtuq4qFOuIAKFK8l5k46zGiUIRtuyjQ3JEhPjCEuNZDyljxG7CQrHXLG/
	cLeBr6WudTtI4PyMS2dPhn/3Rw7yzaWN333ZOuoX
X-Google-Smtp-Source: AGHT+IEk9W6AJ1Bfki9sNMYgrASoIkC8McdJI2hZtNgAUOMLE5wTU/s3opZMrauV4el0rFXtouBevg==
X-Received: by 2002:a05:6402:3489:b0:5da:1263:306c with SMTP id 4fb4d7f45d1cf-5da12633426mr4994787a12.10.1736957473227;
        Wed, 15 Jan 2025 08:11:13 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a55f9sm7416232a12.81.2025.01.15.08.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:11:12 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 15 Jan 2025 16:11:12 +0000
Subject: [PATCH v3 4/4] arm64: dts: exynos: gs101-raven: add new board file
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250115-gs101-simplefb-v3-4-52eca3a582b7@linaro.org>
References: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
In-Reply-To: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
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
 arch/arm64/boot/dts/exynos/google/Makefile        |  1 +
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts | 29 +++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
index 0a6d5e1fe4ee..7385f82b03c9 100644
--- a/arch/arm64/boot/dts/exynos/google/Makefile
+++ b/arch/arm64/boot/dts/exynos/google/Makefile
@@ -2,3 +2,4 @@
 
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	gs101-oriole.dtb \
+	gs101-raven.dtb
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
new file mode 100644
index 000000000000..e982c87402a8
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Raven Device Tree
+ *
+ * Copyright 2021-2023 Google LLC
+ * Copyright 2023-2025 Linaro Ltd
+ */
+
+/dts-v1/;
+
+#include "gs101-pixel-common.dtsi"
+
+/ {
+	model = "Raven";
+	compatible = "google,gs101-raven", "google,gs101";
+};
+
+&cont_splash_mem {
+	reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
+ 	status = "okay";
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
2.48.0.rc2.279.g1de40edade-goog

