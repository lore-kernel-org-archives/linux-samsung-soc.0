Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79A31AA8F;
	Wed, 22 Jul 2026 20:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753060; cv=none; b=dSmyrCxzOkmSuubvaBK0tbwLAC5Ty3/2Dlpe9/DGEVXnkT1RDvWX7z+Gq9sn2CCuKJsol7fxougrGKi3S6jQAeOzAioo+uVhmutT8/N618vtFcJ+GSw8F24N+wIKS5GqK3dFOEtl8G14HqIvDSsQuY6KNhb1fgkk2cIJvYj/2GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753060; c=relaxed/simple;
	bh=QCFLtqrjxaxKo+IkPyPzKNyVJbZKAG++zQnBYytxjyk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sxGQIxhgnf8OXlQVhPnN+GU2yKsOvi8z3Uds2GgY4xPhB5l7YQCdavaFLtEu4Y0b+EpKr6wlOeluh78ISI3qMW2lxiPGJXmdz4sPLaTcx/p6pJp4aEM8NpGlm0hReW/a7+F/OWVWQ4hlj8RrS4JWXSn3osG5pi+CgUgPpReZKWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=YbaHimZl; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="YbaHimZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail3; t=1784753047; x=1785012247;
	bh=xbt7lg6ASnf6yol7TditJ/E15XiSCMl2qVhsdgt6Qyw=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YbaHimZl+IzyFfkoTPAKbFfhsyueZIAgmp5oPPeGQ+y4qmAstME7f5MIex0LRY+pr
	 X6PsKb7supMtDtGXqd90ySBUxC1th2pDQtqffWXoIOzyWYpEfGBq2Lx+M7WtKo9/xd
	 lVo+DY2HfgXPTQlCKOvb9+n21CwlFaLGEEcMS4Dc8oOHMsdanHCcrycPgABc8ej4Wt
	 nH/SuZ4c+JrpJCnAkjs6ji1uqezVDUf5/A7ZY1u3O800JBmab5IyT/M/GZzY8QSdhq
	 dl/a199V7lGeKXivTSpYRzOlBWHVcThR/FuaXSu1n/GheUeaCXf5bT+rwR+77b8kdT
	 57gY1OTm+WU0A==
X-Pm-Submission-Id: 4h55nw6NWyz1DDp6
From: Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v3 0/5] clk: samsung: Introduce support for Exynos9610
 clocks
Date: Wed, 22 Jul 2026 23:44:01 +0300
Message-Id: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23PwQ6CMAwG4FchOzuzFhnIyfcwHmYtsihMNyQQw
 7s7ISYeOP5d/q/rWwT2loMok7fw3NtgXRtDukkE1aa9srSXmAUq1CqHTPIwti7sNShJd0e3IE2
 BZkc7rNCkIvYenis7zObxtGTPz1eku2UoziawJNc0tiuTlodOLjyi+BZqGzrnx/lPPcyN+J6p/
 er6HqSSaaUhU4hnyIsD1bYxtPVu1nr8Cd8D9JqAUSBIiQuuoNDwL0zT9AF7gkfzJQEAAA==
X-Change-ID: 20260715-exynos9610-clocks-a82a4c42f2a3
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Chimac <alex@chimac.ro>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784753044; l=1722;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=QCFLtqrjxaxKo+IkPyPzKNyVJbZKAG++zQnBYytxjyk=;
 b=YtVdMQqvrw3I9oyj8Kv0aIb3Z90Md0KX+PV/sky+lp+sLS6ZfR7kEWanv0kEu3C35wtcCf/zD
 RB6g7IF0d+oDHYvzzq+VEun9JYFnM6YXZCl4HPiKV9s8IqUnO9V+RKB
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=

This patchset adds partial support for clocks (no SHUB, MIF, ISP, VIPX
or MFC) on Exynos9610.

---
Changes in v3:
- Use correct DRCG_EN offset for dispaud
- Fix improper clock assignments

- Link to v2: https://lore.kernel.org/r/20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro

Changes in v2:
- Remove device tree node commits
- Fix binding formatting / example build issues
- Enable auto clock gating
- Add USB CMU
- Remove CPUCL1 CMU (PLL initialization fails with ACG enabled)
- Update maintainer e-mail, copyright year

- Link to v1: https://lore.kernel.org/r/20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro

---
Alexandru Chimac (5):
      dt-bindings: clock: samsung: Add Exynos9610 CMU bindings
      dt-bindings: soc: exynos-sysreg: Add Exynos9610 SYSREG bindings
      clk: samsung: clk-pll: Add support for pll_1061x
      clk: samsung: Introduce Exynos9610 clock controller driver
      MAINTAINERS: Add entry for Exynos9610

 .../bindings/clock/samsung,exynos9610-cmu.yaml     |  335 ++
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   20 +
 MAINTAINERS                                        |    9 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos9610.c               | 3715 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   29 +-
 drivers/clk/samsung/clk-pll.h                      |    1 +
 include/dt-bindings/clock/samsung,exynos9610-cmu.h |  722 ++++
 8 files changed, 4825 insertions(+), 7 deletions(-)
---
base-commit: 06a508eb73747a8a71bed89f5766226e433594c5
change-id: 20260715-exynos9610-clocks-a82a4c42f2a3

Best regards,
-- 
Alexandru Chimac <alex@chimac.ro>

