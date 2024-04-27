Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037041487D8
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Apr 2024 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250186; cv=none; b=OGLTk1cN+h1g0GKbC91TFmF6j5qQ3qyyAPNyJXSV9PUY7PWUXSWm+2J85oHC6eD+JpKy4sZhyGY7U0Oy4aZlzKLnDdHdYUYOIHVJSBdLAZI7DtBlJbfTTS1uo3zfK0jeLJAD7RmJY1RXco2L8L3+3qP7OpdgZTmj5Xhpgnps6rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250186; c=relaxed/simple;
	bh=5bodQvN8FujH0DNsbxAsErbliMjmBltn92WZuAMz57w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQNAXCpG8duH9DhUT2yupONvC7aQ3y6dG2bS3ej1GS+d39bPABFAmYNXXRqIKdrgNuCde/FIH71J1dnIop9UBdcJIvt3JlPOBFqoXNgLN+CbAaQ+0dhEoy2v8IUXbrtxpJxVZjCOweRZs8Jg0rUgDVuPE13JR7FSxEoMJ+2LiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fJiHsU0F; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fJiHsU0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=2F3yQc5OYq/TjttbywN55Gd7XF7kO1dQ9WqJ4zJk1sI=; b=fJiHsU
	0FrDuj2rFjcEbPa/eFwf2/IKpYn2fIMHQmySsrwP8DoakwcW0k8eSgz7Sm7/2pxJ
	RaPpfO1YZg+tyPq84O8nUBNIUH5VQK+QNGiizJ35zDwL47RUQlonvtZsPOY/UbcA
	t9ug/su/9zwYFCGRPxLz4gfeH1ITq1viJBYOmVLBKaZukMTsdl93JIaHaSp/I7MV
	NMMOdwSA++ql2q3tNkY9t9/sfFcleDLqoBLtwmMoHuWbPqfPZzBY4zhJdAHFsrEg
	B0Or6avYVZKuZci2VOYxuXtqQhj2yDvu3tBDbJ2nv7/d29ElcsmQyGGDaZYi3VId
	TCIHT6pvTPCDxt1g==
Received: (qmail 1781878 invoked from network); 27 Apr 2024 22:36:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:16 +0200
X-UD-Smtp-Session: l3s3148p1@bqHO+BkXwo9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/15] i2c: exynos5: use 'time_left' variable with wait_for_completion_timeout()
Date: Sat, 27 Apr 2024 22:35:55 +0200
Message-ID: <20240427203611.3750-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 385ef9d9e4d4..d8baca9b610c 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -763,7 +763,7 @@ static bool exynos5_i2c_poll_irqs_timeout(struct exynos5_i2c *i2c,
 static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
 			      struct i2c_msg *msgs, int stop)
 {
-	unsigned long timeout;
+	unsigned long time_left;
 	int ret;
 
 	i2c->msg = msgs;
@@ -775,13 +775,13 @@ static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
 	exynos5_i2c_message_start(i2c, stop);
 
 	if (!i2c->atomic)
-		timeout = wait_for_completion_timeout(&i2c->msg_complete,
-						      EXYNOS5_I2C_TIMEOUT);
-	else
-		timeout = exynos5_i2c_poll_irqs_timeout(i2c,
+		time_left = wait_for_completion_timeout(&i2c->msg_complete,
 							EXYNOS5_I2C_TIMEOUT);
+	else
+		time_left = exynos5_i2c_poll_irqs_timeout(i2c,
+							  EXYNOS5_I2C_TIMEOUT);
 
-	if (timeout == 0)
+	if (time_left == 0)
 		ret = -ETIMEDOUT;
 	else
 		ret = i2c->state;
-- 
2.43.0

