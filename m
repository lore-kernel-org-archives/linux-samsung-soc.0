Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5C9310774
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 18:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093241; cv=none; b=XTGQlCRUo+8X77yHQCl/n97sKkWXZI9rKb9pt8pu97QN3Lmjt4gBf2CCeC60crxBPAsKNNn+RCXapiNgLqU76qE5vkH/lfdFv46whiybeRrdtfNAibASme14rKqtnjvbDGJK2r6NCL8HlU8DbSjqfJeMYaf+EmJQzvarBSg6lBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093241; c=relaxed/simple;
	bh=4TcBQPEAGKM05TWISFH3YhLVnNBHOq5rwTZKeWo8X1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nO9c5DufAAf4+GUsnbz9LcId8pB6FJzuhXE7qeGfJdX4nOSET5+U6Sk2ufChN8ORM8/VMn4vwRQtC2joDJ4XLCecI3jwJNipE/XdL28iGuk1Lhw6+MmgMYDFuwso+zRalUMF7H6elKGsQnIrTgOg4peG6pzgcWmjgvTNI6zH4JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxIxOI/I; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxIxOI/I"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-bde0f62464cso620389a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 10:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093239; x=1771698039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnXmUEvVp0FKiuAf5tSWSg+X4ncehtCc9Vi8+FOLDFA=;
        b=QxIxOI/IjjcE3tNN0PHIDZ7GryklbymZ3Y1FflrrbE6pJsS1IYPSqAWqeU8oTWSihi
         JVH+yoG6UzXAjFJr0Y8qCmO1ALkeGznnng4IPe6xAfWRo53p5ph1IslSNy8p7gnd2Ers
         UVKdJy1kCDzUoK1xM5Qe2E/vDV1Oo4dML3CSr2rSVIWPGR21Tx6GEbn+qiWp+1gOYbFN
         fEIKWkyUdCSdHULDnj5tT7Obs1s4Cobq8EhIsiJ73jcorLwQ8HMVDCa1TjW2XKsDxn7F
         x7CfM1RZz/djanfXHj7BYFb8+Fao2p99jmFsw+d/fiEL96YzFqN2j9r3vUccjKHb35Lt
         RlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093239; x=1771698039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GnXmUEvVp0FKiuAf5tSWSg+X4ncehtCc9Vi8+FOLDFA=;
        b=UoBV6e3KofG7iqAQub7Kj0SSm+pmfrcWWLQ6OWYKli3Zb17HfHqVM82CM6jjdGyOgH
         D533PYPfkAf4M0FamiH/eu5ZTJc4gW3UUkzkMPll2//y3GyMCTJutKBCRxxnG940ihCd
         dej32gNmN04fHaiqFiw53CKZTnnvbv4/ucjY3d8BZsuWiY5cJOmICz6RGkGjFWzO4BCa
         S4XiM/5VcRiPGqQXZMwMCdudBQEjH+mhlJHwPygdKBlQCvn2WV61eVW5Ja0khLG9ZVE+
         PHN/fjs/dd7+8AqgpazAvcWLLgeRca1LAMAKcsHXsq+tUA1usctaRGZ2fp8EGxcl9MJ6
         MvxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrENL/4aBBwC2FgBRjVDHLWEY10hZhU5YckGC23K7Kk0y3PEeT/FjFkM3NVjZe2lJzWMNRD6MSFG5gkKmXueFztQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6guubIsAqlDVF/lQDT4bEevWkju+j/z/m77ECPmTySxl8/wO5
	8QjJq4KuNwyFnOVkMherZpDcvje9kMgXnYweDVvTHHizqhi5DF2YwrZW
X-Gm-Gg: AZuq6aLNxkPf+DzP5rPvL0jxFQVF6hJA23+ImLxZ/0mVvDdENi+yWK+J+21HXvHcJ+h
	uOZrd0Td/0+cYMqa86qzCrwZsqApiB4I38X9x0RDiZmM3Vxb2kNMWrlIvYne0x25nqnCK+Bo9zz
	Sp7C+9ulj1L8MNGmB8CSNJVDx8ohXWKK3zYJ9OUqr+oO3P9Kf12zohedwDx8hrU7nUqcIXL/hSM
	EjWueGco7vvaKYp4/LVvHYilhFSoLkpOJtFKQf78kgH5r2iafKuSo0iZfdUtrYU8UU5h5Jh2A3Q
	tHKaXVbaUfblEHt0er6/49P/gyY45aVEwOVIIx1tqWD/06h77/3npeOksNHHoP0qD7GJY0bL0Pu
	oQ4YA1qcjpu86kGN3XwX98rEKLpvsL/kPcLNdQfDA/C4Y9fPs6I/b1aw6rOfUNchnErck+HThjq
	CHrTabOn72o5MqN7DitgCiX3d+i2sdYw==
X-Received: by 2002:a17:902:ce89:b0:2a8:7814:47d0 with SMTP id d9443c01a7336-2ad1749829fmr30161265ad.22.1771093239295;
        Sat, 14 Feb 2026 10:20:39 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:20:38 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v8 9/9] thermal/drivers/exynos: Fix some coding style issue
Date: Sat, 14 Feb 2026 23:49:06 +0530
Message-ID: <20260214181930.238981-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several coding style issues reported by checkpatch.pl to improve
code readability and maintainability:

- Remove unnecessary parentheses in sanitize_temp_error() during
  logical comparisons.
- Adjust indentation to align function arguments correctly.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47b92c84ae98..f7f604230cfd 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -252,8 +252,8 @@ static void sanitize_temp_error(struct exynos_tmu_data *data, u32 trim_info)
 				EXYNOS_TMU_TEMP_MASK);
 
 	if (!data->temp_error1 ||
-	    (data->soc_config->min_efuse_value > data->temp_error1) ||
-	    (data->temp_error1 > data->soc_config->max_efuse_value))
+	    data->soc_config->min_efuse_value > data->temp_error1 ||
+	    data->temp_error1 > data->soc_config->max_efuse_value)
 		data->temp_error1 = data->soc_config->efuse_value & EXYNOS_TMU_TEMP_MASK;
 
 	if (!data->temp_error2)
@@ -536,7 +536,7 @@ static void exynos5433_tmu_initialize(struct platform_device *pdev)
 	}
 
 	dev_info(&pdev->dev, "Calibration type is %d-point calibration\n",
-			cal_type ?  2 : 1);
+		 cal_type ?  2 : 1);
 }
 
 static void exynos7_tmu_set_low_temp(struct exynos_tmu_data *data, u8 temp)
-- 
2.50.1

