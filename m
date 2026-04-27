Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB5322B6F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302261; cv=none; b=rEyCF04aeNmppcBawG8RsaiG6tFOlCSsAG2g2oEKD1NTeE92GM6bkK8WQWexXTW/mXqbKKnRQ9Ql/xbOfRjFHgbo60JhTfj+TdRTAEjR4DhhiHGlfqDLyZNWXHoUfym4k7SILAtUISoij9m/Omc7FRe22i8NKbeAT0mvOyfYVsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302261; c=relaxed/simple;
	bh=m/tO5SKZlsZv2lDCNDVLmgGJxhoMZAGNBisteBM84SY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OCaVnflRN6uZ1lyyspKkRq/ERWNK8bxoVZAHzbd2O23o9Dpq4yxWTf0Yu/mWLTNdX8TPCDCp5oqlW1hEFuJCsQRy3ecOtkbYBWXBWskFHyXJt77FLDYGHV6mFTbMPIofoBPVVgsRdOAZCeBcOa+bWlZdhe3eeFUCt8JWsbzK+ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cuAGkdaG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cuAGkdaG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0046078so94891105e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 08:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302255; x=1777907055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+rXCO4mUBoHaMSfoUP0Fw9J65bipPOLJZg1yJy+iuw=;
        b=cuAGkdaGAOlVpLNjrCNBPAZMJxNNHxl4hg36qoSXDkm21wTOHvnKmUO4I4y9Uggf85
         Z3aRIoARPVn67DiutyXhymhjz4NUS0TV/wlDfYUKQ5YQa4bpdlhK4WgQ/pAfehH4WIXJ
         SpWCfC2vuI1LWzCZGQHuFf49NlHCk6NB2PAId797AenTWOZIG0mgwM5ULqytpAM8MfpK
         IJHuhdv+bQPr24UiqRDMFGfTrPAssuoU9x38JQTyA+/1OzpUMbsf4Swz+m6pVAF/P+Hu
         FFeYsDvG6Xm3t95AI/jjoZz81lwviBSMEnmnimbB/YFoGLEqJovkzCbZwABPlFOvD2aA
         KfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302255; x=1777907055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+rXCO4mUBoHaMSfoUP0Fw9J65bipPOLJZg1yJy+iuw=;
        b=PNzUdV6VKNZmHN8zAnYsORpl5AwkpuQ/jc0/WPCsXq3B0oWl1u/o1SZlSLl8FSpqVo
         DTHfkxixVZSx7+qhlmMgurISMczJDxhA4wEs8hywzVk9PB5xVTAXUFxdmcIAzuqiCx+w
         fxUrNsr2H3GytuIH/zXtxgFS1QE4YnxWB3m/ockNC5K0Hsr2YMZhRxc/EuQTLx2YsWdH
         JPTO7Q5dV0qvibIRUnwNo0WmiXYq+GfNAwEalf+TStzHbZ6CHtVZ+MGQLWn0E+IVnpQm
         O5iToJ8xL6A1VpGukEoCu/h+dRb5LmF+k+jLiERHsua7jEMWuz9A0EF7PUg38x2pH3Ge
         iPBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oxPGJNw4oXEX3dsBkclG/hfmBQpgscChf9QtM04R0ErZq3SM5sHxZHNWUXnuq2aWpF+Pum4nFs0A6Fksiw9tQNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6qHZqCYF1L9pf3tDOafsdYrVVfAsv+6lCk+IJAl6HFj+9Y402
	Erualao9Vq4+cuJakpJpT49HTSmO0Rf7rWcC+XyjXqkH0xa790ts8ConeS49BPEiqFo=
X-Gm-Gg: AeBDievh5VgMfWVFmk9e/Hwy0RWsm/MVpCfPYbTtqpTxz6gBeqg8q8oxraqb8L04Hc2
	jZ+/zK5luTGi+Hw4hHhYvcIZiB8xJVhrCSbIN0Kw82RP7Fw1IvNbnfbsM+QAp2gqrCww6EetTEt
	RgSQlFTTHbsz2dQVG9nwyO4lCln4uHbYmQCIVBZ+B5w1qilwdd4e909XSldAyaliZyg/XojDNQX
	UyNSuyRLmW+Pi+uCJe/IH5wg5kIYlnxTtRLAUPaYkkv9Lw3+LAU+SKBrh1cMw38Hbn8gyDP3EZg
	UK1Jf1xejEej9thrZUFb0ZJQmKquHsyxVFE3yMeMmxQ/I4pCYF911u4sCGd+mgF0QvlgUSIFm4g
	2wuN42Ja4zdE/K5ndTafnN2M2nHLikXnMrnaQEk1JrBS3c4CXnlDyPwBcJBa6NB9l5J0yw+lOiT
	OKmbUILnR7asAmAqGco010hgmvfBw17VevVAQUJqW6O1qoi2mxJeogxajNlgvsQdpHQT91LZOD2
	kkr20KnhUHtFWeDdw==
X-Received: by 2002:a05:600c:a30b:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-488fb750a2bmr435746585e9.10.1777302255373;
        Mon, 27 Apr 2026 08:04:15 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:14 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:09 +0000
Subject: [PATCH v2 4/6] firmware: samsung: acpm: Fix memory ordering race
 in RX path
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-4-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=2809;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=m/tO5SKZlsZv2lDCNDVLmgGJxhoMZAGNBisteBM84SY=;
 b=5E5ST4vkspz2pIaYKwMEQIblGJZBWV/PhVFqy7dQxYqnohf57zk5thyo0lnNMquWf8nB01W4p
 JkoNrnwDadEBiGfuVEy/6Jd1w3UB0St5O12XXnW1CVE5X7T8uoO6Tlh
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified a memory ordering race in RX path [1].

When draining the RX queue or reading saved responses, the driver uses
clear_bit() to release the sequence number back to the available pool.
However, on weakly ordered architectures like ARM64, clear_bit() does
not provide implicit memory barriers.

This allows the CPU to reorder instructions, making the cleared bit
globally visible before the preceding memory operations (memcpy() or
__ioread32_copy()) have completed. If a concurrent thread allocates the
newly freed sequence number, it can execute acpm_prepare_xfer() and
zero out the buffer via memset() while the RX thread is still actively
reading from it, leading to silent data corruption.

Fix this by replacing clear_bit() with clear_bit_unlock() across the
RX path. This provides release semantics, guaranteeing that all prior
memory reads and writes are fully completed and visible before the
sequence number is marked as free.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index bd0d48e9d157..c9aa79c2faa4 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -7,7 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
@@ -206,7 +206,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 
 	if (rx_seqnum == tx_seqnum) {
 		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
-		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
+		clear_bit_unlock(rx_seqnum - 1, achan->bitmap_seqnum);
 	}
 }
 
@@ -260,7 +260,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
-				clear_bit(seqnum, achan->bitmap_seqnum);
+				clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 			} else {
 				/*
 				 * The RX data corresponds to another request.
@@ -272,7 +272,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 						rx_data->rxcnt);
 			}
 		} else {
-			clear_bit(seqnum, achan->bitmap_seqnum);
+			clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 		}
 
 		i = (i + 1) % achan->qlen;

-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog

