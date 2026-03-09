Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A594368284
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Mar 2026 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042145; cv=none; b=WeEQ8m7HUn7P+ykw+nOCn25QNmgonLvwYzV/at3+4sCvEex2Bx/dWpU/dpJ3vRaLhFJzw8S+e5yocASLM4QQrG9+vdjT6+odRe7NarFckUSYrulgUti0XgIif9AeFA6pO36UIHelrEcdkmt1cwaklTdfEZgaJw4iIunEmvaZEfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042145; c=relaxed/simple;
	bh=wLT+P5immLGtGSbMvGWE3RVKTFujaWsLE5OCjzAKMtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=alQqqRUw2dB5K0GhI/DGQx4BU+nabR1/+L0yBI1tknIOS7hf+aTdJmUvQPlhlN1rtNjDSx0hdDW7giiztPdFaY+XPbcWuZ2K29QRXtsYOSqHaQDcbXz6QvMm3/AOwKDO8mkciyFCmePyexyczkiqXZGyaOpvh1XGzCfG7E6iUqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bYVfChgS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bYVfChgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=q/d+PubUJJgEQn
	QuB6s6hs0XHW992roQ6Kpop01fimU=; b=bYVfChgSsYZZkfABSlbgLaAeIVlgRg
	ThOO34tnNRD0XaJoWrBZpmsLlNWvpsnrijWABsml/Hr1bB3qkMJjimHJ3CH01+xo
	KqVdInUu0TFeEcQuLTO5qhsUCn8n228U8Z1eHzl4K4ANAEHrDyhU95PzueWUcaOh
	dVZGHfnz7Qziun11V376dXlteOH6Lhii0y3wpYJakIYDXH44oroumW1HJ/J0iF77
	mFtXoqca9oYtSmWH8HPb6zn0YUpoiwBjg1+KHF7hXUrmmHxf7yL7NAIhJpoNeH9m
	/Dhz5W1Z/tLxt557jtjOkD6emhSIQiWJSBq1DrMRCiBdoam6leGF53iQ==
Received: (qmail 2669355 invoked from network); 9 Mar 2026 08:42:21 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Mar 2026 08:42:21 +0100
X-UD-Smtp-Session: l3s3148p1@K4v7ipJM+LQujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFT] mailbox: exynos: drop superfluous mbox setting per channel
Date: Mon,  9 Mar 2026 08:39:20 +0100
Message-ID: <20260309074210.2279-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
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
---

Only build-tested. Found because I made the same mistake in my
to-be-upstreamed driver and then looked for that pattern. Testing would
be still much appreciated!

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
2.47.3

