Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35126188704
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2025 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740384095; cv=none; b=hG4zfJeiqibme08qrh0l2+m6yBI1OdDR5sy8kGv1o+1oEiPKguQpyXDjg3w2FPXGFysD1WBazVm/gC5G/6Vpepku7YpHjjLFp5GcStp1CpEXTavXp96GY8xVzx3UrBAMNs7h7A0O/tVK0cgtnMqO8vuXxyoC19CiDbbJO5bv15U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740384095; c=relaxed/simple;
	bh=fLnEiSETJ8+PZ13rLV26ADkS/jCTNTqwXysxo5sNB1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0IBvhZSrwvvFgus/B3Vma3kIOdl+/N7rTKMiN0XhOIYDVyIwCVsQGVE+Y65S6PA1L9lmKbub6fjR5UtpW9AWhLXAMVOkJC4RcJqP1ptmGyXIQKjjlT0J7qmVc7hhBMt3CfZ+idwqme3nV7hDFsX9av2tqVAY6xEJmMmZ1QV1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rMBG1MHy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rMBG1MHy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43996e95114so25559905e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2025 00:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740384092; x=1740988892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDvEBdyqb+LCUK8JJ/EhfQ/X2vzVVFCo3S0RnsiF8pI=;
        b=rMBG1MHytDMvfXTMelHJoNkoKbwfUApbDVwznlrfRZhea2Xjbqjg8Zfk2btKCCOaol
         yyKcI28Mabj6BEsYixaDDxzgEJk7h3AHBL0QGggrTLQAkcyrhAwUI0fyBwaVL+U+OeoF
         9wmHM3y0TmXvc1KBme4KmlNeeDW1d+o9wkEYMTeQ1R8eYlL9PbEylsvFGUweze0bSImR
         EOr7DQsmi5YPR9ZnnRSKJzHC2UwRNYXw72ConwO18fCeTKjie+My5JQq0tgzjpYXftrc
         309WA8pXgiVdTHHs0YoGmh3SXCd8RrGzn2ZsohrGjNClStPyk1VR/YuKAhddSEu+uaTg
         EMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740384092; x=1740988892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDvEBdyqb+LCUK8JJ/EhfQ/X2vzVVFCo3S0RnsiF8pI=;
        b=Yg7qvY7XvxuYjFx9Ori5eE501uUHSkaEH88vPXEe+QvAdLyOa1IJZrqmO2oBKGWVy5
         6utvLtz4eCCwadys0rvvc0p8kdeqNLv16hOj4j/TUqup6bfPj6SAnPsjzvzUC98T1YFK
         roNTqpWL6nr0DreE2b0bfQeQEqGFfdf24GoPzPr4UecwWgcMcT2T7MszvqrPeiEAmDDc
         jF8jOFM17iVcqz1592HPB20gQdQLGdSilbmPUdPVl2cnTrwED/Js6ru0A3Wd1iBzCThj
         R0Iftwati1QFElPOLmXNUe1hLI/nZuG5a+g3fLdOuNqc4lXv9xCQYztgV+tCfwQRggRM
         uo8A==
X-Forwarded-Encrypted: i=1; AJvYcCURhS+OVD5CpXCkXM0BWrcfQz2WWCz0AtOcxgjVvtcwZy4bbwa/j7eTy8n+ImcIZ9p4f1LpgVzw8oCTq9qDTj+gjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2oAzdnaKpnLMIN8JIxJyabZ0lC53gj7rFpIFitFZa84Azmm/O
	QhX6sBIPJX8yF8juSDrcRyKfOnKnVJfynb/dMK/2QUdK63/u+pPbyPdWNgM/MdojnCEzR8f4DMA
	fQ9c=
X-Gm-Gg: ASbGnctAG8zZI0ItpZUq0pwrVBVhWcH2ZpfSIbR03Ah+4aegBFhnoJ5kMxtF0YLdBbS
	2kRsUnof9I692YnH1ObuoJHJfDwDWh8EpcTk/SFdP6tqNrPm43pMEqzDxZ0Atg3kHlKWHvE50Zt
	wdWmmddA5JVV5uBYcBXNI1lER7ty4+Cg2XkIjySWHyNdC5M36AiRzbRffFc3hKItMTNHn/lQAUe
	wHPqc/SChNEbT8sxSRTomCJ88qEjNEktvywHnuRWLO9UarL7vX4mHHaQK5S+J5Fi8ySRe1mHdXc
	bwq9FNd3swv1U3Ng/jVnqDxsQzNtMMdsQvoraEzVETSVlhbbtjsOsBT9AHNVkodDEtgcPAdyYi4
	8RS3eJg==
X-Google-Smtp-Source: AGHT+IE4ZDfn8IZlrI1hvBZaxOYiDGG0nYOPyFk3VkBXJ9hbsd17nkiDUQ2UUuMCC3IuQ80wYzn30w==
X-Received: by 2002:a05:600c:4f92:b0:439:9377:fa22 with SMTP id 5b1f17b1804b1-439aeb3453dmr95707715e9.18.1740384091916;
        Mon, 24 Feb 2025 00:01:31 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0367533sm97690395e9.27.2025.02.24.00.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:01:31 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 24 Feb 2025 08:01:22 +0000
Subject: [PATCH 1/3] firmware: exynos-acpm: rename exynos-acpm.h to
 exynos-acpm-xfer.h
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-acpm-debugfs-v1-1-2418a3ea1b17@linaro.org>
References: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
In-Reply-To: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: andre.draszik@linaro.org, peter.griffin@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740384089; l=2304;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=fLnEiSETJ8+PZ13rLV26ADkS/jCTNTqwXysxo5sNB1Y=;
 b=3T+7vTI0DjoqdFOzA1ETT/a2YAOdtQrNmTHKgkHboovpHfmPcXLCAGDs1fKlPZGN1M4U2WRzg
 ZwS4rhbBJLnDhj8MJEGz0gLckLiY937y7lH/k1/+7pa1o+7yd1Nce7y
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Rename header file to better indicate what it is used for.
This is a preparation patch, as exynos-acpm.h will be later on
introduced and included between the core driver and its debugfs
logging feature.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm-pmic.c                    | 2 +-
 drivers/firmware/samsung/{exynos-acpm.h => exynos-acpm-xfer.h} | 6 +++---
 drivers/firmware/samsung/exynos-acpm.c                         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 85e90d236da2..9ad4cb82fae1 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -9,7 +9,7 @@
 #include <linux/ktime.h>
 #include <linux/types.h>
 
-#include "exynos-acpm.h"
+#include "exynos-acpm-xfer.h"
 #include "exynos-acpm-pmic.h"
 
 #define ACPM_PMIC_CHANNEL		GENMASK(15, 12)
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm-xfer.h
similarity index 79%
rename from drivers/firmware/samsung/exynos-acpm.h
rename to drivers/firmware/samsung/exynos-acpm-xfer.h
index 2d14cb58f98c..0b76a270b773 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm-xfer.h
@@ -4,8 +4,8 @@
  * Copyright 2020 Google LLC.
  * Copyright 2024 Linaro Ltd.
  */
-#ifndef __EXYNOS_ACPM_H__
-#define __EXYNOS_ACPM_H__
+#ifndef __EXYNOS_ACPM_XFER_H__
+#define __EXYNOS_ACPM_XFER_H__
 
 struct acpm_xfer {
 	const u32 *txd;
@@ -20,4 +20,4 @@ struct acpm_handle;
 int acpm_do_xfer(const struct acpm_handle *handle,
 		 const struct acpm_xfer *xfer);
 
-#endif /* __EXYNOS_ACPM_H__ */
+#endif /* __EXYNOS_ACPM_XFER_H__ */
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0..3c14afc89fd7 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -27,7 +27,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#include "exynos-acpm.h"
+#include "exynos-acpm-xfer.h"
 #include "exynos-acpm-pmic.h"
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)

-- 
2.48.1.601.g30ceb7b040-goog

