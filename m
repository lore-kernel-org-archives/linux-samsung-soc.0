Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A913FBEBB
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468318; cv=none; b=ZcDA9QsW26IPViX+gyOBhsGPPVq3vOg1cjLwVREwNgeag3aCOU/6JqjO+tjck8SCHoZbvarFSxiVxcNqA96G589TjuHyWWoyOThho/L3knwCcAw5Qxjsj9NmAdBZz+kwbnZFvPY1omE1V5kyAszu7QsUf7OAVEtnWSzDuW+qPNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468318; c=relaxed/simple;
	bh=q1S+03aGlcH6n28TvbZ1L4it7+K5AeVq24YPPGzZ2I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M4QpoOTvIaTM7J1Ocjxytvap+VQ4HBBRqZJml6aiwYVMBz3LqRlnpAofuadm/FgnQO0N37qXPdTzGDHA6yBFi8lIXRw0yURaLwaax0lZOcBzs1Jw5RWwrPjsHeUqIj/opWNIhsMB5XNuV2tC8bJq+WJp7DNTE+7gFDSSpZsNUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OM2qgAVG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OM2qgAVG"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43fe608cb92so8458072f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 06:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468315; x=1778073115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JCJJgoNCZ5gGQkcl+YQnJFPiiEiR515Ip28lGR0OcA=;
        b=OM2qgAVGiXx6gBYTnLqyewl/sVYxfsEPzJHFvxfy2GF/peKZUUXJHNn5d2Io6JJ7GF
         zOor7AXV/ARNROons4cq6GmKhGS12c57A92AVyROFnTEJMDUh8i7bGp0SMZRCZfGIyYT
         7NIFeum0effEdGdemIPxH6nSWNA1nJBk66tkOTGp0F0wPKYHRfV0wj1MXr3t23h0wdSa
         YiI33hxYSe6ud32eZj8JdhPkDNfEhaamYYOHtELKyssVhxF1RmOtJr1ht3lDoC9A3Ixu
         1Ul5jR4TvgYbHn3pUPypsbmemQnLq1EOuRruUhzdhMnxtNc9LTKv3wRef7AcUbI/dZJm
         1MvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468315; x=1778073115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7JCJJgoNCZ5gGQkcl+YQnJFPiiEiR515Ip28lGR0OcA=;
        b=ISc2J74/gztsFcesA5IOPBrCI0YfZP3Jla1UUl2ChPL4owHW7PplmiAtf8pr3cmkvU
         Wr9d0RPTQ0mmxDxLOFYHiD3JC4cGLHxe3IbCvSpEoKK5XD6nTRFdyrudF5pQUwihiAUg
         97dIglO5WoHHyvBtTPxj6LOKkiHewXiWhjBmZF5xfBX3jAMJmLHnlZxUMn8gMqkgjuwW
         jIHCkHtZQbBm+IbOHudBq865Jqh1vii2IuA0Zm95EldXVN1rCwwpNqkNusbDcvpSTuDQ
         U46U8yPEqqtSxFpls9CItizHyiPuz7LlFOL4fqgy1YHZ2xyyeQPhx2yuMqXxmYnKq1yj
         9RKg==
X-Forwarded-Encrypted: i=1; AFNElJ9oaOFBBToAjcY6K/kj3lGO4xn2JAUsshRED3iDYwD/JLA/hxsqKjziUnitj5bIFha3YsFpQfEFdz5q6XrBi56euQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmlM9FbQD3n9dqpVY662kr0l09kMpDOeT7Fwi1E88tjhKUbvH5
	sZ8AoJTegO2xWVaNZld/ITTc+ZokItPlOFiPIXqT5tLIoBbL4e6pLMt1v57Gdm4a2sM=
X-Gm-Gg: AeBDieteVMWRUpLeMm0nJIEQRl1tcIxGxRFEhFgOG5HOsoRdITo+geT7cuG+e2aNEAf
	soimv7Q/whEfjf/2Qf8VVLWoQbC775ke5kF/lVB/+jSsU6qk34UX8oXLVvBynqPEPTNGa6z2ZLI
	c8I3NwGHIXpNPRD1gKXVwLRJJtkADlM8PeDpLr+aIHbWD5N0z/VxyPSVGkA9Weo+MmOvYFsvDf9
	z29kQkSoP8NHbeAmfp9piOtHET+hS+BZW/NHwsNIgxi2quOTjVIyBdUqOF1lkoTncKFZdWvLlZP
	phuTQNJe2uGYv/aElzqn54MSD/nFeELZoNGVL4+tGMh+VDh3x9jwMreJZg3lIrK532uFVsVvtpI
	Q4RMbyx4oRQNKEdbwZzAhFrkyXqwCfjZzhs5nN6SjMSPaQUJ4KBpHTAQnR6P5sNMMDfENr7HIzh
	pszPd57XWGnFcOJVWk4Xvb1G4DkU7EPVlMJZXLVTIjxslKO3K+4XvT2E8s8SOMIUrV5SPnuGBpi
	QlwpaPX3/HGFYSoRw==
X-Received: by 2002:a5d:5f83:0:b0:43c:fdd:ea96 with SMTP id ffacd0b85a97d-446496d7958mr13247989f8f.26.1777468314477;
        Wed, 29 Apr 2026 06:11:54 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 29 Apr 2026 13:11:53 +0000
Subject: [PATCH v3 4/6] firmware: samsung: acpm: Validate SRAM shared
 memory and queue pointers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-4-47cf74ab09ad@linaro.org>
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=3318;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=q1S+03aGlcH6n28TvbZ1L4it7+K5AeVq24YPPGzZ2I0=;
 b=Vg9Aq4hjk+3SdpYiyCFYei12SF/+xSvtM3lyisaToANK/5u1mqS2/n17ihJi1MyptTCu7yyiN
 oSXoNoWnjfQBZOF7NiENy941dWjDk3deXwUbalPXuFT9pK5A5euN62h
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified multiple missing validation checks [1].

The ACPM driver reads queue pointers (rx_front, rx_rear, tx_front) and
configuration parameters (qlen) directly from shared SRAM without
verifying their validity. Relying blindly on firmware-provided values
leaves the kernel vulnerable to crashes or infinite loops if the
firmware misbehaves.

This patch fixes three specific vulnerabilities:

1. RX path infinite loop and OOB read: The rear pointer ('i') is used
   to calculate the MMIO address before the modulo operation is applied.
   If 'rx_front' or 'i' are >= achan->qlen, the driver performs an
   out-of-bounds read. Furthermore, because 'i' is mathematically capped
   by the modulo operator, if 'rx_front' is >= qlen, 'i' will never
   equal 'rx_front', causing the CPU to spin forever and deadlock the
   polling thread.
2. TX path out-of-bounds: 'tx_front' is used to calculate queue indices.
   If it exceeds the queue length, it causes invalid state tracking and
   out-of-bounds memory accesses during __iowrite32_copy().
3. Divide-by-zero panics: 'qlen' is read from SRAM during channel
   initialization. If 'qlen' is 0, any subsequent modulo operations
   (% achan->qlen) will trigger a divide-by-zero kernel panic.

Protect the kernel by strictly validating the initialization parameters
and MMIO queue offsets immediately after reading them.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index bd0d48e9d157..e4d8d1120192 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -230,6 +230,13 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 	rx_front = readl(achan->rx.front);
 	i = readl(achan->rx.rear);
 
+	if (rx_front >= achan->qlen || i >= achan->qlen) {
+		dev_err(achan->acpm->dev,
+			"Invalid RX queue pointers from firmware: front=%u rear=%u qlen=%u\n",
+			rx_front, i, achan->qlen);
+		return -EIO;
+	}
+
 	tx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
 
 	if (i == rx_front) {
@@ -439,6 +446,14 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
 	scoped_guard(mutex, &achan->tx_lock) {
 		tx_front = readl(achan->tx.front);
+
+		if (tx_front >= achan->qlen) {
+			dev_err(achan->acpm->dev,
+				"Invalid TX front pointer from firmware: %u (qlen: %u)\n",
+				tx_front, achan->qlen);
+			return -EIO;
+		}
+
 		idx = (tx_front + 1) % achan->qlen;
 
 		ret = acpm_wait_for_queue_slots(achan, idx);
@@ -574,6 +589,12 @@ static int acpm_channels_init(struct acpm_info *acpm)
 
 		acpm_chan_shmem_get_params(achan, chan_shmem);
 
+		if (!achan->qlen) {
+			dev_err(dev, "Invalid shared memory parameters for channel %d: qlen=%u\n",
+				i, achan->qlen);
+			return -EIO;
+		}
+
 		ret = acpm_achan_alloc_cmds(achan);
 		if (ret)
 			return ret;

-- 
2.54.0.545.g6539524ca2-goog

