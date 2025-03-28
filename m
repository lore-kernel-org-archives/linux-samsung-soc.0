Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF01C4A16
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168662; cv=none; b=cLPKMaRBcTldQOMpAiY9PiBn673MiRsnXB2B3JpVutMlgCmsSporndBLEHk6yFCTqHiHhkwJULhSWWdSDiB8zoszn6uRWSuPO30agCj90PzhSJpB6AyoUv2LIla8i/YkcrVd0y4fxTETaPU4ntEVujC1BYmL9xxM/wFbkcU9GdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168662; c=relaxed/simple;
	bh=UlkZld/wRLMptXmKQwcze511hrG+hJRq5bCGkApcG9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwmxDOMCCYGT3FVMGvrVD3BUXi368VOlcp80442P7u2E6SVoA5geYhbuz8GoASPz9R74cLiMN3/B85jp2WBIE/PvXD1KWbB2+nsztp66mkew+9wOHg5A31mu7mlGiGEuh/gQymLVMRO7qCcrgvjgX5RiSAVk8slWX1y+FlFq1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=up6ypTB6; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="up6ypTB6"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so2961002a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168656; x=1743773456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=;
        b=up6ypTB6ptQ52jARMKn6f5Hj1V6OdKjHv9DOhfECZ/FK5TiT+ScL1BXQ/fdJNETAA3
         xavnUuzVqDavZF4dw20deY/UR+PUIHmYEXJomeE6ux4HUpCNVhfr3QMDejA79CSCJl2C
         cb7faVl3ixYs5hBA/d9MhtEZLJLTHExhx31zHQ3KN0aPruxxP8SHOO6nnX+6eu484+oZ
         LmKLXn/i7Q0EdPOJSK/ZSzhmcmehEkfDbG26rurID5ffa3pTPr0EZiOwawKIKetaa3i+
         Bsjdo7bLrDlkCBy/My4LuAphaip8hRtrO1jSIyR+X1oxIfNTZkzwybutZJvBFSwQMVm8
         rVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168656; x=1743773456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=;
        b=QBAQ4p6/zw55TxXojgtI4HaGPC2m3HjnkSn2g/H0MIr2JQw+5f6eHD7yt/RtLJ6bfh
         PrbqAufSGbG6IZTdaLhd79kmYotOG15wvGZ/7i49DIfaIVbZ9fqQrect+jCIkD1y64Fy
         io5wrIVyEfkak7Urnjb4r2Z5CDQi2wTDfrGUIUQ+k7PYXJ7B3pl38z65VxFtJP5hovOu
         v/oLrjaKnipPhg45HfhuL+nqLLpm+rM5uDRMgTbY3dV+OrYGGMAIdKqLq/M/Krv9dP86
         rLfcs4cbUOl+VfoZQ/d//WmWAUHn0QfRg4V9z3YKS6tMO+p1b5VYSVghoiIGfPhV6w6i
         1W+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8CKjaaJTVM3CsB2N5CTAORy9VvqPLWSI3cDDOjS5zsbLeO7se1GQJGMlFECLPqim9bJtpUbQZh6LTQJWKUu3RLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPmZVCMBi8bq2Mi/QrfTJrTMbm4Wqc5YA+OGm7Vw8mjSZJtVHZ
	oIqvnMG0azm+JYmtc0T8t3qZwcfFunS4cXbNBnR0mG2tFg3OgGn63l1TOLyDbO0=
X-Gm-Gg: ASbGnculsTNolMS8wW5sotCWRWMTEl8YuCePsc5h0hJOgoeZ4fYnhXnFyIgfm6yRd/Y
	TReaQYUtIw2tcrkoNmrV0LzYL5Ke+nNm+noygSTP3Yh93SJSpCrd55BPMh8GNoGIellHVbqyk1h
	csbyTwvP5TdI/LsteNBGv/wW+NRctAVazZFycmw+E10y2X57/sQmNX9ULvdvZrQLv52sQxHUdgQ
	F/4TyHXzXXDFOZHkRh1128OvwF5PbLyqHVaR+JBORR75uh/RqvaupozP6r9SPdgGQvXVyRFPcR4
	QF/mzsEWZQtAaZQ7nwg7s3IAvyb4ehr6gs5HYtPnidJ6tv651QSYf6AsC/Q4/vZNdOpvPTdYkE0
	1Z3Th5YdEogMl1kYesC/7oxqO1/Gv
X-Google-Smtp-Source: AGHT+IFSv1dN8S6YvQdBhrut9H7MyYLkPc2NAR/e3xh+ZGzELkDUwfqEGTXxlFtku9FFJFYLhMO6Ow==
X-Received: by 2002:a05:6402:278d:b0:5ec:9e9e:3c3 with SMTP id 4fb4d7f45d1cf-5ed8e256dd6mr7177184a12.6.1743168656056;
        Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:51 +0000
Subject: [PATCH v2 05/32] mfd: sec: sort includes alphabetically
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-5-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

Sorting headers alphabetically helps locating duplicates, and makes it
easier to figure out where to insert new headers.

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
2.49.0.472.ge94155a9ec-goog

