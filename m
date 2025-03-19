Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E1920C488
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 05:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742362710; cv=none; b=CfBsS9a4Hg001RpV1p001kx/DFQlAS8WS4l6Pz/vvxS2bHjCE1a1vtj8scBVngFBqFZ8dlmCXwTdQRN0KZQEOs6pA5zYX31Rxz4aqekxsT6+pRfbULoViJV0o6JcXwtWWXNpC9zh4R4WJmZGnuCrDRbijLdJSTY+GkofPvEc11M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742362710; c=relaxed/simple;
	bh=4727X8BB/UFkI7GNXf3VvnzSOro/EFeFrwgWraWKOgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRT2CNkWWfxEXIIaRv/R173lH6JzUTN/TIYZABnfRXSZREgeFqQ9Ymk+m04R9Ga7unVWdB8FGOpSs50FgVoPSmYiO1yUg+8XNbhcfXgcgHTt08IkqHHRz9KpkFYv+c2ZSSW51f549m3quI4D5yACjG7R4KaN7quQHmLkmdZIqf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HP6KktEG; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HP6KktEG"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so11696407a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 22:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742362706; x=1742967506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgsA375lt/C9JoBeIh+flIPjgZNxw7BBlg6E3CmnWA0=;
        b=HP6KktEGg5C7n2V/yeTszAb55E+MRiCKkujWvSVAx1Zc6DiYTt61M5XrxgIWoBUrpJ
         JE4GVIQ++l/L0KcRlmFhz9dG8V4XRjhVQiPSRCVvvuI0ul8RN+0uqYhbhyxMUopkFdbx
         bGpgIkrAsHP5edueU4oPuyHhVxs1HCebm5BIdspBPgmyhX0lYoFirRHf4SIl5IPgdKDu
         RJXbOuNVR6Z20Lx+ST2KdLvMOr6UyUxHJq+laj9y3UutSSZSUBJjQhRyyNr8fPkLrlLa
         2/Djje/B6f7/Rqj+mJoRJv5qxy4nWL4DLJOBbtEWG5a9WdFDWvET/avPrQzOq9fxN5/W
         C5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742362706; x=1742967506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgsA375lt/C9JoBeIh+flIPjgZNxw7BBlg6E3CmnWA0=;
        b=M9uLoYSBblDqaw7a1mY3EVMq60FBbj7XeDLrHu5E9MGw3ugKFdnTkZR/5lxnDajJVI
         rMZu7jyZqzb9OcKdcCmvW/XEwHmbivTLCcZq7+mX1uEGXwfN/sPPMXRwGZX0k+ugYjy/
         OJn2ESdt/uHk8TRBjB7dLyTC9bd8COclfXp4NVfiCz5w0rWx9oLkf/3NXld74dl9+Szw
         PRkbUV+/OW98vrUaiKtQ9J0Mb3FROY5JRrjxTRleo6m2vpqLB2dN7hGNFuqhuoxs7IbR
         IY7yOsw10G1dvhRkWXcX1JeO1AyI9l6vwXeDWbclarm+YXu+xuHjYPuwCRPbfPQ3kUuG
         DbZA==
X-Forwarded-Encrypted: i=1; AJvYcCUnim+4sYhNyyVCc70zHc36b6ts4bREY8vctPCxN8s2SyWHpHJIj9kzP5/3I9Ia/SdAA2KT9axpzgBdRnn2zVkSTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdguehS7HJM7klqAMFh2YyGgwJdURFntj5SmFu9Q2fwA711xJ7
	M+zpF31DphoC5aJmFe5g25Yigg49MRNLZZ13IKJ4Sdo90DbMLwOS8Pb+jVJow+A=
X-Gm-Gg: ASbGnctRhEs1MfC70vtBDcOSMqBZhRZN5lqGhu8n9nTiK2or+I3IMd0xxgPjcUfoSCo
	Oz7jPDpBHjEKN5P0IFVO3+UYpUzopX80jKt8vzS5/sGTeXtMugErO7KYBaVr1fwzawWXVoZl9sH
	bltO0iXbJN8Zb+KNH/FuPiJ5CCEvmSZeQ5hqJAc50by3gBheuh9rpm0y8kzLychnIncoeCSTUmb
	qqh0oTznk/XjHrs/icG3F08fZ4ifetiD3h6dy8lg/BtKOxWQFclbApWthcwkQXH3C2+WevilCyu
	ZWK560//BXUb+uOCSc1mxtNVcDNtmCL4PxTEsIFJ3eeuGVyVXZlSGgL1iTtCo+mSs0zLbYlEhLF
	S4tzvXhbHHCxhQDGnfADUFUpShBWe
X-Google-Smtp-Source: AGHT+IG3tuVguXn8VMgCu6sKWPV/ocanlmbBg3hUDHZimmGHiNDmeLkru9JZ3Nv+KSAa/KV/eaCfAw==
X-Received: by 2002:a05:6402:35d3:b0:5e7:8be5:d189 with SMTP id 4fb4d7f45d1cf-5eb80ca9ce2mr1398560a12.4.1742362705701;
        Tue, 18 Mar 2025 22:38:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e6d4sm8511817a12.9.2025.03.18.22.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 22:38:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 19 Mar 2025 05:38:23 +0000
Subject: [PATCH v2 1/2] firmware: exynos-acpm: fix reading longer results
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250319-acpm-fixes-v2-1-ac2c1bcf322b@linaro.org>
References: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
In-Reply-To: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

ACPM commands that return more than 8 bytes currently don't work
correctly, as this driver ignores any such returned bytes.

This is evident in at least acpm_pmic_bulk_read(), where up to 8
registers can be read back and those 8 register values are placed
starting at &xfer->rxd[8].

The reason is that xfter->rxlen is initialized with the size of a
pointer (8 bytes), rather than the size of the byte array that pointer
points to (16 bytes)

Update the code such that we set the number of bytes expected to be the
size of the rx buffer.

Note1: While different commands have different lengths rx buffers, we
have to specify the same length for all rx buffers since acpm_get_rx()
assumes they're all the same length.

Note2: The different commands also have different lengths tx buffers,
but before switching the code to use the minimum possible length, some
more testing would have to be done to ensure this works correctly in
all situations. It seems wiser to just apply this fix here without
additional logic changes for now.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
issue is in linux-next only afaics at this stage, as driver is not
merged into Linus' tree yet
---
 drivers/firmware/samsung/exynos-acpm-pmic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 85e90d236da21ed76f7adba59caec165138ad313..39b33a356ebd240506b6390163229a70a2d1fe68 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -43,13 +43,13 @@ static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
 	return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
 }
 
-static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd,
+static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 			       unsigned int acpm_chan_id)
 {
 	xfer->txd = cmd;
 	xfer->rxd = cmd;
-	xfer->txlen = sizeof(cmd);
-	xfer->rxlen = sizeof(cmd);
+	xfer->txlen = cmdlen;
+	xfer->rxlen = cmdlen;
 	xfer->acpm_chan_id = acpm_chan_id;
 }
 
@@ -71,7 +71,7 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -104,7 +104,7 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -144,7 +144,7 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -184,7 +184,7 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -214,7 +214,7 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)

-- 
2.49.0.rc1.451.g8f38331e32-goog

