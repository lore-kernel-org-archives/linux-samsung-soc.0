Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE502154BF5
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231060; cv=none; b=M820jUzeDdwJ1VYct334AN0GtZFEsxvxbT1zY43hOzgiLgk3+o43gzujCJ1yVDcXFcUN/zuI/aJDK3jmwpXw1PSO8TbMTGuT+hS8qV/dQww1tvsXJLGf9RzzPjVFYAkxIzZ2ql9nd38fu9+9k6khXNuHMQdbb+FQFdRIOZC7wh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231060; c=relaxed/simple;
	bh=oKsUOZVVIPJ0FZ1hRtLGE+U8FMFNMZ/Ejmjo0fiUpc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hfZ/pYOUPLsaJfqu4L+KgH9c2h8rwLAe3R6tsxyxYxA1azqt9QUHEXlDcXs54oxhaHcbYoD4F4+QSdSsYCa5SgWwh7FOd+T8j3Oaf+Hah8zlgQI2toMlWW+FgDeq7aA4tVO0iZOrhHQChkFdJPK80Iq4yBEIULgu/HgNgm2R5ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4nuTEp/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4nuTEp/"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso17926166b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231052; x=1744835852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4jcXi1XTosiHhMqSSsNm0hu0JnYFeJKR1d2RSvQQcw=;
        b=P4nuTEp//DciYDHu3tCnU+YAs5wD2T3rCQs86x6Ng0rrx0L/7ffORpOspH5UG/7NEM
         QWHNggAKGBBqqkE1AxHz+/BoNwjLje4MywJTwZX9btBfwOOpdlRvWv2vRxi7SjaRQGex
         be9G48KhEn4OaWVscU0ufcQeAgr01jFn4/dVrdkC4oTk3MAHwRhu/Vm76JGxBXiK/lMJ
         nlzDUbMBuO0KwAYXMGbv7cKXt+Yfac4J5ZgfRKKweWxXHc38OJ3pLKPG3NlErzthEayx
         +M8oj/jP7OWVn3KDCEYq4oBhxhHTw7AZLVxivOLq8h4dPahArkV7BccgZb26sWQoFwDF
         nvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231052; x=1744835852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4jcXi1XTosiHhMqSSsNm0hu0JnYFeJKR1d2RSvQQcw=;
        b=PYI6kNNCB4VmRXAM+eF2nrCQi4obPh5UFt+aqeTqg0uot+0xNWvQXPO030YazFN818
         +ktgWO0aLexoTG1v3j9JySAgYPdfF+Ac7fjMq86Vs+HUk/rYEfc4WOA9N2f5RYlzj3iB
         ergtYtG+04OkW7Ly0gC+2QGDGMqXEFkMPWtuEE2zsP70wJh6s8OoM8OWhNT9dbewgofh
         QEXtvcLFJXR3pCmEF2OUuESia/SDTVWS9L+i4y/t3fkZCWT0vtwMRzSeGDZVcC0BNw9u
         KAfH8nhqmExZ6y7YFqlwVCKu/wgxb2FgrEZJneNWssmFmLcWonmoNPJ+ohYNXkLIfRq4
         fGcA==
X-Forwarded-Encrypted: i=1; AJvYcCUx0t7VANy4mkxycDhchj+zE1zkFqqY1pq19KWBbCDIiwSXM5Vr4wwAt8KaZattARpy2QnHET9RYw4yObw9vxCuiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzreX1hMH1xsUUf5WmekOaT7XFwW1YgDJCb4gOb+jyUxmluRVnp
	EParEw7GFjk7gnupXBmxl5p/ceOu4KhiVAWFYM7/JiKw7nEgbw6SPHyDT0aL2tY=
X-Gm-Gg: ASbGncuV862wLx40ZicING6m5un76iv4mhyBFPZ+IGDEGUJ1JuHHxrxbZKbUQWNUlD5
	2m8bGBBxQVNoyhwoqjbG17w0xO38CM2HEBg5CIvkbOBjDv/0+cmnhd7tbmeP6PKhM1n0sWNA+y8
	s7SAuZoaK8CpZe/VcXqxo/6dqMykg/caneR5ptiueyxk8FU/HybreH7nhudBchOZR6Kfe/7mNu9
	NJK796bcRrAn29mBU2Hc5sxFvp86mvHHpz9cgyiHTHd2rztSMDoHOpWjw5gwUVFiNQttGzIpbhQ
	Q4Hpcfz4R4ip4zUjCKph4EaIQbZsRj9YOS7XjxGxdOg8DxAHED9He2jrT3z3BJ+1pbGGM4b/u8y
	50xwGrknY1E5a6S1vQ3bwiwTP2R9uGTRIrMfJ3g==
X-Google-Smtp-Source: AGHT+IGwqRhQoC3fOMayfmVAcj7UA23NDr6Q3DFxxTe6qZCKM345xZ2mndUpMT12OV06uBa0ucpMZQ==
X-Received: by 2002:a17:907:3e1b:b0:ac7:cdaa:8946 with SMTP id a640c23a62f3a-acabd181303mr9820366b.11.1744231052442;
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:27 +0100
Subject: [PATCH v4 06/32] mfd: sec: Update includes to add missing and
 remove superfluous ones
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-6-d66d5f39b6bf@linaro.org>
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

This driver misses to include some of the respective headers of some of
the APIs used. It also includes headers that aren't needed (e.g. due to
previous driver rework where includes weren't updated).

It is good practice to directly include all headers used, which avoids
implicit dependencies and spurious build breakage if someone rearranged
headers, as this could cause the implicit includes to be dropped.

Include the relevant headers explicitly and drop superfluous ones.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 7 +++----
 drivers/mfd/sec-irq.c  | 5 ++++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index e31b3a6fbc8922e04a8bfcb78c85b6dbaf395e37..b12020c416aa8bf552f3d3b7829f6a38a773f674 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -3,9 +3,9 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
@@ -17,13 +17,12 @@
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/slab.h>
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 5c0d949aa1a20f5538d8baf7a8aefc1160ffa14c..3ed2902c3a2634a6ea656d890ecea934053bd192 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -3,7 +3,10 @@
 // Copyright (c) 2011-2014 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
-#include <linux/device.h>
+#include <linux/array_size.h>
+#include <linux/build_bug.h>
+#include <linux/dev_printk.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/samsung/core.h>

-- 
2.49.0.604.gff1f9ca942-goog

