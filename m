Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CE416F262
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Aug 2024 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722894701; cv=none; b=NuhVIq+u1Ri2XLk+NM6WQ8HBUYDv0hWuZeZ54F3+ND53Ts1JVniTKg2vG+/w7JHoGKEHZ+7W4wZ7w6ef65IBBYDUXPrlgBFIt9IqlqwlZr0Ir7N7NEOh/Yyf7XWAo/vKzy/luyWK+/Gghad6SwYsfLLFHNPL21GgZT40ukBm+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722894701; c=relaxed/simple;
	bh=x7Y+GOviXWzZ4Xq+laSowWYOs+2/GtjEnwN0+rBCfvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UvQPrCg9vXp/GT2vwqy+I380AWRoIQT+5hGvqO6IpfJu0QUvv24cFaAnUcbhgjynw42GkF6fMTOvZMPvSmPH2XN2pGbJYjh3Bh+eomNcKstQ+Lj/rQQ6iW3lANQR9f6SBCtAJpKr9VyNIVllwG4tPt208MRXMNeFaG5Tc8ZO6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HSd7pA21; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HSd7pA21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=J0bLTIuU/Mhn2qog1wsVS/0//rPwKleWaM2YFI6mOes=; b=HSd7pA
	21WJKhwN3nsHQY+m2evdIQLwd5ET7r3A6BP1WXuVV1/L/z0cvx9QPmSVZ6mDl71d
	P3fi58TbaBg8+VfpV07pZaubTrpmGOl/lBUsudv850u28/fTLnqmp3PhSQNORaUN
	gNh9C7dZhzL/8TLTPIDyK67RY5BuFvf6pYWJGOjd/2ixABzlo9gr2E0zR0GU+PUx
	61kq529SB3SREb56IXd5uFCCi6tfj3JddibXjtcjemt0Ekr+I1Fbxxlu7Qzyc4L+
	uSXiUuW6xezYw25NbiRD9McaCHEzuWfJF5bnQr0ncuRkP+sS2Y4bkUxhwRjPc4HT
	lyH0die1o2nUOU2A==
Received: (qmail 18215 invoked from network); 5 Aug 2024 23:51:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2024 23:51:30 +0200
X-UD-Smtp-Session: l3s3148p1@oJr5rfYe8JpehhYC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-media@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 5/8] media: platform: exynos-gsc: use 'time_left' variable with wait_event_timeout()
Date: Mon,  5 Aug 2024 23:51:18 +0200
Message-ID: <20240805215123.3528-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
References: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named
'timeout' to store the result of wait_event_timeout() causing
patterns like:

        timeout = wait_event_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the
code self explaining.

Fix to the proper variable type 'long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/platform/samsung/exynos-gsc/gsc-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-core.c b/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
index 618ae55fe396..f45f5c8612a6 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
@@ -1225,7 +1225,7 @@ static void gsc_remove(struct platform_device *pdev)
 static int gsc_m2m_suspend(struct gsc_dev *gsc)
 {
 	unsigned long flags;
-	int timeout;
+	long time_left;
 
 	spin_lock_irqsave(&gsc->slock, flags);
 	if (!gsc_m2m_pending(gsc)) {
@@ -1236,12 +1236,12 @@ static int gsc_m2m_suspend(struct gsc_dev *gsc)
 	set_bit(ST_M2M_SUSPENDING, &gsc->state);
 	spin_unlock_irqrestore(&gsc->slock, flags);
 
-	timeout = wait_event_timeout(gsc->irq_queue,
-			     test_bit(ST_M2M_SUSPENDED, &gsc->state),
-			     GSC_SHUTDOWN_TIMEOUT);
+	time_left = wait_event_timeout(gsc->irq_queue,
+				       test_bit(ST_M2M_SUSPENDED, &gsc->state),
+				       GSC_SHUTDOWN_TIMEOUT);
 
 	clear_bit(ST_M2M_SUSPENDING, &gsc->state);
-	return timeout == 0 ? -EAGAIN : 0;
+	return time_left == 0 ? -EAGAIN : 0;
 }
 
 static void gsc_m2m_resume(struct gsc_dev *gsc)
-- 
2.43.0

