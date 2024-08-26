Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1039CB64A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2024 03:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724643084; cv=none; b=SOYPztwxpTwjtblF3hKPfZqB0cYWWuPd0xti00wtPsyAqadDiFw0PXfozD3p/5M8w5Gvj0B3Q+Ga1OfdR8DYrv6+mK974at4DyFpEIqMW9s32KLptzW9HnTcUAKbXcgkB118oRwhZhp7/+ODUxRdSc/XVi01XGgYulIKcS82/GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724643084; c=relaxed/simple;
	bh=RdpgrtE0BNkUH+sCUovJgp3bCoYUMeZ3+rBiFLPIs7A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UEu5ivzze2p6oVvDvA0Gb3aCLisZtFYpyxfAISZf/zblqlaWwZthjArUe02Zqa6qcnQvLFC9ae7aMzutukFoT36GbMdfjseKj5k7lG+5Ia8Q7WN5E2GwCwU554ruvX4+lyUCHKfkIxhrTzGN5g8t5q+7/g9n/ARQWcQyXiJu3Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WsbgX4p3pz69Hp;
	Mon, 26 Aug 2024 11:26:32 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id E258318007C;
	Mon, 26 Aug 2024 11:31:19 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 26 Aug 2024 11:31:19 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <krzk@kernel.org>, <alim.akhtar@samsung.com>, <cuigaosheng1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
Subject: [PATCH -next] ASoC: samsung: Remove obsoleted declaration for s3c64xx_ac97_setup_gpio
Date: Mon, 26 Aug 2024 11:31:18 +0800
Message-ID: <20240826033118.4021727-1-cuigaosheng1@huawei.com>
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

The s3c64xx_ac97_setup_gpio() have been removed since
commit 0d297df03890 ("ARM: s3c: simplify platform code"), and now
it is useless, so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 include/linux/platform_data/asoc-s3c.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/platform_data/asoc-s3c.h b/include/linux/platform_data/asoc-s3c.h
index f9c00f839e9f..085dd8e8af76 100644
--- a/include/linux/platform_data/asoc-s3c.h
+++ b/include/linux/platform_data/asoc-s3c.h
@@ -13,8 +13,6 @@
 
 #include <linux/dmaengine.h>
 
-extern void s3c64xx_ac97_setup_gpio(int);
-
 struct samsung_i2s_type {
 /* If the Primary DAI has 5.1 Channels */
 #define QUIRK_PRI_6CHAN		(1 << 0)
-- 
2.25.1

