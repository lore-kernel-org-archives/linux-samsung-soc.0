Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6081A3038
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386854; cv=none; b=i44H0jkniIikyraRFRUhU8/GeBkHKDeSa3uOf5RmEhdA8suDLvyBgW4pn8hFqFHv4ftBEOlxFPNDSFvsucY510PZq9l0fVzpFqwu0TJvhy67NbH5LH2wxEhJHSnacIMlYLIAJheFYij3lWPLPCn3UTq0KnyVSfG0oS1/cZMHuyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386854; c=relaxed/simple;
	bh=C/GDm+Nqq9XPeSi8uubYBLyjAJFA9X0IbYKCE8IEprU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDF87htygsk6WDpWXd3F6kdEXWeppwUghE38KLF+eWCgwWqIS449NyVVBPqOfRoZklBO70D6MT17IHrkwmuyvyvBNFbrcuLcYoTfZHOJ3HdBnHfNLt/4UAdu46SewvFr6UqpWO6YFnXzfk032vycxVfPQ1cgjE8yzJf4juAQHww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9lAh2Dv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9lAh2Dv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-431ac30d379so8707635e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386850; x=1730991650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9jgbEBOHttlHnzoEFJvpzWVhBO7kDylk6QvL3iIgjQ=;
        b=b9lAh2Dv7aEHilnRJ5Tia9ufXC3mUsQaQUSdAfW5tBTZl0r3Qks1s5REyYTGVcxwAf
         eA/u1sLOKDHh1i3/t/+LWVI9x1ii4xPFkeayVG29Hh1VlAK4iA2MBomaxcO3gXtmTUt5
         xpfQkDdlsMCx5AUfHxKqU7Cn4LnKF+f1qNXs9DetXAxj8hIe4KtJzLnES3PPsL/t+LEt
         DAzUdWFfCuwvlJLAhjMWF0bvGrFH8uy8JqtgVAOQ9BYNrreLG97bZ9ty1XMWy24/X74Z
         jgiW0zt6Mtb3NF0QZgd1exa0GqirKTDzs7EeTlk3/bHYkQJuaS4Vs2HAro/HQkkaTgGg
         uudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386850; x=1730991650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9jgbEBOHttlHnzoEFJvpzWVhBO7kDylk6QvL3iIgjQ=;
        b=pS2UuW8Yb5V0KkSbVqkaRzOuVAjg0y03J6uSMBBTfB3dP2E9mpcV2Hx7CMwyxwG/LN
         i5b3TlZxmvgXgCkQmt0135Y37vP7B6KoC88n00GbOPfav8I5u+ZLW8rzt975SABP+1nf
         C/t6Ee2zAh7vF3NOwGtxWLRwiTeBRn+hAGt3+PLlgXzGlTWz4MCT4ezAwVZLL1Hr2HWT
         9WYqhaHTT3kyl50ztFSXDwOnzjE8v8Tf1H4IGXXcBtyF5mD1eGcqbj4ryaztmPsc3lTd
         PvjBA7K+snTUiBaeqpYCZEm3DL+/J2hGcwr2HapoaIcQptlvrFpCxT+02MaKlDdohtFj
         m+qg==
X-Forwarded-Encrypted: i=1; AJvYcCV/E7QQ7t0Z4g/X7YTzk5G1aoPxTMXq0IoSUK381XuiyOeGAot06K3oOGxELyhr1uk4iiVKxGmxQImPhHW23MDdpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy26VLAZj1pmrfjhw0yxKOcX+X57wM2t6gvr3HaAMlQXAO2YoKX
	Fc5GM8CusFMGKM5ISeyaqe2WOYCYDAj9CQ+tdLJ03gOjF2V2v3LMZ8IbsP9AeF0=
X-Google-Smtp-Source: AGHT+IGBloKnQyzK042bxpPzzNwKfFJqeBubjE+dIc7DcjDnTJukogo204p6ptQH0HImb9KtmNPitA==
X-Received: by 2002:a05:600c:1d1c:b0:431:55bf:fe4 with SMTP id 5b1f17b1804b1-431b17365ffmr107037035e9.24.1730386850219;
        Thu, 31 Oct 2024 08:00:50 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:49 -0700 (PDT)
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
Subject: [PATCH v3 10/14] scsi: ufs: exynos: enable write line unique transactions on gs101
Date: Thu, 31 Oct 2024 15:00:29 +0000
Message-ID: <20241031150033.3440894-11-peter.griffin@linaro.org>
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

Currently just AXIDMA_RWDATA_BURST_LEN[3:0] field is set to 8
in exynos_ufs_post_link() function.

To enable WLU transaction additionally we need to set Write Line
Unique enable [31], Write Line Unique Burst Length [30:27] and
AXIDMA_RWDATA_BURST_LEN[3:0].

To support WLU transaction on gs101, both burst length fields need
to be 0x3. As all other SoCs expect the current value we update this
in the gs101_ufs_post_link() specific hook.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: fix typo s/burth/burst typo (Tudor)
v3: update commit message (Peter)
---
 drivers/ufs/host/ufs-exynos.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index d59e1933b64e..78307440107f 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -48,6 +48,8 @@
 #define HCI_UNIPRO_APB_CLK_CTRL	0x68
 #define UNIPRO_APB_CLK(v, x)	(((v) & ~0xF) | ((x) & 0xF))
 #define HCI_AXIDMA_RWDATA_BURST_LEN	0x6C
+#define WLU_EN			BIT(31)
+#define WLU_BURST_LEN(x)	((x) << 27 | ((x) & 0xF))
 #define HCI_GPIO_OUT		0x70
 #define HCI_ERR_EN_PA_LAYER	0x78
 #define HCI_ERR_EN_DL_LAYER	0x7C
@@ -1922,6 +1924,12 @@ static int gs101_ufs_post_link(struct exynos_ufs *ufs)
 {
 	struct ufs_hba *hba = ufs->hba;
 
+	/*
+	 * Enable Write Line Unique. This field has to be 0x3
+	 * to support Write Line Unique transaction on gs101.
+	 */
+	hci_writel(ufs, WLU_EN | WLU_BURST_LEN(3), HCI_AXIDMA_RWDATA_BURST_LEN);
+
 	exynos_ufs_enable_dbg_mode(hba);
 	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_SAVECONFIGTIME), 0x3e8);
 	exynos_ufs_disable_dbg_mode(hba);
-- 
2.47.0.163.g1226f6d8fa-goog

