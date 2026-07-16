Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCBB436BD9;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222105; cv=none; b=koIIZd+oZ8rGd2wdVbiA03EHyC9320XxHRPaRzR04Oj6Cz+RHEAGKcp4SGQt7xnLAL8292N/mb76PdRD/MddoVA1Sbn0yt9fxsIXTtkqf4RTj2VD6lZwJ4Qjksig5+nErlQkjtKOoO40lQyX5uxI5iVHxlnrGvOBB8O5tW2Nd2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222105; c=relaxed/simple;
	bh=X1Fos9kKkDy2zbBIakV8ZOCZ9DAxzYNhdLDz5n9bfc8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lRpINdXoomd5Gq/U0cMWjoUYAvYP9ksCSsfFBbDMLWuj1OFHNZr6bHFPHErXhKVpeAC0/BUpoF4da+yNJjiXV+u1K6Wai4VYaVHjUpf2djAksw30jS1ZPsc1LZOjSboLH2JHwwyJkSUwRVSLL1JveaJDTMtVy0AIgiovs+SDCXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1PoNS3p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1PoNS3p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A61C8C19425;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784222104;
	bh=X1Fos9kKkDy2zbBIakV8ZOCZ9DAxzYNhdLDz5n9bfc8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=d1PoNS3p1omkUfGI1w2iv3gGCNsp93/DFmr/f+F7moJKUymE77LtLAlIYXeCLQIwF
	 vozvGwtDSiako27rGiUFnl+duvEzdka8QW5/VLVu6wlGvrUJeWwZrKPWbRxiTEPslS
	 xr1AgIKbDSJktzV/Iue+xGQCCuiSv4n4CchDT+J7YAGT/7g6931agErVar+Wzt9ce1
	 KytYsH1m6XEWKlbBGWQqclrxi/cN1lu57Oj+tZpAdTr0UZrd7Q5tfjr6c6OX2CJHIN
	 nvqmFXR+17Yrq0ZMhNaqnq9yjE8D6si5zAa6puGeguwdMW72rG2Rzt6IwQCfA2/SHt
	 D/fZCQl4z48ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80432C44501;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
From: Alexandru Chimac via B4 Relay <devnull+alex.chimac.ro@kernel.org>
Subject: [PATCH v2 0/5] clk: samsung: Introduce support for Exynos9610
 clocks
Date: Thu, 16 Jul 2026 20:14:54 +0300
Message-Id: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OSw6CMBBAr0Jm7Zi2fGXlPQyLUgdplFbbSiCEu
 1vBpcs3k/dmFvDkNHmokwUcjdprayKIQwKql+ZGqK+RQTBRsJLnSNNsrD8VnKF6WHX3KCshM5W
 JTsgUovd01Olpa16anR293jEd9iG00hMqOww61ImhKeAvX8BX6LUP1s3bTyPfjLjP2env+ZEjw
 7QreM6EaHlZnVWvB6mOzkKzrusHHo8JseMAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784222102; l=1530;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=X1Fos9kKkDy2zbBIakV8ZOCZ9DAxzYNhdLDz5n9bfc8=;
 b=oe/N4QjcY7RjD90vVYaAfx7OOis561uo4+mAZaidGEwmABp72QNciImjaCS4G+mDFyOSXERlo
 MCwY7fXqfuAAEyE43juQm34lCyjnH1AGWI27t2iG4NioxCFnI2S7Bkn
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-Endpoint-Received: by B4 Relay for alex@chimac.ro/20250914 with
 auth_id=877
X-Original-From: Alexandru Chimac <alex@chimac.ro>
Reply-To: alex@chimac.ro

This patchset adds partial support for clocks (no SHUB, MIF, ISP, VIPX
or MFC) on Exynos9610.

---
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
 drivers/clk/samsung/clk-exynos9610.c               | 3716 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   29 +-
 drivers/clk/samsung/clk-pll.h                      |    1 +
 include/dt-bindings/clock/samsung,exynos9610-cmu.h |  722 ++++
 8 files changed, 4826 insertions(+), 7 deletions(-)
---
base-commit: ce28329fef089fc63dbaadcc4c1fbf9c287e57e0
change-id: 20260715-exynos9610-clocks-a82a4c42f2a3

Best regards,
-- 
Alexandru Chimac <alex@chimac.ro>


