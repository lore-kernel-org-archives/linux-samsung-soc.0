Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626CC271800
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 22:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607477; cv=none; b=gRJUaYxfAPs73ryCcv5mFi+N3LrMulZw4oFY4Ravdt7kL9JD3P3OpcDp7S+L5MGQLvGAu0uA4rf+VrSOnM8ILnBRsHp5XWjENPzoF2yXVkOGdLW8CJvoBvz5xQCrnQNCGV/oI6QoECCBbvpJXG6mWUF9lwoKr17NUgUdPG3HJvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607477; c=relaxed/simple;
	bh=qiJ5NgMCW+3w1jlKpr4Qxl9Za0XkMmw59lyuniMavhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sR3OOFjZmD/npAxhWYeKeEmSst3LcWvCOBkC5LVEde8/rftntpaVd6SAhfHshJELsobtcpkDiY81WSOtM2pCesnPbuXblHXpakyp2YhOJH3ATWsJi4S0pp52yqm9DgZMeZkmxYOiDdsOqbsJqb6/BJ7Wz4vFrIc9fMZOpuduX1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j+I8pKwq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j+I8pKwq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220ecbdb4c2so5382395ad.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 14:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607471; x=1741212271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVSwZvqHp4KclUxAlGtZReiZmGLJRUAId7nnJAavdso=;
        b=j+I8pKwqaYJqCfqWZPsBRXvs4z07NZzQ09hIeY4Ya4cnMLbZIoBpftqQcXWk9D3lV3
         +THBIzqAdjZR3tRWr2IshtH4m/jE5BAPazAzQPgbLAjzCUsJcVtxeep0gGDxGbmx2gFL
         UsjaQDjc6/OhoIQc1vTilF8BBbcyJ8NER0ukGUsIElskI2DclsMoaeK+i0pe9H1zXmNx
         wCfQhldsdjvTSryXVjap7/PH7/i9M+/pzMMNd1rM+yklqTwoM+qX4a6SAsuY889St56l
         1kXXOWoLOMOIQKT4RD8SNdfqT6A/+oRLo35+WtXfd54sCr+s/+KLcHR2gb1wNqeM5UcH
         MMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607471; x=1741212271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVSwZvqHp4KclUxAlGtZReiZmGLJRUAId7nnJAavdso=;
        b=INE+1rlNzlLAdLR2/TvNy278KATIyaRzsoEtosa0Dtoz42JdPfuXkK1yXxYdTG6HXc
         /mqHSKst9630F2D26Ybu84gBSe84+NlTjmSFJN8Dsofn561r82o1USLCOohEtErGnaKl
         WH5Ym+gfmeAwdO4zLna0FYGdIdK9N9f0breL+rpANwCoZlLutbMga35+7SlA3cT4ADuV
         WhI/8CSYYl4g1oE5103PUtulclvS8APMrZ+//tE5uol8CFvLd8IZKBLGgPndxR4j025P
         wLTsM0ar/n3/Qqz89V208iZeQRQYyl1CrBBLHD9GmuWvUd8oqrKdq2Kh0QIwN3VugI7S
         heoA==
X-Forwarded-Encrypted: i=1; AJvYcCV+kSFtqflabHq28Drkg38c5b2BzvYR+PowYiTyqpZFZ1wkfkYfALtF+wOIfPlEyl5HPSuxhEy6PFts1bfMRnB7/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzgupo5FwlTSYmMWNyrLFm9tOpSlhUX/x3DrHyW4uJP20tud7J
	qNlvGkvpn+wqIByINdSkKrwj61mc6qhYb7CVuV6D5Yp5XkNcy+xAWti+b7Npy3I=
X-Gm-Gg: ASbGncsljvMPPJCWiXZR08ZA8hLB0/aY02xsDGoLL+5QDSJowdjW+CXAOSMhxGhxG2O
	iZq/5LR428EMrtK1XSGBOZZ/3wA9mWEoe5/Lx0glZTCvlGq0Lmgg9FEZ10/Mq0jxKS7ImqJLl3k
	nPUwwa1NUzH93c0eGT9JcnyX558CYormk22fp+u2qe8A6tBGMishfO5eLes8gn+vKaVhnWLz1ZP
	5QM+ljFMxurWBncGIFsncYUvLliNegQ+ojAtyg/zqq/cHk77pCAya4cvAd8z7TeWi7RW1nkSllk
	LizbZ31pCX329nADnA2Ey5k8GKFtg+tJX56OBw1cFeFd+Clhp1RykuXu
X-Google-Smtp-Source: AGHT+IHv2DLo5yokOufzr6ieTPFjBCf/BVk00fjUAV4YbzWaoAbBY7sSAOQrP6QEylsN4Iqip6zQ3Q==
X-Received: by 2002:a17:902:d2c9:b0:221:f61:14c3 with SMTP id d9443c01a7336-221a0ed8294mr315855585ad.18.1740607471584;
        Wed, 26 Feb 2025 14:04:31 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:31 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	krzk@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	ebiggers@kernel.org,
	bvanassche@acm.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 6/6] scsi: ufs: exynos: put ufs device in reset on .exit() and .suspend()
Date: Wed, 26 Feb 2025 22:04:14 +0000
Message-ID: <20250226220414.343659-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250226220414.343659-1-peter.griffin@linaro.org>
References: <20250226220414.343659-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO_OUT[0] is connected to the reset pin of embedded UFS device.
Before powering off the phy assert the reset signal.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 4c3e03a3b8d9..64e2bf924213 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1517,6 +1517,7 @@ static void exynos_ufs_exit(struct ufs_hba *hba)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
+	hci_writel(ufs, 0 << 0, HCI_GPIO_OUT);
 	phy_power_off(ufs->phy);
 	phy_exit(ufs->phy);
 }
@@ -1700,6 +1701,8 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	if (status == PRE_CHANGE)
 		return 0;
 
+	hci_writel(ufs, 0 << 0, HCI_GPIO_OUT);
+
 	if (!ufshcd_is_link_active(hba))
 		phy_power_off(ufs->phy);
 
-- 
2.48.1.658.g4767266eb4-goog

