Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6835A261364
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Mar 2025 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742830457; cv=none; b=j5Qx2h6zd3mX6uupjfkJmtMBatlPO5NpY8866H/vk9r7Z3XLsRf7p+1tYU8Q0VlR4TuDk0KfWIlwtJd8cDlEVMWH0T8ULdvHbFb36K8D3gWwz1swz2ouKyg1XB+qcdsHj0yTQTTM7pv5DdO/P60Aoh3X6neG1XWISwSUx+vjNas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742830457; c=relaxed/simple;
	bh=p+IEHY6sIvNuhaTNsK9FWIQI5zgZXUPtd8JCLrJBLgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IcOm0EIHoqi1kdueUobuGG0rZyLoRul9dB3UHdgqmcadeNUeLKGwfe2StKq9c3ZBx/bdO0w69wem7IoOzpYSZQvCvHNBfqYDKWvDfc7870XJtRT+C7LweaqgfmFvbLjClZO+Yg0Ft56aVgi6DiG/6iRthwzq5Lpaq9mpy9OomcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JPDDtA3X; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JPDDtA3X"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso443088266b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Mar 2025 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742830453; x=1743435253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKFz6eLJyqKb87mD6Fpb+y2pLdxHOWnaVFUS6QOxr3U=;
        b=JPDDtA3X8G312iY7/8My6dM/WbxOZMIAZ5BWxjFabqZfBAX9sDnHDH2YVjhgRMYadr
         09OD6CbDAcsXi+E/rjxPo72QMerMB+aNeHDnaiZyJjC8kkmmVp5jvGFdwsnU3UJL1m0O
         7WFyG5mbxI2boYo0Sehoxgwyj9QrS2HDTq907+EsotJYeVnF8ZVNxXQb0wLjG9B0tD9a
         JY/gKyVTtVm/NwhIPmgVTEEjsNjmE9GNP9zjxgN8pGULG/oWXhe7M9pFJtZU0jtGillR
         nPCvCVSAfBX8bdQXu8x9njD6xno1n5icoKwu9mK9mO68nUZ0wguGhoWqtkS9TTPMG5Oo
         1RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742830453; x=1743435253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKFz6eLJyqKb87mD6Fpb+y2pLdxHOWnaVFUS6QOxr3U=;
        b=sWeQVVXriiRxDLzLuvhvZuZ9DozAFMlLqs7LbD6tjBt9D3xqY0417IH65eToCjdDL8
         iZbOdq6PsUHaktFwDRVO4Z1xaR8jM2J0sBNGzm+IFr9gFL1EQ8qVxZtUfMEjKrPnqKMd
         ha15nOgAMWgUlM9VpgkotnuGYAxYMa+TR2+8l+xcEwDRbQv4IZu4yQ2K1j678koii5cu
         0aq/VMuCFyw2CfqtWWC1+aoJqQgTyu7nxZKwnzwNDylOe0vlWJDyitqjptLvqJgg177W
         diYsF22rRTsBMiSkr1nIKcbEYPi1Cj/0n7cC046pY3j34HzjrPg2Oj3D7tfbKL5VSMW+
         5hNw==
X-Forwarded-Encrypted: i=1; AJvYcCWxTGgDYac0qfQZEy0YYD/wOsNGKqWOZ0qqnOBKRn0dhrmMvn4/FK3nl8DxXqSZwGB3Q8QXthoPPdPXO9sTHA3bvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgkz2nPZ0+WfAdXdTnyavKNv8f47ixCX4/FdXT7Cc1IDUrs62F
	tzgC8Ublowj7EfUnxYXDObe9f4pszlladb9JZtKN187zftWNJf4uTDngwlbUap8=
X-Gm-Gg: ASbGnct73vsAcujVl5wEK35aU7INOsuO/K9a8UktCVoZoIvEPDwNhvAAtr4aedgjfe8
	gK6JMwW5TyPKFInevOT9fazcrSyxzVxJSvGQDsRoYAn4rfwbYCkt40vUZRGSHI92LTcpKKH3mEX
	3xcZ/L3Twj9P3vw0O6Pg9Gx1mYCwLKsGzjS7ypbvesa3BtPzJRCvhx4V7EsqvUK6dx3Dpcc9I8E
	qdnkXpMXXCil3KaqJPhICa6KYUDTAH4QidFajCva4IQyaqSxeYOXsLaqjGhNOPtTnnnN4esdS2p
	EYz6nxoMBqvepg5Z8GDNNIUB6qoztQTvyAzO0B8ZYuV7E7XzkS2l/2Ch+YHUYkMpj9DbwClbBwu
	e8sZW3vwD0bYFu96lxb59BXuMzWk8
X-Google-Smtp-Source: AGHT+IErQhBX/WXUMuS2xd0b7MNJeantSHZ2LsehWbVB+frQPoLUYxwOawSJkU4fE0OO3vdYCY7DoQ==
X-Received: by 2002:a17:907:3e03:b0:ab7:d87f:665b with SMTP id a640c23a62f3a-ac3f25593b7mr1313444066b.48.1742830453430;
        Mon, 24 Mar 2025 08:34:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm690219466b.31.2025.03.24.08.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:34:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 24 Mar 2025 15:34:09 +0000
Subject: [PATCH v2 1/2] firmware: exynos-acpm: use ktime APIs for timeout
 detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250324-acpm-atomic-v2-1-7d87746e1765@linaro.org>
References: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
In-Reply-To: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

acpm_dequeue_by_polling() uses a loop counter and assumes that each
iteration of the loop takes 20us. It may take longer, though, because
usleep_range() may sleep a different amount.

Switch to using ktime_get() / ktime_before() to detect the timeout
condition more reliably.

This change also makes the code easier to follow and it allows us to
adjust the sleep without having to adjust the loop counter exit
condition. This will come in useful in a follow-up patch that changes
the delays.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* add missing ktime.h
* ktime_before() instead of !ktime_after() (Tudor)
---
 drivers/firmware/samsung/exynos-acpm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..542eaff03f9e39422a8c5345ca75e05c1710a9ee 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -15,6 +15,7 @@
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/ktime.h>
 #include <linux/mailbox/exynos-message.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
@@ -32,8 +33,7 @@
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
 
-/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
-#define ACPM_POLL_TIMEOUT		5000
+#define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
 #define ACPM_GS101_INITDATA_BASE	0xa000
@@ -284,12 +284,13 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 				   const struct acpm_xfer *xfer)
 {
 	struct device *dev = achan->acpm->dev;
-	unsigned int cnt_20us = 0;
+	ktime_t timeout;
 	u32 seqnum;
 	int ret;
 
 	seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
 
+	timeout = ktime_add_us(ktime_get(), ACPM_POLL_TIMEOUT_US);
 	do {
 		ret = acpm_get_rx(achan, xfer);
 		if (ret)
@@ -300,11 +301,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 
 		/* Determined experimentally. */
 		usleep_range(20, 30);
-		cnt_20us++;
-	} while (cnt_20us < ACPM_POLL_TIMEOUT);
+	} while (ktime_before(ktime_get(), timeout));
 
-	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx, cnt_20us = %d.\n",
-		achan->id, seqnum, achan->bitmap_seqnum[0], cnt_20us);
+	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",
+		achan->id, seqnum, achan->bitmap_seqnum[0]);
 
 	return -ETIME;
 }

-- 
2.49.0.395.g12beb8f557-goog

