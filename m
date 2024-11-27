Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583D61E0E16
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705099; cv=none; b=DG/mwOwlw+wPXOwkzqy/t/q76I+VytmfXA6imMRv+C6eTliQq7SA4Zv9L0yCRzWrPB//TnO+EVEbVDE6NqW3y1XHCj/nVm1iYuawObS/p3Pe8h8xGB2US2tjEBBazFcfwKaMW0suBHRQHbTW9nj54P5dYRWMSw1PSW1LZG+z8JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705099; c=relaxed/simple;
	bh=pxF3U2AMX2kAxO2vFBTnPKHJ/z4C1rX/30GUiYdACRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VDwY+vh0ebZLUiSECHrhWGXFf4fYPT2vqsOERwID2tMAPYn0RUQ1EA3tNIiJsOC95VB2zI/YRXMvveS4EdAI+vy31p2f1816dkQ15jjqygPUXgCwxWZCNNSUL4Jhoxz0t014sqqvu+BmyQF3RXZTq5gNXSPzg2WkykqSgGQgGEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S15Rmw1e; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S15Rmw1e"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa5500f7a75so503734866b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705095; x=1733309895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ela2PSfA/tyEVDL+lOFVH15DKBPE6OrGnsuqeliWc0=;
        b=S15Rmw1emeUL+6bNDFXxR7jiWwCjw9EaYm8h33Z0wSY5VYjy/IyasPZgOBv06sj9k4
         Ihq2M25tNINVu9D/pUrWWpjoPxLue3+CFtM9zlgVDsZ8CG4qbf7qGr38FQwRT4dPDtS1
         fm+P3LEpOdt3E2m6GKfn5iQ+eJmxge4/4vMi+ZpfC7Mh63R4B9YGRuzb4iq2yXOY6TZO
         W7XlRw8ofwNUHVLPKy8HIuHU6XpmklKW1zGh44wL3IuI9Krde+bmCxiBKmkAEkiBKtCd
         fo7IuFm7IMxgDjnrOCTY3Zb/eENlzgS4cJNjKx9hIFwIXlhr17THfi6yHWDCkubNnTXj
         713Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705095; x=1733309895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ela2PSfA/tyEVDL+lOFVH15DKBPE6OrGnsuqeliWc0=;
        b=DdIxQE12AWCkV6P8YhOW+/m27bqNmg5GIPaN+5F1cZ4zK+83jIzMUATvNrb+TCPTEQ
         3iqnKQHVJ4e2k//8zq/lsbkjbNMCmVLh7MTs6QmMtpN2NwCWL/XjZY46mETIZXAKvA5U
         8N8Dk6R+UYuM0zOeBtso00xAOlHCwd6FXOSZvjU2xl3O+1DNs654hscb3lNr4ZtGrdRH
         ZU99zwKm6UxnoY/mlnrh/SEREZvh9Q45vcV+OAjQNJbniEu/hk7qmntZzC4hHMuGGKaD
         Kq1421QOzAdVHtd65g0RgdbA0eQkPfL7mlnjJ86znR+IToMYShSIKNjjWFD1WyqH7UBl
         S2KA==
X-Forwarded-Encrypted: i=1; AJvYcCVDfAmyfVX3wKm8fVRrJX142t5VbiNGGER4Khwa0jRAQPiXXygvIvrYx8IBgntIVHppk3B7OeKhuWl2hldSetiG0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRJU+r6MbzfAuWiwvvKGak5P9blSoG4r6N2AObWkhnE2fih/p
	+/g4Z6q8RoeeHGg7bdij8eWSOFOFvE0+Q4xpWF/gtYbEWw8IHujoXKiUAno6pSI=
X-Gm-Gg: ASbGncsd2NdiNPTuQc0nfQ81f01GdDZdiwn6CzzOlcuR5B2NL4Gxwel5mr2SsUkHJfK
	xY+nIjGVLQDlFcRdGZxwD+G7qMnlJHzOsBAOKMDRHjOu57bA2LfeJaISXlrwRMyyLte0xTHemk7
	X0lRRwcYaGcA9iS9b12LCDpJ6b+ql+6qcvBL+lHiTsdYoKH5yhUUqIqrAfqSzoZ4VdURkwNZebw
	nKqxSwZhW9Z0zxPjoihEkqIPvI319BWOQR3CMIN6qTuhXvHU13b53FO0JqZZ2vStgD3CELgHt0S
	apCmt2wbv9BiHi8bKR88JkKC9nugeAVwqQ==
X-Google-Smtp-Source: AGHT+IGGy57a01XH3UbpX0NsvNr8Tj73NtCtISVWPxqvv7KY3oEK4Rqy5+2NoX4k6+nU1RKiz62pMw==
X-Received: by 2002:a17:907:7da4:b0:aa5:43c4:da78 with SMTP id a640c23a62f3a-aa58108aaa2mr177836266b.51.1732705094719;
        Wed, 27 Nov 2024 02:58:14 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:14 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:15 +0000
Subject: [PATCH 5/9] phy: exynos5-usbdrd: fix EDS distribution tuning
 (gs101)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-5-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

This code's intention is to configure lane0 and lane2 tunings, but for
lane2 there is a typo and it ends up tuning something else.

Fix the typo, as it doesn't appear to make sense to apply different
tunings for lane0 vs lane2.

The same typo appears to exist in the bootloader, hence we restore the
original value in the typo'd registers as well. This can be removed
once / if the bootloader is updated.

Note that this is incorrect in the downstream driver as well - the
values had been copied from there.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ceae4b47cece..2a724d362c2d 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1510,8 +1510,11 @@ static const struct exynos5_usbdrd_phy_tuning gs101_tunes_pipe3_preinit[] = {
 	PHY_TUNING_ENTRY_PMA(0x09e0, -1, 0x00),
 	PHY_TUNING_ENTRY_PMA(0x09e4, -1, 0x36),
 	PHY_TUNING_ENTRY_PMA(0x1e7c, -1, 0x06),
-	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x00),
-	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x36),
+	PHY_TUNING_ENTRY_PMA(0x19e0, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x19e4, -1, 0x36),
+	/* fix bootloader bug */
+	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x02),
+	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x0b),
 	/* improve LVCC */
 	PHY_TUNING_ENTRY_PMA(0x08f0, -1, 0x30),
 	PHY_TUNING_ENTRY_PMA(0x18f0, -1, 0x30),

-- 
2.47.0.338.g60cca15819-goog

