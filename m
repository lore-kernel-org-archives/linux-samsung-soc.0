Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6145E2E6116
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878889; cv=none; b=n0CqnQXc95FXzrD71zoNP+PGtwDE4EN1VfjlW8lqSoWdgPy2/XnJJiClMwXJv9GmraIeNClxEp0lJIaHh423IpjllZDDgru5qjs3crCTwTo5IuoCXDk6KaEYfdRabOGWtJckzpjTx8pYDK47vC11M6Dtc0ngOy6Eox15uwIRvr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878889; c=relaxed/simple;
	bh=9Xdnbrncq7VH0BmQ/6t4XS63l5XFKqkc1TeJjnWKNtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W8XCi4zDHoOLDqcBKFFYLQPvLD7S+q0GpZ1/w0AEt1HmIjoYl7OArnX/NDnYGunfUIOoUP+q8rpKtXlx8yGYwPAA4BUJt31REL7MlT27fQa1lTIULm/GkMORdDaTUjFm24eK37hPAnIre8fCBpbYpE69TxeU7sQoLNJa6bnpFlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ftzUlKhm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ftzUlKhm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so45906035e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779878883; x=1780483683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yohZLbN4T246kBQJdIC/qXF5efV1Yafvx3na1eLrUw0=;
        b=ftzUlKhmxzlcX3NkoEBFVMfPaMo1Yi9ZUcLzeLBcwLVudmzeMGNAT+XoTRZCLJmYZL
         vN84ImLVxfAtlmZYixIUGI75rwCWkcDkc/zDwO9/z7grTcbgBOTkf80yV1Ps4R+MC8uy
         yu+ysKdsSeEgOq4DyChEGIPRx9fy8TZ/6Z2v/e5c6GmyMzlFhpviBevUGQV/JzlvDl9s
         BsFfe9DvvLTV+74OrjiFI+TshXbFjvxX41khWVT1GynXhKK56XMW3vv+kFGIvlLSeYW+
         XeBOjRD//XDXW05kPR058Ohgr89mkbo6jsF0hjW4zijCzM4yUqvbYq3+bD5tA4nhnYRr
         mTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878883; x=1780483683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yohZLbN4T246kBQJdIC/qXF5efV1Yafvx3na1eLrUw0=;
        b=Tktjk28g/6hENZuqGGDUWUzh58+MB8IGKmEoDCmyVxL1FGE6FBGlaarjY7KxMyjztk
         gTS8KOWHGKcfHjjHANqO8zwGCxXCLiOTO9FPiFuEra8R//oiY9FW8Tm3UiE/VSnMEZT3
         WC77kdDSri4Zv+nSH9vlDURi2qYSv5BpO6uH+AuocavlxQ0fLNQR2Vm52g9+t4vGjRyk
         0J6boJarnJHmdjWQSQTsIjwbtiHnqAWijDPoFNhg52o4noejn1mnBPj2gvfoR36Zd/wb
         Hskc99ZGafycZmzBBZvxl+FqRhvBPOFHazFGH/d12MVmG7krebp9MtzB+2gg+y+BVUlG
         fBpA==
X-Forwarded-Encrypted: i=1; AFNElJ/wGj2IKcUg28SxBlX4H5MDWmT/PuP+47NmCxcXj1iM1HfdZgSo7SguiWWg0N7rF0oOlwOh/PknEljtbw/V/ad80Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlYLQjZoqYyCNNci1RXSC47+ePHyQrrVIrBc+fhJFLSrNdHmPo
	4hOIk1Hpzt9RWIwnc6PcbYDP2DLgXzSepFUUx/cg1C/ygLr91BD57V1tsmGFNw8Xsjg=
X-Gm-Gg: Acq92OHAU+5gqC1L23zzNGFFeqXMHoJsTPmxjBDcD0hpOhYjhXisN/olQ8MHV9Nma4b
	hHijZ9cwzy4ihbcq4AiEvRKL4U4DP82ZHyeNS9/MJngWovTg1Ki1zo+ivDccNbLTwiqpa3rImN0
	le1QtXYpLgkKw71C8yd434qu7iit+3x91WcUqwUiDtnlLHS1MHCfsXf8TEM7RLAnBf/vVJRleih
	L3swu8iIyR5CZaG4P69jEwnNNMluPGDi9CmoSYV570tF2wxiK2lCa/vU7IjL/dw5RTuFm0vTkpi
	I50SFuZVXubliLBYZ1HRGtQ0SjF8UM9ZOb5UdocNPrbqPO7PrqpUNeei+s/CWaPRiYToo5zttds
	XLW6abT93u8KAVuhWDGHyAiM+Wvie32Rzn60wg0iSs8obd7NobSA+nhmkX8TPZo0Q1aLsGuzpiV
	zgcvEq8pevk/XPHOZ5BsZqLGDADUJUalHvf1AjodPprVjTxQnBmTKPK8A728qXa5r2y7FuJtbAd
	93L9HGYHtKzeWZAdw146/AYHA==
X-Received: by 2002:a05:600c:1f87:b0:48a:8905:a500 with SMTP id 5b1f17b1804b1-490424ad9abmr362404855e9.12.1779878883413;
        Wed, 27 May 2026 03:48:03 -0700 (PDT)
Received: from localhost (p200300f65f47db041edccd9970843bb8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1edc:cd99:7084:3bb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4904527526dsm428217795e9.4.2026.05.27.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:48:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Karel Balej <balejk@matfyz.cz>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-renesas-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v1 0/3] regulator: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 12:47:43 +0200
Message-ID: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5669; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=9Xdnbrncq7VH0BmQ/6t4XS63l5XFKqkc1TeJjnWKNtI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFsvQ+3pUGvYbTzMBf1U7HpUNs0YqKV82qCwBE o++WwMTehGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahbL0AAKCRCPgPtYfRL+ Tr6TB/9tVIDirqaIFIr+cLHvFRjr/N+HTQz/62BiICc2JJZjFIxmMz6KGMb9PGbAjW0SSau/dN4 zcLMGrCLoC48OmtmlVPfz+h8PG49qdmzJoQkLg4kgndLfg39qqbcPsy5OhkrlgPPzheAU6T3zrm 0WxKp6Wr3LT/anxmAVOQ5FtwjfhMonlFOEOipHYnM2hSfShJ2Bh1eE6IBZytU+c7SY+/nNNsB/D ZC0jCfekfiHdSj1sMmpvYw/JsTRuvgZI4wfY2r4DqR7oE0TrKI5jZLonpB9QKDQyLjLXmkS+xzK bbDtl9bNcjm0Hwz5BysWpXOKEc9oARJLfgXY+NBO7kgQGcRc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 3b0c9a251a2e..b84881f32444 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -610,4 +610,7 @@ struct dmi_system_id {
 struct platform_device_id {
 	char name[PLATFORM_NAME_SIZE];
-	kernel_ulong_t driver_data;
+	union {
+		kernel_ulong_t driver_data;
+		const void *driver_data_ptr;
+	};
 };

which allows dropping several casts and eases porting CHERI to mainline
linux. A possible follow-up change is the following example:

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index 308279b31fd3..6bbad1f1ddd1 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -1211,7 +1211,7 @@ static int bd96801_probe(struct platform_device *pdev)
 {
 	struct regulator_dev *ldo_errs_rdev_arr[BD96801_NUM_LDOS];
 	struct regulator_dev *all_rdevs[BD96801_NUM_REGULATORS];
-	struct bd96801_pmic_data *pdata_template;
+	const struct bd96801_pmic_data *pdata_template;
 	struct bd96801_regulator_data *rdesc;
 	struct regulator_config config = {};
 	int ldo_errs_arr[BD96801_NUM_LDOS];
@@ -1224,7 +1224,7 @@ static int bd96801_probe(struct platform_device *pdev)
 
 	parent = pdev->dev.parent;
 
-	pdata_template = (struct bd96801_pmic_data *)platform_get_device_id(pdev)->driver_data;
+	pdata_template = platform_get_device_id(pdev)->driver_data_ptr;
 	if (!pdata_template)
 		return -ENODEV;
 
@@ -1329,10 +1329,10 @@ static int bd96801_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd96801_pmic_id[] = {
-	{ .name = "bd96801-regulator", .driver_data = (kernel_ulong_t)&bd96801_data },
-	{ .name = "bd96802-regulator", .driver_data = (kernel_ulong_t)&bd96802_data },
-	{ .name = "bd96805-regulator", .driver_data = (kernel_ulong_t)&bd96805_data },
-	{ .name = "bd96806-regulator", .driver_data = (kernel_ulong_t)&bd96806_data },
+	{ .name = "bd96801-regulator", .driver_data_ptr = &bd96801_data },
+	{ .name = "bd96802-regulator", .driver_data_ptr = &bd96802_data },
+	{ .name = "bd96805-regulator", .driver_data_ptr = &bd96805_data },
+	{ .name = "bd96806-regulator", .driver_data_ptr = &bd96806_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd96801_pmic_id);

which allows the compiler to notice that driver_data is supposed to
be const and thus requires the first hunk.

If you consider the last patch mostly churn, just drop it.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  regulator: Drop unused assignment of platform_device_id driver data
  regulator: Use named initializers for platform_device_id arrays
  regulator: Unify usage of space and comma in platform_device_id arrays

 drivers/regulator/88pm8607.c              |  4 +---
 drivers/regulator/88pm886-regulator.c     |  2 +-
 drivers/regulator/bd71815-regulator.c     |  4 ++--
 drivers/regulator/bd71828-regulator.c     |  6 +++---
 drivers/regulator/bd718x7-regulator.c     |  6 +++---
 drivers/regulator/bd9571mwv-regulator.c   |  4 ++--
 drivers/regulator/bd9576-regulator.c      |  6 +++---
 drivers/regulator/bd96801-regulator.c     | 10 +++++-----
 drivers/regulator/hi6421-regulator.c      |  2 +-
 drivers/regulator/hi6421v530-regulator.c  |  2 +-
 drivers/regulator/hi6421v600-regulator.c  |  2 +-
 drivers/regulator/hi655x-regulator.c      |  2 +-
 drivers/regulator/lp873x-regulator.c      |  2 +-
 drivers/regulator/lp87565-regulator.c     |  4 ++--
 drivers/regulator/max14577-regulator.c    |  4 ++--
 drivers/regulator/max77541-regulator.c    |  4 ++--
 drivers/regulator/max77620-regulator.c    |  8 ++++----
 drivers/regulator/max77686-regulator.c    |  4 ++--
 drivers/regulator/max77693-regulator.c    |  6 +++---
 drivers/regulator/max77802-regulator.c    |  4 ++--
 drivers/regulator/max8997-regulator.c     |  4 ++--
 drivers/regulator/max8998.c               |  4 ++--
 drivers/regulator/mt6323-regulator.c      |  4 ++--
 drivers/regulator/mt6331-regulator.c      |  4 ++--
 drivers/regulator/mt6332-regulator.c      |  4 ++--
 drivers/regulator/mt6357-regulator.c      |  4 ++--
 drivers/regulator/mt6358-regulator.c      |  4 ++--
 drivers/regulator/mt6359-regulator.c      |  4 ++--
 drivers/regulator/mt6360-regulator.c      |  4 ++--
 drivers/regulator/mt6370-regulator.c      |  4 ++--
 drivers/regulator/mt6380-regulator.c      |  4 ++--
 drivers/regulator/mt6397-regulator.c      |  4 ++--
 drivers/regulator/pf1550-regulator.c      |  2 +-
 drivers/regulator/qcom-pm8008-regulator.c |  2 +-
 drivers/regulator/rt4831-regulator.c      |  4 ++--
 drivers/regulator/rt5033-regulator.c      |  2 +-
 drivers/regulator/rt5120-regulator.c      |  4 ++--
 drivers/regulator/s2dos05-regulator.c     |  4 ++--
 drivers/regulator/s2mpa01.c               |  4 ++--
 drivers/regulator/s2mps11.c               | 18 +++++++++---------
 drivers/regulator/s5m8767.c               |  4 ++--
 drivers/regulator/sy7636a-regulator.c     |  2 +-
 drivers/regulator/tps65086-regulator.c    |  2 +-
 drivers/regulator/tps65218-regulator.c    |  2 +-
 drivers/regulator/tps65219-regulator.c    |  6 +++---
 drivers/regulator/tps65912-regulator.c    |  2 +-
 46 files changed, 95 insertions(+), 97 deletions(-)


base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
-- 
2.47.3

