Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D22F1A2542;
	Thu, 19 Sep 2024 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758727; cv=none; b=fqx9DlUJTBZTlYJ9AxOLQ3JaIv/lNL9zEsl17nt6tlg1MmfmSILvI4CWrk5T4zPHIVrFczePRzZ4ZohvbYUce6MU1r+H8I2eeVrSwcraWI9yv0OJPzVddi2R5NHOm3L2qwH8hXAoIofwlTmBO8a80z6QnfiIYCa6ZQ7DIbwf46E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758727; c=relaxed/simple;
	bh=qVoHmsRHGg98zFI6pqJncNtKRVJtC5MUzrba+bc+fqE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XGxUl5XC4+SGd23RzREhNkLCDLZe/0aDWVW5EQ+rktucKh+HiFP/8deZDKSJ2tptm8ndR2sFOzIKnPvtWhBVtC5nBzBpOl/5HTUQs4ehTXvKRVswThd/DOYZui4xd57b9f70/x9YI5vtn9AAMUtg/8YnxoQTeWoHoN8AM3Li5M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=cnDZBoqY; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="cnDZBoqY"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0CE3623D30;
	Thu, 19 Sep 2024 17:11:26 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyXPdYhAlJud; Thu, 19 Sep 2024 17:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1726758681; bh=qVoHmsRHGg98zFI6pqJncNtKRVJtC5MUzrba+bc+fqE=;
	h=From:Subject:Date:To:Cc;
	b=cnDZBoqYnyKfzaZrq9f3KL+S/i45kM/FIo9Kl3pW/xs6wx9KLeaCeR1g0jDxp2K2u
	 0UHsQoHE0aS6TuSzMa4yHtyChXb3TEpisyxNUjGCS+JDwPCwvtXqNIn5wN5A1wCqRO
	 84onX7kELKXyIGr+tIA1TGCzyboiBh9t4UAv5aOf/P2/XrzBEHZ5Fxa7f/OoooFjLx
	 PslShWcaVjfeNR0fGrewR3LXCtQiawBM0UQ+7KwAZqsaagHXVO0S50SgWTN92Rz+V+
	 B2mcR/ZhFyJBO6ba5TGIH4HkUTczWwhiKTEmwfTNk/nbc74Zbz6XJygYZVHMJsuiZ6
	 VY8jXNLe3RDrw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/6] Samsung Exynos 7870 DECON driver support
Date: Thu, 19 Sep 2024 20:40:59 +0530
Message-Id: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAM/7GYC/x3MTQqAIBBA4avErBN0EPq5SrQoZ6xZpKEQhXT3p
 OW3eK9A5iScYWwKJL4kSwwVpm3A7UvYWAlVA2q0ejCd4vsJMVM6FLGLQVmH2BMZwtVDrc7EXu7
 /OM3v+wFWuUAIYQAAAA==
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>

This patch series aims at adding support for Exynos7870's DECON in the
Exynos7 DECON driver. It introduces a driver data struct so that support
for DECON on other SoCs can be added to it in the future.

It also fixes a few bugs in the driver, such as functions recieving bad
pointers.

Tested on Samsung Galaxy J7 Prime and Samsung Galaxy A2 Core.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (6):
      drm/exynos: exynos7_drm_decon: fix uninitialized crtc reference in functions
      drm/exynos: exynos7_drm_decon: fix suspended condition in decon_commit()
      drm/exynos: exynos7_drm_decon: fix ideal_clk by converting it to Hz
      drm/exynos: exynos7_drm_decon: properly clear channels during bind
      drm/exynos: exynos7_drm_decon: add driver data and support for Exynos7870
      dt-bindings: display: samsung,exynos7-decon: add exynos7870 compatible

 .../display/samsung/samsung,exynos7-decon.yaml     |   4 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         | 124 +++++++++++++--------
 drivers/gpu/drm/exynos/regs-decon7.h               |  15 ++-
 3 files changed, 90 insertions(+), 53 deletions(-)
---
base-commit: 4f3e012d4cfd1d9bf837870c961f462ca9f23ebe
change-id: 20240917-exynosdrm-decon-4c228dd1d2bf

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

