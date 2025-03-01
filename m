Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FDD23F399;
	Sat,  1 Mar 2025 03:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740801461; cv=none; b=fHKFuB5+4aYfaJitM34JYI0tn/311kUdlnW6tNmANQZpwIKoWC92hXSL+q/CkLm1z/19XpGv2tOAX4/qFpi8ssE9dXitnpk5zPXHoA/Tml+hPhePdBzU7ehZeB4Ptyu3LfmJm+I3AcPopiXFu5lBI/K+7jsNCQuIFDthT2Sf454=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740801461; c=relaxed/simple;
	bh=rEHaf4maxyiGGOMN1IF2sOa3FpT4ACpF4a9JkiIWSt8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PbUewxnUvWvkHEqHLaOczbjoaadgFBSmTRLYDmL3KHNoWa8ufbnfunNemedcKTBvWL9YZAfGVc+cgzA7Otl5Cu3JhWISHeV+4Xwl62yzuJ0FtHdBLykDIsU7X6I5lSeVGvE4PQ3oQ6B1FnzUQabLamjUPDQb86RQO7u0Jig5LuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Em96SsLL; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Em96SsLL"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 63C7E25F0B;
	Sat,  1 Mar 2025 04:57:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-yxFxoy9gdi; Sat,  1 Mar 2025 04:57:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740801454; bh=rEHaf4maxyiGGOMN1IF2sOa3FpT4ACpF4a9JkiIWSt8=;
	h=From:Subject:Date:To:Cc;
	b=Em96SsLLK3JE0voTXKEtlh2B1s35FP/WwdY8OEFy+JYsArqkr+MlBGDTtjD4ZsuJO
	 3PnuYqNR7CYabtK2nP0UPImD+xOIhJEBxb5e6imz2MNd56nWcgbjc7N7QGirJp9Rmj
	 GAHsnOA+Ggf+E7qq52HQ4rRhjqkeoNOzqxvWj9QNO4qKrRZcHxSdqIOPJINGvf1Vph
	 pMqtDs+sO7/ovusCmZM+49Px0zkXTRJMw3TIg4X2dcCIJm8ixfiJK7jq+5ImMgIg6N
	 Exsd4XxFlqAvzo6azbKBN+bV15x9uSSRwIOKi9n7hRSUrNDueD3avU+FfEesUXLjBc
	 oeMGgH8mOLnQA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v5 0/2] Introduce support for Exynos7870 clocks
Date: Sat, 01 Mar 2025 09:27:11 +0530
Message-Id: <20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJeFwmcC/3XNQQrCMBCF4auUrI1MOg2xrryHuEia0Qa1KYkGS
 +ndTQVRkS7/B/PNyCIFR5Fti5EFSi463+WQq4I1re5OxJ3NzUooJZSAnB5D56PaKOD99c6bi2/
 OkVswiFArIK1Yvu0DHd3j5e4PuVsXbz4MrzdJzOtbrBbEJDhwjYCgSRojcWddDN7f1j6c2Gwm/
 HJEveRgdsAKqoSkmlD/O9XHQRBLTjU7RySFRoA16teZpukJ68xDzkwBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740801448; l=2719;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=rEHaf4maxyiGGOMN1IF2sOa3FpT4ACpF4a9JkiIWSt8=;
 b=UoI5gUYpp/4io6yU8aYNLdhMOhmNT64JGVnwQXQ3FZWV6ZbYTsbxDzPz5RstcQpMzgFknW08c
 vkVYlaNEjwCCgcFk+h/SLVmnQH7NAnmqniUxQoZs1CyylIE0U3wT0Qt
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
Changes in v5:
- Fix dt_binding_check errors and fix dt example.
- Link to v4: https://lore.kernel.org/r/20250301-exynos7870-pmu-clocks-v4-0-0f3e73b10db7@disroot.org

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

