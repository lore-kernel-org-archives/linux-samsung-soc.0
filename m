Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03791C1AD0
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386857; cv=none; b=ihb5qvsebsdHeECv3saPmqMdL1+uT02IGDdNM+VtZaqBazAi2O9CjBZDzZmvR9hssgyqyvUgD+rCE3dxEWQWokwpTS0oMG47YF2Pu4Zl751/MTsFbEZ7q41uJtD6nOYzBwjmIUyIrLR27VN0N9f40A9RuYN/TKGDRoEX/0rU68c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386857; c=relaxed/simple;
	bh=DNXiPZZOPqqCGRsSUrJuQXwDPghQpinVVwrMRAUyp2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qO1LaoyLtBQLzNgen8uT1jbtaYwZGiftRjDxaBIYjcyE6bf5ZkyxjXMB8pdOsbanvf7eE/VxrVdhn6cGchy3XVRk/eFfRibWfW7NZqKPXyn5hfqDs/z/iJPhr5tGxvKiHvA0vDmtqror6jnNMk9DD0kttUQmvMX6f5rbUqXCcFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sdvWC8Nk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sdvWC8Nk"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d41894a32so613160f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386853; x=1730991653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dhr5+lgkwJp/4xdbeZNcQAzRLkNmuREPhlR8Kw0nM4=;
        b=sdvWC8NkIoevImTc1EFGJE5IZZtGUhp2is6TFJM6yLca5JjPKkDwi0wYISBdlAGGLO
         9WFriredKimceZ9OcQIZqp8o0VeCQ0LJa7ceopJUlJzgoo/UHMgQRSMFClQwukOoouN0
         hSh3woxKYCWF35bnEk3dnGJvUw3E4ezaFa040Fb1nRxJHCmd5JxLQUthiAmtu0lNi2wQ
         ccaGmGL0A1FbF/lfwSkkaMCH6h8UVkwrg6ScsqLx/GjBZ/9/fTM6OUh/eQFn1CzykjEE
         3RDC+Kpd6G7izxAk8ayAOIs63ZU5VJMJOfQHo6UJQ4nJxV6NzzzbX6Z800WJIqfIAw14
         QVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386853; x=1730991653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dhr5+lgkwJp/4xdbeZNcQAzRLkNmuREPhlR8Kw0nM4=;
        b=H1kAP+VFCls6iVKdZ74S8WT/g7GqIXt96xmYcGEUdUZOZdTAHt73s0XDaa+RZ4wccJ
         REOs+zxrUnmRlyOWxtoD8raTwJqtcPZ5hZjkJ1a2LdpuJWztRMkJc4rlwiRyLMUCLpAJ
         QSQRLGWOm0sUKOVGlhdTglyg6VndwogfxuRzOeBIO/ES/jifsrOrlgCnNQaCL+AnjbDs
         b1scGc7GeHJW6evn/pJp4Img22hc3dpmJrsWnqwjRA05QPDoNFjw7LR1Dwg7ndFPc1au
         gXHiB+hAF5KwbOewlvza7g7YD5zdI3UzZ3ZxWYWhgModwM6tlOahrGJ/gAdD/7T5Fo63
         INJg==
X-Forwarded-Encrypted: i=1; AJvYcCVZXovxD/gHmpFM8o1mTPNPIKsHm8eQfgVJJoF4KqwbOSW5HXeyOmj1CFi9tdJHRkr1QDztO3HZVlc/lCmSTymqcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPU3+2R7IdPu0J06s18cBRFarg3S7oJe7GQfMJO+CDSuiApqok
	kDhmeQiyPTX0cpK8LYxi9C/91yH+CPfHjd0TeeCUNtApLsiEb3+ReTM1jMywjZY=
X-Google-Smtp-Source: AGHT+IHKfc7pJ6Zm8piuDfmKaMIbjSaLV4oLGDh35XiuzbNsP65XFtHQ4OrcCPyxEHtqyv/uMEAbZg==
X-Received: by 2002:a05:6000:1566:b0:374:cee6:c298 with SMTP id ffacd0b85a97d-381c79e3662mr280380f8f.21.1730386851639;
        Thu, 31 Oct 2024 08:00:51 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:51 -0700 (PDT)
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
Subject: [PATCH v3 11/14] scsi: ufs: exynos: set ACG to be controlled by UFS_ACG_DISABLE
Date: Thu, 31 Oct 2024 15:00:30 +0000
Message-ID: <20241031150033.3440894-12-peter.griffin@linaro.org>
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

HCI_IOP_ACG_DISABLE is an undocumented register in the TRM but the
downstream driver sets this register so we follow suit here.

The register is already 0 presumed to be set by the bootloader as
the comment downstream implies the reset state is 1. So whilst this
is a nop currently, it should protect us in case the bootloader
behaviour ever changes.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 78307440107f..5078210b2a5c 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -76,6 +76,10 @@
 #define CLK_CTRL_EN_MASK	(REFCLK_CTRL_EN |\
 				 UNIPRO_PCLK_CTRL_EN |\
 				 UNIPRO_MCLK_CTRL_EN)
+
+#define HCI_IOP_ACG_DISABLE	0x100
+#define HCI_IOP_ACG_DISABLE_EN	BIT(0)
+
 /* Device fatal error */
 #define DFES_ERR_EN		BIT(31)
 #define DFES_DEF_L2_ERRS	(UIC_DATA_LINK_LAYER_ERROR_RX_BUF_OF |\
@@ -215,10 +219,15 @@ static int exynos_ufs_shareability(struct exynos_ufs *ufs)
 static int gs101_ufs_drv_init(struct exynos_ufs *ufs)
 {
 	struct ufs_hba *hba = ufs->hba;
+	u32 reg;
 
 	/* Enable WriteBooster */
 	hba->caps |= UFSHCD_CAP_WB_EN;
 
+	/* set ACG to be controlled by UFS_ACG_DISABLE */
+	reg = hci_readl(ufs, HCI_IOP_ACG_DISABLE);
+	hci_writel(ufs, reg & (~HCI_IOP_ACG_DISABLE_EN), HCI_IOP_ACG_DISABLE);
+
 	return exynos_ufs_shareability(ufs);
 }
 
-- 
2.47.0.163.g1226f6d8fa-goog

