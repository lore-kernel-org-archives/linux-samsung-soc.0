Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B7625B090
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Aug 2026 04:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786422842; cv=none; b=H/YWPW8AnwlRqP9Q/YCuvgDNYoBpu8iRF/EeyRPRKp3TLNgxxJpAiMpBVfjQpv2ndij8IVBKWrVtCQZ5Vu6Pf9YdqpNy1CD6BWORw/o4wostoL6z5qt/0Y38YUA1qPr5nwOBSuI41pfF/Kj3AE8+tHfSTiwZCupAixiGLeCacRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786422842; c=relaxed/simple;
	bh=ZLd3J8PVEgNl+BzJCfVDHPTgZH7fT2L0z1Tal1ZxU9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rV8xp7r4OiWjNB7DKdHmTTgCVkiHQi5gEZszUb2ws0KIuf2gkCHVVfy1e7bfAXKa6vvq8WuUBuLUrifNzKuSRkHniSjOB1f+o0sks3JSIL1GyQA9m98JcxsY4J0rt9bSVFw8ZhzPRjWmK5jTfCAd4oQSV+xdwAWqPAuOANWP/A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5tpE7tj; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5tpE7tj"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d02b4c3601so29483345ad.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Aug 2026 21:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786422841; x=1787027641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8x8MJGnJddsyIz1e4nFOatZ7XGejclv30uKfFBgm2PI=;
        b=U5tpE7tjyLpw/c+5WcXk8XQVuckyjXAW0B0YaiRGRXYNwZHlchLJijojmem46axHWH
         b+Bq2Bqnshekd06XeDnNiDGMcWOXKTecwpm9UQ8eb5SotcaHDp/Ql1jlH8025DKz0BwI
         OkttdpTWWDKlGnJIAziBR++Px4l6n5QQL8uZH02dARTY+iaeJoZGdoXicuX7TZYXdZ+H
         PQPg7pgHuZ0WpBrpgnNgRQSerXItAFJQOOoe/t8yL4A+nlaD3VhQh/eP7hxcLRkLpm31
         tzxKQNiNOo7PRoFtKjjcesBh9DD7yqrkqvFtQr/zDTfIliAUo7lHN6Vfy9D0mAlRdoj1
         mD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786422841; x=1787027641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8x8MJGnJddsyIz1e4nFOatZ7XGejclv30uKfFBgm2PI=;
        b=KQ36y4MsDc1K8GAt8EuYwk6OVpdtzcpvnKWRaLbbcNnHyzrFOiSaRcBDvEsicHTKor
         3YMYgfzK189oZNgtJjuKHneQgWABHwGneEJoUl1wmWRArG7CkXbTXdrsXlMT4y1GGKNq
         PGWh3rHdW/J+osKKZliDqNFSW0nrqBspzerJ0/3FGW2Q0AYlcoydRZM4EzFbkJl7qBgX
         81492iFjkHYCd7PPhq/7WizSyEZT/2fkuarA24CqogfLfpVOLRTe8sPFZJusIhFKufFC
         Oo6FRSbgOCwtgUDNqvb0443XpGi1SM3pk7BBQxAgS+wyj8xYnYNroB/y8dWuYPHmIwJM
         TlfA==
X-Forwarded-Encrypted: i=1; AHgh+Roas+zU/tT/tN5QTLBSVV8/xnqVe5qJRfFlQFOXg8Qs8hjv1H9/irn3n2dc/JFRXniE7uXS2qHbtQHPj66kKzMoNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ96nCdWv5eqWmmGKQQiSf8ludXwPN9d62i2QKTx9EL1vIbUPE
	+Tgc1WE/zAZ5YUPidf1a/V+aTLqsaXIuoaUqWWQZdCv98wvtRQFMms6TofLfdw==
X-Gm-Gg: AR+sD12gBNzUtorTn9DWrxqFUzNZYMKMBadMkt6KkaTLAmUu0NOWzY8AnPxFZN4grF0
	fJ+KVFWXUBNcB0gfIPKsamnezt1N2u1+8UzGgbheFBJKILp9Lcu7FIcDlHkHCwXEG0Q4KjrOhjk
	NqmDMu9CG6gqEtVac8/EkWt8Dz401jCrlJHczLc2Bd8kExct0VYA48tb4aXBDyF/7JBIdxfg98P
	WTTy1yCupTDTTkggtOKfhxYxSN4m8DV3Pg6s9/UxBU3e9Upzzx92FRoas0YAulSDtGzCsYggKLG
	Hle1amJVEq4GKkSvIEsCuGTOiK5nSVc50u4s0jex1t5+N9h06Qi9AQ//7S0CIwGdX5e82Cc81se
	UBKSnrx4IZZ1DFauTuAluZmnvi5HRJx4jGPcJKXgYtdCA+8kha9msN8MFV01w+hzXMdubPxwnPX
	Sk0O3+IrxlNPp80HykN/sJgUPYjGw7M5zkmr5VArIH5TvuU0hD0JqK7lIMGW1+i/nju4HObgLhY
	9MFK7f8xBxguBHCIhGt3cWGk4on5TVWbcCfVlCXhWrrZfril1pmU1Df5kozF1HtIqZx5SPyelqJ
	UIuq3Q2yJyuti/8IltWGxbfqR0fLbuTlMZP1sQ==
X-Received: by 2002:a17:90b:3d89:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-392ec59c589mr647621a91.11.1786422840848;
        Mon, 10 Aug 2026 21:34:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d537d905sm1823331a91.14.2026.08.10.21.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:34:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG S5P Security SubSystem (SSS) DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] crypto: s5p-sss: pass s5p_aes_dev to irq handler
Date: Mon, 10 Aug 2026 21:33:58 -0700
Message-ID: <20260811043358.136042-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The threaded irq handler takes the platform device and calls
platform_get_drvdata() to recover the driver data.  Pass the driver
data directly as the devm_request_threaded_irq() argument instead,
dropping the platform_get_drvdata() call.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/crypto/s5p-sss.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index bdda7b39af85..f20c02e9d646 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -638,8 +638,7 @@ static int s5p_hash_rx(struct s5p_aes_dev *dev)
 
 static irqreturn_t s5p_aes_interrupt(int irq, void *dev_id)
 {
-	struct platform_device *pdev = dev_id;
-	struct s5p_aes_dev *dev = platform_get_drvdata(pdev);
+	struct s5p_aes_dev *dev = dev_id;
 	struct skcipher_request *req;
 	int err_dma_tx = 0;
 	int err_dma_rx = 0;
@@ -2221,7 +2220,7 @@ static int s5p_aes_probe(struct platform_device *pdev)
 	}
 	err = devm_request_threaded_irq(dev, pdata->irq_fc, NULL,
 					s5p_aes_interrupt, IRQF_ONESHOT,
-					pdev->name, pdev);
+					pdev->name, pdata);
 	if (err < 0) {
 		dev_warn(dev, "feed control interrupt is not available.\n");
 		goto err_irq;
-- 
2.55.0

