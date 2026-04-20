Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CBF3A6B86
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Apr 2026 17:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706818; cv=none; b=GAdE2g0EtbkJGzlAjM4fXJ6/uLAmY0weW7A5lTe6xWHa/lLD05T3MQxtYwBwhgs11GsljIbGh2Veqr++wHafW5WbITpUSC4GEtlu6anurpKva866sqg1pMUvrdeKJZAR65hPnaUMGqtd8USZrEW8c6T1djpNwSXfHArBM93Zbfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706818; c=relaxed/simple;
	bh=dBg2F8BGZZ9Mm5Km26Z5eGMyUNSTN1VtnuTwvVrkrps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H7KV+Ho7VyJt27mbk9DB2nj2YB7UdEn4fKG4mplkPXkgWd2pLgyhd2aJPka8EXqL/vnxgGy+FWbsRxRo7MVhlfAFEdzQSP4yPv5nG3LYEoERYWlozX/G6zm7FFTaOVy3djs+4jRhL/ucNlM6X21oCb80e1kkertWQfHVNbFtMFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XoutfUF9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XoutfUF9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so13031895e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Apr 2026 10:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706809; x=1777311609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O67orx5DZUm8BgsTcl5AUXZvqqdjzW17WuxDEAybQAY=;
        b=XoutfUF9J0q0jx7CLg5db6DEsZ2d/oVy4JiJR4vNcDcq/DW6bCfsGHf6j/8jaB1TZd
         eBXMWIQ0zNdCdg64Uz3gxpfPfvDGi3mN5ta6U8lvfhJJB+rHcwaHqpZIxEotoMXhGx4y
         nQTf7XawgQubFT5jcEm0DxA5wCBpQUhujRQCv5X6bMyExDst9+QmHIgB4tq2TEpQEDWg
         bclh3KHnMEGAU4Lt3xR0rg9Lal+jo8+vJkLu5eBGM1hOPnlQdG99tTqj+WiKkY8aanjU
         2tWZDwd6UNHXLgFC+Iz82s4wtbJQTqRBiJ08ypIAzK8HbPvGGk+XG9/sNKrUlJYdS9RA
         +1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706809; x=1777311609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O67orx5DZUm8BgsTcl5AUXZvqqdjzW17WuxDEAybQAY=;
        b=MDD+MIe9GzyqG5wH7QzV0BkAYaDfYLvBZqefVrH7v+ES1PztOAXyOuJj1aGlq4g622
         vYFQ/fwgyrDvYSYWK7sNRZytW51pbcW5ztXXafOCfQt1B1XLPvYeTeI+JX7JpETTErZZ
         9LCKHCMKdCm2SAXz0XAjoUQDQ3Bthks8kZj+FTxSOY5iSCBHnx54KYsKA/Yh5n0GoB55
         tyRBmzffOMQC007YhFw/6gBWHr6l8cJY7dcGxcnT/3n3yfdAC9ilbmx0baWND355Tcvs
         lmkgStVmGgdfVKhpG3hOl20AT68ElZNwnBbUSxE/M/6CUay7hu8liTTXvEcFCgZjeXte
         OS4A==
X-Forwarded-Encrypted: i=1; AFNElJ8vqp+hF/rev0H6bwxUj3/ZKi2dLyBTovAFoKPmcSUKfR47FjjAZdRIotbl+BO159/pPEK21bMF6Zqx6DPsUGNU+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgHttTbAnrG1W/rn5A17V9K+8jKJJrqTl1daywijsq7AX+eg3Z
	tgd5GAGw0TCEMCyP8pYf8stkoPQ4VsERtIUtXxhpp8aKbfkLyHhVfLmkQ7HKMNTy8TY=
X-Gm-Gg: AeBDies1HBwcTBjpgLPohYE1zUqB57+MmlTOzjh1mBmc9sn58iD3tCHKub6mNhmSQCP
	kaCOGc8K9QVL/XqFshWQNzbur/mPXNVQT24CLNvJeT5TcBMRFfh22vIlJq0dcRWH3QmFmabr8i8
	P8Jv9RUbdAkv0xULn5nV5/VWn93itAo4fHmZmO71mf6q3vwLHMsF8QSOmKSYmL+8KgwUyFAZA2t
	iM8HPU2ooIg+FEIGYrZpau5hkhz7Q2xlQTr2fQTZZ3sIfk5fUPXNZ6cKxTDAIk58xGgwRfZM+c/
	u2f4nWG7QCknariJZlsHnRe4S8kE1pmYkVWlPQCY4SecOAUh2M9fygMxZax8cggAzbU6VF3ERLV
	1Efi4O69XKA6/yx4NCC/Ed6IP//li2me5vnAwyuBxRFZ69UWPWse0mvqisP7dAGLMr6Y4B3ZhPR
	uloqbaK2ha2MTy73PHKvZB2uyXGndiuZ6iJf9tKAZKFBwzL4m+J3uJ7RIclcdVuIR6qxym/H4Sd
	y1x8Djd6gp0YNDY9w==
X-Received: by 2002:a05:600c:4f92:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-48a0f18edf7mr39490595e9.24.1776706809215;
        Mon, 20 Apr 2026 10:40:09 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:08 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:52 +0000
Subject: [PATCH v3 06/10] firmware: samsung: acpm: Add
 devm_acpm_get_by_phandle helper
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-6-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=3004;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=dBg2F8BGZZ9Mm5Km26Z5eGMyUNSTN1VtnuTwvVrkrps=;
 b=UOAj8gd0XgQFhm1iCBDvFWh9DJ+oBh0oq0XfmalIeylHgCDrLUj+FnH+1NXZyoFoKkD5UBjgB
 DQ3XgDUmwZzDRFlKtsI8+P4vVI/i2hj8MZGg/O8O5oANp006hjIzhqw
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Introduce devm_acpm_get_by_phandle() to standardize how consumer
drivers acquire a handle to the ACPM IPC interface. Enforce the
use of the "samsung,acpm-ipc" property name across the SoC and
simplify the boilerplate code in client drivers.

The first consumer of this helper is the Exynos ACPM Thermal Management
Unit (TMU) driver. The TMU utilizes a hybrid management approach: direct
register access from the Application Processor (AP) is restricted to the
interrupt pending (INTPEND) registers for event identification.
High-level functional tasks, such as sensor initialization, threshold
programming, and temperature reads, are delegated to the ACPM firmware
via this IPC interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c             | 23 ++++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index d4afd6b535e4..15c10fbb2920 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -797,6 +797,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+/**
+ * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
+ * "samsung,acpm-ipc" handle.
+ * @dev: consumer device
+ *
+ * Returns a pointer to the acpm_handle on success, or an ERR_PTR on failure.
+ */
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	struct acpm_handle *handle;
+	struct device_node *np;
+
+	np = of_parse_phandle(dev->of_node, "samsung,acpm-ipc", 0);
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	handle = devm_acpm_get_by_node(dev, np);
+	of_node_put(np);
+
+	return handle;
+}
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 8511c3c3983b..9df4c514ebde 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -70,6 +70,7 @@ struct device;
 #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 					  struct device_node *np);
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
 #else
 
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
@@ -77,6 +78,11 @@ static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 {
 	return NULL;
 }
+
+static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	return NULL;
+}
 #endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.54.0.rc1.555.g9c883467ad-goog

