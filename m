Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ED8165F16
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 23:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778110733; cv=none; b=HuH5m17N+0zSzKhn2F5t4Tm1gL2bHgVdAlRJau4Iq99i+tbzfAq+7pBQCpnAKqRKIfaccVj9x+YFTg1NvBLmREDTISFjjU4PV1eQCN00P6J3Mjn9ZmPaGPuu5xrwuxPhzT7jC2YXxq4hiIExWeSQB2aTVKNtB7HOZcggSjCigOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778110733; c=relaxed/simple;
	bh=9zAPeymXTdpKny4POpd108mMRvmh/gvrm8KrmFAoFzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nWraoS3z9MQ56jn8+RV8I+bTxlyuyHNLTTNQmWjMoTj+NCEUAVe0MLnYbn58mjNVc5sk570UhA/6UOwJp94GmxBE24/Hy/TfqfHzMuwFd9ngUcP+2QnrN+xzHMlfyzZ5lYm1TCVvnkVbfWjb+SlLy16EN8yvqImpQIwzuybLLic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoL71SZe; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoL71SZe"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b45cb89f7eso1705505ad.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 16:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778110731; x=1778715531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UVEIaKDdrM7xZJUVR1McqNtSIVMO4TpYRcIh7aYsrl4=;
        b=EoL71SZeCun8eAZ0U3LnPTB+JXJx/+KqBBNQ6OtKSCbiStSsH6Hzx2Lm8W00gyihwb
         1qOLpT0uQ/xS/kjzT/iWe92JWZT4cQeJ9DUybN9Z7oQfg+Z41uEvyf6C3Dt80cGBONK7
         bHX2Q7+5ihpc10rSjbbTE7ruZeaDkUbINYGC80cHqa2zcXOykdZEfKaP7VOveWCJVItl
         jfJiM95wpOOsx4Q64TItROp/Ef9BEPLFF4+qKcQelsMSKqbggWMv2rR1qxnlr0JuEgcf
         zxALSTV9nS2w/tuQp24Jq3Irn1F1PQZLJLLAyOMecbwy1jqsolditHF0om2Id5y2Tz9y
         5POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778110731; x=1778715531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVEIaKDdrM7xZJUVR1McqNtSIVMO4TpYRcIh7aYsrl4=;
        b=N18Jv0ciLMqv4kIbrrtlWZ0Wg0XjbVItPV8cpcFw4eQYAocZOs6Hf+ZZhOuSnL405W
         wAmgf96CdE9To7Oavof6KOr1O3i4rzsYtWwdfOkrfgyTZyRJ/M0uSvbY1vHBlT/dN4o5
         eCZTg8dIhY5gavQn3SpQy56Q7UO9wSiD1qEDIBs7i/bq4+ftEE2uWyzUUtSjeeYEwTL3
         EP0zolOmPdgd6dtnvYjYLhiVbYuufoda7a2fPd75oyFIjt8+Zl54Zh6MldWBmvkT2oqv
         ORnHIwLoxjzGaQ64/RgbJiTsd7Fz+BZlld1mCqvqefMalyjus2m04tcbVzuvQTBVJVVH
         KxmA==
X-Forwarded-Encrypted: i=1; AFNElJ9m1XOF/EA31+K7JEBRvUM7l581792AdSCSLiHYBKJdrv6SKwZxu/0BXzVogMG+dly9zjQRDaEUTJpPr8otv+QQiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu1feOTxF2bIvNo/2T4Iz2/P1uLKDjLpDDiwekjgUe/Y4Px9lT
	W8bSSJ7pLEr3nfWj3LUpqOrVQeKSvgoikYQ7Dr0vhcZKdrb3Fst8lik+
X-Gm-Gg: AeBDietna0Kd8Nq9yevme3r1DbbM0/qPp3VDf7RxzfkSjUE1iGJJ7c08R9KUfwj++x+
	vECqXnhRB8q99poQX3XvsNuAOGtjuIeX54baKKvz7mLjMRmkBecWBaXgbcMCY/B6V3j/vhc0zlD
	tk6vyulPt5GfM+e73iYVPwkD5zVyrGRtUZjJsVxuxQDlF8kxzR+KwnZPgZi0aEjJH5t3TywoD/m
	MobCHBFYruK4ac8J7XXgRCb4tYESIzfaqVaWFMPKts/cPW24YPvJ7SGCepp0tycE35H8Ks6JYaO
	DgikSAIkVUiuxBVpzaO/SHTI7/FszR5HFt/lEXk4IRA0UoV0aYZPzQTSMnmGJ0hHpE0h2T7ygfJ
	wR+o3o70yAc9IIxwVEhzD+3LNuk6jwbF8wNoLjSyaDGm9mqj7eJDGR020Dc+puw6cu4yqvDkP4k
	KA+/ncmxOm8TZPVJaPpSQmUlAwWa3V+392+wrWVLnHKrh2V8dN4L+4q5DC4jSXEvBsHHy1vUvjL
	7OkRw8GDHehjg4AGSr0rT6ll3le2c262cRXIO5BHUcopQ==
X-Received: by 2002:a17:902:f0d4:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2ba78e4cbbemr36383825ad.17.1778110731188;
        Wed, 06 May 2026 16:38:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babaaef08bsm3471805ad.28.2026.05.06.16.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 16:38:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 0/3] clk: samsung: use kzalloc_flex
Date: Wed,  6 May 2026 16:38:30 -0700
Message-ID: <20260506233833.178357-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch three structs to flexible array members to combine allocations.

Rosen Penev (3):
  v2: fix compilation and reword descriptions
  clk: samsung: use kzalloc_flex
  clk: samsung: cpu: use kzalloc_flex
  clk: samsung: pll: use kzalloc_flex

 drivers/clk/samsung/clk-cpu.c | 34 +++++++++------------
 drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
 drivers/clk/samsung/clk.c     | 11 +++----
 drivers/clk/samsung/clk.h     |  2 +-
 4 files changed, 47 insertions(+), 56 deletions(-)

-- 
2.54.0

