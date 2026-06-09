Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E00932E126
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015943; cv=none; b=aCAuh0l4lv3r93idGW7vlpniuwwtaHgLvfyOQUkMqlmlWijaAUKPtLZUvGq6ru2G8+4OSKewqQwldJ5qYeofDCKRpy2QMfpRI9pbnUyf77Ev9XjIvZ6REedgCYSOpwyizKNDd81xXybnZ/UkA/ioEZll5dcMTcuX68/mgsmoE9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015943; c=relaxed/simple;
	bh=97aE7Ww53/xYTnf/jGN6p7aLQq344lXYs6Z17FpXAds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NzQnkvU9yvoHgUBUIDtVwTXoa7mZYWb8yuikBGIH+oUJFHusXqT0u3dfSCsFyNOKTxCShNcbS2tcWnk+qlYINBhaifiR6txUmip3RvRR1qeGUO9jHH6bog/+lIyWyIsFbT0irsC+t4zVHnrOTR2bG9ZYZ86qMb8J2+jrOAHeBL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjclAejP; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjclAejP"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c2d792c8so37699455ad.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781015942; x=1781620742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bES0slIYsqJ4nlNrDrdS0ePhgxZqsdotlF46CT03uqw=;
        b=FjclAejPsXEoiLR6t0+lGhJVn+x1Kx6SiRpBDDKp5SSwTJoqtDKpdK0KZkOcTcZuxe
         D9Y8Nf8VXmN30E+hjoUWFyXyQ7FvH1W804nu0191qezA7UYeKqrCERxu/x6SbG6QMC5j
         oHzeUbdCSiaTXItUqcC1BlvwShykth88aeumeCLgH21mQBEp344t+ZwDJXQm6kxdB0bU
         o/oP5xpOqXHBtte5Uo2w1Iid4fx3mz8Aa7HOBSSzJNSnfN6kzwqQKAjGdFB1kN0EWJwk
         c95xuP2ib49KbP6EYJHB4COoUXGym1EqzqyCy0IDGl57JPEKeiceM+QF84k3vFhnyhmL
         nrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015942; x=1781620742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bES0slIYsqJ4nlNrDrdS0ePhgxZqsdotlF46CT03uqw=;
        b=rlM/KrQxqZOjBs/AoocJtFXMyvbhfZQopZ79zBsiYkL7RcYN+NOp1g18YJvIljxnOj
         wU1OoalG1xizJgbY1mFqvSWA+53wOTjtIniDaFh00niUpWOCKqmvDExBKWimUzi9M3MY
         Ip8ydZbUn2hsAG9H7rBHh7frnIBHsgymgZ0N+kICfFAOCfhV3jjdab2G5W+9f6aDCU/T
         N/JuO4r9g/Z1pywzpnxrF0qdbdD7lpZ7ZtkTN7cL8EcijMwZbwm8WvQLvsDzvmosx1em
         6duwvLlRQmRhR/9A82q8xkaPfEaIIgs9C1aEL1PfTzeXxGGKdCpCxfZcVJlyUVT9RZyL
         n0cA==
X-Forwarded-Encrypted: i=1; AFNElJ/EiC2653Oq46xQZG2r2OSyCsUytw7upTSBpeE3NRl1yYawQUD64M5ivAOaPDBHXpLdyNNpDWqB4qOhDkByCnsIVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhB/SkZ1WKD+gjv5b/sZZX5g+/AST7zZnyYypgjilNGRVqz9f
	sTdsu2TcIG8QJ8jPiFto+1TM1lCk9LM9rPKeCZj68WDB7A0LmB84aXni
X-Gm-Gg: Acq92OG+eXUiORhvVHDyQVD1HvOvbZR8ysZrIRiuEIvp8n/ecYCIXs+RMSZvw7dCOvw
	vMksMrYyqZf4a5mpJBBFf2g7qm3GGyS7EM2m/Jo8J6LYkh6BhivKmzemxjKIz+x8D5QEPhx9/VC
	0nSGxzxvfZmNUyy+Drx+M9dCoydjZwtpcwgf+UgeMI7wvRONEimxY/4ub/+0XkyVZqm3nU7qOnL
	ErwukaXQUGiP7Q3wP1gQ/dvSyTR1HPcJdw0GIGqC5uIm+dMCBLXtvY4QUzVRpqYzHguWBpalcPH
	ZUbDExFFJBJEg4KtzkBLK8j9Desiip78NrHpUcwMncM/O1Xd7CmKL8BJLcDi5wPqk8FrcO7F9XV
	x5kpIRRoIfx1tF/PE/5NEk+ohtpprT/ngJfIidNYKwH6M24ioH7rQQ7kcrU+7+L+P3SxhmpUXKY
	PEN96VgkhpFJT2GswTm2JfXtGcDe+o6o1p8pzjuPduQ0WlDV4fEGXZmOsqkyslTt87VtHyCAAxg
	MnpmowISgJRbY8tb+UV6LX+fVAz3gjyXWIyKVgINM6M0rzFJoZEmw==
X-Received: by 2002:a17:903:2451:b0:2c0:3400:5c34 with SMTP id d9443c01a7336-2c1e78e03e8mr237284925ad.3.1781015941960;
        Tue, 09 Jun 2026 07:39:01 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm220741875ad.8.2026.06.09.07.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:39:01 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH v3] soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()
Date: Wed, 10 Jun 2026 00:38:52 +1000
Message-ID: <20260609143852.1783558-1-geoffreyhe2@gmail.com>
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
Changes in v3:
 - Only annotate the np declaration with __free(device_node); leave the
   rest of the function body unchanged (Krzysztof Kozlowski).

Changes in v2:
 - Use the __free(device_node) cleanup attribute instead of an explicit
   of_node_put() and the helper refactor (Krzysztof Kozlowski); dropped
   the former patch 2/2.

v2: https://lore.kernel.org/linux-samsung-soc/20260609133320.1748882-1-geoffreyhe2@gmail.com/
v1: https://lore.kernel.org/linux-samsung-soc/20260609095224.1706036-2-geoffreyhe2@gmail.com>/

 drivers/soc/samsung/exynos-pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179b..f5fcdde9750e2 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -167,8 +167,8 @@ static const struct mfd_cell exynos_pmu_devs[] = {
  */
 struct regmap *exynos_get_pmu_regmap(void)
 {
-	struct device_node *np = of_find_matching_node(NULL,
-						      exynos_pmu_of_device_ids);
+	struct device_node *np __free(device_node) =
+		of_find_matching_node(NULL, exynos_pmu_of_device_ids);
 	if (np)
 		return exynos_get_pmu_regmap_by_phandle(np, NULL);
 	return ERR_PTR(-ENODEV);

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0

