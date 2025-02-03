Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7197220E32D;
	Mon,  3 Feb 2025 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615068; cv=none; b=slqqms70kXPsqpTKOECK/wQqdnsVTLysPN3Z0H4VCq+yeQAkwIR7+sQl2mgxCxmA1joNip+CsXOP9zQFlpvM26UnJdT8kDH2e2PkPlR6rmFHViXx50CfF/X5ND2IMhBIPJZFKAWKuPjIahgwa4m8HJWkiub15TaUo5vgSdDUrP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615068; c=relaxed/simple;
	bh=UOdlW/B5f7UyeRQyINQBWwmZXqqYBsym7EwJVm9wZFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a4e4xVELDZXmFULVNTv+cySDGU9T0YIgOVBerD4ajtHuGbTnNw0n/JriAMaUBgIW1e8vYDklhUnawaWEwDh5oHhWz5UYJTSiFV35ZxAsiocrjMFqfXaicoPQpSW+mzc8Xuc4o0smAmCOXe+gl4lX57o1rPtRHjTWG/Q4Bu0UAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Zt8GS/88; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Zt8GS/88"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E483D25B8F;
	Mon,  3 Feb 2025 21:37:44 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hm_wKjRRSMgf; Mon,  3 Feb 2025 21:37:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615064; bh=UOdlW/B5f7UyeRQyINQBWwmZXqqYBsym7EwJVm9wZFM=;
	h=From:Subject:Date:To:Cc;
	b=Zt8GS/88Cfkl0ztoKt1rcl+Prdo0NIC2Jp8TIYWayM9RqioUrK2cgR3HO7+ucFlXm
	 +GtWsUFxt7BuAnHfYHwihFZivNezu7WvFO43nhjngLyhoUwsR6opY4EnEBskVWbFqV
	 yKq2zRGKJiZKg1vHzRGa2XAGYa45AK93jb2HkQK9G3ujz48r/rdmtpPtDZn0BzB04Q
	 o6jztToSnTaZFGQ29bNhaACQx8uWZWG1nM8CuZSmyMB5YrC8UcCQ/cUEvvvT1jcpmU
	 OKDcg5jhuFSfap+9cC9/kApo0+D0GEubsuj6PPSdL/r4GjN3bYlI5onx0+YNOnI9Kr
	 sMzMvpVyxYz0w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/5] Introduce support for Exynos7870 clocks and PMU
Date: Tue, 04 Feb 2025 02:07:28 +0530
Message-Id: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAkpoWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3dSKyrz8YnMLcwPdgtxS3eSc/OTsYt0UgyRjYwNLc4PURHMloN6
 CotS0zAqwudGxtbUA8ZNRCWcAAAA=
X-Change-ID: 20250203-exynos7870-pmu-clocks-d0b330970ea7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615054; l=1455;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=UOdlW/B5f7UyeRQyINQBWwmZXqqYBsym7EwJVm9wZFM=;
 b=Wd6SgxBY6MpmKjGF60sKQhCVMjPZIXG0ikzab0iWnyaGKGbqvukvR19AEl6Qzg+BoZQyujYlw
 7khlksWWCBCCtohWfL8dTsrqLL1hZRxePuxNeuDMU10hIvLpvWb1Xjd
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add a CMU driver for Exynos7870 devices. It handles the following
clock banks:
 * CMU_MIF
 * CMU_DISPAUD
 * CMU_FSYS
 * CMU_G3D
 * CMU_ISP
 * CMU_MFCMSCL
 * CMU_PERI

It also documents Exynos7870 PMU's compatible, and adds a CLKOUT driver
which depends on the compatible. The CLKOUT driver manages clocks from
PMU_DEBUG.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (3):
      dt-bindings: clock: document exynos7870 clock driver CMU bindings
      dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
      clk: samsung: add exynos7870 CLKOUT support

Sergey Lisov (2):
      dt-bindings: clock: add clock definitions for exynos7870 CMU
      clk: samsung: add initial exynos7870 clock driver

 .../bindings/clock/samsung,exynos7870-clock.yaml   |  246 +++
 .../bindings/soc/samsung/exynos-pmu.yaml           |    1 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    3 +
 drivers/clk/samsung/clk-exynos7870.c               | 1830 ++++++++++++++++++++
 include/dt-bindings/clock/exynos7870.h             |  324 ++++
 6 files changed, 2405 insertions(+)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-pmu-clocks-d0b330970ea7

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

