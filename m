Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC447395ADF
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Jun 2026 18:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780425468; cv=none; b=a3P9qoOesgnnPU3j3I4xFhD0Ex0Y8obZJ9RhTKprgaZ92GRUrl+sIaSQoV+5VY3X2+0b1JkU12C7vuI/kDG7wx5jIhGRdxNC8/8kUQBbR18PEuEtRSv3nQMmr65drp5e0qE91IQUtOKcWxHLnreVY1jvmhjTyQZyX+KJaKN7yx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780425468; c=relaxed/simple;
	bh=+9icRJM878guDktkvKRdV7M11E818HdtxnWGnfxrGmU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B1Gf2wLB3Ia5POOQ0TVz9fEY4+jgPfwR1FPq4rp4L+Uki/Nieo0+Qz95JxBWCtYUiSw7mkLFM46QhL6tpemFpeCdwlcGH6Ro48dH874xi4stBzSvknW6mSuLzOW14aWbEymJ8Dx6OZBJz5cY2KQzMOia3ubWsX2GC4OqipuspgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=lyLKTlSB; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="lyLKTlSB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1780425462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ifzs265vUAPV6IFIZqod6woQ6e3KxesGPyzpRuY/iQY=;
	b=lyLKTlSBQSQJUwrUC6x4vG/WGdEJePCQnq6NVERHIGUwOlV7NeAqpEC2A5PYYTeRM4YwQT
	3if7BAnbRhIm5dZwAO8amUxkTsAlByPdU7nS5e6/8Wp6P/vFoXwRzJDr5pCqluka3qY3Cm
	PCkNjWRi11HbsnuNPylJomeG2W1CbLY=
From: Henrik Grimler <henrik@grimler.se>
Subject: [PATCH RESEND v4 0/3] drm/bridge: sii9234: use extcon to detect
 cable attachment
Date: Tue, 02 Jun 2026 20:36:47 +0200
Message-Id: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=henrik@grimler.se;
 h=from:subject:message-id; bh=+9icRJM878guDktkvKRdV7M11E818HdtxnWGnfxrGmU=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqHyLk9cgk+1xEeOBEHFUSpeRNgrTIniPD26alJ
 mpxLsjrnnWJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCah8i5AAKCRCwB25JC3Fh
 a1hBB/9Sv18iNp9etcxbIHTuwjpTLL2QqfhikCmtehealHMm8Dd7N3r71Bx7InayxC/j2KNDfod
 mPC61myClxgXnxatDXBDhhr6N+OlsBJrVuAYCRtIbehKvul4unwOD5JspIfECEK2YUxPWiC1TnH
 x8oTDDy/a1aQ27N1H4q6EkFEP2+MMmm8ZhmZTqzkqf7oJG5eoJATscB2x6uyWatK2YGej0OxJqo
 jx8aWRp+UNqv/Dj3Tq3tFQ5s0zmEqi9hwm0vDw45mu4EKBjbn1nrVRFbkNWMLRio5HVVFUapxjj
 822T2mk5dFJjygbST/RDFskh61NnUrey1ARv5cjOg+I42moL
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

Hi,

This series fixes so HDMI through the sii9234 MHL chip works when
cable is hotplugged, by making the MHL chip use extcon cable detection
functions. Patch 3, that actually implements the extcon parts, is heavily
inspired by commit 688838442147 ("drm/bridge/sii8620: use micro-USB
cable detection logic to detect MHL") by Maciej Purski.

Before these changes, HDMI only worked if cable was plugged in before
booting. If no cable was connected, then wlr-randr still showed HDMI
as connected, with 0x0 px, which confused at least some UIs (phosh)
and caused problems:
https://gitlab.gnome.org/World/Phosh/phosh/-/issues/828

Tested on exynos4412-i9305.

Best regards,
Henrik Grimler

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
Changes in v4:
- Collect tags
- Link to v3: https://lore.kernel.org/r/20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se

Changes in v3:
- Fix return of dev_err_probe in patch 2 and patch 3, spotted by
  Dmitry and Marek respectively.
- Change to depends on EXTCON || !EXTCON instead of select
- Collect tags for patch 1 (not 3 since there were (minor) changes)
- Link to v2: https://lore.kernel.org/r/20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se

Changes in v2:
- Add dependency on extcon in patch 3. Issue reported by kernel test robot <lkp@intel.com>
- Link to v1: https://lore.kernel.org/r/20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se

---
Henrik Grimler (3):
      drm/bridge: sii9234: fix some typos in comments and messages
      drm/bridge: sii9234: use dev_err_probe where applicable
      drm/bridge: sii9234: use extcon cable detection logic to detect MHL

 drivers/gpu/drm/bridge/Kconfig   |   1 +
 drivers/gpu/drm/bridge/sii9234.c | 124 +++++++++++++++++++++++++++++++--------
 2 files changed, 102 insertions(+), 23 deletions(-)
---
base-commit: a87fef0880c4f52769b5a3c2fc1b2d73aaa04eb3
change-id: 20231218-exynos4-sii9234-driver-d817d4b511d5

Best regards,
-- 
Henrik Grimler <henrik@grimler.se>

