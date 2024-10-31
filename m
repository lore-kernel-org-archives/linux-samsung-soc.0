Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA681AF4EA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386847; cv=none; b=F+gMIZiH0MDR9doMveswngMtBbmBiyzv7e2jrNWd+/V4wb08D2Hy1pXJhErJuFWjiQsBEuhPoPxjWB8CP7YgSIzuA+2wYlrHXnq9/LEujcdW19/4O2eQqBCDrLVeygjZjNaWGLRFW72TMsuPO6Yt5cEr+YcdABcTfp38VD8YKLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386847; c=relaxed/simple;
	bh=XQ6lVdO/7PywiTR9Hdfz8GxGAKaSLgkznc4FBkJ+NM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tCvJwJ5yAqvqSPgeFqNiyQ9daSBweJftTkPMQs2FYPvvU+ntwH+QBJGykaZw4c+QFCFhxKMNDMQ7kbFbzHiZqeKlRi7TpjDdJoH0MP1pKH5D1skoK+1n9h25KUWVILXYAZCE/UaicjgrU3zjxi3KaKoZCElR3Oz9EhJOMfqXBg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=stRWUVNt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="stRWUVNt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso8105995e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386843; x=1730991643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86sA0f6Os+pjSfGkaxQ4yImAusqnRJDENyNfYooIZr8=;
        b=stRWUVNtj92h6JuBdL2twBG59p0sbG907JY5I6oDD9EnQn8C4KjvIv0BASLSOf8hME
         ECLumJpwbGt0LcNl1WaxD5BU3WxAFReEKmp9c/VfO62PGozLSMPaqhCZBpT3mJNfxcmV
         dKtSouMpzFjur2WGto6RPQuQ3czC5MkWdx7bx8QioNmD8G4iFdmass7oqOw3xGzHfddT
         YoY5okkbA9xZquVZyN/2VuKoo5NKibnnBdpW3dMeQCIz5ShbhA/hDbG9sCUb6M88OX5x
         3ku0nNo4cH7EWnZvSM4zAO3rE6sN5GPA6NDMFnuEx1QM/5qxPNOc84M9bHe07ZqqY2TI
         4Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386843; x=1730991643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86sA0f6Os+pjSfGkaxQ4yImAusqnRJDENyNfYooIZr8=;
        b=X2dW2FOK0amM5bj/yzBKi9E51ybLyJNWdScoO5p6k/I8UceGhRoFiBs3Rwd6nbW36m
         Lvb2Xu+ALDWslIkRrxY1TSLV82RcVRhB7zO55HnfXS3c3q1DAOIeGysu8hjFfVUywtc1
         gqYjyRqEpdtCAEAi1eyALABOIqG+NJqXUzGeOoWRnCKgVfB08I+hevjrdBXE780lyCNm
         RU/0JEvtNoyeFuIVYvvH0gQkH5LQJjthdpOkFKOQqDl/ZyU3HtmHo3VHE7D+1oNM5Vku
         sLAYDBJEwdA7pHiYRpAQQjsb4J2DNSemXkx8EOaHERNx9bNi0/6d3Lt/9fMyOS9J0ar1
         vh/g==
X-Forwarded-Encrypted: i=1; AJvYcCWg9sQh7QeHsBLxfBRJU9yLARiXRO6kOxSjBOEFKID7G/wmJQ/4hTOMkVlW6zvhKwubrlRVvgebdFN3B7F21Rk0wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuCCB40Vc+tJO/Gpefv/NfZeCYVglfKE8YZYGw51yoK0j0Y6xr
	0/kMuGTltG6uVQR6KrV/eqJaHG/ggZ/+DLJMa/UsR7k9StdTH7142R6AC4sS9Qg=
X-Google-Smtp-Source: AGHT+IHBzn01GkaFrVY+fjAehvpLRixtUxLHicSEaRnq3vqepb6mFx2FPf0yhN2kuBANtTE7+uHjZw==
X-Received: by 2002:a05:600c:46d4:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-4319ad049a8mr154531185e9.27.1730386843327;
        Thu, 31 Oct 2024 08:00:43 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:43 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	krzk@kernel.org
Cc: tudor.ambarus@linaro.org,
	ebiggers@kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 05/14] scsi: ufs: exynos: gs101: remove EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL
Date: Thu, 31 Oct 2024 15:00:24 +0000
Message-ID: <20241031150033.3440894-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Auto clk control works fine for gs101, so remove
EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL flag.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: Adjust commit message to use imperative (Tudor)
---
 drivers/ufs/host/ufs-exynos.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index f4454e89040f..2c2fed691b95 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -2138,8 +2138,7 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
 				  UFSHCD_QUIRK_BROKEN_OCS_FATAL_ERROR |
 				  UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL |
 				  UFSHCD_QUIRK_SKIP_DEF_UNIPRO_TIMEOUT_SETTING,
-	.opts			= EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL |
-				  EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
+	.opts			= EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_UFSPR_SECURE |
 				  EXYNOS_UFS_OPT_TIMER_TICK_SELECT,
 	.drv_init		= exynosauto_ufs_drv_init,
-- 
2.47.0.163.g1226f6d8fa-goog

