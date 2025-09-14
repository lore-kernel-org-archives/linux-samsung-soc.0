Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A352594B7
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853769; cv=none; b=ftFhzo/6i1nJtJ3xP6s0RqAeFrB9JKLitpywH/AGZa27O140j+OBH8OFLOMNI5Tf4DyfmuWc4OUQU5kxVmVAk8UiE/QWF1W5vKodT3HsnW7d8TR32raVoZP+HSSLe2Saig04yeyjHjg3Zu/uz8j7lRpE4BhH3ZAd5r9NXW6wSVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853769; c=relaxed/simple;
	bh=kyKrbyMlhOJaQK6nZpvShmo5GTsEoyiDjllRpRMHI4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1JhPwX1p3gzoCm4KekIha2J6lZ+6fP0NuHEp13aqD30lkItx3oAyy7NRF+vABNgqjoLT4rhrehVl0BNMxqr5Y8YSTkzvjsiz5fR7udC4PK0ve94Bhj8yQY33RNegO/m/4uPt9YdNQNfwyjfLq56ImDZTDjcEQbpWIQv7db1j4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMHoUSCu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMHoUSCu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3e92ce28278so654912f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 05:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853765; x=1758458565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOU9R2Lnh0tpNOjgfaBNBcfWHtUekf92OIAIJIxr5KA=;
        b=HMHoUSCuy6iJWUw/2/Nm9Pc/RlZEgb/FXtrbfDpCmK3g6xJVHCR4wJ7GnbdIntbzO5
         ufHoDltYZDf0V3VJib6ZRgggXqFrZWNKbU1065jzOwIZGzhwLl0w9e/c9uAf2lKbMVPC
         r7rDRWANoe+v+CxJ/++VZ3KUvu0XXyyqazBCHtBqa1lKzkV/9bEY0Mz0sXwy0t1R3zTZ
         yyWYaXB+Pb84FVwMvHkZaOB1qRyyLg+G0MTIyErG2Oq2WNlyZw4j1wr25+gtfD194BwI
         ZVZUi0fcCdbumoyGp6x3sxESKjR+Kw1nTU2ADg1KAvgsrCk2ptDNcx+gJHvtNnmuqxsL
         mbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853765; x=1758458565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOU9R2Lnh0tpNOjgfaBNBcfWHtUekf92OIAIJIxr5KA=;
        b=tZWEs9uAsM7vC2YW9oDt/UOiP0nRc8Wg1vOalNxVLmqM+0D4ujIvQBK1FSb03k9F+l
         xbTD6qkul6vqB7qgGPJ2+AlsdX9aufEerCRtKc1ii5WVFMJ+cxN+3xVNf46SSopWHgvZ
         NlCuNbR/M94O9NACK/qBL6colGcHPmp3EHq48lTBPryyvIDL0K3v14asFN4ThOAqcbAD
         O6c3k4bGqAc6rYCp7fXy4w2daQ5fLEBJTpd85r5ei/N5DckyAqXY6dkyXYFYIrWdEsJo
         Jhmuq0NLGoHPFr5s78s1hp8sU98PWbUANdhymSIPxJ+0/eK+HLkKYStES/mmllTtctPy
         QM4A==
X-Gm-Message-State: AOJu0Yy8s+rnii+3BbRNc9BZMFxPEq6eMY+8rqsYVumNAhKxAvBNiyas
	fTE5mR+rJa1TfdXwY1urbcdqFI8k6QH+bozhI9dxUG1j1rAgp0ERGHiG
X-Gm-Gg: ASbGnctuzD+iU7GqjYlN4K4u2px1azz8KtLzt8olOXJN39v/QQ6N5k4KT1dK5kx5yDl
	2ZHHwisAbLMTafueyYQc5i1LWP4sxlq5ReXl+mAPCxEwSwDMmZA6sdjAlBwJ/NGOAEw0tebX18J
	n0P5GHsznLZWd49s/EwPWyfSXXK1nrV0umRJhWorE5WoI40c2Bz1CdIx8RwQqomaTqSRNjOSvPP
	Jr/oSMHCY+VVOjnxXeinKILikbYMm8V9b8F/r4JHPgpYVn2JLP2Rp5O/BOxIzQjPRIWa/U3SdPB
	BgXpZikG6dvV7fx8jbMs7bNCtO6YkT7feaNu0wcCYjuJCm7yGDQjkAz752kZYA9Mzhw7FrF2Ij6
	YQQkB0CpcTz1/KvOLY18cWgfYNOdKNskn6rvGBuFs8ppTo3wB1Z+n8AyfAUFM7VZquL521+Mg9w
	==
X-Google-Smtp-Source: AGHT+IG99f1RlRObwRO3ZVgbqbD8FEXYcOCWgQZx2Y0pKAQ0TG8WDRZi1Xh0wpZoEZCKRmVP1u9ogg==
X-Received: by 2002:a5d:5f50:0:b0:3e9:d0a5:e436 with SMTP id ffacd0b85a97d-3e9d0a622f1mr1712381f8f.23.1757853765242;
        Sun, 14 Sep 2025 05:42:45 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:44 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] rtc: s5m: add support for S2MPS16 RTC
Date: Sun, 14 Sep 2025 15:42:26 +0300
Message-ID: <20250914124227.2619925-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Samsung's S2MPS16 PMIC RTC, which has pretty much
identical functionality to the existing S2MPS15 support, with the
difference being the ST2 register.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/rtc/rtc-s5m.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index a7220b4d0..910248731 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/rtc.h>
 #include <linux/mfd/samsung/s2mps14.h>
+#include <linux/mfd/samsung/s2mps16.h>
 
 /*
  * Maximum number of retries for checking changes in UDR field
@@ -254,6 +255,11 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
 		ret = regmap_read(info->regmap, S5M_RTC_STATUS, &val);
 		val &= S5M_ALARM0_STATUS;
 		break;
+	case S2MPS16X:
+		ret = regmap_read(info->s5m87xx->regmap_pmic, S2MPS16_REG_ST2,
+				  &val);
+		val &= S2MPS_ALARM0_STATUS;
+		break;
 	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
@@ -303,6 +309,7 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 		udr_mask |= S5M_RTC_TIME_EN_MASK;
 		break;
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -354,6 +361,7 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -378,6 +386,7 @@ static int s5m_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -416,6 +425,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -455,6 +465,7 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -494,6 +505,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_info *info)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -532,6 +544,7 @@ static int s5m_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	switch (info->device_type) {
 	case S5M8767X:
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -613,6 +626,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 		break;
 
 	case S2MPG10:
+	case S2MPS16X:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -680,6 +694,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		struct i2c_client *i2c;
 
 		switch (device_type) {
+		case S2MPS16X:
 		case S2MPS15X:
 			regmap_cfg = &s2mps14_rtc_regmap_config;
 			info->regs = &s2mps15_rtc_regs;
@@ -817,6 +832,7 @@ static const struct platform_device_id s5m_rtc_id[] = {
 	{ "s2mps13-rtc",	S2MPS13X },
 	{ "s2mps14-rtc",	S2MPS14X },
 	{ "s2mps15-rtc",	S2MPS15X },
+	{ "s2mps16-rtc",	S2MPS16X },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, s5m_rtc_id);
-- 
2.43.0

