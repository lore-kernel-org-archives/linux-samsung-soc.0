Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D7027A46B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Jul 2025 06:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871168; cv=none; b=jSoVswHV3d/ixaQAh6ktanJhq15p+WrYyr3+EZ+2HRYjx3nDTEoZhDkS1uuzoXYpMFm36oAwm/yEwrOmH3v2nKL2gN+J+dFr7QrelzzUR9/SsVJd4v0xqwKTKS2UqIHh+Z6kaiH7g5somSTouXtmGvgFymVOJT0W9LFFPY0U3zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871168; c=relaxed/simple;
	bh=hDhD2ZHTEXjSGhALf8bUwgYDspDhjlceSvYZvUo0BS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=HR4c8eVPdDPT/4EBr3gOiyOKFEpovMSY8uN0ZhqbawwK9Ro9OXPDFygC8veO/+7TFh9UHFplzeXh2M398FCRH+XLqbkSu027OJ5K7LMsPwsRb6KNVp/N8qcMF9p2mf+bj18Cj73N2oTCF8FdldYS8HFIQCwgxoe6D4t/psaOd8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=a1YBiqDo; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="a1YBiqDo"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250707065244epoutp01642f2b5e3caaa5ef10b6d4037e031c74~P5Yq-Rtn91632816328epoutp01L
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Jul 2025 06:52:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250707065244epoutp01642f2b5e3caaa5ef10b6d4037e031c74~P5Yq-Rtn91632816328epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751871164;
	bh=JbWlxwedOoTXP5zKVUcK44eCeNGHeMuK1L5j3H8XD0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a1YBiqDoj+ZSkcFSwwoQOWKmQ2Sbx6yzOr/aLknjjo1PW4N32bVJxbWtzxFl+vDrB
	 lTRB0Cchqj+hv4RlX3mPi4ClZTMrm32NzidufpLgh0Y0Dkdwxji2kZVWKp7bU7O+AX
	 lM3B72Jd0LtkbxS9RblgyECnals9J6uazWrKp4hQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250707065243epcas5p48904fa6ee07313b361e98517b84a2687~P5YqhllHw3004430044epcas5p4E;
	Mon,  7 Jul 2025 06:52:43 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.175]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bbFL22tZFz6B9mD; Mon,  7 Jul
	2025 06:52:42 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250702051532epcas5p381e97531e4df64f556e8aba86c5532d9~OV1YM_7H01293312933epcas5p37;
	Wed,  2 Jul 2025 05:15:32 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702051530epsmtip2c3c09bb7f89294a84dee07ebb1dbfabe~OV1WoMXzv0283602836epsmtip21;
	Wed,  2 Jul 2025 05:15:30 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	inux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Wed,  2 Jul 2025 10:54:25 +0530
Message-Id: <20250702052426.2404256-3-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702052426.2404256-1-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702051532epcas5p381e97531e4df64f556e8aba86c5532d9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702051532epcas5p381e97531e4df64f556e8aba86c5532d9
References: <20250702052426.2404256-1-dev.tailor@samsung.com>
	<CGME20250702051532epcas5p381e97531e4df64f556e8aba86c5532d9@epcas5p3.samsung.com>

The on-chip RTC of this SoC is almost similar to the previous
versions of SoC. Hence re-use the existing driver with platform specific
change to enable RTC.

This has been tested with 'hwclock' & 'date' utilities

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 26 ++++++++++++++++++++++++++
 drivers/rtc/rtc-s3c.h |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 5dd575865adf..00686aa805f2 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -384,6 +384,23 @@ static void s3c6410_rtc_disable(struct s3c_rtc *info)
 	writew(con, info->base + S3C2410_RTCCON);
 }
 
+static void exynosautov9_rtc_disable(struct s3c_rtc *info)
+{
+	unsigned int con;
+
+	con = readb(info->base + S3C2410_RTCCON);
+	con &= ~S3C2410_RTCCON_RTCEN;
+	writeb(con, info->base + S3C2410_RTCCON);
+
+	con = readb(info->base + EXYNOSAUTOV9_TICCON0);
+	con &= ~EXYNOSAUTOV9_TICCON_TICEN;
+	writeb(con, info->base + EXYNOSAUTOV9_TICCON0);
+
+	con = readb(info->base + EXYNOSAUTOV9_TICCON1);
+	con &= ~EXYNOSAUTOV9_TICCON_TICEN;
+	writeb(con, info->base + EXYNOSAUTOV9_TICCON1);
+}
+
 static void s3c_rtc_remove(struct platform_device *pdev)
 {
 	struct s3c_rtc *info = platform_get_drvdata(pdev);
@@ -574,6 +591,12 @@ static struct s3c_rtc_data const s3c6410_rtc_data = {
 	.disable		= s3c6410_rtc_disable,
 };
 
+static struct s3c_rtc_data const exynosautov9_rtc_data = {
+	.irq_handler		= s3c6410_rtc_irq,
+	.enable			= s3c24xx_rtc_enable,
+	.disable		= exynosautov9_rtc_disable,
+};
+
 static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
 	{
 		.compatible = "samsung,s3c2410-rtc",
@@ -590,6 +613,9 @@ static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
 	}, {
 		.compatible = "samsung,exynos3250-rtc",
 		.data = &s3c6410_rtc_data,
+	}, {
+		.compatible = "samsung,exynosautov9-rtc",
+		.data = &exynosautov9_rtc_data,
 	},
 	{ /* sentinel */ },
 };
diff --git a/drivers/rtc/rtc-s3c.h b/drivers/rtc/rtc-s3c.h
index 3552914aa611..ed57ebe06b41 100644
--- a/drivers/rtc/rtc-s3c.h
+++ b/drivers/rtc/rtc-s3c.h
@@ -14,6 +14,10 @@
 #define S3C2410_INTP_ALM	(1 << 1)
 #define S3C2410_INTP_TIC	(1 << 0)
 
+#define	EXYNOSAUTOV9_TICCON0	S3C2410_RTCREG(0x38)
+#define	EXYNOSAUTOV9_TICCON1	S3C2410_RTCREG(0x3C)
+#define	EXYNOSAUTOV9_TICCON_TICEN	(1 << 0)
+
 #define S3C2410_RTCCON		S3C2410_RTCREG(0x40)
 #define S3C2410_RTCCON_RTCEN	(1 << 0)
 #define S3C2410_RTCCON_CNTSEL	(1 << 2)
-- 
2.34.1

