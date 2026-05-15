Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0644103A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837559; cv=none; b=KkzAiF6UKAPs+G2hRzjCAWgr3KPu8zzUtWgYx0IQlaOlLZ/quaGQx55Mn8//GZ3kJcyRXarYwwzb6dcIaemYBuwm6stFNMCd9GpmTOg+wmzVyNMnmHb+pYtOkadIZ9+TDpb8JqdtHR9ufbgyFMCsoMvVZFW3UHWDlxk+tRFfAKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837559; c=relaxed/simple;
	bh=V/zAmCJSjPS4lESeLMnCYH+wKme4wcn13reVAfH2wSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAhn8/Ky2eOW1rOiUT9iyOiJ7sHwAU5FI3DQodHHsEAaiGNUqgNLa9d/Qh2uH9M4DBl3v9BRS+NrCUA0e4ulwIdu0eg9jV1EEzJGOX+StBz6Agn9Gm0lfRugznXIXrC9vWK5QVV5L69vmLHqW9veBHONemUAByMHgYYCgOt0MlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HWs9zKPd; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HWs9zKPd"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39380e79936so105985031fa.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837556; x=1779442356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAYzurZY50V3hmmtsDULHaTPPUEpyOSaAQclTNRWi04=;
        b=HWs9zKPd8M0tg/D8xHPzwjUF++R4Ie2fvhiqKnjEoo8zRvOQGqYr5e7sL+gnQ7XjUf
         VPn3Q9QKqVM2WK1oE1qPBwsJqkWTpnqFJSdAnIyNtogtlv8pY59Sws8k/JkVatF8LfwK
         LoOf6GBTDSTt30Z0Q62fRnEz1NhJCDGMaJoFHrSkIo9fOOPzC/6RZsoGttxSUM+E81xY
         cNPsAErEBPER9xzPdBgbiadlRo9vonWoLOXcCaydtcOrdZWB3wkJhOFigNUmZQYFzTvt
         Py08jVeEBKlKPhRNVYq+TwIqlV+aU0WxsFOjK0klpVOZ3U3qcUg+UL93O50OlRpOeZ43
         hN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837556; x=1779442356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bAYzurZY50V3hmmtsDULHaTPPUEpyOSaAQclTNRWi04=;
        b=JzyyjeRyFICC1dRP5iF3cFmoqEU9v6aVQIAbFp++UoUP7zPd1AmhVXbx3uMidxH5cv
         yJBrJSOtKpwsfeQ4/AMWx0lioI+G8VHmLbNWGoVQ+V+GUNqvGkxdu6Ru2XRiGkych7pG
         k+JDOJaD9UoQiS7zVQsPFkPkNaKAAJOqly8EZKHqHA0Mo1Onoj58zlsL5GIG/XfgYpKC
         5z78o9epfzBfBSBiiPjiAhNRP2h1fWCdVb79bJRNdkj0RN9ZMJPkuV4f4mfY2EOsn+2S
         gLZ+cshOY/GoHTQKd0XeYY7WAG6NlmbOWyARDG/+OEVdaxEd86p5u2GjeWEUqGPlSGaU
         q0PQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GOXY8Y7kR0VICLJsk6ra8FCZu2yfpfAGU+2U6vptbAabABbuIcDJWg+EZ9JxbPhQ6j/JLDgMTmWGyCd7fO5POKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo12ksgpVYbg72d7fFF3mHp1R4cK64WH7FoUTJfAzsUWqIjQMy
	FbNtNPGm3S0oz5GFsl0/1doM6xfAzqYfm8sLYYLZxdl+yXv+tYuOwxwilPeCbcdIV2k=
X-Gm-Gg: Acq92OH5Uw1449z1bxsMDHAvdjFq0t+mVU2S73MlwltOHGvMx8ZeIpx8Iemwekb/IQM
	wSnwlNEVcDfr1Jr6OyrV8sjaYx9VDduxpnmPbW0kcBT4XVQ/NLMhOZ8QSS+49iRrRVJgcT2fGga
	GIiVDljm8A3JErSCw/B98MhvWgXLjZp6W2+ufhnN3IqG2OTlxXpb2xl3BzA2/UMsD0q4cGG/GPM
	7sytm8vX25ohKNR01hFKivIHta7E5aj3R9u7PxHLXt4GzVEonT3e6ORqa1o51n9nAj4vxJ9FjGO
	QmN21R5Q8Nkdm2Aoyo0j7hvSCx44LZrjWbHpr5MCKv3ttWP5t8WYTfNvYqFLuU16CfAgLylmuEc
	TeJ/bn5XAqUwdWkNL7ACw0SPozMa87Nhq+MgF8rEku6zZc96tEm7npJ5ukPuX460vm/SFVR40Yb
	bO3s4ph4F5MHuLi7z+Otn+sW+kxAQD5mPP8fk5ALDs9QDdoHccshiCH4MG2bAgz2actgCy9LrD/
	nS54F/R
X-Received: by 2002:a05:6512:1241:b0:5aa:b6a:7a8c with SMTP id 2adb3069b0e04-5aa0e7755fbmr794712e87.43.1778837555450;
        Fri, 15 May 2026 02:32:35 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:35 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:30 +0000
Subject: [PATCH v2 6/6] firmware: samsung: acpm: Add
 devm_acpm_get_by_phandle helper
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-6-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=3069;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=V/zAmCJSjPS4lESeLMnCYH+wKme4wcn13reVAfH2wSY=;
 b=InTs9KReVdF2eoMfw0/biWdc7G3Bd8Nh8MxuA9Gg5UmfB4Osm6mTlKpQfuXozSCoIiHD7QqQe
 acV6BXVoUDbCnqsPo4ZPDSLBCkon0f53ViIX/VdTjIn/a3bkutA2HBs
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
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
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
2.54.0.563.g4f69b47b94-goog

