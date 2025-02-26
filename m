Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E068A270EB4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 22:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607471; cv=none; b=Zp3TfN0g9h5Hhq9smMwKMZi+L4ws508rELUopLL35QUc7tHRGg/W3Kw3hLtBSyEa8xiS08lQ5pRw0DEw8YroyRokk09huO3p7rByD/uwVkuEfvALtTXGMP6IWjW72+4DtGKspartvZ9gS9LPUpogY1F3LmB4nVy1t+3sJHAF+BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607471; c=relaxed/simple;
	bh=PNkwNwv9VpT3YvgmkBDx8X89ApJt2EDBqRN1Kfvrn7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyvymWN2kW58t3y9Pvm8tDgDjidbiAndn5aFddNnke5a5ACpyy7y2jq6RIk1lDa+6GOV/Gp+MFf6XzYiCOfwDAonrzZVcf2aPrYpP9heeXaoKFJhjDrANQw+ke+iYhNvmt/LYIMYjqF5mUndTTtT7eysRQ1+CGQW0SfE4+UjVUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w18bcyUK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w18bcyUK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220f4dd756eso4481775ad.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 14:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607469; x=1741212269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H5V/4krQO0tnwIPu67VnVVU8I6AEiTtxk+UIVEETD8=;
        b=w18bcyUK+p921uzYSd/kGAaSu3U/R0ZDH1MTTwxYnOUlU7PKWGnexfImx3y5UMVIQe
         /TVir7zYUZUwKNjJ1+dxdy9HoiWvbok7bpUaPoFeyLffw+F8wz3KTm3OTFiZXOoWOu8h
         c06pQOI28bXWHho0oBJCF/exvssvUVNxnSdNKzkzyOn6mFSUG7FQfmmW36WhdkMmsJss
         cuepu35Y5H7EgYw5IlUj36q6vjqpsEb7mNTrguU2JFqi2E/ekccRk+Gwt16rJ1FWjxTO
         yzqjW2/FGt1f4+JCXY/GqHHbJJ5NlM28Que+Wxubw6Le+MQdJpQ10WHY7FezxZNXXf5F
         DoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607469; x=1741212269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1H5V/4krQO0tnwIPu67VnVVU8I6AEiTtxk+UIVEETD8=;
        b=gvXdJUs5TzxTcyEV54wW/5yO05Ov9kPtwd2OXcrOIqXizUCV3gktKLX7cw7ZXiI/U7
         ZBsg6/JUupf1XQL007UiUP2tx1cSx/4q3C1izXyMv1HUVXZBIZW+Q2j06ZisKosCwYkV
         KnSUixFVqSG8XaBrb0BvSZBrJPErdluQfA6mpWgpc0wKMQ25SZHkROGBIjbCGwzESxMi
         8K4tKKDlzzHCn3p0BzZwdQcH0Aiw8wogEGB9Emo35goksNijfMam+7DUKQdkVOuCuXq4
         5kY7E6/anZaEeNC5o4ioP23LFWp+ykz3Bv+Vh2O4bDFZHFKCY2qG8i0zODox8cp3qbMd
         l8KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsfnCfvcpSQnfwrCHtMhJe5474luHIrzp8rY5hb5RyJ7G4VlZYWJy03dwXAJUAB/OqeBSAvXISMB/NIZu/xn2DQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNlpuBIW3SSv4q7Q/f5Tm3inMYWrOn0Yb69XA94sd7QYCinxh
	FcfQggl+a3MGwvPxJDtuqpn6GRD96Z8LyU+kXLxy+pXiMauGd0bl7oa4uDfIjdc=
X-Gm-Gg: ASbGncs7cgWGR6d0GlbyHRRZLPV/XwmJeZVf+Z1L3F07SF3IeZNqQMSMmOL7yhyXa0G
	A7nYUhDWmkYKX8jXi3F/h86BEGtyvgYxGGWP498jGgEiKGWf1A3UTopcO3woULnNY37cARGR0rx
	zAdO5T3mLZXBZ8s+L447ig5d0e0tzGzoeomXFlkadvwVOgOSNZWvoi28avIgAsKwolrU10M8zMK
	+l/Or6Yzq6Vo1TaPW6OleCb70TwO0+oY2zXiHI/lY4XfeXVEBxq/rQqgC3eTiIl+rOCSSRzPZUM
	BcctOWO+8SWgqU0qjeWq9VgzqHV76qgtTZegiMtmg/EfL2vCnlyxqDE0
X-Google-Smtp-Source: AGHT+IECzNts0Mtu5VbZUxztS2HO/B6nm80SgninqK7JKlelTupDcduJXw38Hys3XginT6lu7IkrHA==
X-Received: by 2002:a17:903:2348:b0:216:53fa:634f with SMTP id d9443c01a7336-22307e78babmr138892345ad.48.1740607469342;
        Wed, 26 Feb 2025 14:04:29 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:29 -0800 (PST)
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
Subject: [PATCH 5/6] scsi: ufs: exynos: Move phy calls to .exit() callback
Date: Wed, 26 Feb 2025 22:04:13 +0000
Message-ID: <20250226220414.343659-6-peter.griffin@linaro.org>
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

ufshcd_pltfrm_remove() calls ufshcd_remove(hba) which in turn calls
ufshcd_hba_exit().

By moving the phy_power_off() and phy_exit() calls to the newly created
.exit callback they get called by ufshcd_variant_hba_exit() before
ufshcd_hba_exit() turns off the regulators. This is also similar flow
to the ufs-qcom driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 27eb360458a7..4c3e03a3b8d9 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1513,6 +1513,15 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	return ret;
 }
 
+static void exynos_ufs_exit(struct ufs_hba *hba)
+{
+	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
+
+	phy_power_off(ufs->phy);
+	phy_exit(ufs->phy);
+}
+
+
 static int exynos_ufs_host_reset(struct ufs_hba *hba)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
@@ -1968,6 +1977,7 @@ static int gs101_ufs_pre_pwr_change(struct exynos_ufs *ufs,
 static const struct ufs_hba_variant_ops ufs_hba_exynos_ops = {
 	.name				= "exynos_ufs",
 	.init				= exynos_ufs_init,
+	.exit				= exynos_ufs_exit,
 	.hce_enable_notify		= exynos_ufs_hce_enable_notify,
 	.link_startup_notify		= exynos_ufs_link_startup_notify,
 	.pwr_change_notify		= exynos_ufs_pwr_change_notify,
@@ -2006,13 +2016,7 @@ static int exynos_ufs_probe(struct platform_device *pdev)
 
 static void exynos_ufs_remove(struct platform_device *pdev)
 {
-	struct ufs_hba *hba =  platform_get_drvdata(pdev);
-	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
-
 	ufshcd_pltfrm_remove(pdev);
-
-	phy_power_off(ufs->phy);
-	phy_exit(ufs->phy);
 }
 
 static struct exynos_ufs_uic_attr exynos7_uic_attr = {
-- 
2.48.1.658.g4767266eb4-goog

