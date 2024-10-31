Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BFD1C1AD9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386858; cv=none; b=nOsoikU0XGxcYzT81WY2E50DEt22GewCRZN/nInulZk0KkrhP3GgyNP0NggPpsSvLGCkptbC1IP8kxZtG5ZW3kjA0EKINsozbKLDPLX0FTTu0E68ovsJdUY3nih8WyXzzvsNIyuVrm5m7IM7ywMD2lMsDMaVB8Ote17pY79VTF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386858; c=relaxed/simple;
	bh=fvC24w7gj89Nb012evxg+hZIB/Nm64y6FgjqzdxwzQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKQ/ssnyFXlF5gdMj4wPyo3HjV5vov6e3C6TQILEGDN1dVIHtNzTQC3WsavJj+m1Xe4otpMulUFRSeUeVx21GwZioaE4GRY5NNtTjhPwirks2q+wKSJHg6PZxmhGT95mypB4xdGpoPbunr9c3dQHFFgxWbpeRXyCXl3TarOSvfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gJv1F8s8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gJv1F8s8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so761311f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 08:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386854; x=1730991654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pek064Hz7CIKn8YheYCxRzKFA8nRolzJISWb5PBD7ls=;
        b=gJv1F8s8XZALYcOj9HUWtkVqlgdfoTIWaTgert6zScmpVZ+zAIKfammFIbzC4YrspO
         anPW8tIeFe5Dj51JMrsfJwjYKJHx6zvU3WbZdXcFkSVkqgniGUoeD9xhXYz1EK37bzCE
         K8pRodK2aNAC77QSfVL+4ztG3PQFrQC59iJ5ILJIvDO0caufr0vrLfMNhrIi9APRKufl
         7xt9y8rAORyhi52hY+05gPwHMm346lnZpldCjnZy4JppjkoW9mOQGDRDvkVVuxbc2QQF
         JiUahkVOW+CyH9cVuI7wAMJ38l38Ho5KCyfVaPnvfFv1C9oSAD7jVeoYlT/Utq0wwlXB
         xsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386854; x=1730991654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pek064Hz7CIKn8YheYCxRzKFA8nRolzJISWb5PBD7ls=;
        b=DnShNkf6eJpQQtQcx91YimSV1Al9GsBRWCGkQK5+vt8dGJHC80XeAhBtH95aGCDLO5
         Kjkg6bStOrRx/NR5qywb0Lyb7TycaZ893J/MMJVbHkr9KjlNByoBzrKXlOff1Q6ekFpF
         0veTQXvrGlL48X76TUNATU+G4tQxKEz2+C3T3GLRqMqOSEMihSq3wzSDwIXwiibBd04c
         9FKN+1TeQXyZfu75VbqF8Z855HWLRBpIK1mJqlcH17ka5zrILvA0RcEvefeITzoE+noh
         yw77HH6lJbk7CTnscIBstviJXNW+31JIZOZmRdZoZZ3Zn/fL/Y8Zpt1rVr5K+jztYnff
         8l0A==
X-Forwarded-Encrypted: i=1; AJvYcCXWIr1hpaOov+XApvqPMzVulvN+z3y8D78luITYBaZFxkZJva6lv7aEIZH12CiU9dQTp9W+DLR8X0ouekiCYoOVoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpzKoBesgktuNzjkYpLfm6xdKdaVbkxnJSYxkWQP9cGmLIKTAK
	Qp1R2I4B22341yXTsYk+BUF9igduguM5HPAT32V3+AlIcVMMCDrG0gLFvsbi8eA=
X-Google-Smtp-Source: AGHT+IFW5CC5JRXdKxYGdEgD1gfJan72KWcvXpNH/k/uV7fOOa8gSAbAZdmjlZXVCXNa52l8mJQzTA==
X-Received: by 2002:a05:6000:1a8e:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-381be7d8f8bmr2977899f8f.31.1730386853121;
        Thu, 31 Oct 2024 08:00:53 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:52 -0700 (PDT)
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
	Peter Griffin <peter.griffin@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 12/14] scsi: ufs: exynos: fix hibern8 notify callbacks
Date: Thu, 31 Oct 2024 15:00:31 +0000
Message-ID: <20241031150033.3440894-13-peter.griffin@linaro.org>
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

v1 of the patch which introduced the ufshcd_vops_hibern8_notify() callback
used a bool instead of an enum. In v2 this was updated to an enum based on
the review feedback in [1].

ufs-exynos hibernate calls have always been broken upstream as it follows
the v1 bool implementation.

Link: https://patchwork.kernel.org/project/linux-scsi/patch/001f01d23994$719997c0$54ccc740$@samsung.com/ [1]
Fixes: 55f4b1f73631 ("scsi: ufs: ufs-exynos: Add UFS host support for Exynos SoCs")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: stable@vger.kernel.org
---
v3: Added Link tag, and CC stable, and Reviewed-by (Tudor)
---
 drivers/ufs/host/ufs-exynos.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 5078210b2a5c..9b6c4cfd7665 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1526,12 +1526,12 @@ static void exynos_ufs_dev_hw_reset(struct ufs_hba *hba)
 	hci_writel(ufs, 1 << 0, HCI_GPIO_OUT);
 }
 
-static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, u8 enter)
+static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
 
-	if (!enter) {
+	if (cmd == UIC_CMD_DME_HIBER_EXIT) {
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
 			exynos_ufs_disable_auto_ctrl_hcc(ufs);
 		exynos_ufs_ungate_clks(ufs);
@@ -1559,11 +1559,11 @@ static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, u8 enter)
 	}
 }
 
-static void exynos_ufs_post_hibern8(struct ufs_hba *hba, u8 enter)
+static void exynos_ufs_post_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
-	if (!enter) {
+	if (cmd == UIC_CMD_DME_HIBER_EXIT) {
 		u32 cur_mode = 0;
 		u32 pwrmode;
 
@@ -1582,7 +1582,7 @@ static void exynos_ufs_post_hibern8(struct ufs_hba *hba, u8 enter)
 
 		if (!(ufs->opts & EXYNOS_UFS_OPT_SKIP_CONNECTION_ESTAB))
 			exynos_ufs_establish_connt(ufs);
-	} else {
+	} else if (cmd == UIC_CMD_DME_HIBER_ENTER) {
 		ufs->entry_hibern8_t = ktime_get();
 		exynos_ufs_gate_clks(ufs);
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
@@ -1669,15 +1669,15 @@ static int exynos_ufs_pwr_change_notify(struct ufs_hba *hba,
 }
 
 static void exynos_ufs_hibern8_notify(struct ufs_hba *hba,
-				     enum uic_cmd_dme enter,
+				     enum uic_cmd_dme cmd,
 				     enum ufs_notify_change_status notify)
 {
 	switch ((u8)notify) {
 	case PRE_CHANGE:
-		exynos_ufs_pre_hibern8(hba, enter);
+		exynos_ufs_pre_hibern8(hba, cmd);
 		break;
 	case POST_CHANGE:
-		exynos_ufs_post_hibern8(hba, enter);
+		exynos_ufs_post_hibern8(hba, cmd);
 		break;
 	}
 }
-- 
2.47.0.163.g1226f6d8fa-goog

