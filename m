Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58E13EFD0B
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998757; cv=none; b=QC4Cgcgk2VvJBPluxcMClkzn2Vfk8wIsuIHlOanGrM5ufSyiR1Tw+5B7oNV3t8tm3Y8/ehcmrRCOcadITJXPnEa4LNa5K0mlBj1Ph4c9y7wF5qyEw7QLic0awyMVF4+toOgZiFEuTiyCp65IRHYKYOnEztR82WqVKvn1oZGpX+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998757; c=relaxed/simple;
	bh=8qluRMxg8XjIHb//whowodtyirdLh+q25aKG3zPxL6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HU+5eI78G2a5IPvhZnpg95QjVd6IAUT4AewkdjVuGGafRh4lkpMIfegu8M9Bu8aGg1GhpuW/KQFiiXECnEP1/BNRJKloLc8ceqrNa0UpumgGcj/DEWzqru3KiEo6xbqG1t8hdkFXS1sWvmTmPk1WvIZ5SSsNlxDqalvyM52/lvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1U/CRJw; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1U/CRJw"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso3195680a91.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 02:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998755; x=1781603555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GtRmLzA0ZT60bBVMGm4lGXTRSY/cD/E4T6nl5lxjKr4=;
        b=Y1U/CRJwdtkrDg2kCkFD6qLcLVAGYHgxQK5dManPcx/WM1q6JG9dWmNH7ffsPumsyK
         +OzZ5zSsMgqk5qW8pD7tahFrJmM+jRI5Xfcwq3C+gWXlekSPIduXi24uOOyBA9rN3TKN
         x+jbonjKJKRZN95iRFQFUKtJPEqxfmEOlbQwkkkTwlmOxmpIHEGNsXE6Ly1xmqi8yFyA
         xO2O1eDq/unt7t8Dbmutxl89tAGsFaT/hQMMFBipKdXbb+x4/g8uC99/i83W5IiwydXh
         143g5nSTvlO+kaIpFsCfL+1Tfk2VsG+TOzYIH1rnbACrkmooAflXNXXwHOtEW4xQK3s0
         iZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998755; x=1781603555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtRmLzA0ZT60bBVMGm4lGXTRSY/cD/E4T6nl5lxjKr4=;
        b=PW57mw+794eu7D7EAGHK9PFCWsdEtgqxJWKvo3upUiywLBaJg6/KEdiRZ1e0FaB00o
         1HqXkr45zqqbTK9TPST0mR5jKsM/0eTuClEKAxcGIcgt73mvuSbUztmfOKmVqeLMr3fV
         MB7YzxC/NH2ybMt6/Hf7w5vqvAtz27fp3eMs+WHtxd7BTGKQ3RRR/bZMsJOwsHTtdRTr
         dQawGRIK1fUS0g9wpvUJdWxGT8iH4BuXu4AcvybxEEE0nRAi21mcP3v6FYpGr7UDtv2v
         vqirJtovQbHlHeQxCdOFK7PgOncou0aA6Q+lOpL4AoHG26xZLUnohe1j55+3RYlLQZbh
         QMXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SthPk5Jqer76VhzUyAGdLdz/OEe74FtK+xrhwQEKT7a0cnMLU0Ujh35w2tvIkFUjKHxAAxkfJm23DxQCQ0osAYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM5aaZ9W9ArhUWanxujNiAa96zWKXkCnS76R8t01wguw35FcBt
	S7cmMH+iWrJH0pAEEM+DdRo9QxnJMKhXEv7cx6NrXTH1lc+zworo1Vzi
X-Gm-Gg: Acq92OHpq54ecWuK975BCjyrcbpwrBRr/Y/KTPd1ot+ctE92BMNlFlL/uEoO1pRBUD3
	xYLs8TtyTOPmWtHddKrc7G1F2yOXct6/6IOet3sdGZFhQwgRISlq+jI/jdqku44D2TF9znznN7R
	QdMMMa7ZlnHxYdV1tUR1dVCw6Cd1+s/X2LuoH5Un+5AN6EWfTPXIydURL0eZkjHeCqjiPLQfJpJ
	hNnfh9pK46GS9y2HpeueVbP1z51nULQb/9+s8JBDl6SSKjx718QjksAKnygRMp/jI0KRbFPiOcB
	EHAQg9dtSkJPfF6TVte+ktZMuAspTvdDW2g4UDJ7PLT+GNoft9NVA47YPtcMb/Op2MlaZHKfyKf
	N41XZFvo56FwdSBLYGL/0cJJsrYJuTDdIXYXKXmn1SFzTY2t8Pwi7AAzuf8rAf+WXfx4RdzGYxg
	pa4TLLqZ2YmFvmnEaIHkLl1SO0r8oi5tTocW6nc+RkktgWiSrsTzUN0GydKY48t6sty//Ms0KAR
	dHA8FjH94iOw7HGEDj143RJkdeOC7oZlCiy7J8UuAhYdDPhHVEBVA==
X-Received: by 2002:a17:90b:55cd:b0:368:ac5f:d31b with SMTP id 98e67ed59e1d1-370f0770bcemr20382207a91.24.1780998755286;
        Tue, 09 Jun 2026 02:52:35 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3713346cd9fsm13185172a91.2.2026.06.09.02.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:52:34 -0700 (PDT)
From: geoffrey <geoffreyhe2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 0/2] soc: samsung: exynos-pmu: fix of_node leak and refactor regmap lookup
Date: Tue,  9 Jun 2026 19:52:22 +1000
Message-ID: <20260609095224.1706036-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weigang He <geoffreyhe2@gmail.com>

exynos_get_pmu_regmap() leaks the device_node reference taken by
of_find_matching_node(): it passes the node to
exynos_get_pmu_regmap_by_phandle(np, NULL), which with propname == NULL
uses the node directly and never drops the reference.

Patch 1 is the minimal fix: drop the reference in the function that
acquired it. It is small and safe to backport.

Patch 2 is a follow-up cleanup that factors the shared PMU-node lookup
into a helper so that each public function owns and releases only the
node it acquired, removing the need to pass NULL to the by-phandle
helper. It also makes exynos_get_pmu_regmap_by_phandle() reject
propname == NULL with -EINVAL (passing NULL was never a documented use
of that interface). It is a cleanup only and not needed for the fix.

The leak was found by the static analysis tool CodeQL. I do not have
Exynos hardware, so the series has been build-tested only (arm64);
runtime testing on real hardware would be appreciated.

Weigang He (2):
  soc: samsung: exynos-pmu: fix of_node refcount leak in
    exynos_get_pmu_regmap()
  soc: samsung: exynos-pmu: refactor PMU regmap lookup helpers

 drivers/soc/samsung/exynos-pmu.c | 71 +++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 28 deletions(-)


base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0

