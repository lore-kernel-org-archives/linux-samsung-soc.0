Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABB9309EE7
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2026 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624419; cv=none; b=cKynjqF4SZJg35LKbjks8AWIdEZIu6AhnUUMtt2nDEQeNAylzRke7YBUQQg5QZRl4fQ114q7AMV5UnejnW/oBc4eHo2CNWqimdg5Lqc467UevjogfE6pCcly2IiWUpnTKMWD3iPUyUwvl/g09LV0ORc/beMniObpk0qSPdkz9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624419; c=relaxed/simple;
	bh=iN1raRxQ2qcF/ep1luk3AQflduCS+ipQOkFu+lrDcuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QvJD2hlJnrs4ZJvtk0SzDknitxPDHjHZwSREamYVfAcKWNh4iNjCQ+MP9E9d3hx5Z4Parm2EdWne/Q0VkQvQKTUr6EieLh/KRt9QWwvIc4o23JUCL7N8F75kiyn9znIoDsotpnTzaOxRo+AYWWA3w3uYoyA49pVdw9gfczbULoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iFk7N04c; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iFk7N04c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=QbkRIDt0qoYiA3
	XO98bAEG4jglboobxHd9T2H+sRSRo=; b=iFk7N04cl8TO6mkuDYPYVsx2O8GzUR
	UzXdbVmAxbwiFbu++SIoVEWvSBJZnYY7bBPK6O6r6niT+pv7IJv5pnNzpBhB6cCp
	v7x398eH4gOGpO+IPsafqbTcI4zPhBQCuEKhJWEvOlVewo45GFxU6moJSISYmp7y
	eF8mo9yIGRGpzLTo+aMXpo///wke5tjj/VNhSDCVFLWnEpsysyqc1j57BMw4WmNK
	Y/iZkz2hvv1LMSpLUOQpUwejlwAPNMer2647xxfHfqynH8J7qB2VnUM5UoZZXUfg
	F42N6wK+8wLO3ChhEworuX8mjVGgYaXN0WAfXqsUzP4ixzcNE+NaW7fg==
Received: (qmail 235509 invoked from network); 27 Mar 2026 16:13:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2026 16:13:35 +0100
X-UD-Smtp-Session: l3s3148p1@Ugjk8QJOXuxUhsJN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] mailbox: exynos: drop superfluous mbox setting per channel
Date: Fri, 27 Mar 2026 16:12:46 +0100
Message-ID: <20260327151332.5425-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core initializes the 'mbox' field exactly like this, so don't
duplicate it in the driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes since v1:
* rebased to 7.0-rc5
* add tags (Thanks, Tudor!) and dropped RFT

 drivers/mailbox/exynos-mailbox.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index 5f2d3b81c1db..d2355b128ba4 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -99,7 +99,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	struct mbox_controller *mbox;
 	struct mbox_chan *chans;
 	struct clk *pclk;
-	int i;
 
 	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
 	if (!exynos_mbox)
@@ -129,9 +128,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	mbox->ops = &exynos_mbox_chan_ops;
 	mbox->of_xlate = exynos_mbox_of_xlate;
 
-	for (i = 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
-		chans[i].mbox = mbox;
-
 	exynos_mbox->mbox = mbox;
 
 	platform_set_drvdata(pdev, exynos_mbox);
-- 
2.51.0

