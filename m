Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35487289824
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jun 2025 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222200; cv=none; b=JoRYdnq4mUL5nvo/baMw8vc1SgCp3zOH34zYdpI7q7YQ86VHRPfzpIBrAWrbCVyACHffD6th2LIa133Xo5ZfUSaAIpv+rNYhwZUbStTQVYxdDaE36cfOw6FBPkEAKBdMmsMXCzAudk8Idc1zbHXMQTHbMjopSF2kQIhFNSTkre8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222200; c=relaxed/simple;
	bh=8hBWejyp6d3TxDVLSnvfJrpHg53/OBQTJQ3IoXt6F80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kptqh8ceIKBSpZhmNMqubxPuOP4FrZpmdPsM/o2N8Z24KGjXeutEWp1gwNvtYIHiNcHLCPkQ8dQOWBF56VMop4J90r055PNNP3IbQGnndujtNyWBnU75gNrwz70tYxT57ilXTKg9AQ4g17kmFyeEy5CVExfk02qgdDBGnxZmTS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0TfzwoK; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0TfzwoK"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acacb8743a7so375837866b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2025 08:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222195; x=1749826995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5o+Jwofv+O6NsaE5r2rO6FVmX4rnlZXl8n1NzB2gfs=;
        b=y0TfzwoK2KgKRpYRirJwxoPtYOAl2zfWMOTZgixEtSfwbTgu8oSFxhIH5uoYUDdUIT
         l1+Y9bEOG5c6UB95nVVgbbMnAszGAYoFZOUwPcSo18B8HON86KmkagUJJyrJnqSguc+j
         zNPp5Gwq4+sVgxwVIgTAs1ez5GlwWcBrysF0WiqpwqE809J1NvXoc9LsUH2s+POGLLto
         rHaPo2bJEeW0qScOfG2LwY19tn+F6lE0WqQqsR6vUXckQtQecNff1KotXiA6IXrq/pa7
         YwiVJDD+KOKt5SNi5LcpM2RXiYOu8/eVl/7abCOeYpHOaO97e4sLsAIlsv1U7SZKrRqP
         6Smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222195; x=1749826995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5o+Jwofv+O6NsaE5r2rO6FVmX4rnlZXl8n1NzB2gfs=;
        b=KhDSybSQnp7fhIhJuz1ZlCnhD/PO5E1DSuK5wS85DzPF+OhMYf7Gb8SP2NWnfxyF7y
         cq+PU5peYsgA1QCfgfKoaJWCwW4x2IFtdTgot0ZsjQcdTPbCdSrdq0SnR+Y8R6bLDcYg
         PpIEfN5HAl5r1pyjg7khkq+BpezTSsMkyTZeTKElzjXSYKFlAp+vHjyMseiRpUTaDWje
         QDL7lwHRvq+48bMpKANkQ+xkhsmyfvIVPtL+2G+gKnCnn9qH0BFYC1rv83bdY52FtSXs
         JwQvBWef5dIwwJ6sRliJwMGO66Ch/a/RRcW7y1h3a++a6RodStPUOhm0PSLX5tHhPMa/
         A8xg==
X-Forwarded-Encrypted: i=1; AJvYcCUgSgMuHLfUc7OK6B4kJesD+DNe/JLVsMzzHNDnY5/Zf5YXqal+xXW/s/0Fzkm0X+Ic48i+M0ubmEGkcbFh5L+t4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe73b2EJoOatFIGyZ2VWaFWdTXFR5XJQhfS14LOyVeE3ChkMpw
	NhF+lsweVpr1ZEUYv+INKnRrPv90SyTdrh7pcYwwbIt89b/PvuTztAg+5s4BTaYRrpA=
X-Gm-Gg: ASbGncvTiDY6WCiByDtNQirTY8VbbXgBJcd8vApS8FH4B5unbltnxSqF/Xz6WcoDvpk
	/LRkL39VXImbfgHRMBtbxpPNLO0tm5sV69tMph2zZs260ZILUn30wG0CSs1HNntDujrsBi275OT
	GgK9yu9Kz3QTlXgJlQeMpwsztLcCxDtCdXku6ijMKzi4YRW8tnmsh+il36RCR0DlUSn4fwnmzBM
	kdS/FWmVy9POUO0PptKlcXc5sMrWVxAn9BoLeJU4ACSKXECvAjvXwjg8mV/gRlmclqf2rOaVeSD
	FrOrLaoRi6yeYGNmb8pn0tfRA6+v+AhoivQgUgPcJpEzQ9Qr3mU2SytXPpPUsyBlxjkjzGC2EfR
	yzFJjtgr6WZRTj//x9VhTnO7rTW2/6iN+I56y5UwDd8xNqQ==
X-Google-Smtp-Source: AGHT+IFSVbkX5a/4o2KAe1Uk19F/3cil9Il8krcQUMRLrfjoeTE792Rwh1ewllGslz419fdT8y8DaQ==
X-Received: by 2002:a17:907:db16:b0:ad5:5a7e:bcd with SMTP id a640c23a62f3a-ade07606aedmr768199366b.8.1749222195317;
        Fri, 06 Jun 2025 08:03:15 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:14 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:03 +0100
Subject: [PATCH v2 07/17] mfd: sec-common: Instantiate s2mpg10 bucks and
 ldos separately
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-7-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Bucks can conceivably be used as supplies for LDOs, which means we need
to instantiate them separately from each other so that the supply-
consumer links can be resolved successfully at probe time.

By doing so, the kernel will defer and retry instantiating the LDOs
once BUCKs have been created while without this change, it can be
impossible to mark BUCKs as LDO supplies. This becomes particularly
an issue with the upcoming support for the S2MPG11 PMIC, where
typically certain S2MPG10/11 buck rails supply certain S2MGP11/10 LDO
rails.

The platform_device's ::id field is used to inform the regulator driver
which type of regulators (buck or ldo) to instantiate.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- fix commit message typos: s2mp1 -> s2mpg1
---
 drivers/mfd/sec-common.c            | 4 +++-
 include/linux/mfd/samsung/s2mpg10.h | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 42d55e70e34c8d7cd68cddaecc88017e259365b4..8a1694c6ed8708397a51ebd4a49c22387d7e3495 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -14,6 +14,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/module.h>
@@ -35,7 +36,8 @@ static const struct mfd_cell s2dos05_devs[] = {
 
 static const struct mfd_cell s2mpg10_devs[] = {
 	MFD_CELL_NAME("s2mpg10-meter"),
-	MFD_CELL_NAME("s2mpg10-regulator"),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_BUCKS),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_LDOS),
 	MFD_CELL_NAME("s2mpg10-rtc"),
 	MFD_CELL_OF("s2mpg10-clk", NULL, NULL, 0, 0, "samsung,s2mpg10-clk"),
 	MFD_CELL_OF("s2mpg10-gpio", NULL, NULL, 0, 0, "samsung,s2mpg10-gpio"),
diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/samsung/s2mpg10.h
index 9f5919b89a3c286bf1cd6b3ef0e74bc993bff01a..3e8bc65078472518c5e77f8bd199ee403eda18ea 100644
--- a/include/linux/mfd/samsung/s2mpg10.h
+++ b/include/linux/mfd/samsung/s2mpg10.h
@@ -8,6 +8,11 @@
 #ifndef __LINUX_MFD_S2MPG10_H
 #define __LINUX_MFD_S2MPG10_H
 
+enum s2mpg10_regulator_mfd_cell_id {
+	S2MPG10_REGULATOR_CELL_ID_BUCKS = 1,
+	S2MPG10_REGULATOR_CELL_ID_LDOS = 2,
+};
+
 /* Common registers (type 0x000) */
 enum s2mpg10_common_reg {
 	S2MPG10_COMMON_CHIPID,

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

