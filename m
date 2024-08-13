Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6445419ADB9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Aug 2024 10:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723546552; cv=none; b=a7axrijleoTOwebefQ97oLGFrIKO9+Fd30JPGGdex4715xXVm6ldXzNHnL30uG40V07V91FXy40ZtncHZKlEV7uhjXure1tdRG3p2741Ivth0WS4Fu79Y/74G5Ep0KAJI4sQFvoHz56cmZt+pv8NiB58+SxB8djHc836/SKnSzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723546552; c=relaxed/simple;
	bh=bVlxMMRjII3O1ez0/lupSMYEQ2pl94z3t0kj3csreSc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uiuR5bfoCjfCgHQRvXp5fdmoEbg7mx3Lizw9hyKRgx7wxBpBqLFTYhdB/hHt6Nrx7PqqitPmX3An9EJbortHvBKpeLciyb+CxUrl+0UCK1u8wed4mh9tpBp8kb8KzxQwTt47fOvmyEPLFZ8kB4lw1HbEVRGbO5FeCNH1LB9oeIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WjpCg0SM3zfbMm;
	Tue, 13 Aug 2024 18:53:51 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id C39A418006C;
	Tue, 13 Aug 2024 18:55:47 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 13 Aug 2024 18:55:47 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <krzk@kernel.org>, <alim.akhtar@samsung.com>, <linux@armlinux.org.uk>,
	<cuigaosheng1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
Subject: [PATCH -next 2/2] ARM: s3c: remove unused s3c2410_cpu_suspend() declaration
Date: Tue, 13 Aug 2024 18:55:45 +0800
Message-ID: <20240813105545.1180788-3-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240813105545.1180788-1-cuigaosheng1@huawei.com>
References: <20240813105545.1180788-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The s3c2410_cpu_suspend() has been removed since
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), so
remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-s3c/pm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-s3c/pm.h b/arch/arm/mach-s3c/pm.h
index 35d266ab6958..d48d15088525 100644
--- a/arch/arm/mach-s3c/pm.h
+++ b/arch/arm/mach-s3c/pm.h
@@ -48,8 +48,6 @@ extern unsigned long s3c_pm_flags;
 
 /* from sleep.S */
 
-extern int s3c2410_cpu_suspend(unsigned long);
-
 #ifdef CONFIG_PM_SLEEP
 extern int s3c_irq_wake(struct irq_data *data, unsigned int state);
 extern void s3c_cpu_resume(void);
-- 
2.25.1

