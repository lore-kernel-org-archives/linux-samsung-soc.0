Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4043B22D7B9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742575285; cv=none; b=A3lMPrUJ+Cy5XbDa7c95YxlNqxZCu7cwmYdswuxD5SpzUfkg6S1VPX/RrGaT6TSqWVze1duQCR0pPM1xum/03WjsAZsVXdImm/bhmdyRRsjRlHmjUdngBn8INxLtpduVhGsHXv33JY0catla4l1FoiYqkCC7mDE3e4JI15Tado8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742575285; c=relaxed/simple;
	bh=Pws08LvMbXyIYXHBhhgM7dOJmvCHCz3WGZZhXE7y8N8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7JnVbEB0q2RBKwSuQgZi0l+2aMEFIbLkgS78n7YyC5qG793QAbm/xXUsCEItmadzbtlIKnAGGZUugAgXASTGOWXXSNAi1TcbKVgHLEkHvzcKEkwfD72HBhJrC1GKwSvDNJA66T4MoZvzLhhK5OplT3IkhdsZpT+gfZkqjVqzMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWHFaHSd; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWHFaHSd"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac29fd22163so395414166b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 09:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575281; x=1743180081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgqqVRk8zgVEKC8aOnJN2NYUg3kMqPomNQlkiSAg/5E=;
        b=CWHFaHSdsZjmt6BWVhoeGM+/dVvsaDBWbfJUOlGjb8aizJk3QiTkhIjOuDwkkm7tkv
         H1PV7TWQlYhsDSPEolg3j0KQr21wCROSKdd8JEsMSEkoouYsE6xDmqIw8DRCHy8Apifw
         LmVYgSI0XFvCc4OX5enFHMPwaCec7yjPlPX/jGb74CfSGx5Q5c2zAO4b40QQ73rusABa
         bvRRz4gU7pili3KbC94fFkEkw99Haj/fcvkQj87W//8wo+Hxhc5JQMkaq+Cenz3eaADP
         Y/QUwXYEqKyXHPa7kBaQIEIhwnWXlvSB0jrjQMCBDYSPdtXSn2DEJer8TwfaPi54wFW3
         53VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575281; x=1743180081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgqqVRk8zgVEKC8aOnJN2NYUg3kMqPomNQlkiSAg/5E=;
        b=Crmr7Ypp89NEtQwZScsNlZvEWybHQ4VSzO3lJYXIyS9DdeMCm/BkvPpBLlENNIU/N3
         SpRpFmyG3ezYuImTCZWRAnsFUGBqducBm8DdFszdXobSxdadu7fhMi/zKSt3LSKUqlmn
         MHO0Z2t6IrUwWTcFrg3HvdBS1ktE/ry2/GS/5Xk2CK+9sS2r1U7SfvN8j2qdZQaDd8CY
         AVA/hRzqZ8B83FIXnzHMxoHphsdvlE7bWvC0n/v57JMNn4sVfUF1ebDoHRbMEUvgK8hv
         qijls4HxQfRZu5DV/xs5TWWee/6f+aVbJLqId3ko5CUetnbxWIGdLJx61xj2+DmhSugJ
         d3GA==
X-Forwarded-Encrypted: i=1; AJvYcCWuJwI7ruEdUprMC0/uZTZtI64+xqsNfUPUJnnjd7ptFMUXOyu0QlsPSck/k3tjmSIHed45LMgmZ+cLkPfQbbAliA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNx5xIl4zp3tSCW8GOLA6QDE0rZ018BkxL9cOfZUUPTbv11Ux
	ZChNFc1lZ/+ZJRCqBgRe7K9pfDsC27n4PST2lg7S79V3RynXG0gOoYDEBhUK2UknPuacm47m7Vs
	Xhto=
X-Gm-Gg: ASbGncuMsDbP7dLmQsbHfvc1GR7ByloP04EGWp8T1fxDKehdde11l4fx6Z57vjeeIk7
	cWLxgA5Q6ZXX4itsppjOvDFCUa0GIcweJiZgftsQLz+8WjeaIFZMOtuZwcD41yGLuQIXTSMWkNb
	T5mc4SIZmyfw4+uDMjCDxZcrtvUssYFek6mwQy3FDZ6qTcwtRvvN0XsMWOf+IJ8ftlzmj9QIq+o
	v+JVW8rgMVOG25vK11QHIWfm0xCL+r/elAD5bSdf6VCNe3UX1a7ZzC4hJsVnyA97Shele5Ze9lm
	e9GSWuJMpO4RALY4hjk6VhxqTR1HeWUDMW1haFn1grev24b/gJv9PbDwZpPeiJ6YZSPROQMMjLR
	vWj4GR2iTPQkpAITzFSa+9/UNOLF4
X-Google-Smtp-Source: AGHT+IECXlewiRNaZcsT7VByFGLy8wa/hYDpGmKSUjf1tAtN9CwCl6c2v3o8DCAfvXOp8IgGjxsCNw==
X-Received: by 2002:a17:907:3fa3:b0:ac2:758f:9814 with SMTP id a640c23a62f3a-ac3f211101emr418514966b.23.1742575281409;
        Fri, 21 Mar 2025 09:41:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbdc78esm184015666b.134.2025.03.21.09.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:41:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 21 Mar 2025 16:40:58 +0000
Subject: [PATCH 2/2] firmware: exynos-acpm: allow use during system
 shutdown
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-acpm-atomic-v1-2-fb887bde7e61@linaro.org>
References: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
In-Reply-To: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
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
index d7ed6b77a957af5db5beba7deecce13ac7b30fd2..33cde6e88e2c0773fdd36c80927c77d3bcb44135 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -15,6 +15,8 @@
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/irqflags.h>
+#include <linux/kernel.h>
 #include <linux/mailbox/exynos-message.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
@@ -24,6 +26,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/preempt.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
@@ -272,6 +275,17 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
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
@@ -299,7 +313,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 			return 0;
 
 		/* Determined experimentally. */
-		usleep_range(20, 30);
+		if (!acpm_may_sleep())
+			udelay(10);
+		else
+			usleep_range(20, 30);
 	} while (!ktime_after(ktime_get(), timeout));
 
 	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",

-- 
2.49.0.395.g12beb8f557-goog

