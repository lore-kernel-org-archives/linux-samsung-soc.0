Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6246FB0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2024 03:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724643256; cv=none; b=lKR+EhXMmcYEx3HgRfoM8Jxz+eQR3Jgtuhozxg81dTfcCoZYGW4N2oe76T1U6Y7oXJNZhgNCPOUD+cpwDBN7SJqVmd6YPTxMOSZ8fSbAr+1379I+dd3htbqnlh6bn3Ui170PohkXIvS1cmNKy2Owbv2wc07FCgjBKNHeWORgzRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724643256; c=relaxed/simple;
	bh=C5rmDrUqicFPGzOxCKoDSNWC1KLTgSJYljkOaRT/QKU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DiC1bdpUQnc/TkXSdrQ0OVQ8sy+2zvuBPWE1jsRA3qRNNVvdiAP8EGiyXoWl8P3nuq/FgDgLBzWfoI4ajCPf4OW9qoLLlmpMeRxFpoeDsLQdbrTbG2IzP0ON4bT4K08mCIl9saTgCx4c/F8goeG9MKalq2XfXQAoy6diYFqh0vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wsbp11tl9zhYRV;
	Mon, 26 Aug 2024 11:32:09 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 10C9A1800A5;
	Mon, 26 Aug 2024 11:34:12 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 26 Aug 2024 11:34:11 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <krzk@kernel.org>, <alim.akhtar@samsung.com>, <cuigaosheng1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
Subject: [PATCH -next] ARM: samsung: Remove obsoleted declaration for s3c_hwmon_set_platdata
Date: Mon, 26 Aug 2024 11:34:11 +0800
Message-ID: <20240826033411.4022822-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The s3c_hwmon_set_platdata() have been removed since
commit 0d297df03890 ("ARM: s3c: simplify platform code"), and now
it is useless, so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 include/linux/platform_data/hwmon-s3c.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/linux/platform_data/hwmon-s3c.h b/include/linux/platform_data/hwmon-s3c.h
index 1707ad4147df..7d21e0c41037 100644
--- a/include/linux/platform_data/hwmon-s3c.h
+++ b/include/linux/platform_data/hwmon-s3c.h
@@ -33,14 +33,4 @@ struct s3c_hwmon_pdata {
 	struct s3c_hwmon_chcfg	*in[8];
 };
 
-/**
- * s3c_hwmon_set_platdata - Set platform data for S3C HWMON device
- * @pd: Platform data to register to device.
- *
- * Register the given platform data for use with the S3C HWMON device.
- * The call will copy the platform data, so the board definitions can
- * make the structure itself __initdata.
- */
-extern void __init s3c_hwmon_set_platdata(struct s3c_hwmon_pdata *pd);
-
 #endif /* __HWMON_S3C_H__ */
-- 
2.25.1

