Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70720419306
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012130; cv=none; b=tsKcS0aX+Tnmvr5CaHKh/Hu/SnuzY4qdLsle021TmPL/oJV27iKWb67mrbi8Q2YhXhmNZ8fHXDPyV+ukk6lBoHXDm82/D2DlS9C37B6mXJcJGq1qt2TR4HR56v/I0HzrJwxPJdoiPDQ8RNACc2Bjs5SxJKxptDhFLaD48AM7pRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012130; c=relaxed/simple;
	bh=jpxnrGycI8rKTjiQaBOGwhUXMd0O9eLBVdSkKkFGyEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pN2Ue7RTKU/caFnjDXsaTLTjY1PJMnXC04p8uvQiCBq0yqGnTWAg/B9PACkHr2K7vomc55zF1mQWSd97rh8/nvUDWu4Np+Da90OXcnXsjCF8j7mvac4T9N0QnUl5aj7KT8PpW9rgk87wtrwoikNWk8VakECwn/8GP92xDAGr5Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHuaSFE2; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHuaSFE2"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso2319656a91.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781012126; x=1781616926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcKDdH1yhiVL50Qlb5vKMH/mf+UgMoMx7KZoBbcwRZQ=;
        b=YHuaSFE2tmLhSiPEJEtCfTcIfHf6qoucg5x48pSSuobOq+WsqX5h1k444K5BC9nCGE
         q6Xr9gdDAewmKbjGVfbyz1y8ZeDBeHHFIXLWQRijEyMr3Iv42flflVAVcEW0gOQY8nwv
         NoTOtchlCBjFqpJSguTcOa3CIzZnEP0BrLI1ErkyGV7m2wXGFcTh+9n6u1pCLYOtk+6B
         RHrlmU4ixp3fGiQLS3xuNEj1hZTSGhI/oH8uzg7pb5Yo9CyLdtVpIdQfebdv8lJ7XvgX
         FJrJhNIsrIiJfq9AhXyllkI7sCNMalVO+U+mdwuSv+H0F3cdr4mdsR8HXe9f1OWtUXDc
         yUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012126; x=1781616926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcKDdH1yhiVL50Qlb5vKMH/mf+UgMoMx7KZoBbcwRZQ=;
        b=k2LExv8eUr5bCI2VPkaFdWcCunLHjZ599AVKqvumt7ecMGiyQzACKomDg+iosKsuov
         LSWlRWPcG91vPU3iFufceu3Tl00SwhWLrVZmuJYIUhvsiZSXAP8D0Z1E3+aEoWADMq0I
         daaP8L2yEEAJnQAaErRKAp3OsNwErv0dBw31YGlECtnxma2lsmCs3pUr5nsk9P2XkHrv
         WuIsbTUto5c/zcmwfQleayszy8KiFzQFKXV8DIlEnI+Rzo6hIvp1KsUCkx4GUy6adRE6
         CFNXQrTl1D+V8zF/duWrBAS0Tav+q5E9b7Wfyuu62d75JcZuEF1sv6AwUYNTXT8k0IoP
         PSTw==
X-Forwarded-Encrypted: i=1; AFNElJ8d39j092J8xd9GgbSK4iCHij4/DAs2GKvQcvz0iRR5KdK/nVwByHmuiIRdAgpg4tYwpJ3eMvZPp+4cGUHGN04oWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxOkvX2Q8krrxvq6I7pbRc9JrXfq2e8oE0xkwdPirzexsJYLP
	UBnr7HoCvSmGevI/nrDK1eFppS0i5YG3bb7IkuoA+xu2H3ZBgG4yp89L
X-Gm-Gg: Acq92OGmnI6Lf85K1y1ZO0Pw5xqok9SSHMVTXShPcDYMtqJP6A6hV+0MBmJU2qGjVbD
	35OoQDbdzuB88OLUMHZIlbDRMjjJZjafKZMPJKECgM0X6/DFX8hXq55m7lZRmFZnQZXnApn5Fk2
	zvT9Qiiu+45c4bfzTsqRhC65qr25aaluqtokCwBYmfL5r0Rpypyk8IbC9d3/PVOalKAM42BudSf
	dnt6Y4o4hRzBZvvSI9CJDxkIjdvWJGApR/oUgXOqAcHRIYQjNjsovbG7wysSCoYQn5IrHyA96OU
	WR0x77R9N9K/PF8mDg7qmKBSN8eM84ZUniYjSWGCPOKcrLCrV1UD8s0IJQ+JgTMTOSUTvpyWydW
	JczIwEeJFZmAdm/ezUNCQmJfg9Zi8bwtiZDpciYZG3wPpVGuabe9LMAR1EizOiC+PoAjgP808Sl
	F3ZEYE/+TrszSMvNE+fxzYdkZHPsgKaGbXjFqSstLyT3YPq3EOlGgVyA0fc5EQJEt4ncDLYv3bq
	cQKRsFBHYkl8a2wgQV0oTwLb7R0OT9dd6gANCe5wqRQe/MLQMnD4O5tBFv0uv47
X-Received: by 2002:a17:90b:57c4:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-370ee64373dmr21339868a91.5.1781012125708;
        Tue, 09 Jun 2026 06:35:25 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827f1sm23628719a91.3.2026.06.09.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:35:25 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH v2] soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()
Date: Tue,  9 Jun 2026 23:33:20 +1000
Message-ID: <20260609133320.1748882-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

exynos_get_pmu_regmap() obtains a device_node via of_find_matching_node()
and passes it to exynos_get_pmu_regmap_by_phandle(np, NULL). With
propname == NULL the callee uses np directly and does not drop a
reference, so the reference taken by of_find_matching_node() is leaked on
every call -- including on each -EPROBE_DEFER retry of the only in-tree
caller, exynos_retention_init() in the Exynos pinctrl driver.

Annotate np with the __free(device_node) cleanup attribute so the
reference is released when the function returns.

Found by static analysis tool CodeQL.

Fixes: 76640b84bd7a ("soc: samsung: pmu: Provide global function to get PMU regmap")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
v2:
 - Use the __free(device_node) cleanup attribute instead of an explicit
   of_node_put(), as suggested by Krzysztof Kozlowski.
 - Drop the former patch 2/2 (regmap lookup helper refactor); with
   __free() the leak is fixed in place and the refactor is no longer
   needed.
v1: https://lore.kernel.org/linux-samsung-soc/  (<<FILL IN v1 Message-ID link>>)

 drivers/soc/samsung/exynos-pmu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179b..265a095316079 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -167,11 +167,13 @@ static const struct mfd_cell exynos_pmu_devs[] = {
  */
 struct regmap *exynos_get_pmu_regmap(void)
 {
-	struct device_node *np = of_find_matching_node(NULL,
-						      exynos_pmu_of_device_ids);
-	if (np)
-		return exynos_get_pmu_regmap_by_phandle(np, NULL);
-	return ERR_PTR(-ENODEV);
+	struct device_node *np __free(device_node) =
+		of_find_matching_node(NULL, exynos_pmu_of_device_ids);
+
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	return exynos_get_pmu_regmap_by_phandle(np, NULL);
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0

