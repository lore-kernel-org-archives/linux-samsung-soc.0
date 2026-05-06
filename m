Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48F743E48A
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067569; cv=none; b=GE5ubs9bXHwvL6R7hqEP93s+HdFvJ53Lq1jWqo36CASvlysLyvhaZv7e9BSXrBGFucJr7NU7KwE0NlfIBevBk9p+R+Pg0WpJQLuu/Fqn3syHNNSE8W5ujJT+LE6rtXUQIhkW6oXzLwFdUxslfhogb5twZbQXjVO7kWUsgKptiek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067569; c=relaxed/simple;
	bh=ixgrXz9GN5EhUvDPJ28JgskjbIJslRyhesZiWA23f/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tik654JJJkoMw+1WZHwaWELSdsQYqzfUo//AiLB/xcyxQzATLahdJg/2Z+FTOPOJCyeNlXN+xWAtSv8WyDTzP3CvYrZYkcsfqFMltYliSxxe3Fshx3IjHkEoe27hNvMvS6IJ8wWzKUwDQbgpd5a3eeW+CaQbGAMCIiOJlpu6vv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WsTBEqwZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WsTBEqwZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43eb05b1875so3374123f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067566; x=1778672366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4q7kcb0fMi5Pu2YwTecx4CalpdCzHIy+97zlwqlgQQ=;
        b=WsTBEqwZb1iIc//09QkpFbiCK2IQ85aPaARCvUWhwpyQB2fApE3XlDm7ZzsDnS6Xgo
         NTD5xAm2Q2v0tMfx9vkqKZjFuOXXB6jaGlYweQwoWTE5FQfkHmshYcSRHMtHDKXJNulB
         vki/mzOPrDhBXHVG+WOpc01HMWCXLpJ/lcjqMVL5/NToCxvNIHnTsMHusPVogbgkd2Lb
         /SJqpGY16AgsFbOLFX0fOhVbcturTgIHbUsnl4O3GCRIxGb4sw5MRZmYVFD6h2ETIp/L
         0iL2vN5/w+BEScFMvW+OsMoi2ofNCXyxfvlWLqYxKHaWzFu8iA6MdCbClTzNRcRtPFoN
         nW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067566; x=1778672366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4q7kcb0fMi5Pu2YwTecx4CalpdCzHIy+97zlwqlgQQ=;
        b=kDBWbk/rGcDTHqyg++ZS5rSOJhLeDKXUzGlRl8/kvSKFnD9j34PRROTxm1Wk03lWFE
         bjapUuTV8GyY9Dzm6C5Na1rvkaahLVJuCrounWtxuzjaXVlbHjZFVl5OFWZY3S4o3r7N
         3JR+APAYvne9eEFDBg8muZ0B2eyCHzAr0XvTxawKy/afFvcLpMInm3oOivsNtyTsI9a0
         p7cHQLRxRYjJdOez+zWzdXNxKRt8Tdhqpi37XTQJWfGGWLHddpIE5ynKv7N50ku2qj8m
         L2xMw1fRbkB5DxPW8n+4KP8PDva4WKo7ZGjqeVb+hpHVSD/b3lkEWPONSuztFMA2Kjhz
         ih2g==
X-Forwarded-Encrypted: i=1; AFNElJ/vhKnolMovQaERljlJ/B8f9y0cSIvAbCKByufAPXS8BbngIneYhtMuMOPJtTo9MWK7CdQyHsfS/YW6QqOvchQhng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVB+aFQAp/mAPmPbfw0JWj62TvJu4UecD7yPRcrZ1w2evYVpBL
	JDgWk49h0yrr5YJ8BrFLqyvmoUGWdDbh9OSPNF/ZCtZYWu8AnSgAGow0Xjx1Ow7w+Ug=
X-Gm-Gg: AeBDiesHTlL6jRoQf+5uG3OyttLKr12i33DInhwe4xdXDZd+2+hadxllIEc6UIBr5lH
	Rv1NKfCiKiZdc7/CgWn3IMfD1wdatEIXKFEcxoodkb2q1rAH6yDxgHFi8KHzljfNMzJGywamH+q
	jp/7HY11AFNZ2YxdvE//v3622JJvFHusKn8psJNx+fsrBORrEuKJsc3o1E9Z4+43aOSoYxo/V+Z
	KZyQck4sFHwj7AnVfTyTIK+ox3p2bztYaUpVs8g6v8CTq8TQG5m3K9UyMigL2+0BpZKA55ZsTFZ
	ry+jBFHSt2mgyRFBTaDWvfO4JtsXg15BSIXtyD7RM8LpFAXmClEVsroUEzIvuJYUyahsBFYuaVS
	xxPXSWWB2RGT4stvU8YgSPfadRQ3iQmFq1N+WjKBHlP08SQEcTgstb/dOU6p6/kkMutl6cpIKIw
	ebuHpTICmOWuUdpgzFwYlxkR7TL2svjBZVMAjEYVGItpWSLuKk5KhdWhhwY4hTLl11LXX0mPYTO
	ITCtxA/aaik6Y5alisshsHWkb7s
X-Received: by 2002:a05:6000:42c6:b0:451:6a8d:e774 with SMTP id ffacd0b85a97d-4516a8de7a3mr3101276f8f.1.1778067565966;
        Wed, 06 May 2026 04:39:25 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:25 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:08 +0000
Subject: [PATCH 6/6] firmware: samsung: acpm: Add devm_acpm_get_by_phandle
 helper
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-6-a9cd5daf8355@linaro.org>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=3014;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ixgrXz9GN5EhUvDPJ28JgskjbIJslRyhesZiWA23f/I=;
 b=f/8MQczFVqs1m38YFWFXyGRZ8YFS9xYx7+0MAU6sUUFpkMvkBSPCNfMwpYRWjgw7yCQ1ajQlP
 qyIQAYzjkSbCZe7EwVXEnD5bggQ92A/a77SgnUhU4fr/gmyOdJ0dcCW
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
index 2cebc5456968..a663e15fbad6 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -857,6 +857,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+/**
+ * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
+ * "samsung,acpm-ipc" handle.
+ * @dev: consumer device
+ *
+ * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
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
index 08d9f5c95701..83cbd425b652 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -71,6 +71,7 @@ struct device;
 #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 					  struct device_node *np);
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
 #else
 
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
@@ -78,6 +79,11 @@ static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.54.0.545.g6539524ca2-goog

