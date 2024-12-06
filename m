Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A618D20D501;
	Fri,  6 Dec 2024 16:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733501641; cv=none; b=oSVB6DV8vNDlNInOAqzL0wol8OtlJZFcXjjKHxPMlOAUBzsxyimzX92NQp1jEF+IzhygOpkeByrIBrjbvXmgSZUpgeAjqnxxwxMHbWE0esgQcCwyizAa96KOzXdLbcR82yBCs0TlCldNAPFXZr4aNPrDDkTDmRlXBWbHLLUPWZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733501641; c=relaxed/simple;
	bh=C8ZUvyDK/liK+O5PSjiupnuJWNIGEJ028E5VI/EvwKI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NakBtG+Iy3s0S2JNpwjCUgWEDoeIaF8AoIhWZz50KsHJRGSEyCzCTnenGO7elBsqWcyTQDRQ9ugZgIurASV4Av3pFDu6Dbi0M3moGMruRIZsfWbDY5qIaMPp8m6eXmOy16u4IjSN+6sCwTIu0kMvzu3ng86W7ZU6tmnIn1olhzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=clMCC+Y+; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="clMCC+Y+"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4bsr4hzpz4wRg;
	Fri, 06 Dec 2024 16:13:52 +0000 (UTC)
Received: from [127.0.1.1] (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4bsh4khYz2x99;
	Fri,  6 Dec 2024 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733501627;
	bh=C8ZUvyDK/liK+O5PSjiupnuJWNIGEJ028E5VI/EvwKI=;
	h=From:Subject:Date:To:Cc:From;
	b=clMCC+Y+efcXfWO23YnMIGTg/lvJB9blKRbyCZDOq6MEpVSv8sdveXU2MU6RX4xrM
	 yl9Bc5THfSZE/Ppa2qoMMO9QVj25rRoMw1GT4KLrpAEOzmCoEq0TWLak33Io9mr9r7
	 1whf1EAojBTx4+xoAjfeQI6Xdeb8GCii9b3t8liK3uNitorW9Ww4RG2ykNuCY4Hs+y
	 sKmchK/DgFyRXUDo9kTwdgxH7NXnIVk+zdfAGLTP88+WVGhv/IO6C/X3mPYIR5EKYy
	 kk4G9pBnQvU/wDNeAuAOHLsSfR4O2XZNhFSHML5ua/HcY12w0ZcSZN3y3tPmxXAuea
	 wHj0eEWevO81g==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v2 0/3] clk: samsung: Introduce Exynos990 clock support
Date: Fri, 06 Dec 2024 17:12:17 +0100
Message-Id: <20241206-exynos990-cmu-v2-0-4666ff0a099b@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEiU2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDIwMz3dSKyrz8YktLA93k3FJdU4vElERTA1OzxBRTJaCegqLUtMwKsHn
 RsbW1AGylCihfAAAA
X-Change-ID: 20241206-exynos990-cmu-58ada5056ad5
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733501552; l=1306;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=C8ZUvyDK/liK+O5PSjiupnuJWNIGEJ028E5VI/EvwKI=;
 b=XJ05RlLwlH1Hp9sM1jYNxcMvMmBVTe36X4bmaOuUeArZSJK1Jk5wAk46F0i8DqhlW7y1Ar9to
 Qx8oWcNT9ieDKhbzXF3L5xeHxtfPUPTZkH9QCsYM3N4IEwR0opuY3qS
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Hi all,

This patchset adds support for the Clock Management Unit found in the
Exynos990 SoC. This CMU allows for clocking peripherals such as USB, UFS,
MCT, et cetera.

Currently there are two blocks implemented, CMU_TOP which
generates clocks for other blocks, and CMU_HSI0, which generates clocks
for USB. More blocks will be added (hopefully soon), like HSI1 for UFS.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (3):
      dt-bindings: clock: Add Exynos990 SoC CMU bindings
      clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
      clk: samsung: Introduce Exynos990 clock controller driver

 .../bindings/clock/samsung,exynos990-clock.yaml    |  120 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos990.c                | 1343 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   14 +-
 drivers/clk/samsung/clk-pll.h                      |    3 +
 include/dt-bindings/clock/samsung,exynos990.h      |  236 ++++
 6 files changed, 1715 insertions(+), 2 deletions(-)
---
base-commit: ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
change-id: 20241206-exynos990-cmu-58ada5056ad5

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>

