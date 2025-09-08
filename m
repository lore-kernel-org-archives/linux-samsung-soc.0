Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9793054D9
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Sep 2025 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757340130; cv=none; b=sy6P7mtZ5iPBr50YmYitTNWtWytFFExLPItjuxC8FAeZeUnOKAXUHLgh3yYom1iVZ6TXqioTcSR5v2o2WS3fJLy4d4inE8xH411rdf8aIUhmRPckXKU5cf50+QyODQ8ZXWXbNZSm+omc5hBTjMYunMkuidqzYBkAVeoGm2Xj79k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757340130; c=relaxed/simple;
	bh=UPzFrmYlehQ67lOfCOXqNsyB4OmdijU+Qi/kEZAQkKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pov+CaLXWZPNTmDLTE6bTg9nRu9fYHuxqjaWznN7aYJgne3aHwP3sjWAElQ87zfsJBkwc75J7kP0/qD/3AyJL0zt9FDDdMGR2GgkHAMe52uNVxalaZNzwVHB02aKe6X4eVkzo5NoeLs59uaUvvP1MksLgXbPLkpKZJQ2ed1QcYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M+u6bYE0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M+u6bYE0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45de1e6d76fso14932115e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2025 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757340126; x=1757944926; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5RQZ/QOE9TZDV7pIc1NrwTekYlZsnd5jalWbAXr12tY=;
        b=M+u6bYE0J+wcICA4RCJ7EDuNmHHYT/O4ApFrYIGqBL0xDpZA5qKldcEnMnUPVPbI3p
         KzSoo6HNmXF2L0+lm4DaOhMg/yB8+842lrEEoJ1EIjkxrsnXL6Z+TFjoNPjo8XZJDlZq
         e6/DkfmE0yqMglJarqxZn8foV5sxv9lCkf9nhQdLPEYlUYC8dgkNlnXGjzo5Np7U0jsU
         5SLMmucJYhs37EZbmIBp1AbBxz4bNgULaUrQ8e7boCIxQEuLkHDqgz4aMgGP5IEA9vHx
         QfKbM0vwVNQS0Dif1zNWQcuiod9TCaO+Lxddvq4ubP+FdHMA+D5Oip2FL1ad5rKuA6G7
         UaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757340126; x=1757944926;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RQZ/QOE9TZDV7pIc1NrwTekYlZsnd5jalWbAXr12tY=;
        b=KuZZ1jAaUmOBCRaE2UhsEOzxtF38W+1yqPIADLahKhxfVIGNGkNrMscObs2rpg9zAe
         9By84mJDFxRVbfyu2HDfiz1KnXqfJ1xP7au4wI5OlwEb07ny6NEIq/dJT/n7ocSKUmZy
         eGBFnFZNef7gpuislwR2hoQ3jyLTasAzND964Qd4v7sLkcMtdvPhQCvcjginuJIxAY0+
         pg0L1JF+hi1aKS5qHTQjVw8owMoxLWIZe3sQ4bHdu82Mjfc6zuGciWRK2CSmsRVs9STK
         R17NhXrIjxlYKqscSmTTaN8lmNIo3qyui2BkcMD/yqi7fq3o1hlhicu6eZQW7yZMB7Qs
         +IIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVpPaoFcsUOaBcu+E+nHiI1/lIPDS11MBp9vIrVePQbbQf4eHEkCflh5Q0InlNjT3Zui8tyAQ964RU+GSHnhGbNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMsVBospUaQhEadl9tr1g3genTPb4VkZEBLcS3Ingr2squTGLR
	JC5t96LZtFJwRw9sWd8MklQLzoEKhzjzOT2Vhd4WCa+pYkflTQKWalXhS2AhR0kvPfk=
X-Gm-Gg: ASbGncu7PSbh5VGzafwbplRxLPW/yz6ROfKpmspKblefu4QdGMJMAybllFfw9+j+Q9l
	K05XpVA7YA+t/ZYk+MS5xBA6AeiCQA8XV2H+p5CM1orCZvgTBEkICb9fqiYXX29R1Il2f8htHS5
	u/dfent7sqJepz3O3Lp33qXCtFbawL0OJSvOKNlXQOm891vIj7AO2BlqYZxyNzg9QyKlKm2//JG
	acIqo9L2cTNHCBHoL7SlT4kbD4pXBBwRH/qH3EjybKy7zxec8UpKPe2tIuYWCOibwtsg+yura41
	l45QzBQXO0QPJ5pdTHwzwk0/ppJx0aHtnfm8XwZqrc/9A7nDEC50SkygG/Q/TZq+OAqiEvWIvyZ
	PqOkbCPu++q7e2qyUOdUUteWziE4DgxcK4zVuUtzRfhpigoS6HHxSzDxkZ2oK8oq3WdylAZvJrg
	tvtb6lcOYJOkNTVHrfNArrB1o=
X-Google-Smtp-Source: AGHT+IGzcGQ+F2OqmZfoK8PvEKQf84hVehr3slGK6Le4o9R+uV9RGVF4+iDIn2UYKe3BWKulhajCOg==
X-Received: by 2002:a05:6000:2f87:b0:3e4:a51e:5d0d with SMTP id ffacd0b85a97d-3e641e3aaabmr5830362f8f.1.1757340124783;
        Mon, 08 Sep 2025 07:02:04 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276d5e5fsm42013031f8f.27.2025.09.08.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 07:02:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 08 Sep 2025 14:02:00 +0000
Subject: [PATCH v2] firmware: exynos-acpm: fix PMIC returned errno
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-acpm-pmix-fix-errno-v2-1-bcc537cf3f17@linaro.org>
X-B4-Tracking: v=1; b=H4sIANfhvmgC/22NQQ6CQAxFr0K6toYOAuLKexgWA1RoIjOkY4iGz
 N0dSdy56OL9n/+6QWAVDnDJNlBeJYh3Ccwhg36ybmSUITGY3JT52eRo+2XGZZYX3tOxqvPYmK7
 giqkeqIO0XJRTuVtvbeJJwtPre3+y0jf9+eivbyUkrGuyZVM1hTn114c4q/7odYQ2xvgBemn44
 bcAAAA=
X-Change-ID: 20250820-acpm-pmix-fix-errno-92b3e6e17d1b
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757340123; l=3824;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=UPzFrmYlehQ67lOfCOXqNsyB4OmdijU+Qi/kEZAQkKQ=;
 b=sef6R5CI8KayC5IctCl4Gh9igxFmkW38rf9t41t2Ip8vfbeaJX4QKiwtWpHjWvLTVGRyOqsVd
 gXz+n3EAdEsCW05os9o2JYGiSLRvMXvrrWOYgPQ5wySZ7T7i5wZO7eQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

ACPM PMIC command handlers returned a u8 value when they should
have returned either zero or negative error codes.
Translate the APM PMIC errno to linux errno.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-input/aElHlTApXj-W_o1r@stanley.mountain/
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
- remove `enum acpm_pmic_error_codes`. use designated initializers in
  the array instead.
- constify acpm_pmic_linux_errmap
- drop inline from acpm_pmic_to_linux_errno
- s/errno/err
- Link to v1: https://lore.kernel.org/r/20250821-acpm-pmix-fix-errno-v1-1-771a5969324c@linaro.org
---
 drivers/firmware/samsung/exynos-acpm-pmic.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 39b33a356ebd240506b6390163229a70a2d1fe68..961d7599e4224ef6ebe64dfa2fcb441a4dbd78a3 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -4,7 +4,9 @@
  * Copyright 2020 Google LLC.
  * Copyright 2024 Linaro Ltd.
  */
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/errno.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/ktime.h>
 #include <linux/types.h>
@@ -33,6 +35,19 @@ enum exynos_acpm_pmic_func {
 	ACPM_PMIC_BULK_WRITE,
 };
 
+static const int acpm_pmic_linux_errmap[] = {
+	[0] = 0, /* ACPM_PMIC_SUCCESS */
+	[1] = -EACCES, /* Read register can't be accessed or issues to access it. */
+	[2] = -EACCES, /* Write register can't be accessed or issues to access it. */
+};
+
+static int acpm_pmic_to_linux_err(int err)
+{
+	if (err >= 0 && err < ARRAY_SIZE(acpm_pmic_linux_errmap))
+		return acpm_pmic_linux_errmap[err];
+	return -EIO;
+}
+
 static inline u32 acpm_pmic_set_bulk(u32 data, unsigned int i)
 {
 	return (data & ACPM_PMIC_BULK_MASK) << (ACPM_PMIC_BULK_SHIFT * i);
@@ -79,7 +94,7 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
 
 	*buf = FIELD_GET(ACPM_PMIC_VALUE, xfer.rxd[1]);
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_err(FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]));
 }
 
 static void acpm_pmic_init_bulk_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
@@ -110,7 +125,7 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	ret = FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	ret = acpm_pmic_to_linux_err(FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]));
 	if (ret)
 		return ret;
 
@@ -150,7 +165,7 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_err(FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]));
 }
 
 static void acpm_pmic_init_bulk_write_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
@@ -190,7 +205,7 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_err(FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]));
 }
 
 static void acpm_pmic_init_update_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
@@ -220,5 +235,5 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_err(FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]));
 }

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250820-acpm-pmix-fix-errno-92b3e6e17d1b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

