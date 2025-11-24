Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1B8155C97
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 06:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763966849; cv=none; b=WCyqL8mprMyNUCwxsNby26aSvoYsXMjNWlFS4ic2nNJJlgLNYFL72wXcRlEGFK9HjZrY7vNDIi0ohugjbEvG/JXp9EsprOwdrmvVfS3bN1/9W0UV27w7P/TjX9XswUqKLZAjVg66GwG7mtFND+fNPUTCKTc14pCtawH3+qLM7q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763966849; c=relaxed/simple;
	bh=xS8f3e9ojWBUFTPLFmVH0AEiU+l8qCLZvV+ksgaES7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E2Jm/GbMLj6Rh+VqQB1u2hn+vp3zDUN27hZzlK9BAmO4eCTti1/U1u6XtPIuZpkAP2fe5/QGtBdhXd5cKaSBTzUABlIi5KR4m5lTdFlH1imqhaS8tCcK4L1rBYt59WMvXcwkka9SsKosMIPMxB/iEnZd5GVfdeY8XFzqRN25T04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JzJCq10O; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JzJCq10O"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b736d883ac4so728595466b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Nov 2025 22:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763966846; x=1764571646; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h6aNSaZ9sGWXOSiwhNWYpDnlUK0Ex0m/nPsXkvx3ZHA=;
        b=JzJCq10OQZss9ldGzaGF6dOOCV0QAVIbAZ2EfOKoMtU0mEEOnITh+kA1lfcDIuZLWA
         cQSnx2Vj9raPuPtTW9SHAnn0Qebyt3aBIK9t5Yw7SQc02O1w32ZGAJkdfu2NT3j76hfI
         AO6P3ivZyKoESVCZaSk5+4Xvyxj3AdV5EmK7RWNRCP7ZOsFUkRm5fD/djg5hiEEI+u/R
         4f4wIOlg+DtInI/syvwcHnIcA/But3SLHwb5yTsBvj3dBSvlTz5nR6FbVSnWGBqYHIcz
         M1SHWzanBDeGtAaUL22F9ibT6IOvVc2nWDkTI/1UeWvJ/b3gx+5LpZftxEd8+O0ODW5a
         H1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763966846; x=1764571646;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6aNSaZ9sGWXOSiwhNWYpDnlUK0Ex0m/nPsXkvx3ZHA=;
        b=ryVM6jKAArgno6+Ryz0B+gHaMrl2wCwPXbLj8cCy07cBIkzxKdM5GX1zmuM4QuDL4J
         jWgMmFFr3DJMVOQAKkyj+lxm9KuZw8SijVfhMyY84Tdz8VHFRsUwV3pxWkEZZpowhNki
         UIcdUCSp8dKJsbomwCklYgvtVt7uFHwMdhx4ThEPTrsiKmXzRBazHUtUsVJxcB1QzSfs
         ZdEdIeYRx9DlWQ31jLaRzLMoe5GENbF3ui1+TkwDFeA/ZoU1mW5C+nbyY30Q3PKYte8R
         FbTdkVChXtYY0ABLD1JGJRFVNmWnCrCSppKeMXPsIK84pbD+koawcDkmauZ4mFWuZtMG
         5GnA==
X-Forwarded-Encrypted: i=1; AJvYcCUNyMb8QfTzO1kYGHPR8RekIN8NGHrveDuucCdRkUQSD0h3a1XZBBuUZXvC8aGOevwCLJ0tbVZr/kw75tY1U0FThA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVpUfT7bxnHHt+2fZWNDzfUoWKtXdBNT8Hz2v0JJrIF44jvmxJ
	1qY1aIVIwEjlPQe2fZ9E96uPZ47k2fpuKKlS4k7oyyY1/uVLai8GrefMabTcPw9CvY8=
X-Gm-Gg: ASbGncu+b3FGozckiJ+HUXIdZeHyndb2ZEImoQrf/40PwLIKUqlDr5qDTEjyUjYaNWl
	IxTO1vf9rPVnmNs9bW8On9U64tXooN3gFDtlijpgaRnxCr+fKMAG3Ho6ZkWg2vFVk7wMM3//uIY
	9Fn0heWZ5KJ+D+gVJ19yJ1pYFwHzPm2hMKmEdvOfuMyiGT3wZ4rnMuYAqqi9QZjfRD9zlGxYJ6x
	6/kDL2eiidY/U8kTvGNVQ4SSdJ7xWlQM3H205K5KXJYQg7JWsxkhTNz3v2PHa5iJgW+gQqLIcSA
	wNXwLeDmhL6ZKGgYHg7TcZWH4ejLe2vh2VqOn7mRt1wzZUTqaZoR2jyO9Hkd67Y3uL/kb/Hp/wk
	rgclIrMdS78VNPgd/wQh7DI8cBmRq1WebLPt0QE9AzFTGKPhEDhTt1pPXPC7lZ0LW04mYub06ee
	ANKcLbTnG3YEIu2LHXHPTKRQth9Y+QiwcWrgjOEZmih44/teGLuavPXBRkG/S/D/P3qV05RA1n7
	f1ozg==
X-Google-Smtp-Source: AGHT+IGE4sDmwpE3/GH8hy46tdrskmewKXjoFl9Dnjg9WQRlefUv99r8KcFhmMNtPKwKVWJwbOYSKQ==
X-Received: by 2002:a17:907:741:b0:b76:3548:b741 with SMTP id a640c23a62f3a-b767153f880mr1156705866b.10.1763966845717;
        Sun, 23 Nov 2025 22:47:25 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4f4esm1207766266b.45.2025.11.23.22.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:47:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 24 Nov 2025 06:47:18 +0000
Subject: [PATCH] mfd: sec: Drop a stray semicolon
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251124-s2mpg10-chained-irq-semicolon-v1-1-578ba2d7adca@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHX/I2kC/x3M0QqDMAxA0V+RPC/QZsrEXxl7cGl0AW1dAyIU/
 93i4+HCLWCSVQyGpkCWXU1TrPCPBvg3xllQQzWQo857atFo3WbvsFaNElDzH01W5bSkiFPPPTt
 ifj2/UB9blkmP+//+nOcFn+GOa28AAAA=
X-Change-ID: 20251124-s2mpg10-chained-irq-semicolon-f8c8c02cc73b
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

A stray and unneeded semicolon was added here by accident, just drop
it.

Fixes: ee19b52c31b3 ("mfd: sec: Use chained IRQs for s2mpg10")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511230909.zk7EkTnb-lkp@intel.com/
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index d992e41e716dcdc060421e1db8475523842a12be..74ac70002d1fc54c7eeb78cfc21b6117a3e14b03 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -304,7 +304,7 @@ static int sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
 	default:
 		return dev_err_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
 				     sec_pmic->device_type);
-	};
+	}
 
 	regmap_common = dev_get_regmap(sec_pmic->dev, "common");
 	if (!regmap_common)

---
base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
change-id: 20251124-s2mpg10-chained-irq-semicolon-f8c8c02cc73b

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

