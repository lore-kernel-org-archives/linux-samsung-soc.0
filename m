Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE931261368
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Mar 2025 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742830458; cv=none; b=hmC3ek/40LLOx0DLVmDIdBBFZNWV48DlVsyGDjy2ay5fl5tJ6R6/CBnF8LZlkK2AzlX3EvifyPzxI8b9RIjoJOKJxNjAvTQfymVfjVrqv9/2AtaUBaFsl6wLmKpB4g/J0wXt4NOTvY14BbSPjL4FJhPB0yfZzhmsvD3Lq0+mkGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742830458; c=relaxed/simple;
	bh=BbaRiEVNhHM1RZ2ZnJzY8WLo+QoHvZrXazGZXzvdN9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcLDWnZsz6WTe2iqR/+dlKz2izHf/QC/WxEtnDVwqjPFm1Fk3jf0lAHTbJ3AKBEg4PVldxad7XcH3VL2Qj49XNSYVvg3nAzHAw6qJk6rOHDTOGkVBi1q3NpQEWpc6tKit67UY9DDrOmHB34lDNKuSl3eqMjab8Bn7mLJOkERjtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fqV/Y7gl; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqV/Y7gl"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso3750766b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Mar 2025 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742830454; x=1743435254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRWYwpfb+Qm0/LZ29AYhcqtDsg2o5q/MxVz554Yo+yk=;
        b=fqV/Y7gl3A+nzJWgWVFe+IEhaRydBSbnkZJDpGei4Pey4zmcC6pUD02drg8L7T22ex
         Y0mMrBGgvwpbPz/Wmcrz00DrIuzyNBIUN6IEcorfwV2wqi+pd0k2pq14BxnEtS/8FKow
         PcZonkZPmIYwtwnrousKhUnZuseHLfPjvUXsqZHsEoNjYbhli087vTcZHRIoFJ578G2T
         PtRZSuinelSo8F+nQ+iS9hXI5K/vcnUf0zhXMF3k1uM4odr0at2iwOoEvAPZwGZvVLHp
         RACi+X9twz72VX2vud3sP+OeEmEtH9p82HCoJSzhnKzpN24ogQS9ymcWjvqqVR+B9KKQ
         xMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742830454; x=1743435254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRWYwpfb+Qm0/LZ29AYhcqtDsg2o5q/MxVz554Yo+yk=;
        b=jKFJepF7fo41vHNKFeJHhSx+GXSDLWL8n+YCnZvlaoTYk4CgHNrWuOHtU6Czq4u3BP
         ZswNVzhL9Z81p31G+WXIFhN73CxNLuAuE5h6McQ8Ax6qjbQOchaJNnUhbElMTSjO/lcK
         3pPYXhaBZWOOSoAZgm3mENXffizheUfDEJwjEvfy6LW+D52GeMDlJjtp7NPC26ZonX1X
         jsjdmG3GLTaQ0gd8mKbJUgfHfa+bSFSI2+UB2Kx0s79xR+Wpo5yVDwAk1pKA94d1DUPW
         nBan7harJi44tzMa6WQ8VKnpjKklIMdEvqaGJ0ccsIvOUrkAD+21AiBeepohuis5a0Qg
         1/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoQWJT/Hb9TlXlCoIaq5Ugs7bl2uUsAyD8fSEKqO2ecIp1OrDTDqWsddvUEqvtyoi3JXHSSeyrTRSowhgijTim5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRikxKgJY9KLJ2c0WMx/d+pi4eSJILAXYqpux5Yvw2rWIq/RqR
	hYnFYmOegvIcz5a9uaooZA8Tx+tSxD8FZb/r2XVONAMNSxgP0Lwa/DGhIZy8gxQ=
X-Gm-Gg: ASbGncup5cSdFcJ6eOmHUYrdgSiObYfh2381TMS4bONAQlT+iodIYBJfGq39pBif3Ay
	1yMG6GsNYC9b/GY4zrcZeRcX1qcDCrnEqjeEhPGq3txxcPq588IiKqDDaEy45JJEbCceMblbkUP
	HClMMwMS23eUj/KAknlBeRkhxGDkSfm6VdrR9MwuBQFjOO8eHW/moCrQOWTEe5k+gdotrrbbmXa
	2KQFuZerhUA9m1C60HQH+dcS683XZZfSItuVV96jk4ypULH3jtG7508k4J8VKO0B16PBo1YWofE
	pqbsFenDYvylpacGVpzclP342EOPzLqhfWj9IgjNhah22TdwBBI6jR3mPHS7PYhlrOpnMs/bK0M
	kKuix4GIyMEzv6JJDUuCfQcjF/iPz
X-Google-Smtp-Source: AGHT+IFWUzpGuHqazl0dpTOmipY8A50S66wW8ZDj1rQKEydjpZVDbROVxeCvHwm+5oYARuqtOVEg6A==
X-Received: by 2002:a17:907:3f9b:b0:ac2:63a9:df0b with SMTP id a640c23a62f3a-ac3f251f206mr1143189666b.35.1742830453945;
        Mon, 24 Mar 2025 08:34:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm690219466b.31.2025.03.24.08.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:34:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 24 Mar 2025 15:34:10 +0000
Subject: [PATCH v2 2/2] firmware: exynos-acpm: allow use during system
 shutdown
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250324-acpm-atomic-v2-2-7d87746e1765@linaro.org>
References: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
In-Reply-To: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

We need to access the PMIC during late system shutdown and at that time
we are not allowed to sleep anymore.

To make this case work, detect this condition and use busy waiting via
udelay() instead of usleep_range() in that situation.

The code isn't switched over to udelay() unconditionally so as to not
waste resources during normal operation. acpm_may_sleep() was heavily
inspired by the I2C subsystem's i2c_in_atomic_xfer_mode().

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
udelay(10) causes a checkpatch warning (it suggests to use
usleep_range() instead for usec >= 10), but that's exactly what we can
not do.
Reducing the udelay to be smaller will generally cause the loop to be
iterated more than once, which I wanted to avoid.
I could reflow the code to hide the actual value from checkpatch, e.g.
with the help of a local variable if that is preferred to ignoring the
checkpatch warning.
---
 drivers/firmware/samsung/exynos-acpm.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 542eaff03f9e39422a8c5345ca75e05c1710a9ee..4f65f7ef39b5fdbf5bb10f6ee9ffb78c5e34d8b2 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -15,6 +15,8 @@
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/irqflags.h>
+#include <linux/kernel.h>
 #include <linux/ktime.h>
 #include <linux/mailbox/exynos-message.h>
 #include <linux/mailbox_client.h>
@@ -25,6 +27,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/preempt.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
@@ -273,6 +276,17 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 	return 0;
 }
 
+/*
+ * When ACPM transfers happen very late, e.g. to access a PMIC when powering
+ * down, we can not sleep. We do want to sleep in the normal case, though, to
+ * avoid wasting CPU cycles!
+ */
+static bool acpm_may_sleep(void)
+{
+	return system_state <= SYSTEM_RUNNING ||
+		(IS_ENABLED(CONFIG_PREEMPT_COUNT) ? preemptible() : !irqs_disabled());
+}
+
 /**
  * acpm_dequeue_by_polling() - RX dequeue by polling.
  * @achan:	ACPM channel info.
@@ -300,7 +314,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 			return 0;
 
 		/* Determined experimentally. */
-		usleep_range(20, 30);
+		if (!acpm_may_sleep())
+			udelay(10);
+		else
+			usleep_range(20, 30);
 	} while (ktime_before(ktime_get(), timeout));
 
 	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",

-- 
2.49.0.395.g12beb8f557-goog

