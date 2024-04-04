Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C1613443B
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233646; cv=none; b=elVIpYWAedx/gK3QcPfsNRdIf2qWieYKrKwXSci1OHX1gaz0NORsXcZP9foJDcZQtzZIzLNsAKTrqTznngE7/jtl1vZ1li57gL1wP0/qiVvUzsDE/BxunFlCuY0k9qBYjvn/UyZbIu0e6P+KpTq92yMq7tVAkW2lZn5mAalsRdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233646; c=relaxed/simple;
	bh=ZHKCf97OijWc2VffmsZBpB7qLb+gSrxVQc/YXEeVJNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NytIamtO6uaPlvYckfheYA44R7kaJK90BW+UYZKdWmD4YmgEll/ngxgP8cKWKIJWfY5X/bE01VOxx+AXTHtYilQ0wL9Ys7p7zCGCb2m7TyhdIlWmPMqlyco0/I7Rtuyb1kUbLFeVQ+1Q3vAfTWRlIK1hHgDat80fDkh7C3Wj5sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hhe3K7Yq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hhe3K7Yq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4162b20d040so3026985e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 05:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233641; x=1712838441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyUUQp6WOxRvluHXSIvI5EfrW3GeehtIyQz6Nkgdpu8=;
        b=Hhe3K7YqTmMEQoghiyRYr/zoAn+h5++tRlrhAsHCzfFkGdmj5HZCeAkqX5Yr5bIK3x
         5lE+aUw/9fRGz1WyaASMmqrYLqolatlpj3JV2N/J1XtVRRMR2QAL4p9hslMeT/JFkphV
         tpMX7f94nQ2zt6YnYPyEvEQDkbigRUgMu1hT7KgzdjeqyWKpUYmja3jV3DoJCAo5Gsgj
         tGz3yb6WASJRZ2QDuBu3S4jSBd9XZjVNOpSF46jvkrSBWVS87lK5qdGa2mOzdqvj44sg
         O2oE1XirsTmQ16+K+sSfQLwbmNC+l8KqZonbogP0FL3SF2e3brWjPKG0TI+iqh43ugjB
         QjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233641; x=1712838441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyUUQp6WOxRvluHXSIvI5EfrW3GeehtIyQz6Nkgdpu8=;
        b=nUrWOca30+Frde5akDX1VwrBcWMYTH9QkkHx4gdcNR8nYHBURm4JIzjxxTxZeUcxPe
         2yXD0YEl72Fmr9YkvaAVjSxIKhG9GSxkKLyiqbcPVtaD1ETCv5jErifphM/znqxxXSoR
         SzhauVjPYZKcr9uFLzxTC5QfP5I2LkGXgATsIE70VJHXjORCWQ1DnSHrGTDI9n9PwyoF
         uUSvVJz71w5harlCNjkR46f3vcQhSX+vJdgPpjGy1nVvUn2bdnme/IVY+HUXjzkVJjZY
         bMzvzxzZ39+QhF532jmqiwp1JYkQU37VUgcEKkOssR7+0UiUu03C2yHp9ih44QouzNOK
         bReA==
X-Forwarded-Encrypted: i=1; AJvYcCVKVCibO9Pg12eZ1spqTa5kZiSXm2UTTf/MifjcT9zLpmqsk7699CuPYivy6Rugko3MuraktdSuuo+VEU9/dGSyAt1wmOGI9IU7KemyP07Yatk=
X-Gm-Message-State: AOJu0Yyt5irMlR8q50T8Dp+xq94WaUjN3sP7wN6Vt4azvgSxxKYiwOxy
	XAofuisFoMiqJKQo7xwfwtEnAhhYb9d8T5WzRAJXObAZ+wwKbQBLN7mj5axG76Y=
X-Google-Smtp-Source: AGHT+IEMnaWns3sPAMJ91nDBk0kRT98vdLD6EXIhsFu+f4lEueXgTLnJxBfN0OJHTHTi8CWqnrfg8Q==
X-Received: by 2002:a05:600c:1f84:b0:415:6cd7:9967 with SMTP id je4-20020a05600c1f8400b004156cd79967mr4750373wmb.10.1712233641601;
        Thu, 04 Apr 2024 05:27:21 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:27:20 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 12/17] scsi: ufs: host: ufs-exynos: Add EXYNOS_UFS_OPT_UFSPR_SECURE option
Date: Thu,  4 Apr 2024 13:25:54 +0100
Message-ID: <20240404122559.898930-13-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This option is intended to be set on platforms whose ufspr
registers are only accessible via smc call (such as gs101).

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 4 +++-
 drivers/ufs/host/ufs-exynos.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 734d40f99e31..7b68229f6264 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1186,7 +1186,9 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	if (ret)
 		goto out;
 	exynos_ufs_specify_phy_time_attr(ufs);
-	exynos_ufs_config_smu(ufs);
+
+	if (!(ufs->opts & EXYNOS_UFS_OPT_UFSPR_SECURE))
+		exynos_ufs_config_smu(ufs);
 	return 0;
 
 out:
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index a4bd6646d7f1..0fc21b6bbfcd 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -221,6 +221,7 @@ struct exynos_ufs {
 #define EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX	BIT(3)
 #define EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER	BIT(4)
 #define EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR	BIT(5)
+#define EXYNOS_UFS_OPT_UFSPR_SECURE		BIT(6)
 };
 
 #define for_each_ufs_rx_lane(ufs, i) \
-- 
2.44.0.478.gd926399ef9-goog

