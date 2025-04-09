Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624E7213E7E
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231058; cv=none; b=oeko6gFqwAozSh49JBMnw/vQFIl2CJiIdKE9S7XcEGbGNEB0siX1pFb4a08gGNFEwcKYijhEaBfQd6IW0MmEDVw8fNz5J2msJdVxYKJVCz8q4Awzzlji10fTBQteHGB/OPmV9DWmYy4VizkuGXPEkfG2vonQ8LhHjOhCUk1xJW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231058; c=relaxed/simple;
	bh=2foMlVQ/rrFhYchojsGnx6WEkHW4CBP5XOWmzyZJG5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLE8krbA6jDmbWuDZZ8C9BTjAn2UN84cpX59fwvu7nJ0WlV/jbAZBwRq83/r/0Nq8g0ZwKAeYUlqTK0kxwXKuRNDZHffxxFjhJhHANoz6V5MyBbKqYqclbR0xOfApImd7jl3reMoMnlPwYeb1dXnxyiTs35oqQr5alZbcY40JzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xaSuIRmi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xaSuIRmi"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2aeada833so29814966b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231053; x=1744835853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dUWnnbmvdHhYGfFFJml9oJoedUjXAR2wlXNtpTeJXc=;
        b=xaSuIRmi8kjsXYQ9y+82uGmTrNho26IN9SuOVRmXC9WFTSoT+u7XxWkYmUrErJMwy5
         auYVbPydBSlFzRzgu381KmgkS5H1JyIwu1hwRb391L7SR8mfkfU0sPLkk8tjnIlqFJjk
         /7t07kiTL3SFK69eleJmLIHPKXnu0USvsBTGas8grLTmvVLANGeeLr/qNvw4tbA0nmmK
         i7nNFbF06TbwPoO8nJd2vzF79eUOkdLTTUdjsLPzoGwisByssm1w0YJgH9042G529xuk
         EdNKRo8RQACtB+yW3kEscg6TMi3y0XFKHTECxnFa7doqw7cVZh+r48suOonQYASZqSh2
         j0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231053; x=1744835853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dUWnnbmvdHhYGfFFJml9oJoedUjXAR2wlXNtpTeJXc=;
        b=YX6zEu681Kwm6EzGWpYQJVivVe8SZmRBvTwfRYGFlPvD0G4VmWr8c8M9mw1InNd/Br
         UtdbyVhZovUzMnW1bA0DKw+RxIe0IhYo85lL460pk6+W6jYbuSWCEil+XqcZHyPLlarE
         kvJaZkBawK2XK3WJW4guWp5b05zS5JPCzsGvM4J/Iwd7uMTZsuFo2X90TIKXY7x+j6Tf
         4s/QCfPtQY0SW9LLd2JdkGUkRal27yp2bSesa8CELGMtkCgB/qzpfsG77p83X/xh1/MX
         Wyx+Uex2qzski/RlB6AvyfWmazsojR7PTDatdCEMq32zfW+6noNkxXpsrjvzDVSX35QK
         p4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJIl5sQkNPUIWxKd9dCc/R2O6NkKSBxC8URPgFJiFGZ/cPeDB4gu23HSmMXH2Z/T8UZIFXSZ2D2R9rtewe/EPOww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9u1yOvTKk43uCi2BdlbVxbY2ej8DkeWc03JRG7IzZ0zkNyU9O
	ymm7klR1bSlkvInMlljrrxmtKMCw/t8Biq6mKleNLCYJCkha7rTpVKQUO9yeji8=
X-Gm-Gg: ASbGncuHnY+q1eVSE+S59x8AAVPJnB3zAPWqNnago1oGScDsdG5SBKyzcZkZIOw7nUq
	8T4L7f8O+mKChpoY1D0kQh/soxAe9uKbnd5c5Mea57ZsHhxir6pI/j0vHmifXZewt8OwUfm2s9d
	OVUODOaCHkzP81iMRF6QySICGGAaKWlgqdgsNDuQBTtfTSmakR3XUz3ihGKpBMTMvl8pCqFsfS2
	9urh0lie5bOY6ROjOC75hQNDFPfTTXghpdOHsuOdMuFJjDRa1wLnPzeBznDoeybLi92exb8Jbz5
	6Ju8hYYUWtp4lsugW4SgfRJdkkGW6ILUgJo6Tj+2kdfXOVdhvhYbPlzy4X8iXcEeMSpSsoiAvxm
	KuKKE4hJuLwwqYELh0ZIXAYIPMWg=
X-Google-Smtp-Source: AGHT+IHKPyqKkOQl1VeMSZiViKNNp2YZh/sxu3Ut5v80bTjVlkCkL3GxyPP6wMwuQ/pmeL4UatLsMg==
X-Received: by 2002:a17:906:6a13:b0:ac8:1bb3:894 with SMTP id a640c23a62f3a-acabd25168fmr6274466b.7.1744231052992;
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:28 +0100
Subject: [PATCH v4 07/32] mfd: sec: Move private internal API to internal
 header
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-7-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() is an internal API for the core driver, and doesn't
belong into the public header.

Due to an upcoming split of the driver into a core and i2c driver,
we'll also be adding more internal APIs, which again shouldn't be in
the public header.

Move it into a new internal include.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                      |  2 +-
 drivers/mfd/sec-core.c           |  1 +
 drivers/mfd/sec-core.h           | 15 +++++++++++++++
 drivers/mfd/sec-irq.c            |  1 +
 include/linux/mfd/samsung/core.h |  2 --
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..d4d577b54d798938b7a8ff0c2bdbd0b61f87650f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21407,7 +21407,7 @@ F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
-F:	drivers/mfd/sec*.c
+F:	drivers/mfd/sec*.[ch]
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index b12020c416aa8bf552f3d3b7829f6a38a773f674..83693686567df61b5e09f7129dc6b01d69156ff3 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -23,6 +23,7 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
new file mode 100644
index 0000000000000000000000000000000000000000..b3fded5f02a0ddc09a9508fd49a5d335f7ad0ee7
--- /dev/null
+++ b/drivers/mfd/sec-core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2012 Samsung Electronics Co., Ltd
+ *                http://www.samsung.com
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung SxM core driver internal data
+ */
+
+#ifndef __SEC_CORE_INT_H
+#define __SEC_CORE_INT_H
+
+int sec_irq_init(struct sec_pmic_dev *sec_pmic);
+
+#endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 3ed2902c3a2634a6ea656d890ecea934053bd192..4d49bb42bd0d109263f485c8b58e88cdd8d598d9 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index b7008b50392ab857751b89e0a05d2c27f6306906..8a4e660854bbc955b812b4d61d4a52a0fc2f2899 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -71,8 +71,6 @@ struct sec_pmic_dev {
 	struct regmap_irq_chip_data *irq_data;
 };
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;
 	struct sec_opmode_data		*opmode;

-- 
2.49.0.604.gff1f9ca942-goog

