Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD8F21325F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231058; cv=none; b=amgpGrDDR90id88pqDXB9jPRIPZQMiiqLrOzTf6Mjecthah0WCvm7ssMGtvt6E3OU5l2bevt0THPQjimI/8JFDwxQfrn2v0mXt6iaz+CUJ/6G+FF1esNoOAbuIHcmCoM48wF785JI6r/dfnCEhgsTQNBKUMkJ7aOf4TSSDauKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231058; c=relaxed/simple;
	bh=G2QuqVnFMg8y2zTjZxdmMu/QnwXErcjNOQU4yV6iUVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1bOlc88lI7ukHcRgJ/MhOpnfS723AUAdiO6M1qBpBK7IpmZsKGG4/8ky50bFhDu3d7nzDHmjED/kSI+dCWeOxZdb0QmvosTYQ/LvC9eslo7D33hit2jXKA9VURsY8oAWla7u+AbusqCDNv4mOAt52NY+Dji0E83z+0U8bBTVdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q097XvRD; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q097XvRD"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so16492566b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231052; x=1744835852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJ5xfpPt+Udr2klxgQkLdnjiXALVAMMpe1APzqbpdGM=;
        b=Q097XvRDDYtMidEVtgtFNl797DkTTk+NQ00daETce3y5PCoVWKI+muJw+lo+4teqyY
         1KUrI0+BcePBu66lz0iOkYYbCWmTdAcBtYUinYOtvjIGenbQDd73lntPoFBrq+bzFK9a
         2U/nhzV9MLpYhysPPpSWOzZRugSnoG0HkH4utVEOHjiiddrlWI+8qjH8LTDVtw8psZ6H
         noDfZpIKmyK9wZD+4aDazqwDjDESTI04Dkqn0YR3PcB16T1QJVvE0KTsQqPa71hVOvvI
         mxIT5ONJ5SX65+kMFTdaPuC69UknBCqfveqV4BTYTOxemX3J2n5HyO75np0j0Zb6eoe5
         WMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231052; x=1744835852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ5xfpPt+Udr2klxgQkLdnjiXALVAMMpe1APzqbpdGM=;
        b=Dm8sX+x7+1bUUMcHEeqzvprSkz6VEeBn1RYLMDDK0P6j4T3F4GhXqdSs10K3J2yoPM
         8RQHs4Il1L18bqqkOb3Ic8sXOBff1gG9qPpWcUTgIXFGUpovtMwAYpD66GPbkamlp5IX
         x7e7DBCViuMrWFrR2/iWpHcjMA/tlTU5UUiTwKU4+Mn/vPPBFPG80KNvMVI8KOhhK97S
         BS1+A5gykTM3HuO5nuHRVpqSmAczLk5okwVg1OhUbWfde7ZiX7S7+oV5rtM/SR2wX6wt
         50tOm2LnS/dfmxPepZ2GbsDLBDUmmxl6ZGbhLVh42fZGDJYS2GH0+0KitSLLb+aIjhum
         WWZA==
X-Forwarded-Encrypted: i=1; AJvYcCX54oAHus3U1g3jObGI0P1iS58zeU1KnNi9EsiEg0N5IhHos9XgpHEzyq2GfqCUuYiSbEiW9tRaoxbux9Lkndat7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyO+BoZgD/ZdGQW7WussIn+SnF0gGjylejrF6YkUtXLuQ87Pls
	3I6kczoC9aojhPW4uC/1BDwpavUydjsTJXxQZ3w7kQe0rWe1f+0R53Wp2Dl0gCk=
X-Gm-Gg: ASbGncuzYqlPWqPFvSUzU3d1DCA3kIOQmlJnCkG1j6CrWjq6j25WkYabQ0weO3ooDV3
	gpmA0yErOPYDmb58n/ezG8XQ4a9kiizXrHL7l01fqFsusIrNF4IWFKG7hozqGrgEQh+4SBHDSCj
	fZXwOTNdmGOClifUlLEu5h8nqIrOQpBtRDarLNnwEYTztCLCNbqR4yVOrR7zHKoNyldeCJn6cl+
	9LFp8T8MqtjaQCIgwHvuMM/4JIvXW6Ni78cqYXHIbLVgCibG5GtGg/VOXsZJbo8mixnuaO0BYpV
	srafkJZC6wM0nJ445q2SjiHwfGKMygr6kEFX107DF18AgW4FlmrUQsUBcbL9nMYaNoZbdLvVh+d
	ZLhO891vkRKKowEqdK1rGli0uxjk=
X-Google-Smtp-Source: AGHT+IHjirWHIybtv9mCOYpNHyYmTU6KD1TdSj+7K0HHxN3o9SAgZZYxV6t8b5P0L2dTzB7k1zUW7w==
X-Received: by 2002:a17:906:f595:b0:ac2:7cf9:71a0 with SMTP id a640c23a62f3a-acabd3bbf77mr8344766b.48.1744231051972;
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:26 +0100
Subject: [PATCH v4 05/32] mfd: sec: Sort includes alphabetically
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-5-d66d5f39b6bf@linaro.org>
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

Sorting headers alphabetically helps locating duplicates, and makes it
easier to figure out where to insert new headers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 14 +++++++-------
 drivers/mfd/sec-irq.c  |  5 ++---
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 3e9b65c988a7f08bf16d3703004a3d60cfcb1c75..e31b3a6fbc8922e04a8bfcb78c85b6dbaf395e37 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -3,16 +3,10 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/init.h>
 #include <linux/err.h>
-#include <linux/slab.h>
 #include <linux/i2c.h>
-#include <linux/of.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/pm_runtime.h>
-#include <linux/mutex.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
@@ -23,7 +17,13 @@
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 047fc065fcf17f5bde84143d77a46749111ea5b8..5c0d949aa1a20f5538d8baf7a8aefc1160ffa14c 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,9 +6,6 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/regmap.h>
-
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/s2mps11.h>
@@ -16,6 +13,8 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {

-- 
2.49.0.604.gff1f9ca942-goog

