Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB66C1D514A
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769573; cv=none; b=AjY7/DrkuSpkdYUZ53ereWyBVyfY+RM5VENUT4nvF5G6y6tO12qIGFuIwPploFWMLDkuLra61O+yCAd3tPbblBsmVemBJsTQjA70f8SbsdONkLQFPxpnRw+wnk0QmqHPO/Iu/GJTJK2hv09Og8GryOIs1e+0h81rHT8lcCaxAUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769573; c=relaxed/simple;
	bh=BAdQgtrPovKD1iIkHpNo2/fj9h1pbImjAxhHF9j1z9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F8eAx/eVS7WJLK2a5r7+dJzGRqzN10G7TN9O07ps4De7ijWdBsWxkfVRvCCkKiARk+6R7BceV7u5yKPGnm2dqvOD7rj3Gz5XE2JIiKX9LOI4AQyx8+H06bLh+0gPWyuX+dYkN/NHHp2DOvz4UM0rPvh3fwJELNX3/LYc7qNHa6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wektAsnB; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wektAsnB"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac297cbe017so864494866b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769567; x=1743374367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElO2IZ9G98m5zgbIKm9J2T+DEuKZxhIOZ2O4ti4VZ1Q=;
        b=wektAsnBPyMEZMxqYx/4ZkVYxXJkd/cRbrZr7cbw2Vl4uX5kwkPdagGjmHAKABKuNS
         xu/zT1cYWAhXAV0n2TpxFQMS+fTqx040UeHEDSb2Mr7E9hdnDt69PtBVj/IXN6aqiKYv
         YzK7o8/rUoAzEUC/ai2fYkT9CHGC7K3KJe68jIibInEdL/WprFJb/q5/KrJu0jsFR20p
         Dy3NyTGFWuYLegvxLwXNQy/4GbSZOUd2EVG+kGDjiapWxNO8NJCBXWbeTPdnT1bRurR7
         aoU7adxGY5Mu4/tDJOFHZc18mMsUUHlT0E/iWSIkhjpOR90keAJezSdJUWsE2KVRQ8Ig
         jI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769567; x=1743374367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElO2IZ9G98m5zgbIKm9J2T+DEuKZxhIOZ2O4ti4VZ1Q=;
        b=FmJagg0+n5bgwGDaB4TRWpc6RdFqpYp2D8DHYoZFvw20l0gKskL6VEiHqsWlDMCa7d
         naz3lbaaEluS8nWZWiq+KFUWUjJVYV8N6nJ+gdB2kTNHltDhqYpI8s4zQ5/nz7mcBTWL
         c5ziPIb241znXvaa8NGAZj6NwkzD5IO4Pw6/IJGzjXcSFOs0k5BzMk0ZR5Mogwji4BrZ
         X+B9xYTtJqv+wDhSb4G4Z1eJz9S5EbK8qdiYZTas4nR08O/V1widyNZoy21TR/MaVpyx
         2ojexhOIRCGCcuRuZcXPHMIXeN4uo/oHgUYG4vxagTROr0EDVIUVpgSk/p5TGZGqR57v
         OL3g==
X-Forwarded-Encrypted: i=1; AJvYcCWZSUzdD1kG9CN932UmRk+S7iz7nrkw0Kh6X0pfzv0mc8p5eyELxB2SIGX7Hfv5I/LgWUkVfCJa/9CdD1QvQYzfvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNgag7qlQ1ksDxAyZorghohamEZsL/Kngo/yNzHgwS8j4UVkqV
	ZxsAJrR8zer+TamLPSOUOx9W1hUB+4rdurb+zG/X/+bG5siilwT9agY5dfQWyl8=
X-Gm-Gg: ASbGncv+hm35iiFWWeRvKdX0Z83vXic1h/nXO5MLH9kkTSZjEIY90a9xZC1lmQa7CDD
	RroqKl9QUZFdl/9B07myUqJpxXbTr7pQysq6w/fcrUQRWJ84EnySuY4hXv9oJ96EGTbsKQRCabZ
	kxj5W+4CeRyKL/ntOlzbqrU00RjnEuCnfpjAkYkKry4HjrRS39BX9vBKT0GbnCJgB5qG6nZKG/O
	wzUwVubVyHTa/1oixci/WDEvyhsM7X5DhJCnimov01ciostFf0zhjmf4BGuSU+S4dUrHONBk2i1
	Gx+3OCULiePKw3r7ltIkp/fVpS6lFocv5Ah2tOuKdHaH72kcmsGSMa45dxnrj+9qpN4h8y9pmou
	f+UZmdbCeNsyB+3b7Okfnquww7CPd
X-Google-Smtp-Source: AGHT+IHK84mhAeYJUO60X9G/6jnyMUTEi3qcuoEP39r4Iheks7w5bAT6r9bNJMH9nKdB0JzRhkSGLA==
X-Received: by 2002:a17:907:d58b:b0:ac3:ef17:f6f0 with SMTP id a640c23a62f3a-ac3f00b5ff7mr1040036766b.5.1742769567137;
        Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:22 +0000
Subject: [PATCH 06/34] mfd: sec: update includes to add missing and remove
 superfluous ones
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-6-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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

This driver misses to include some of the respective headers of some of
the APIs used. It also includes headers that aren't needed (e.g. due to
previous driver rework where includes weren't updated).

It is good practice to directly include all headers used, which avoids
implicit dependencies and spurious build breakage if someone rearranged
headers, as this could cause the implicit includes to be dropped.

Include the relevant headers explicitly and drop superfluous ones.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 7 +++----
 drivers/mfd/sec-irq.c  | 5 ++++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index e31b3a6fbc8922e04a8bfcb78c85b6dbaf395e37..b12020c416aa8bf552f3d3b7829f6a38a773f674 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -3,9 +3,9 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
@@ -17,13 +17,12 @@
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/slab.h>
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 5c0d949aa1a20f5538d8baf7a8aefc1160ffa14c..3ed2902c3a2634a6ea656d890ecea934053bd192 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -3,7 +3,10 @@
 // Copyright (c) 2011-2014 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
-#include <linux/device.h>
+#include <linux/array_size.h>
+#include <linux/build_bug.h>
+#include <linux/dev_printk.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/samsung/core.h>

-- 
2.49.0.395.g12beb8f557-goog

