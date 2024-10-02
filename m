Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8BE216A22
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 20:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727900178; cv=none; b=J67GXX8EMJkBz6WxqGiBO892dL0DGSy4zo5Y6De2xj2eb+pFcR4YzQyTqLLxe6Pj2m6gw5Vi8DJGjNtRHgwMKD0Ie0vhNIvUn7Ng2Kb/n/xUSTzahL8MB94hiQvP3+J9Nn10KIVCWO+1AmCdCkkhopXuCwE2K6tDo33c0oE54dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727900178; c=relaxed/simple;
	bh=dXlbjZd+8YKtogCZ/dJtTJwwBRivMwtGgcmgRCO2fgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4TV5d52WSqK9IKl4jyID+Zk5kESfJbdt9oKmvO2J2VBgz8qqgPEb7ob5l7GxSik4WpQxPEF6Al8vFajsqXpJGlHqu0il0eGDmgbo+6Vm4W/VfiXCNAcuUfzY/IohBFrHHIMPO4Y3v9hP0h3HvDozLiVMeI+mEV59UlQUYEkgAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t1Lx0fic; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t1Lx0fic"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37cc846fbc4so156930f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Oct 2024 13:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727900175; x=1728504975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grqdGWxVlr6gg9Igkyge2iFlQEJRxUTK9OOJod+O8as=;
        b=t1Lx0ficGeXmAdfHUPa07dgNpJpmUOmPRNKv4huJcXPclo3o7yyplnZB+iquFqfkwq
         7B6CVzaaDKlBUpYGwx1uFz8dvcYFO0kkxQ0DWxqyfShthodktnlVjHxLDQusgnok3dkr
         MEOJ+lTtzt0N+QXll6Mj27FciBcqqj4d3tWVbo0Z/o5gcaJR3r2C+EI6KhrydDtNNK1H
         a6Qq3ouuQl7QYOm2K1b+CAgY6/wE8oWFlGnb1075uF60KtBFezgyLGuawjXZrElp2vjM
         iRuYiGHmuKRKK0h5ypM3LaupDBfF/AsVzsLmk23RSkKuJ6XL3ptRNPLXs/6LLLKlksBb
         zUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727900175; x=1728504975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grqdGWxVlr6gg9Igkyge2iFlQEJRxUTK9OOJod+O8as=;
        b=ihA/vlunv0NFq+88rZkiXDAIWsIst93UOgifjThICFoD7dJ6QkM898QmIvyFfIoNEi
         LWqnWWJezE0Ypte3hWBMpojLrlaKEKiPIdm70FBsnmzJg93hf2+3JqXvroKTEGcYTVn7
         BiLo1pZM97Emt1HZmJqVmvJVxyfUlYNYIkFMT+AOCwOB9HbxkSp+QEbExSl0pK2m4G+J
         d0PmeXcCber/0DZ7EquuPCXRXpmK+x2rKzqnwOBAWYnk6Vy7p6TSK+E0yKAO34G/HTUF
         wq6E6NL+7vy5Qfx4LywtRlJjsZDlyGYtZl/bbVMcvjfGut0JR79Yl60KtmmX9AOOoGf6
         uewA==
X-Forwarded-Encrypted: i=1; AJvYcCWF9JattkHacv9eUm++GvUs23PVGHZa91ypi6Qu9U/sPhWjOuMSJQwxO73VFyyj/uUUyAeZkAYITgFDD6qmKQjsKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSRPpc5JhbT9ReVRLPeHc/duUHR65pgIvMcOEo/XhXu1xcxOEj
	z9vDQb9tSygGFPJHOplmJpyHMo6zaKf5pqhc2Ra8jWmjatoE/620es3w6cKiJ74=
X-Google-Smtp-Source: AGHT+IEQc2WmlGwouFQBkWQzt6fGr5tg/HyKqMkIdRZTfK8Hcv4Eq8Fi6eRvtniBCRuj83IQhPoGdQ==
X-Received: by 2002:adf:f285:0:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-37cfb9d32d9mr2626016f8f.31.1727900175454;
        Wed, 02 Oct 2024 13:16:15 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.66.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d2e8sm14850600f8f.18.2024.10.02.13.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 13:16:15 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: vkoul@kernel.org,
	kishon@kernel.org,
	krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 2/3] phy: samsung-ufs: add support for HIBERN8_ENTER and HIBERN8_EXIT
Date: Wed,  2 Oct 2024 21:15:54 +0100
Message-ID: <20241002201555.3332138-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241002201555.3332138-1-peter.griffin@linaro.org>
References: <20241002201555.3332138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two new states CFG_POST_HIBERN8_ENTER and CFG_PRE_HIBERN8_EXIT to
the phy driver which map to the new PHY_MODE_UFS_HIBERN8_ENTER
and PHY_MODE_UFS_HIBERN8_EXIT modes.

These are used to program phy specific calibration values when entering
and exiting hibern8. When exiting from hibern8 state we also update the
logic to wait for cdr lock.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/phy/samsung/phy-samsung-ufs.c | 18 ++++++++++++++++--
 drivers/phy/samsung/phy-samsung-ufs.h |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index 6c5d41552649..7162ae5c7bc8 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -87,6 +87,12 @@ static int samsung_ufs_phy_calibrate(struct phy *phy)
 		return -EINVAL;
 	}
 
+	if (ufs_phy->mode == PHY_MODE_UFS_HIBERN8_ENTER)
+		ufs_phy->ufs_phy_state = CFG_POST_HIBERN8_ENTER;
+
+	if (ufs_phy->mode == PHY_MODE_UFS_HIBERN8_EXIT)
+		ufs_phy->ufs_phy_state = CFG_PRE_HIBERN8_EXIT;
+
 	cfg = cfgs[ufs_phy->ufs_phy_state];
 	if (!cfg)
 		goto out;
@@ -105,8 +111,9 @@ static int samsung_ufs_phy_calibrate(struct phy *phy)
 				goto out;
 		}
 
-		if (ufs_phy->ufs_phy_state == CFG_POST_PWR_HS &&
-		    ufs_phy->drvdata->wait_for_cdr) {
+		if ((ufs_phy->ufs_phy_state == CFG_POST_PWR_HS ||
+		     ufs_phy->ufs_phy_state == CFG_PRE_HIBERN8_EXIT) &&
+		     ufs_phy->drvdata->wait_for_cdr) {
 			err = ufs_phy->drvdata->wait_for_cdr(phy, i);
 			if (err)
 				goto out;
@@ -137,6 +144,13 @@ static int samsung_ufs_phy_calibrate(struct phy *phy)
 		/* Change back to INIT state */
 		ufs_phy->ufs_phy_state = CFG_PRE_INIT;
 		break;
+	case CFG_POST_HIBERN8_ENTER:
+		ufs_phy->ufs_phy_state = CFG_PRE_HIBERN8_EXIT;
+		break;
+	case CFG_PRE_HIBERN8_EXIT:
+		/* Change back to INIT state */
+		ufs_phy->ufs_phy_state = CFG_PRE_INIT;
+		break;
 	default:
 		dev_err(ufs_phy->dev, "wrong state for phy calibration\n");
 	}
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index 9b7deef6e10f..b42ed586aba8 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -89,6 +89,8 @@ enum {
 	CFG_POST_INIT,
 	CFG_PRE_PWR_HS,
 	CFG_POST_PWR_HS,
+	CFG_POST_HIBERN8_ENTER,
+	CFG_PRE_HIBERN8_EXIT,
 	CFG_TAG_MAX,
 };
 
-- 
2.46.1.824.gd892dcdcdd-goog

