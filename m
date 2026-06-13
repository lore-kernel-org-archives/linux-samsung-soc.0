Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA4D223DCE
	for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 22:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781390218; cv=none; b=ISxAcqznBT6IcjufJHCakKIacrN5jMRbDkneC84ytArtITyXP2XPJhrTZHJJQaVmBhzzqpjnlcAxAUKdXV20HRBWyz//reUMbpm8zrdPbthhdRQFS8vtqeusTKlsmfAYfHBNQp+hkzpEG5tnanAzi4i9253P/pLgKl3E1HiMJ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781390218; c=relaxed/simple;
	bh=h+tI3stwiGTxgkfAJhfASTTw8PeWJ3Lj02d/Ek3YFYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rryUQK+Q17E9ty632+yG+eTaOTPtmdxR//a8yTn8Krh9hxm+rVUojyuaFi7uF4cw2r194qbmVMSjRA5Zdzj0gSMNLSQLJGPp2hVTP3nxqzNOpP7gCBB1w6kplkRj4GyPYvf6bDfzU12UAFxLNajBotYDMHuUCJbbRMYz9AwY/kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcjYPqMx; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcjYPqMx"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-307631dbfedso4714504eec.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 15:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781390215; x=1781995015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XiDlOMwIBEzJgDCkrbGsmaIjHNUQPh0ynYvlELyCcHQ=;
        b=bcjYPqMxhp+FV/Htkto+EIASNLl02zQ3r1rMX6J6zcs/Y5MEZqwaUI0SWzwLSgWPfv
         jFtHPxCBP1e8ZxUgeEz2NySE6KigpuYQFqMzMxJyHcXhtTjqDxHrjIvOJLzTxV2afKF+
         qr1naiJCz+M4lbRwKcTrgU2d02RM+qww0ie4J35kRN3WhDeHL/c11snwF+MH7ta6HCxC
         nMJuHPADwjAQ0U4wlDvMif1reitbuMvcgUugXXkJBfqQ3NQ36uHtAuqEFFzK5Dp70Hgr
         ZB87j72loFPDEtoVXv7zIOHHMaQsngJjvcTLJpVvBCA29/qachtJSaCHPqzCIzpaE06J
         wqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390215; x=1781995015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiDlOMwIBEzJgDCkrbGsmaIjHNUQPh0ynYvlELyCcHQ=;
        b=KqUTmvDVgm6BjU4d4XilB+8iZm7QZWcXIths+ha8rILopUzl+8QK/UG/DecDJd7qSr
         hSRFKUP2b1jZI1WTaIQGdq9g5IF1W7kFKEoQoPt5IG6D3xUazT2M+sYWfkcPkxnTughv
         Ar+t8MlJ9FGxOG7j1SkoiBJyPiKTuqKj44NobbS8htqOneqBWIG4be+wHED7YKeTepEz
         qcgnX18RkRmJMnVl/EFNTXDtsFHEXnLVdFFeE+irXqqxttGZqkXP1bdCcYHiAKpAkD+K
         svyvdSDAOed2Sk8ALjZ5x/GP7enkixHGDW4VASr+vrV0q1PmNXArFwoOxQxpiQXKfb/j
         IP4w==
X-Forwarded-Encrypted: i=1; AFNElJ8zJRXhF9t8NtrjFthDT/vSd+l/xMhWNQNLirCLtxKQKgDf9gBYXgRdRfBNeVIygKhSFemhkB4s4hOpXAGYLaoizA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEX9zWMIP5S59kqkGkV2bs9SvbCHSlBYWb0S7SNQoBTq/wzlPF
	diROgsEAheK0+R6XQUSiEsGSbK13xrR+mPty3ZkxgjbdCHH4TVBiAAnk
X-Gm-Gg: Acq92OFTSHYVuMSLHIOj2Yg72yqoVxSZygHhXnheMiZbch2tutaYUieGMJREnm5EkxH
	+S+aBVyoMovB4/tJNm7BBkZWqaP8O/0CGiN6UV6KEVG2v1gLjQN+BXh5hFlYYgLFWg+4wHRbCLB
	ETDaFsn3ebf7s/MBjAzQhXSEUlOUQ7aV8nG5soVDrmcC5XFCZTp1Tr+vB2kPEqireVVB2YOxUAh
	2Z95gcPZzd97Oxi75+rPSGMEtlDh38e7lCuLGrqs6uQHHdtZ4dFpyJRLoNzmQiVC8qfAn3tGsZy
	n9t8hQxtTbq5oM8IhVViUGnLcSjkoLPZjRKaYKnQLyA0w05HDsYWR0ddgQWMvx5GH++222FtVo+
	plUyhHmEkXYxLFD3ikfzellaoUpEgG9E57B/P7M28yQpHSeoIrF69pvIJl+sfTbLnmPkKORV/w5
	kASQxw9b5AopiuzxxD/bVILsFAeZNAHZEexlExyj51XIgFkKzCNjg0iKgRKzONhRNjnIRVG0uDW
	l54EY0wodLse3rFKAqZWHROOuTUteWA2BemrOyKgIg4K/wX8lzwA4YtNuRLfE//DNlM2QHnPYNN
	zDwBeJJBhDpDxDWdUue9+Wo5rpMY
X-Received: by 2002:a05:7300:6d22:b0:304:e2a5:689e with SMTP id 5a478bee46e88-3081ff40814mr4819684eec.2.1781390214752;
        Sat, 13 Jun 2026 15:36:54 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm11091739eec.28.2026.06.13.15.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:36:54 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-crypto@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH] crypto: s5p-sss - correct CONFIG_CRYPTO_DEV_EXYNOS_RNG macro name in comment
Date: Sat, 13 Jun 2026 15:36:47 -0700
Message-ID: <20260613223648.119694-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment in drivers/crypto/s5p-sss.c incorrectly refers to
CONFIG_EXYNOS_RNG instead of CONFIG_CRYPTO_DEV_EXYNOS_RNG. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/crypto/s5p-sss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index bdda7b39af85..9bb1b1661174 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -2151,8 +2151,8 @@ static int s5p_aes_probe(struct platform_device *pdev)
 
 	/*
 	 * Note: HASH and PRNG uses the same registers in secss, avoid
-	 * overwrite each other. This will drop HASH when CONFIG_EXYNOS_RNG
-	 * is enabled in config. We need larger size for HASH registers in
+	 * overwrite each other. This will drop HASH when CONFIG_CRYPTO_DEV_EXYNOS_RNG
+	 * is enabled. We need larger size for HASH registers in
 	 * secss, current describe only AES/DES
 	 */
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_EXYNOS_HASH)) {
-- 
2.43.0

