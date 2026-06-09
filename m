Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B6D3F0ABA
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998763; cv=none; b=QqRUsFqqr6nT5lSl/hHaRq5uynOao3yWg/DePQHHiTWTAybsFo9DeACCb7PXd10AwL0NDDWttP014hUq0xRJR2lrasPnwd+WicDbYN/JlzVj27pt/EB/33RFfaXw8SwhfUU4nFCOsHMvQZsiXRjv0iZxQOSA2gCs6/OFi7sfCoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998763; c=relaxed/simple;
	bh=hQnkN/hywsdMhI6SFtfWDuH/kDNrGdOpFCY60EQjxhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W12NJKRlDyCbzAYzIaRRP5MK2QhiMfC/twKj2wOSFCxQTEEuiV4+WVS+cXDIHfpgZC5rJiPPU2tONrJPwhB5fm43b0HIkf90ffNsJB4slC/Ue/EqK/ZlmZ84EDaCMW2Tn1yWNtonMB8dDyyzJvTvkVJWDUOz5LiT7KZ70R4uG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2JywiA+; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2JywiA+"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c858cc9870aso2745475a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 02:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998761; x=1781603561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Atlbwdb5r6O9CLVUIxIon+j2XEv/nqOX8bGypd9DhqI=;
        b=f2JywiA+CVF6PqjYgvlgDL1WfA5182lWDH/DG5IEpjY1hKyQYdp7wHpZZ7dGJsZJDN
         eFTfbxRK67nEUTKp4fE6TIXC6PF1peSENjZj9wO9y2kgcsl5s9z/ynsGMqBD0fvyPm0R
         5HlGu30VJsE6Gym5ArbaImib97Bu9t9CfzGJvZxFH21Tr6BuRiQQL4uAOPbt1ZcH2v83
         FdDMDLuWT+WRsBubV3Ptz9HZDMAkbyO/+f2wbd+LkcOZME4yvgMGiJMNkEUhxLFTYOhW
         u30USnEVEJh8wrkNZ7CN6qxy5q/pbB71e60SVZCkAAweOH6sY5o98H9gDGksPo75O+ru
         2RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998761; x=1781603561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Atlbwdb5r6O9CLVUIxIon+j2XEv/nqOX8bGypd9DhqI=;
        b=qF6QKT6WOm7seWesfymMPQf/zqI44rDJk422fENG2Kc6gbIaRrPyC4V6GTVbFJ9HAS
         NVeA97jN41mp1zyHMl8sRVgaamYAeTTsbXXcNqkwYN73l3ZQZEY6Ak1EDTN6aQ0972MH
         esKwZEQLQ1374JbfoB/+pqDTFBtPPXn8go8OwW1zmnKYkGIflOCT7AsGgDy7k1R7t9G6
         BFJsiTYkp2xSiL+pCYtdqruQf4yqqZBnK45NM5Z5S2lBmAugnuzpj0shQSJ054dVECSl
         ouDiMpZDwQCINhi7xhE/jZgDTxTn030EWIKcr66IcfyVrF5BujSH5fewWO4v+5a327rR
         NhNg==
X-Forwarded-Encrypted: i=1; AFNElJ/PgqyKJmQY4BxCo5E+TlQRrybzxKsBO8VWwV55mzklN+3vUNt5lTJNgq/dG20WgRzXEZJL8nb8ynPYMoRsiNsBgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhwfEkkBJNLeF1AwEasFO5M9zYZMYASCcNsB13JpyPj3axBlXy
	2zbNemunyDW+FpD+WxuYFK+yym6VH0x48QshveaBqeITRrgD+wVpuGAO
X-Gm-Gg: Acq92OG2XIoXjebOMqguN9PCg6ctVztqrYYsTAI+Pdl/4Sm3t7UW7NN4cyNydRo2ppG
	+zy4ZVlIGu97zfDODajuZv5nByTt4/qJqE8R2QYe3kPp1b82GTuw4WrTwre3uqtmIFQJPYdpetN
	FaaWKyouHBSbliN/pxoLqbB6NWS+p7OWBE9VGnuy4kA/eT7Nf7Qpiv0uK3krY3oNsGaofBfB1iX
	Z/J6tK/ljw/0oPaGkqZGDOOlc2A1y3e9YphD4KLnuXbTVWhjvxfPJtjKX8YeTd8amL1fRaJl31B
	s9KswpWno2kYiSNfLNiZwoo8mxOa8Z9Klo8xPJrvx2CJUeJO9ehn7FvDgbV8zd49YvhIJGwumFj
	rcYMKV9DZ9zE3CSYJj+0co2tpuS7TLatzDhS33Z19yutUQhsVHhfJYBAJEYHdixz4X0ZnLQGoRM
	MlzQKQ6jO9a0tGmNKIgVAEl/MRz9axto622sDdGCdUAWiuVMzkuPEtBIIC1slHQcA4ooHAfYxpt
	AcMakPmIdMFcJ6equuA13WRCuV3KaGekCqTNxxJtdmdanVDiAA76g==
X-Received: by 2002:a17:90a:c88e:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-37132b9aaebmr15941311a91.14.1780998761313;
        Tue, 09 Jun 2026 02:52:41 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3713346cd9fsm13185172a91.2.2026.06.09.02.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:52:40 -0700 (PDT)
From: geoffrey <geoffreyhe2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 1/2] soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()
Date: Tue,  9 Jun 2026 19:52:23 +1000
Message-ID: <20260609095224.1706036-2-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609095224.1706036-1-geoffreyhe2@gmail.com>
References: <20260609095224.1706036-1-geoffreyhe2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weigang He <geoffreyhe2@gmail.com>

exynos_get_pmu_regmap() obtains a device_node via of_find_matching_node()
and passes it to exynos_get_pmu_regmap_by_phandle(np, NULL). With
propname == NULL the callee uses np directly and only drops a reference
when propname is set, so the reference taken by of_find_matching_node()
is leaked on every call -- including on each -EPROBE_DEFER retry of the
only in-tree caller, exynos_retention_init() in the Exynos pinctrl
driver.

Drop the reference in the function that acquired it.

Found by static analysis tool CodeQL.

Fixes: 76640b84bd7a ("soc: samsung: pmu: Provide global function to get PMU regmap")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/soc/samsung/exynos-pmu.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179b..a5da2741852b4 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -167,11 +167,17 @@ static const struct mfd_cell exynos_pmu_devs[] = {
  */
 struct regmap *exynos_get_pmu_regmap(void)
 {
-	struct device_node *np = of_find_matching_node(NULL,
-						      exynos_pmu_of_device_ids);
-	if (np)
-		return exynos_get_pmu_regmap_by_phandle(np, NULL);
-	return ERR_PTR(-ENODEV);
+	struct device_node *np;
+	struct regmap *regmap;
+
+	np = of_find_matching_node(NULL, exynos_pmu_of_device_ids);
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	regmap = exynos_get_pmu_regmap_by_phandle(np, NULL);
+	of_node_put(np);
+
+	return regmap;
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 
-- 
2.43.0

