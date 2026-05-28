Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E318D3AB299
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964189; cv=none; b=WngmW+5t+ojRlWB5BpLhYmi0lLX267xGqhjhWwJK0qMD0jTFdE0r8PZfT/w2fcxcEfu6+WuE0gto2YarZLD4Ym+UkCUUPnNk2qPLtrCyw3tCRfV1dr3JkSBinB9QDt5TybphXqQnqj9fynYEjBct+OUXNL1w7ZQ6U1PiMIGTV7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964189; c=relaxed/simple;
	bh=zDeV/QjELvue1DDZEmJSTZtOOPUgKnSkuDpqYuEAmHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sh7ffEwGG/5jufBROZRLcnjRCUH7YqCFxywlFr5OVBt3xhoYYqQrSLRGnnphwhyPmx3K7xdI4A04dD0Gqc6IgU7UkVb2a87uhm+uKQn20gTzOE7Wmbx0MGQp/3OBF1dE4I7wFLSeCKlPqK05pvzE148b9xR54n366ut93Zfdspc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kO3PjU6l; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kO3PjU6l"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ee1a56328so727367f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779964186; x=1780568986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=61U37PkYxDP7srwfy7W6MENJC9Lvy4YJE9j3WlMCKWk=;
        b=kO3PjU6lG+im8EyP6E+RqTHrvdtIhWHOzHmqQRKIGKaK0gBcCuJoZu3ENBAjpjlWnn
         sMajUvTYI4V5nsLorpDKsoMew71mI82WeHXWu9X76DuENMVQv3lFRUsFmw+ezmbclb/O
         kEikFGTuyhiPnWpDIui8nHaLDtr8ub0nlZi1a0OnvgNf+LbcXHscC8EBnE8QC7fe1IcQ
         bP4LqX3CBegm1XmwF+fz3dYOJC6FiuSiDdQ4y1yrdOFhb+F62NFBZNbf8r3ngHogZSuP
         5mgo0KANWazlmIM91YAN172ANzhSu16SqUnASKNXu3v1n4FWel8oVKucA6uoZVo23bpP
         j4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964186; x=1780568986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61U37PkYxDP7srwfy7W6MENJC9Lvy4YJE9j3WlMCKWk=;
        b=Uc7V8R3CYnBpzznrdczm9ByE2lwSvk/xKAp5EkevsQoROoEFakzDpz0IV6gvbGs+AT
         n8w0gsrwICPQ1BNCRY1nFb2lUukICDUrAxFDBYVozxWis+Qp3fFOJzixuvQ56e5HyM/r
         lkVN36litO36bBldgYKM6EvkM+9Cn07DqCqw3zmhU0NRPssA1dlsfB3DM63L597DgabR
         se4OQnpUZLMMJS0Jib4vVRY64xD0xpaUOmOvW/9VT0Rt7I7xfZzfx8PFixt2qP6xTLlj
         Kahxy/r5bgYyjiXIFi7hXD1PYEQSnHN7CeLz6E+Z5O8Id2bxgPAKyWFuKqTjqNKa3urp
         tBTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Zo0sVMscLjLMAp+Y4E9lCFazG8j7JGsmvyHN+Yv4fZafiRjUphH8wzx/lC7vNkeatn/IO4bzbFf/U/mgTK27H4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCqb1HekUZG3znwJhgbooywJ504b0dJ1nOhbftsvC8BBYkixUj
	RUJGiO//+9+Pth0TDDDyydqKxsF17snDociBgTFs9LaHMsB3aulXo9lzqHa59zlin88=
X-Gm-Gg: Acq92OEYkAJA0oXByJ1+2UiS68ql96WI8ZEbTfGxlDBwz7rE0ciVhT08sM/DXvWywiS
	MDYW59cte21gzxUWIbqvRSqrCGEFTrpoNKfVCBsg+qMk4g7b6+SCIpJuzyfJmbYHOQ7XU+u22MV
	8AqA1XlJk/xRtzli6Sta7tl2Pkqr6rxGh2K5qSqhEKXJo1fswl6anmVB02/cjz99Com0Quh1Var
	7TPZzyvmyEAAG2moiLnmN1jY13uhOGA/8vRqSPiOICcOQWt0Ra5/UUE8nTXxQ7yn6HCE1rhunfs
	EMrr9S0bmqxluyhgRIIeC5TNEbd1AkadoOu6pgrZ2gfJiLKkjrEi+yQjrGcpcYuFXQPZgA7BBL+
	ILPDQqc0SQ5TWOepepbOZuiN34FD/JlX5ZM+GEzYVgfhwR4+UD4bOAlWj9Ww2Cw0f/ktwJlXoVK
	e0ovWbbPydc4ZKCVQld8XmRIkl0XNyYoFIwJ3DvISXxw53+TE9SxZfpg80AMTDBantat/uEwA0G
	LkzmouIembhdnTatQVGV8FWDQ==
X-Received: by 2002:a05:6000:2383:b0:449:cfea:ca91 with SMTP id ffacd0b85a97d-45eb38c9090mr46024721f8f.37.1779964186165;
        Thu, 28 May 2026 03:29:46 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb557679sm22133274f8f.10.2026.05.28.03.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:29:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Brian Masney <bmasney@redhat.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v1] clk: Use named initializers for platform_device_id arrays
Date: Thu, 28 May 2026 12:29:38 +0200
Message-ID:  <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3890; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zDeV/QjELvue1DDZEmJSTZtOOPUgKnSkuDpqYuEAmHk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGBkS4W14E07miYgxXfZ5P0Nms7qGfWBHWxrl1 XXk8rIRYGaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahgZEgAKCRCPgPtYfRL+ TqhfCACacCiHDmcj2A4BRNtqxk/gD9elR6r0+Hthg0xplEdU7Dqo89q9+oFpzIx0x6bRVucToXF f+T/0oN5HXPYiS6s8ghodEAx6+PX26gba+9T8x5driWb88R92ipEpt3LlSp86Gus6f2OzabD6Dk YV2bH02s4P7CntM4wkk3lVD6gzEKKkXSGlOkU0UIF//o+Foc2Pr1yU0UDWs2+n72ptVp1iKbx5D DNmiZJmwfmsUv0mFx/Na3djnx9QWeI4VzjAkeCRa9jDvPcJLmkGDU/+g4Sh8SfQftw166pnyKAY FZtoL+shxJBs45GA5394PHmr7UsFpCagSGg0UWTJQ2riRY5z
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

see e.g.
https://lore.kernel.org/all/cover.1779893336.git.u.kleine-koenig@baylibre.com/
for details about my quest to modify platform_device_id.

Best regards
Uwe

 drivers/clk/clk-bd718x7.c      | 12 ++++++------
 drivers/clk/clk-max77686.c     |  8 ++++----
 drivers/clk/clk-s2mps11.c      | 12 ++++++------
 drivers/clk/samsung/clk-acpm.c |  4 ++--
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
index 1cae974e6d1d..8ddb50c67757 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -147,12 +147,12 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd718x7_clk_id[] = {
-	{ "bd71837-clk", ROHM_CHIP_TYPE_BD71837 },
-	{ "bd71847-clk", ROHM_CHIP_TYPE_BD71847 },
-	{ "bd71828-clk", ROHM_CHIP_TYPE_BD71828 },
-	{ "bd71815-clk", ROHM_CHIP_TYPE_BD71815 },
-	{ "bd72720-clk", ROHM_CHIP_TYPE_BD72720 },
-	{ },
+	{ .name = "bd71837-clk", .driver_data = ROHM_CHIP_TYPE_BD71837 },
+	{ .name = "bd71847-clk", .driver_data = ROHM_CHIP_TYPE_BD71847 },
+	{ .name = "bd71828-clk", .driver_data = ROHM_CHIP_TYPE_BD71828 },
+	{ .name = "bd71815-clk", .driver_data = ROHM_CHIP_TYPE_BD71815 },
+	{ .name = "bd72720-clk", .driver_data = ROHM_CHIP_TYPE_BD72720 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd718x7_clk_id);
 
diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index 9149ce4f702d..e6fde914c5ef 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -264,10 +264,10 @@ static int max77686_clk_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77686_clk_id[] = {
-	{ "max77686-clk", .driver_data = CHIP_MAX77686, },
-	{ "max77802-clk", .driver_data = CHIP_MAX77802, },
-	{ "max77620-clock", .driver_data = CHIP_MAX77620, },
-	{},
+	{ .name = "max77686-clk", .driver_data = CHIP_MAX77686 },
+	{ .name = "max77802-clk", .driver_data = CHIP_MAX77802 },
+	{ .name = "max77620-clock", .driver_data = CHIP_MAX77620 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77686_clk_id);
 
diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index ff7ce12a5da6..fa5ac8f673f6 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -225,12 +225,12 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
-	{ "s2mpg10-clk", S2MPG10},
-	{ "s2mps11-clk", S2MPS11X},
-	{ "s2mps13-clk", S2MPS13X},
-	{ "s2mps14-clk", S2MPS14X},
-	{ "s5m8767-clk", S5M8767X},
-	{ },
+	{ .name = "s2mpg10-clk", .driver_data = S2MPG10 },
+	{ .name = "s2mps11-clk", .driver_data = S2MPS11X },
+	{ .name = "s2mps13-clk", .driver_data = S2MPS13X },
+	{ .name = "s2mps14-clk", .driver_data = S2MPS14X },
+	{ .name = "s5m8767-clk", .driver_data = S5M8767X },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
 
diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index 953ca8d5720a..25cfa953ccac 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -166,8 +166,8 @@ static int acpm_clk_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id acpm_clk_id[] = {
-	{ "gs101-acpm-clk" },
-	{}
+	{ .name = "gs101-acpm-clk" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, acpm_clk_id);
 

base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
-- 
2.47.3

