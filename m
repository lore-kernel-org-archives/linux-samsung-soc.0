Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92BE2459E5
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670752; cv=none; b=APOU7FiV7HP0xwIANBphLWts/tceBhFULmrTqmCW8NZQD+VFF/Nve37VQ3pOD6865B5TGxKUtUQslpMDmanbef9IRpZTLmJVrwYApfoZa43HGQwQIxWgETk30bs5sEaC+DXcIQQ8e82Z8mt+NHxbjZS8Y5MZ+nQPDMm/eJ7v48A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670752; c=relaxed/simple;
	bh=ch+tVjxpZDhWADsqi2xUerCCp822EcsZf6tgYWcJO4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3li6yl9DeuP5kczwerCc/qD1qP/LXbswC+r24omIeHzPjeDJ0Wt8wvdmDM/GiO3+SPRQFXYSe7YfE7IWeF9b2WHHH5DKh+1PxqS1gHA6pSoJEKehUDRLbI2SROJ8D8gU3moxEI9r/e1Cqn3oSejs6gJXRgiBzjBcin13iRJeAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ptlSkSXF; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ptlSkSXF"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso1220680a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670747; x=1744275547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=;
        b=ptlSkSXFOxes8PFKZTNsPmG4JKU3A8nitxbBxCUvLZEx2US8bKSaqo92AgnRE1CVKc
         y+XTjdqTHgZMVC75aX5BsEw3y61XgwmBOdDrssgRtFNtMLJEedjjxTLbjRM0x73cJkK0
         FuVy+PG1lBDU43UViPHmGO41PiVdLYSgmyoZGeaqLVEEwCnjUmmKmK3Vnvjp/fbrWucT
         4rSrAtYDcCkWK0H3NcH+zDIEmuHxd1Tj/a94+ZA0IyN2HbpVnCRgfLAzvrz1PPJ+AnHI
         z6LSsGO+pJLh7gB0KSkeZ3D7YzxM2qybNPcSCpd6G22qPx0Wce1QmuPxtLXLzySSclK4
         tkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670747; x=1744275547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=;
        b=fw8JaU2uT3xh0hWD4lBXLs4T8hUb32AiuT21EWx6VwD6t3mldXu4snhIi+ZHl/3TCv
         09YOkwqbjfGrRoPh7bbl1qQUH4z7sG0kFlpy0LfOe6vVQY+QZEjTmX+WWqXdEGafTXjX
         kMt0YL2vuUOZiQ3KT1lS7i/lXQAYC1VyXQnv3GrI7unJnu1Cn53ilRv8D4/W52msaRkI
         2uw4wH0onAKLjbF64pRwI0R7cpBaLOaUXGb9f0OG9LIDTGioM1ArPaXoNTiG6XBzPQAK
         XWkFpYp9MbmImhH6pLTZjHId8m7nlxENEJ6Mjjod4IbCyFpawVa0s2quXo05QuEJvouU
         c8AA==
X-Forwarded-Encrypted: i=1; AJvYcCW+2yKxVaxuLFICylt+H+Z21GfsKXWBUQFhfB8ll4aiXfjPmXmEuAUjUJO5Ul1HBqI6t8LEpa6ZvcTPfLhg82GnAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVQa4n9s6AjtcdLKx2hLjb2xW2Kp4qFcpN/WdR+uNsbIW2F4gb
	CP+lXSryPwSQuW0c/BUAKbrP5Y7hdzhAf0Aef3GqMXnLxmd1/JmX7PT8zEvW5i4=
X-Gm-Gg: ASbGnctHrzXyOApJsrMqZyrtwDTiOn1GYsB6H6e58dZlhix+RtTq49JvFlYNzLdCjdL
	HfiWN1FNaG5G3DB/gjjRdveGbuz0++Cb6gbuIHYk+9Dt0E9ZbHmD2Die6+A8hYz9iJV8naQWsva
	78rguvoZSf1ffJGX+2rFSuBbHPrNAz7VAAvmr/Rd3d0zV7E55W7QQSPmcXqfJXgGmqwubrJcCuH
	SBc61jbSVymqACFBApxyDl+WU6/KpAx1NnBPRcfDymhO6RBldAZ4Bm/oe7eOXS5CZ969bMsEGja
	C4dpZXyil5A8ZELakxZ3TCpdlI4urg44gnm9b9hogS7penVIhpmOM6pTN0FvnRqc8GmGVCmzkis
	F2F5qsznfn5CtGWRUaJJULk+9Gu7t
X-Google-Smtp-Source: AGHT+IHQHM6p/MAOKJQd3/sqq0s5Pmh71tqwvfrmV/m7Z/Cso9FWL+o5hSWX6vucaMzTOkvAI4hVoQ==
X-Received: by 2002:a05:6402:274c:b0:5ed:16a9:c333 with SMTP id 4fb4d7f45d1cf-5f08412c8dfmr2413316a12.2.1743670746820;
        Thu, 03 Apr 2025 01:59:06 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:05 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:02 +0100
Subject: [PATCH v3 10/32] mfd: sec: merge separate core and irq modules
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-10-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

There is no reason to have these two kernel modules separate. Having
them merged into one kernel module also slightly reduces memory
consumption and module load times a little.

mapped size (lsmod):
         before:             after:
    sec_core   20480    sec_core   24576
    sec_irq    16384
    ----------------
    total      36864

Section sizes (size -A):
         before:             after:
    sec_core    6780    sec_core   13239
    sec_irq     8046
    ----------------
    Total      14826

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Checkpatch suggests to update MAINTAINERS, but the new file is covered
already due to using a wildcard.
---
 drivers/mfd/Makefile                     | 3 ++-
 drivers/mfd/{sec-core.c => sec-common.c} | 2 ++
 drivers/mfd/sec-irq.c                    | 9 ---------
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index b617782eca436e34084a9cd24c309801c5680390..8f315298b32a2a9ee114ed5e49e760bd8f930aee 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -228,7 +228,8 @@ obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
 obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
 obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
-obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
+sec-core-objs			:= sec-common.o sec-irq.o
+obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o
 obj-$(CONFIG_MFD_SEC_ACPM)	+= sec-acpm.o
 obj-$(CONFIG_MFD_SEC_I2C)	+= sec-i2c.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-common.c
similarity index 98%
rename from drivers/mfd/sec-core.c
rename to drivers/mfd/sec-common.c
index c4b7abe511090d8f5ff2eb501f325cc8173b9bf5..782dec1956a5fd7bf0dbb2159f9d222ad3fea942 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-common.c
@@ -307,6 +307,8 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("Core driver for the Samsung S5M");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index bf86281401ac6ff05c90c2d71c84744709ed79cb..aa467e488fb5ef79d5bc7110e1ba7c26fcfa9892 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,7 +6,6 @@
 #include <linux/array_size.h>
 #include <linux/build_bug.h>
 #include <linux/dev_printk.h>
-#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/samsung/core.h>
@@ -17,7 +16,6 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 #include <linux/mfd/samsung/s5m8767.h>
-#include <linux/module.h>
 #include <linux/regmap.h>
 #include "sec-core.h"
 
@@ -510,10 +508,3 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(sec_irq_init);
-
-MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
-MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
-MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
-MODULE_DESCRIPTION("Interrupt support for the S5M MFD");
-MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog

