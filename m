Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010681BDA97
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733485551; cv=none; b=oUFJwEM7e3cLZhiE1+DH02jIvcK7QLSUcZ1PMDvbBKDg+F7z83yDPQx3FkoQhIkBe0b3Em2Hagu0rmxKzOzpfpvuVD+nJ8MbwwZh6FtXjaIV85eCDwXBJZSVpULVY0CETIxdtMb9vZo4yYF9Gg2DeWaZeSpVo5xQDvgoRj9B2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733485551; c=relaxed/simple;
	bh=8TSTxUYEBv6cb794J5PMNEjpyIy2WgDqb1+rqsMWLb8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sKqj12cGBAH5F/I+RBWJJ06OaOnN313tflbigqAfQCHN+xZnOyvxOVOAlQqrsPQ4n94vxbo9A/wuBZ9JNDG4HjG1IOP4qBW4azrV9qQMh8EzNapjNUkZ8sHBajAUVdBbWA55aslAa8A//LKpBJ48gVbaNR1XVuAAyDU8bjrKVbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ds8IN9Yh; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ds8IN9Yh"
Received: from laptop.lan (unknown [125.33.216.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C12DC3FDCA;
	Fri,  6 Dec 2024 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1733485542;
	bh=NqUN3W1QE8uKX1PduVefoAqn9x75Rt+nVAqamJ38O94=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=ds8IN9YhzmM6Rca8WcY5tZRE4XShCkTXv6lZchhaNO5x485K8vtvnl1j/yiU0eh7F
	 Rp74dxfXC4Rq+ZVve9pMmKmt6bdqu69mzoLcYw2Mmt/XxyJnSF0xp1St5CFr0WQk2T
	 ZyGIR2AakBu1kz/2JBYbl/wepAk+k6sr6+0K/k4MTP/tKK3sV6lNV4zOidg7Zf0E/g
	 T4P5kQ5Z+e9eUvlovdJaEx64K97EmFCCCHeKpcT71htARonJH5wAHVN2hvbF5Sf1GN
	 aEhWiJeQxFthq9df7hOQpl2PalP32ivZb0iSvt2Hvc5Hnv9yJ5fU0WNeu4HkAnEU3O
	 nSDG9TzrJV0NA==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: Remove unnecessary checking
Date: Fri,  6 Dec 2024 19:45:31 +0800
Message-Id: <20241206114531.1271123-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is not needed since drm_atomic_helper_shutdown checks it.

Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2a466d8179f4..461384705cf9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -357,8 +357,7 @@ static void exynos_drm_platform_shutdown(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
-	if (drm)
-		drm_atomic_helper_shutdown(drm);
+	drm_atomic_helper_shutdown(drm);
 }
 
 static struct platform_driver exynos_drm_platform_driver = {
-- 
2.35.3

