Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FBD19A288
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Aug 2024 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723546244; cv=none; b=GlXWJa6hwwno/HuGTLPgX2d8e6VldNQKr1ztTSyfvkNodAK4T2qK5tSVxoqx3+GjghOtmcXn1X64pWP0O7OsWAAV/JYFiG+CCrTcDFIIN/pR+Zd7z1j9IeGa5s6whd8PQ/MKEGkREmsA8qR+gB6JFnAm+RParOr5FfSfe452WzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723546244; c=relaxed/simple;
	bh=6fBO+zUNttTv85cOPVUd74Qeg6C6ICKHVmno6fckW3M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AMeJldllwn/McdHRjnQbse6Qwu9ILwwC8wyJxXhH7f5S9AYf6c8fIGoRSUiWhItE/+UziFBudxk+OMHnXjf7c1FcLoQKWnup2ywJnLWl02uQPfkySAtDSNBO6c1UE85Ud2/89mcz69qTdnNI7NF5HEKpBMal+idFVVyzmmAf5UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wjp6R3rpcznVZM;
	Tue, 13 Aug 2024 18:49:19 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id BC4C61800A0;
	Tue, 13 Aug 2024 18:50:38 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 13 Aug 2024 18:50:38 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <linux@armlinux.org.uk>, <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<cuigaosheng1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
Subject: [PATCH -next] ARM: SAMSUNG: Remove unused s3c_init_uart_irqs() declaration
Date: Tue, 13 Aug 2024 18:50:37 +0800
Message-ID: <20240813105037.1178393-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The s3c_init_uart_irqs() has not been used since
commit 2a8d7bddf273 ("ARM: SAMSUNG: Remove uart irq handling from
plaform code"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-s3c/irq-uart-s3c64xx.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-s3c/irq-uart-s3c64xx.h b/arch/arm/mach-s3c/irq-uart-s3c64xx.h
index 78eccdce95a7..e754b0359c8a 100644
--- a/arch/arm/mach-s3c/irq-uart-s3c64xx.h
+++ b/arch/arm/mach-s3c/irq-uart-s3c64xx.h
@@ -12,5 +12,3 @@ struct s3c_uart_irq {
 	unsigned int	 parent_irq;
 };
 
-extern void s3c_init_uart_irqs(struct s3c_uart_irq *irq, unsigned int nr_irqs);
-
-- 
2.25.1

