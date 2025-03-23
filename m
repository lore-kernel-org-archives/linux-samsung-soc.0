Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B131D5149
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769574; cv=none; b=HO3HnyS5p5mRI4yLtWJJAAgKw8TR5H70RxqwPn83+bn+dqkChvfSMSycALWHblEh/s4ufw6Pgtob10THPmRkhS99xJi3McP8DUFCQdkC3oAzFoLmPWRfibJtKp611FXvlhZ9CKscx2MpJ0Eh59FtP7phOSX/sH29q3Pj+tcZZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769574; c=relaxed/simple;
	bh=78YLeSjujtRUeSeH8Vmm4IW9a6yqsbDcHABSrgUettU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ji5dfCYzW0a5zycu1NGjwZSpxRHIBzS449yBDAuwtO9Ge+mQNIolKKzJ0MpBFBv/LbHRPYhXPv16T73QC98qzD0mwmBpxZHsAf6f884S0deSOHhUgW2P+3G5VE9HvwRtpgZVRrtxpHEXpMckAvVpAoKuGG67yIvcOiR0zf1g4l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b5hOKARr; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b5hOKARr"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2aeada833so704448566b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769568; x=1743374368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uX6CkEO0NwgPlFwhM+5SvUIZg247JR2UUxHaZZQTw4=;
        b=b5hOKARryU99nrH+vk+1gXNyeAwqNlf6uuW7rALv1d4ffsSGK1CVF5QweC+IyZ1YsU
         ID36Wiout5/4QBC1wAB7ZlQMbAK4KRkYB37zmbS1Y3ANcra8qkMXry9M7M5itzN7JFfd
         RnNeEHKinM3ip/QmcLQ2+p9N1R7l0nsORC4SOFLbRKgwM+q2rF3cAB3RuG4CkRQ/n4S3
         1qLf2W4WMfw1eEy3DNFb4lBVbIyN/u2uinBdtP+J1lWsac5Q8ZB5bSfySbT3ErLKZXV6
         4N44MEY6A0ymwkxAlM9qDSxNY//q6eJsSQoaYkX7q+pMyckK7spFg8fX9g6FQjkavLuH
         HPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769568; x=1743374368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uX6CkEO0NwgPlFwhM+5SvUIZg247JR2UUxHaZZQTw4=;
        b=v6kGoam0J5+rQOfunyK4wVM+jLzfsdnW99ZQA0/+UWUQUGP2yY3hr2ekzTeR+iafNr
         trwaE/kJIowLurABxQD5OK/rSiF8mBL3Bcq1l3B3+WAhGvOQYnN8AknrEJNSg26w/uTk
         im9wfp951nQ9gHGwTorKqQSb9mL0BQlEUEFz2S/EeAiZRTM3rOO4NROmacpkoTmjWJmj
         AXGI/GSzQmRPNht5tUuafa/CHwGe2M1QTCMwMh72NGHkUzSfgRc8qiHcdOi2+7BDg6XY
         Hq48ea62591IHlcY6ifunhkxVfHbODCl5Uo6842r6+g2Wvtajo4ujRiB31T7vLS+nBV9
         qvIg==
X-Forwarded-Encrypted: i=1; AJvYcCW19me1XDQdGW26XUaA2YEHpR7IZhVCs3LG9Zyt/AO85afh7SZTEc8VYUNlDlCFx4hW25DNiAFg9He5f8hUav28sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlDoUkdxEkZwglKE8tp3qH6JnqpIDROL+S0XSJ1ol+KrilLTip
	X8K7kzk6ts0SMDKJQiSpLswONV1rVN1mNp57mKTSWYSXsEC0wZwESnG8wAnx0x67vKQXWexhvdr
	Od6U=
X-Gm-Gg: ASbGnctZ+YzW44YaPYdnRj1IP+KKKOgYocxSk3ttBKifj9dE2+tLmntmEaxDxY0/D7d
	ijyZLX3gwQMvaVT9MNN7hT3jT8KUoF8vqLKCZe8As4AMJ0uHXftgUI6Ad+AqPfqyIm79hhNa7jB
	50CFFAHQdRE2GSehkJqX7Fn4uXVHPH3J/1azP0UP0MXg4fRgg7dUPDJYCzZQnQ6T/gUeruPVBns
	Fh5xrbOctJPcGW9pyycx9jd1i23SHlWiTrjdxiEyd9GRFjVIn9XLfzNxqZOs2QRClPyrlGS063y
	DEX1DFMKchB6lBDpbm3IlcPcwuHicu2kmOiIAc5IYeDWJPHiUtkxtckPKyINRSaM6vMU/2vhA/9
	iTgLtiLvK1NkhUN5M7cW7NDYtHNqwXk7I2tcm+lg=
X-Google-Smtp-Source: AGHT+IFvkyM7m55m5DAsodXq5EZ4AXqEDqM6V8YHvLrK06u5ugX5A70IcVFVe8/Urn5Sgh48Nw6Uvw==
X-Received: by 2002:a17:907:2d20:b0:ac2:26a6:febf with SMTP id a640c23a62f3a-ac3cdf8a8bbmr1398647266b.20.1742769567610;
        Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:23 +0000
Subject: [PATCH 07/34] mfd: sec: move private internal API to internal
 header
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-7-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() is an internal API for the core driver, and doesn't
belong into the public header.

Due to an upcoming split of the driver into a core and i2c driver,
we'll also be adding more internal APIs, which again shouldn't be in
the public header.

Move it into a new internal include.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                      |  2 +-
 drivers/mfd/sec-core.c           |  1 +
 drivers/mfd/sec-core.h           | 15 +++++++++++++++
 drivers/mfd/sec-irq.c            |  1 +
 include/linux/mfd/samsung/core.h |  2 --
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ebf7fa9a814d2d198fce853f7ff9a01f2bb69f5f..d686e02dc7ccd61e35173df997d2f894ee5ab515 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21351,7 +21351,7 @@ F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
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
2.49.0.395.g12beb8f557-goog

