Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCF32D541B
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Aug 2025 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756034262; cv=none; b=JpbwT91KhmBK4w+8u3RhaexMZnE0A3OXOtIZD0mv6fbwNAJFJWc1eBNAvK5pGa0oE5qA23akustuthNy/vD0xiOEaYcuML5f6QCKoQy22gBqCaS0t+4j/WTPGQWBu4uwgu5p+NHVjAWGvKmPgKl7PTZrwTWkPmC4XN3j1v5Anp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756034262; c=relaxed/simple;
	bh=RqSrQZsPMePDaTzNNSIfbjwAEN4ih55AGp+7yA9PgkA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iind3HSq9S82mDq+wywi1eFzlLDF1DFv4Srv1CiQGWjJh4KivQw90exjE7Wl7Gfa5EDIFzXLVJV6IffDUUZO+hHcRhfD7SaCnN9y4BbhJDYJaYur6FAValec+gdTY856xfATheZvWm7bThcFEj423iB1DNzS4lcLllQTHW2bN1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=eF5ITTYo; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="eF5ITTYo"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1756034253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ge79lPdHCphIIoT5GqPoGFJLIef0X39qCGER1FsMbsQ=;
	b=eF5ITTYoPR9uV0wAVY9FMxc0iONWlpHZ1jtzz8JO4jTVCprq58I6ryLQQ5tr9JzNYzgb3e
	/2yzfvHSpksu/fdMcb3l2TSByorop78a7mzwism6qZ5WWD76XkFajfsn9DH9pA4iQNsq7H
	EHilvHDbrvEIGJzw/acLQQxQF38iaRs=
From: Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v3 0/3] drm/bridge: sii9234: use extcon to detect cable
 attachment
Date: Sun, 24 Aug 2025 13:16:53 +0200
Message-Id: <20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKX0qmgC/3XNwQ6CMAzG8VcxOzuzluLQk+9hPKDroImC2cwCI
 by7g5MeOP6/pL9OKnIQjuq8m1TgJFH6Lkex36lHW3cNa3G5FRosAKHSPIxdH0lHkRMWpF2QxEG
 7CqyjewngSpWP34G9DCt8veVuJX76MK5/EizrQpbGImyRCbTRyGTZGfRHay9NkNeTwyGyWsyEv
 w5tOpgdXzMjkQdH5s+Z5/kL5k/pKQUBAAA=
X-Change-ID: 20231218-exynos4-sii9234-driver-d817d4b511d5
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1910; i=henrik@grimler.se;
 h=from:subject:message-id; bh=RqSrQZsPMePDaTzNNSIfbjwAEN4ih55AGp+7yA9PgkA=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBoqvS37BGY/Bu7ZzRm4gX2y+dhlmuOnM2R8+UXG
 NB3tJIsLbuJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaKr0twAKCRCwB25JC3Fh
 a1yFB/9N5+SPxFODk4BllPS3ie+a6cSHB9lOzpNjgDKoi09yzcGmJov+4tdkPcz3SoItsb1qCHH
 lBD8XcmaLv4hIbxX2006yXIqem1QgSdPT7fhJ9EghUVvcK2yPgOjVk0cg+WFhac5yaTGDokWqCJ
 n/OiwH1I3wz9hI2xTLRMlBsTxLfrBWFRCunKinshvynrLNrduhDMo1omHb7n67YSy8RxojTG8QX
 8iVxXO469zgFdmXiVPSo/r/PsJ68Rj6z6giQL1mhDdwTfQ2mwtH6x4f2FzGCVGQhGd1ThXz7jCM
 hLlOZ/3MpY6oNuDtsG7oGChv3Lkvb+7jWujIorJmDIApZzO6
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
base-commit: efe927b9702643a1d80472664c2642f0304cb608
change-id: 20231218-exynos4-sii9234-driver-d817d4b511d5

Best regards,
-- 
Henrik Grimler <henrik@grimler.se>

