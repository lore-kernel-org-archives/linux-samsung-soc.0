Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA4B1F4CB5;
	Fri, 28 Feb 2025 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740771517; cv=none; b=p6LShEN57EmtolYnNr50O3uOV404DyDZCDuwttypMymRVB6YxKblmPuy9iijLGCmA+xNwg/l0dv3d/CzZGyy29XCiL++ak2xDd/p3e5CNiS0lG4FIOnj4UV2iSdB/Q/F+eXJi0bg5Z5CG6zWR73MRiRiXLeyVUzjHpL4cn0dFYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740771517; c=relaxed/simple;
	bh=/Lq/spTlpHf2TgZvIzGLS48PWjcfJCLRcp8b6N7BLCk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GIvBfekrXZ9KWLALvx3yXIV4446Pl1g0nJ1qDuS/P17YPjb3KoNGYLLY0w1fUXPgcFaanPEP1E3rWsbNeggCGNrRe+OvpAn8o+kBzHvDES/j5KmzXxBoUXDEmimpTOCeEEghnh4cilNeOlOtHjGzjpBj4JNldzDCyYCnRnQivE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=GIi0xGVd; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="GIi0xGVd"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0D06D25DCA;
	Fri, 28 Feb 2025 20:38:34 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qe3A8APbVxF5; Fri, 28 Feb 2025 20:38:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771513; bh=/Lq/spTlpHf2TgZvIzGLS48PWjcfJCLRcp8b6N7BLCk=;
	h=From:Subject:Date:To:Cc;
	b=GIi0xGVdKj0Cqw1LcqRSZ/ozhi7hktfzBdxdOcNABMit78ANtOFnkzUxRKzCkQ/Eu
	 tNrbUO/nJizgb0SieYC+30JfzlnNKqm+KNY0OqsE7xE8KNHSycOIeBFJY3uLxVwYTJ
	 662bTdQvohzmGmOMqtSMTKwW3r4voR8XUuxtlcPg8jAlRW7gy9jI66VlAHnrSJCemz
	 DdSb1Upy52veQddPtp2ZiBVvuH63yutXmoxR2BUbcFbDvJ4omwUTA7dZeDWyIGSaDD
	 5QDf1YU4NRSwlgZF62VBfRSUaPjCT4Vj/8rNII5CTVK6gFQ4N6Hw/PSAi72dB/0dBr
	 82vt9LMpi9uJg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v4 0/2] Introduce support for Exynos7870 clocks
Date: Sat, 01 Mar 2025 01:08:14 +0530
Message-Id: <20250301-exynos7870-pmu-clocks-v4-0-0f3e73b10db7@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKYQwmcC/3XNQQ6CMBCF4auQrq2ZMjQVV97DuCh0hEalpMUGQ
 ri7hcREFyz/l8w3MwvkLQV2zmbmKdpgXZeiOGSsbnXXELcmNcshl5ADchqnzgV1UsD715vXT1c
 /AjdQIUKpgLRi6bb3dLfj5l5vqVsbBuen7U0U6/oVix0xCg5cIyBoklUl8WJs8M4NR+cbtpoRf
 xxR7jmYHDCCCiGpJNT/zrIsH7klzAEEAQAA
X-Change-ID: 20250203-exynos7870-pmu-clocks-d0b330970ea7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771507; l=2548;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=/Lq/spTlpHf2TgZvIzGLS48PWjcfJCLRcp8b6N7BLCk=;
 b=FPsHlxQTr23YK33MKYirUnDA5UIHo6oo45rpDf5njAms2v0wdvcHAntmY55Lnrel1SRfvQ5aN
 HoHCEsqPK9eDMgvjoSGv4mceEFyGB+xKSZm510ji8jWKllqZAdey0Yr
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

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v4:
- Fix clock dt-binding description and ordering in properties:required.
- Change filenames of clock dt-binding and header to match the compatible.
- Squash the following patches from v3 into one:
  [1/5] dt-bindings: clock: add clock definitions for exynos7870 CMU
  [2/5] dt-bindings: clock: document exynos7870 clock driver CMU bindings
- Drop the following patches from v3:
  [3/5] dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
  [5/5] clk: samsung: add exynos7870 CLKOUT support
- Link to v3: https://lore.kernel.org/r/20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org

Changes in v3:
- Fix incorrect versioning (Link to v2: is labelled as v1).
- Fix formatting issues in clk-exynos7870 DT docs (from v1).
- Add myself as maintainer for clk-exynos7870.
- Change clock name definitions in clk-exynos7870 DT docs.
- Fix line wrapping in commit message of exynos7870-pmu DT docs.
- Change a few ordinals of PERI* clocks in the clk-exynos7870 driver.
- Take over ownership of patches by the co-author, upon their request.
- Link to v2: https://lore.kernel.org/r/20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org

Changes in v2:
- Drop all patches from v1 except:
  - dt-bindings: clock: add clock definitions for exynos7870 CMU
  - dt-bindings: clock: document exynos7870 clock driver CMU bindings
- Add patch for adding appropriate PMU compatible.
- Add patches for CMU and CLKOUT drivers.
- Link to v1: https://lore.kernel.org/all/20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org/

---
Kaustabh Chakraborty (2):
      dt-bindings: clock: add clock definitions and documentation for exynos7870 CMU
      clk: samsung: add initial exynos7870 clock driver

 .../bindings/clock/samsung,exynos7870-cmu.yaml     |  227 +++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos7870.c               | 1830 ++++++++++++++++++++
 include/dt-bindings/clock/samsung,exynos7870-cmu.h |  324 ++++
 4 files changed, 2382 insertions(+)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250203-exynos7870-pmu-clocks-d0b330970ea7

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

