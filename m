Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C7821CA13
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168675; cv=none; b=IxcIeAwYJ+o+Kez1zZMs8llMLQufObwPl+FH9+OgxOkhzISwGaEDaEclxrpvPpooev/gSjmvE/Ajy8z68thjGptnCb+y6sEU4aNEQ06G0bYJmnt9OCQcj11l1t5BmrsSpXkfNsr/eV56mIebrLudLzXdlUJ1l6cDZ13nQ2PW/GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168675; c=relaxed/simple;
	bh=uZPaCVbPHBGfSgOGE/h2z8oZIqJdXRNHkC3wOcm11eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HL54sDZK7rrzTyXOmuHfCeqLy0QlKoS2K0BMPNDET7gVmMdoSL9pGijDSVvse5xmAeaZJ27u6AZmdoUm/C0FqQorIO75nA7aByqEUDQAqzv+1p7uwNCESZgXa0OH3hIy9aU1iTb+LVGsiKT8ILJYp7MJLEukql/QjX0Du7n8Gzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WKdGgX/v; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WKdGgX/v"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so367598366b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168665; x=1743773465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=WKdGgX/vbRvtc46zIAT4ZFk9eSDjIKPd6yrk8cQKrNQfjVkTIDKVmZPmC7UjgR3//n
         U5fsrnhBk1WgcOMd9C1gCTDovWHak8Y5dVuO4QYKuH7OiLSb/XDICkok1TgUBD3wzwM9
         VuRhLTVuiT4hMtz8NsZ/Aizbm2KhE8UfXxbiaP7buvfPcRNSn7VMPrYSpRNngjZEGWq/
         EoTnUp9trY8IIxuu+WCiWZSc9GvgDSPeOi+K/WkKfuv8qK+ieaGFKMHYuqAAHD7+QElH
         WaVIdGkSJ5MPzzMLT00ZgMyVNTydtbSQ8BA2X6Fw4px26Uc+Ndi0//IHldkuEofIV++Z
         0z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168665; x=1743773465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=sw2ZdTYRRpg0Uv+rISVOhPGrIyqcJDllLmLsR5bMazdMGq0wZ3OfFfNtDPrR6Jezru
         FcOam958+YgBBjBMRHrpD0R3p9g9OzQkD++6uI2eAOmNadMwNxQES3W+bbQ4ARdfRqrV
         jQXhzcep+EcR18BOhoEtIn8+mwq/sJK1dh01/Yy3H8jrI5r0Ho/7cYynYoPmvdEOfYp2
         YpFQDFG696Oj64W36yel3ZEcMo7Zb4g0NLbDNN0ln3jQqdex5Z+dgBDncP/LvpyTHWGz
         bvy6kfKJ8YbG7oWZdbSMELHjJHBQDOu/+1NdrFuTSfQ0WYHNl+WZWoazPGWu7j9to7C+
         U+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB+2XUH1rgNspeBpZpfbFk18M4N456UbsuKFJrhiBLwQjaTgSFHZXne0It8l4EMjqpvvazytbKxdlcZjbJHNh1QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrfAqm3dEiDOK2WvgnKEzsUmtYmWgiegSe0s53jSnngNp0ir5V
	aAjr0rOBVbILh+x2Wa/v3jbflvQ1PUva21f8Eu+yXj1aymrqumepEFFC6pXUSJo=
X-Gm-Gg: ASbGnctjkhnEsS/Ut/jgq/rAnbkEGXCn0Op55fYom6pJmF1t+VJuOGTBzwKJrSpAW8t
	qO31HdVVvx6G4U6T847S0ObxRtCvYvoOgntXPC2TMVtv70BJ1v5NCBBsaLvwXiZ4gX3eR52z1zJ
	GvJR+pz5dWnTw0toPK/gaQDD3vDK6uAyXQ2GISkQoiMNNSEuy82nkOrZHQJ3p/wwmrqu5cU0baO
	8LlUdUmnyVbgnmvIcab74gJfkptkjV3QtDFQ+jZE6heGQp/eHrS9fk1SWHBX2Y4fp5fVfnZ84s3
	Q/F2gro/ZKKeMAdEvHxued3ePwUE/RLxcroJ5HtDN39zGn2JnhxTWdrfP8+7fP7GQoc8qlvrYRB
	F/7p1EtAPFH/35doN09wXro9LAx4+
X-Google-Smtp-Source: AGHT+IE/8XexhkCjt++gZyl4aQeO3RmSnHYdltcD1RaSzcc8eBzKzYT4GuhaF+2UqXAsXXHHf+aEJg==
X-Received: by 2002:a17:907:84a:b0:ac7:31d5:20de with SMTP id a640c23a62f3a-ac731d52b5fmr47028466b.50.1743168664749;
        Fri, 28 Mar 2025 06:31:04 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:04 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:07 +0000
Subject: [PATCH v2 21/32] mfd: sec: convert to using MFD_CELL macros
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-21-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Use MFD_CELL macro helpers instead of open coding. This makes the code
a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 57 ++++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index e8e35f7d5f06b522a953e8f21603e6904401c983..448300ab547c10d81f9f2b2798d54c8a03c714d8 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -24,16 +24,13 @@
 #include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
-	{ .name = "s5m8767-pmic", },
-	{ .name = "s5m-rtc", },
-	{
-		.name = "s5m8767-clk",
-		.of_compatible = "samsung,s5m8767-clk",
-	},
+	MFD_CELL_NAME("s5m8767-pmic"),
+	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
 static const struct mfd_cell s2dos05_devs[] = {
-	{ .name = "s2dos05-regulator", },
+	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
 static const struct mfd_cell s2mpg10_devs[] = {
@@ -45,53 +42,41 @@ static const struct mfd_cell s2mpg10_devs[] = {
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
-	{ .name = "s2mps11-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps11-clk",
-		.of_compatible = "samsung,s2mps11-clk",
-	},
+	MFD_CELL_NAME("s2mps11-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
-	{ .name = "s2mps13-regulator", },
-	{ .name = "s2mps13-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps13-regulator"),
+	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
-	{ .name = "s2mps14-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps14-clk",
-		.of_compatible = "samsung,s2mps14-clk",
-	},
+	MFD_CELL_NAME("s2mps14-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
-	{ .name = "s2mps15-regulator", },
-	{ .name = "s2mps15-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps15-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
-	{ .name = "s2mpa01-pmic", },
-	{ .name = "s2mps14-rtc", },
+	MFD_CELL_NAME("s2mpa01-pmic"),
+	MFD_CELL_NAME("s2mps14-rtc"),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{ .name = "s2mpu02-regulator", },
+	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
 static const struct mfd_cell s2mpu05_devs[] = {
-	{ .name = "s2mpu05-regulator", },
-	{ .name = "s2mps15-rtc", },
+	MFD_CELL_NAME("s2mpu05-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)

-- 
2.49.0.472.ge94155a9ec-goog

