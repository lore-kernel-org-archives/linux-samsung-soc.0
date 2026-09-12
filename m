Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EE548F84C
	for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240366; cv=none; b=Iky+dfT90WEU50GLXer4K1gvARfwBRaZsU9LTbWw2TMvlqnvxGITaPodORlBKHT779mQ3eLe+TsbKQ1VyVuZgET5XXcTwMu21CgPRZnuDLr7HI0lE5izoVRLuQGfZJskZDA87Dfli703PArxISEAgonAiWwcz/tRsU/1EIJDiYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240366; c=relaxed/simple;
	bh=XXK3kAlnkBqlC6TMzeafV9pfZQv3eyi+PkhO2AfD8ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrT18o7rk2SHGQoLUWhHKkfnTNr/ubrRIS/i/MKplkC8Ai6iYye6b1YxIQJ6RLMoQRQGwFHIxy0Cc10BF4x0DgFTl+B5E84Sh4z5L0oGeouLPvq2Ajg7o10gG+FMXq8Bu+4F0NwzS4cquJge2vLggHT4+neFBGh5mINoqwE5xaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8Qg3hHe; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8Qg3hHe"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so799861a91.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 12:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240364; x=1789845164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ji3o+ulSbP+i9U1/Xrwb9df+nl0gS/1m0flRPEBpn8=;
        b=Y8Qg3hHe5BKQFRiaGRhb5Wmc/xkXv7VVSbL6DwCrELX/WI/y8OlEvdYr1d4t0JgWIf
         Md9X7o4pMyCG2KWZFvUeu+GWm2FqyFdLbAWLQxRbFo9v8VxKCWQxZyrbLmHzUKa24+C6
         WVzhWSEnPxZc//645MyM5z2Fh6sMrUYmpJktDhH8T9xDbtQKA7YBPpfZr/WdgMQCHULn
         MEIEHJK2u5wftp+Ormo+9UlpTh0mrDXhMG1XBR2tzrRExXdnsofPRbrUAo1/ENO5UMuV
         4hgUMVw0XpBddPJLHVnQtn7JS6ULh4Df3xw22sZxd5GXKIRHFWokURfUf9KmasJ4hm73
         EKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240364; x=1789845164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ji3o+ulSbP+i9U1/Xrwb9df+nl0gS/1m0flRPEBpn8=;
        b=k35MvcBs8uSCZ/31fBNbnEC5WWOFpmuNc3VYScyh3qwGg6kFpD/Ti5N9aWYFbhDkwV
         tC59JTSe9Y9U7b/lO/c30lkwmhOQhin6mvovLJVFsEbXrs2jPl8BTq5qnMcJFl+xMK9N
         6Emd2oEfYTw3IZDMBtdG+RwMi5aFdj3ZtQNQmp2RwBBdHmUv18U6ASse8C+IZ70G+HBb
         cxMVSeP9ElDnXs+WpLmwoYvS/Cho7GEXPxzOpvVfahSdHzS1ylIMfkrgPNPZ4CGbAiQx
         PauQP7VTC6Jdbdsay2DSatx0Tlb1Ty5zYuKzWKbQ9x4HwcEu2sPFv/AuM3pxkJ1tLctl
         arUw==
X-Forwarded-Encrypted: i=1; AKwUvBxaVKbFRKKkitxYnISJsUEcmt9hnIoOCw8ednEYhhmGX1skpA+ekeqHMrllHsld+0WwUU+nKb1ri1hWSVOMjIz24g==@vger.kernel.org
X-Gm-Message-State: AFuF++kVAfPGEn3Umcq7TY24Nx1YCn2m24ZEE0Yd5reC95lJd+VOs6qi
	N4NvYcsssSDqdEXDpym2pO/AbWw1mEjNBC6c6rBCjUedU1TzljSr9f3u
X-Gm-Gg: AYBFou1fcDRg87x35pwk13A9jjxKXYs4ZKTRLEEkWKm+XN3tIQOLrQg2ypbSYvpHsDn
	38Da8UCaS3opKquomr681TX5nzfER0ryDYdmllqZNu+Yox/U8F8XVXdwxaVZw+DJPBlnAJG/Mz0
	vQTSIG3kXH3XKrXWt3dHdRAgJQ3Kwxk+JwpR3H7Cl4Q3a0H4HI8sFjs0h8M9YEMAY8JCCGW3+F8
	LmkRS1sR9+DV3VnrKzR8Kvxi6rZ4GTqN65N9bIkbY6P+mAB3Ib/XDa9vnvmuG9PIj4bVdwiiJeh
	4HpUgQ2Gzm8vOXF9Vat96Yv2/x4qnQheMGWJtGy1xDTvYttNc9eoUv6xu8ZUlNl+VFzi93p1xPN
	BN+V9npJvKF2O8ZShQ+kxzhorXU2/k4tnvFqvUca63/i274FR+QaqQKzeroq3oxvT81rX1FQZeJ
	wEEHibxXRXvqC+mp8nc9laeJJ5fQjlYvnkwYRBaDF598bK/Rx11dy5HSrDUFC5notzhPY2
X-Received: by 2002:a17:90b:498c:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d9bbfa327mr18115862a91.5.1789240363673;
        Sat, 12 Sep 2026 12:12:43 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:43 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 2/5] devfreq: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:52 +0530
Message-ID: <20260912191156.185448-3-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
-ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
gracefully and prints the raw integer value. This makes messages more
readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/devfreq/imx-bus.c    | 4 ++--
 drivers/devfreq/imx8m-ddrc.c | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
index 49798f542d68..dba76d8b9e5a 100644
--- a/drivers/devfreq/imx-bus.c
+++ b/drivers/devfreq/imx-bus.c
@@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
 	priv->icc_pdev = platform_device_register_data(
 			dev, icc_driver_name, -1, NULL, 0);
 	if (IS_ERR(priv->icc_pdev)) {
-		dev_err(dev, "failed to register icc provider %s: %ld\n",
-				icc_driver_name, PTR_ERR(priv->icc_pdev));
+		dev_err(dev, "failed to register icc provider %s: %pe\n",
+				icc_driver_name, priv->icc_pdev);
 		return PTR_ERR(priv->icc_pdev);
 	}
 
diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
index 52beeb5b7d65..28d7c595fa17 100644
--- a/drivers/devfreq/imx8m-ddrc.c
+++ b/drivers/devfreq/imx8m-ddrc.c
@@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
 	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
 		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
 		if (IS_ERR(opp)) {
-			dev_err(dev, "Failed enumerating OPPs: %ld\n",
-				PTR_ERR(opp));
+			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
 			return PTR_ERR(opp);
 		}
 		dev_pm_opp_put(opp);
-- 
2.43.0

