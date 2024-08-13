Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFB976025
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Aug 2024 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723546551; cv=none; b=rrIEAEb00ABnfTgt4X83jx2IcGU4g+UDTuvzkJV+JMqieCKZMbtcRTdSoqD98XTnhpw5iK28zReNIJI4ZJJaYcyu/fGnh8q0q1DLVQFOhQ+fBebY0gz8I07HmEdiCeV4GPv6Ej2AYF5QfhZZjSXcG6i8YplivwcCAucQsf3z3jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723546551; c=relaxed/simple;
	bh=xtxTQvG6w8zzYPfYQxLQe3CcZL68tB6KHNC/E2XPE1Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uo1T5LSGRLM5RemQqqO80Rds2mjrTLqANxOKvGfewuxK52Yk/B21H3gImMuNISkU01lIWBXrxNti21v7ot4tpPEKBs3tTUmWwJWQ+kOS/pT42Eylt1g3IcXFsJuEL4o+s950SvQCdbCwN0fGDu0RY+EsCRujdo5/8AkTHTGV3o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wjp8J53GWz2CmZW;
	Tue, 13 Aug 2024 18:50:56 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 6AAAE1402DE;
	Tue, 13 Aug 2024 18:55:47 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 13 Aug 2024 18:55:46 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <krzk@kernel.org>, <alim.akhtar@samsung.com>, <linux@armlinux.org.uk>,
	<cuigaosheng1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
Subject: [PATCH -next 1/2] ARM: s3c: remove unused declarations for s3c6400
Date: Tue, 13 Aug 2024 18:55:44 +0800
Message-ID: <20240813105545.1180788-2-cuigaosheng1@huawei.com>
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

These declarations for s3c6400 have been removed since
commit 6bac4f78ea3d ("ARM: s3c: remove s3c6400 support"), so
remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-s3c/s3c64xx.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/mach-s3c/s3c64xx.h b/arch/arm/mach-s3c/s3c64xx.h
index 92258e4f60f6..0505728f3f7b 100644
--- a/arch/arm/mach-s3c/s3c64xx.h
+++ b/arch/arm/mach-s3c/s3c64xx.h
@@ -23,17 +23,6 @@ struct device_node;
 void s3c64xx_set_xtal_freq(unsigned long freq);
 void s3c64xx_set_xusbxti_freq(unsigned long freq);
 
-#ifdef CONFIG_CPU_S3C6400
-
-extern  int s3c6400_init(void);
-extern void s3c6400_init_irq(void);
-extern void s3c6400_map_io(void);
-
-#else
-#define s3c6400_map_io NULL
-#define s3c6400_init NULL
-#endif
-
 #ifdef CONFIG_CPU_S3C6410
 
 extern  int s3c6410_init(void);
-- 
2.25.1

