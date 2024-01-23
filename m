Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18581604A8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024074; cv=none; b=BfF7bpHpmYjYKM1TQxZUuzLF2ER2zM9ncrjiXBW7xdJGOgPdk6JJRy6Uzq66MK5qxM68GZR8V8UUS0ilbYEJ1+Ngz7ZkcYoOQ6VYKXgmvY6wsKojpIwzvNRAdpXQbdwHJyv2ortKg04G4sb+j6+qeGf5SSqAublXhMwQansIOQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024074; c=relaxed/simple;
	bh=yG4gZxYa79HahCfvc6InRnmHlNSFjU/8GPPNK6B+dSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTzo8kdp2c4efUhspg1sti4kp89/rCtriF7+hTctL29OFBrSpt7VGxT5GY+C1pblPudciHs5yaVajEatun2Gu3BOZlVCtEW4mtqR0JvNrG73Z8C42HTHGJ4VQPeeCvTBDMqGsPlLkK/pqE/T32xqvAqOxJaFuOzOMmq1IowxZRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9hQwN2I; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9hQwN2I"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40d6b4e2945so53272675e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 07:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706024069; x=1706628869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OHi5EgWCeJpCVpQQS24DPa9E+cj9YStk/+6+6uJiCg=;
        b=k9hQwN2I2biGzbOtoHY5qnC5w1AVn9rzJ96gggXEarAggq1SF7rbNcPLQ+Px0ZxHQG
         IbMeFhLj+VDI1rZda7FJz/wrsIzuxZ1e8ljGSaw9b8BdD8ZKnxt6YZhxstYiMqupbnJ3
         CzziWBhjBYnGk91vYNkCpEUGfpohXjmkt8pZ2ylb14+SX2WsQ+RuZ1JRMafBa+j1UHUz
         wJ0pw3X/VScP01U7vqs2oA97ttnTHa9YEN2vNNrTzUCFf/ooEAoOfWX0QkFsDfiTUyvH
         tpeT0lazshYVXJuqzMmFBsXwyGK1gImmEMwvRlC2NmmfjNgzdVr3HG3vryXmIe9B1rXD
         a+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706024069; x=1706628869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OHi5EgWCeJpCVpQQS24DPa9E+cj9YStk/+6+6uJiCg=;
        b=f6CRRzjJ6PSfqadyrn0moQ+NPhkXdjq570vIZMbetCTf2NFrHeQvhpJR+g3sKUqHvw
         RsseZkoZtZP/bxYJA4XxX1IAaok0JKvTu2bGqwMZfxBtKbl2eJwAPBWN/yOpJm/LlD7U
         eghEIVoplTlwoFY1rqxjguCldad7PWlefjRiYJIoOWQvmmeUoMwgbqW1bzhVUEetzhZ2
         uKWWekBWdZXYFJ1LxZH+l0wuU6OM95vuuGQLnGUNx9liJRndImcQNqFMM3Kd+ZX9XCO/
         g41JgdoZvajva4e3jc/8zv8iAe5gN6T4aZeM+0T0/hwiTvhntUkPRLM0XkZu0J1fOqp/
         ZnYg==
X-Gm-Message-State: AOJu0YwBAN4UZXOIUdMD6Im2kB5qK4SfO3knirNuOFsfsQk/bPZaFxhf
	gie03sAWdNr+srwL5/E5G3WPTR9MC0Y7jW1yHzjv4q70QrPEbuMqRfu/uxVlU0I=
X-Google-Smtp-Source: AGHT+IEW8wM8jKrmBHWu9oFzJXlcGywLUYOu5woE/V+wgfwbWwJGW6Xexs4KhMhkqwE1PVcIdJYUoQ==
X-Received: by 2002:a05:600c:2053:b0:40d:3afc:9263 with SMTP id p19-20020a05600c205300b0040d3afc9263mr175292wmg.104.1706024069457;
        Tue, 23 Jan 2024 07:34:29 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b0040e3488f16dsm42457536wmq.12.2024.01.23.07.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 07:34:28 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	arnd@arndb.de
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 05/21] spi: s3c64xx: explicitly include <linux/bits.h>
Date: Tue, 23 Jan 2024 15:34:04 +0000
Message-ID: <20240123153421.715951-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240123153421.715951-1-tudor.ambarus@linaro.org>
References: <20240123153421.715951-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses GENMASK() but does not include <linux/bits.h>.
Include the missing header, we shall aim to have the drivers self
contained.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index b350e70fd179..9ce56aa792ed 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2009 Samsung Electronics Co., Ltd.
 //      Jaswinder Singh <jassi.brar@samsung.com>
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
-- 
2.43.0.429.g432eaa2c6b-goog

