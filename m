Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA053371881
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 11:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777547589; cv=none; b=ljZ+trQhYyADgdGwd1l4wQaH2jWer/W0KIPNBKUtMEZcwcq2nrMswVJ5s6Amo0QC/cpfQ4WKqhdnQtPS5+wWiImnKeZscMNcRpAKEbWjf+xTxTO5XIKE19NgMTkWtxKGp0xUgA4fA6BjIWfhQletl9Boo3krHxktuScml/jJaZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777547589; c=relaxed/simple;
	bh=IVpRtS1U7L6XGTbADqaORj5gZJvN+7IbIWKmL6oRgiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z/RNLuxZV/oCqcHWykvVoTW0pn/WC5Evg4D6sEodHmmqpQ7F2OF9A13aRfBFh/qpqPCwgha7h0keGBfvM6zVOj9Rn63S+y8j68wLJrKW1Qw/eFhzaEkFf5td07AN6YHJc2CNXs/OPGFsp0Pyj3PTtuomP2IS0nuTvHE/UXwsRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ht7tRE+J; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ht7tRE+J"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso5578385e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 04:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777547586; x=1778152386; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uLan5B027COPd/t1lMAqUL7IL3uFTazUIilUlFaa9w=;
        b=Ht7tRE+JELCo/NeZn3lDKIab3NqlOrndvqdqLAdZEoqY9pGqslLj2vLSNxA2wWybbT
         4O4MyefG479E5zJHBfqZVMvV39Ydr0ylx5tdNHBlVfWcQAJ8sXP6NXdoamKy3R2vUmmZ
         aCtz/I2Jqxrrn5RXUDsVbaWJ1MTT0zaqdPxfW7whJp+dwv5CI1ksjPgflk5v20SEc+Vu
         iF4Vc+MIIGuNtzg9VBTQ98+RXTXEfzFxpw8CBr9hAxqukab9mSPtB+0Vpwb9UL2c9Rwb
         Jbn2mhXN/AnVMMnZc6fokLVvlVBE0VHZpwiSAxUHPmoyQWClcMroC/nehjqja6KTC8dS
         BiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777547586; x=1778152386;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uLan5B027COPd/t1lMAqUL7IL3uFTazUIilUlFaa9w=;
        b=Bj4nMFpAHG3XDSHH4AFpDCF9+axVZDzFblGrg/YZ2nOqIFulZH2U/F+HWkPriT4j8h
         3ESFJ+phTLfklrNzoVKw2nd/kUx6TyWlm6sGW8isZN/SWcFyMQd93GYV+yHBJiFLN2pX
         k8vJpwgSEMyQwVdXp2hKuwEn35q0hLqcjZF23RWoakVpmpJ3IITkCS1IbTnwMlcHFgRK
         RsI+mjCXZ7ZFIRw78zoimPS1BH+GT2Lq0/3VH01AJARvHWEyc9AB99657WXtrKn2uu0W
         CdHvHyARBtC0YwZIIArwdDT+jmicIL96NZXcro/ydDEpJ74Z/iUSQ8ljhSnAuAP/uiQ/
         PITw==
X-Forwarded-Encrypted: i=1; AFNElJ+c+9Sac9DWz/MBkTyaSU3LnwJLJO5cnNKa0tbKbjgsjXuAq+WGFYDMxSfL5fbTFdffHu4bzydosq3BIM40+wO1sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1EIMNxTdTaREuqnuTrmMJSfBQSQkXLucMahQnu//YlnrMjrx0
	MdAA0+Un6rcpwqkH+6pKeXypg74T2dX5lQ4bEA4Gfn1rjHAWNpUBZ/HV0n84vJ2h7TE=
X-Gm-Gg: AeBDiesAPOYZswgUbVcKaI6AEiHrxlr6YKzYLQQnXvFjM4vCeaQEFwcpfMiHVCNtqTQ
	eS6hC55AHdUM17yoXv71Lb8iy90Nd6oId222sEykHUKVS/tWVhJFxT61QCfHUwAeTbt55A6cFyR
	T+y6qk+8DMixkA2WRDZT7uAwz7euBRTOMmMexGHolQNbqxSNi9oFEpjHgMvVREUnQbOZ5LNwLbJ
	lPKlDJrg2jqAyDB8NyYV8Oiy8gaikmQYODJ1jOkkXAjhTb8HlXFC8VY3D0oArFUpYQHJMHorHDl
	zs+l6QWUWhzoN48MDssL11xM5E2qwAS+4upAjrO19S3t6CWL5JL4UrU3gR3LGFx2I6y8vtz91wn
	GPwc1w0WlErW8HjVcIGYJ7vUSNZAWkc7PNmKo7kUFNXB12/So5xgVeXFsrMDuz/uYL0zp6QwtZZ
	RFr04eqUrL9V6MbnYjXyqYNr25mJoC+j0Gtb5EtsjG6OCenhfGF28tQ+T7OOAteJRdFsNvE3nqM
	ImiQj0SNZKDJFj3Nmu0eIZ67jCW
X-Received: by 2002:a05:600c:e41a:b0:489:1ae1:4eb9 with SMTP id 5b1f17b1804b1-48a84532408mr29885665e9.28.1777547586029;
        Thu, 30 Apr 2026 04:13:06 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca664csm12966686f8f.35.2026.04.30.04.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:13:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 30 Apr 2026 11:12:59 +0000
Subject: [PATCH] mailbox: exynos: Drop unused register definitions
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos-mbox-dead-def-v1-1-a69176b7d0f0@linaro.org>
X-B4-Tracking: v=1; b=H4sIADo582kC/x2MTQqAIBQGrxJv3QP7IairRAvTz3qLNBTCiO6et
 BmYxcxDCVGQaKoeirgkSfBFmrois2u/gcUWp1a1g+o7xci3D4mPNWS20LbAMVQz6tEYg85RSc8
 IJ/nfzsv7fk46BpVmAAAA
X-Change-ID: 20260430-exynos-mbox-dead-def-e019a9ccce3f
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: alexey.klimov@linaro.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777547585; l=1535;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=IVpRtS1U7L6XGTbADqaORj5gZJvN+7IbIWKmL6oRgiQ=;
 b=RYbMiEzkqDTbkaG2gNr5/dC6VlSN+gT2TdV/n6UfLQQ4hiJECt/EuYVSbNhu+IPApG6hiTAMm
 yP+6lWLu3KNDlEStfAdWGKaWiRXVChjGbNuN4Z0EY1tWHfxT79fgfO3
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Leaving these dead definitions in place hides which registers are
actually being used by the hardware, making the driver harder to read
and maintain. Remove them to clean up the file.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mailbox/exynos-mailbox.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index 5f2d3b81c1db..953e715a89b1 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -16,15 +16,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#define EXYNOS_MBOX_MCUCTRL		0x0	/* Mailbox Control Register */
-#define EXYNOS_MBOX_INTCR0		0x24	/* Interrupt Clear Register 0 */
 #define EXYNOS_MBOX_INTMR0		0x28	/* Interrupt Mask Register 0 */
-#define EXYNOS_MBOX_INTSR0		0x2c	/* Interrupt Status Register 0 */
-#define EXYNOS_MBOX_INTMSR0		0x30	/* Interrupt Mask Status Register 0 */
 #define EXYNOS_MBOX_INTGR1		0x40	/* Interrupt Generation Register 1 */
-#define EXYNOS_MBOX_INTMR1		0x48	/* Interrupt Mask Register 1 */
-#define EXYNOS_MBOX_INTSR1		0x4c	/* Interrupt Status Register 1 */
-#define EXYNOS_MBOX_INTMSR1		0x50	/* Interrupt Mask Status Register 1 */
 
 #define EXYNOS_MBOX_INTMR0_MASK		GENMASK(15, 0)
 #define EXYNOS_MBOX_INTGR1_MASK		GENMASK(15, 0)

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260430-exynos-mbox-dead-def-e019a9ccce3f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

