Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094682BF002
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630355; cv=none; b=vEIfCwCGYGWacxjyScR+8saiWqGj51SDzmVL3wLHbVFrK5FghYnK1vjFNh418XTJ1JvejSGmnmnmEFjIfWDIpWu13blOBNSjfdZQblR1h6jJIMq/KJhO4po+66OmORXVgjUv7oTTfTHT/nKurXv0lE4RtZjRk2hYKR4CNKiSUro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630355; c=relaxed/simple;
	bh=lhwHD6zKtuPLFojWn2lPvVEZUebsG6dtNGfIwimggR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ixSf1UqJmrDXMvODcWtS0BUUkJzV13dvSKm+vOmvKVMlyS1YNJUDqTlALxGyi+7KDzOAM9ENqYoAr8KFw1tMQfy9Cg56scqAYYLyWQE7raXJPOZP5RAsFN3p3FhBU1kUKcV+FGu+axoN1hwKyKqKW5fpZoJ/bJ0eRqTfHiYttdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EQmF8u9i; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQmF8u9i"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so67636a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 08:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767630352; x=1768235152; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RWd8gGZijixy7TJB6a7o67qKbhTEBb13LWPMT6IwWdM=;
        b=EQmF8u9ilYheAn96QEWAD3MUAQ4MduixS05Xc4nRk+ffRQ8UKseeDJz+inMyHx3xNR
         5aNKNoYoJnGx+dFKkXGdIK+zNbIPEQSr/P+7nHGIqTlCJPqTobCZj+i1Pc3wDDva0CaB
         N8kN8aub0tQ98gDvn4wr1VhcliH4I9NAExmyDYK8S6nB/YXk+kWsBnrCAKxpTyEO9KRI
         3/1YGIfMQWo3X4TFhFNBeQr32ozkXXxzQOBTLw5CTez8/il6kc/kjmFic7yGJxySzkxK
         E8IJj0+U+O39n/vnmJEqG8THzCGomag6GupnOXPCe3PsIaown1IfdsjzFuWjuBXgiUc9
         Swyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767630352; x=1768235152;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWd8gGZijixy7TJB6a7o67qKbhTEBb13LWPMT6IwWdM=;
        b=OrgO4kNIo33iPEi9ohLB0nGPBQ7NdB+zzNgotvh1ZxhLB71aMdZi109I/wXfvzOIOY
         9Tp4HM/BqdAU9YE8h+JXotBjrezkW7MJBd7u11RyTpGCuLgnuuaGxIgghZs8TEymgWfI
         y4udRupKlEptQ9bulgFWYVj01okCABSi37h0NWmqag3FeRMtyUOhZYAPuFwqK+Mqxqpu
         BpjNFvI3QhL9B6lMxFSN23X2PigW2nGdb5v4/Gmarv3/pS5YAzBTL2y932Yg+m3HYUMC
         E0+lrvZkSotgjQgmdxQS1vpMtIerHvIaNzNEh4KyLDFrmkp0XBP51P6sWD5Ag96aUnpp
         LATA==
X-Forwarded-Encrypted: i=1; AJvYcCUtNhzaQF6dkEgJHCSz8NHzkhx40el2w2Qma1X3MmFUFaj2z1g5Rt5yLMg65sT5/dBjr6d2g6CYTTN7fccZgyU3NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwsFfsbXLYxbvtmOjwvllIEMNy1rlBHIYSKExwP7JDN+SBx70j
	6mxUg8i9hNxsrPEmZESrBH+8TJdD3pCSX01TEAs49W03MLPpbN163wUfsGrefrgGIfkS8Sms2+2
	v/94d3x4=
X-Gm-Gg: AY/fxX4Z6uw+lXoHlP0vUr5BntPdR/L3eg1doBxLJOpe/ofTV9PJxSQRvWByieejJP/
	LyX7tvRVDUfaKsReM6J+6kejWlhgw1i9BiTz1xRX2OXlzOXdvca0TlVlf1E2KKtjk1Y50b71vFY
	p9iUfuQBPxzWG8GPpFzvetIHne0uAk/5FM2PQC44hlOll1fHygCg1uzcQJLh4s7NnwM/nEcuOnj
	zA5VRnQRpcSE+LfbjtYz7Dzhp2p8Ub6D4VEhCVP4pOxXGZeOORzjkG6al9ASiHASbeX7qi8tbsI
	1k/Eid1oOFAl6LMnESVKzjFQBzDf5FUrvKyngDb0vWTUM3E6Gu64nQL/AN5NKJ43dA3lQTtvkqU
	S3HiMBKC7xClxQsoGNPLUOxjOZLf63UPrvHnDsHTCQdIq+ARRx1tvAK7kx6yDpeFiAORYJBwuMc
	f2M9DzGfhg54UXD4DHfG0toJU7JI3/ofXWWg7DNXL6s9GRjWmhztHPNyWw3YKd6evtW/wnOdI4r
	oyJgQ==
X-Google-Smtp-Source: AGHT+IH++F1PtoRnM8tXtPdTTGiZvVCvxxgBXEVu9xsKrhG0h1XR6QkSWJu7FAaG0PBnAKq+tD8WrA==
X-Received: by 2002:a05:6402:5108:b0:649:b4d8:7946 with SMTP id 4fb4d7f45d1cf-64b8edb3335mr42382412a12.23.1767630352240;
        Mon, 05 Jan 2026 08:25:52 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507618dca2sm170164a12.29.2026.01.05.08.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 08:25:51 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 16:25:46 +0000
Subject: [PATCH] mfd: sec: Fix IRQ domain names duplication
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg10-chained-irq-domain-suffix-v1-1-01ab16204b97@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAnmW2kC/x3NwQqDMBAE0F+RPXdhE1Aaf0V6aM0m7sGoWSqF4
 L+79PhmYKaBchVWGLsGlU9R2YrBPTqYl3fJjBLN4MkP5KhH9eueHaG1Ujii1APjthpQvynJD2f
 3HChQSJ9IYDt7ZYv/H9Prum7KrxaGcwAAAA==
X-Change-ID: 20260105-s2mpg10-chained-irq-domain-suffix-c1860909fbd0
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

For the S2MPG10 IRQ and chained IRQ, regmap IRQ will try to create a
folder with the same name which is impossible and fails with:

  debugfs: ':firmware:power-management:pmic' already exists in 'domains'

Add domain_suffix to the chained IRQ chip driver to fix it.

Fixes: ee19b52c31b3 ("mfd: sec: Use chained IRQs for s2mpg10")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 74ac70002d1fc54c7eeb78cfc21b6117a3e14b03..ff2671186e89f2f9b6c98583c0ebfa18d32b89b3 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -198,6 +198,7 @@ static const struct regmap_irq_chip s2mpg10_irq_chip = {
 
 static const struct regmap_irq_chip s2mpg10_irq_chip_pmic = {
 	.name = "s2mpg10-pmic",
+	.domain_suffix = "pmic",
 	.status_base = S2MPG10_PMIC_INT1,
 	.mask_base = S2MPG10_PMIC_INT1M,
 	.num_regs = 6,

---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260105-s2mpg10-chained-irq-domain-suffix-c1860909fbd0

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

