Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F64C41F5CD;
	Thu, 16 Jul 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207901; cv=none; b=hKEgTvLrkP82aY8Sg2o574bqIASzvNinLzrcFqT+M7h9+JXTcEPCcG5rG/R3uO7isLtsa/68o3hizkkVDwUGVBTGQcD/ktxBknMaImuijH3pjwVbKCBZRa3ooFlE7KHbqrPaJHOQ4clyS112kZm1Z/ti9HEYEjk9X/uBtxPimkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207901; c=relaxed/simple;
	bh=Ow4IwDnFiUfQ+hMPyKvrPPBCpRqPO7APOqGKM3Bl2rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=myC0sm8m9l4kd7JIPYbJAFpuiDee4YThyLIaRAFy4BirQyGDxgKlp0Va7JgdLTbP4w9ByVg+DUSMr8gtsA+MV+X9+/FBmK/r/pdbfaNov67/ox6kZmC8rdTlpUH7xu6AcdeUWq4D/4Z4A4G7ep/qtWZO7t+xWBRWkqJ9Y5nVlCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDJDjBtP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDJDjBtP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B421F000E9;
	Thu, 16 Jul 2026 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784207900;
	bh=SbH6G2mPWS6N8Rdy85by/BStAxzP7b8+PUy5VNIEx1c=;
	h=From:To:Cc:Subject:Date;
	b=oDJDjBtPKcyUtDUy0fEEOmyamJT17kbCSPf4NmG/htyLVzd4T/1WyNHzVkM60YskJ
	 7uWDykvkXBsRzgfqCxxxMSq3JhjreQi38aDFx8Y/ozJkOO3oFktb+WKg2uZrFbgxQO
	 ro/XpUY0R5UpM3x9k0uX0R+Dne0y9t7q8NAt/mJ7p/KymH5gYXTCkj5BOQkC0PZaAQ
	 yl0u5U+YN2QbxDdIliMftEqVcpnXRFiU/CJU0mhDt3eWmwdupyY1Yha4d4v7OpfAYw
	 Jg0mHi78lQqYugKPOVsuWmDiMyKnczJsxWYSIwAL1HP2DZobxWEaK+IDMSK6cTV3go
	 ampGHLuU2DYZg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wkLyj-00000006Z4k-35nF;
	Thu, 16 Jul 2026 15:18:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] drm/exynos: hdmi: take i2c adapter module reference
Date: Thu, 16 Jul 2026 15:18:02 +0200
Message-ID: <20260716131802.1564776-1-johan@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c subsystem currently blocks during adapter deregistration
whenever there are consumers holding a reference.

Switch to using of_get_i2c_adapter_by_node() which also takes a
reference to the adapter module so that an attempt to unload the module
while in use fails gracefully instead of blocking uninterruptibly.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 09b2cabb236f..b971b7098a4d 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1913,7 +1913,7 @@ static int hdmi_get_ddc_adapter(struct hdmi_context *hdata)
 		return -ENODEV;
 	}
 
-	adpt = of_find_i2c_adapter_by_node(np);
+	adpt = of_get_i2c_adapter_by_node(np);
 	of_node_put(np);
 
 	if (!adpt) {
@@ -2069,7 +2069,7 @@ static int hdmi_probe(struct platform_device *pdev)
 	if (hdata->regs_hdmiphy)
 		iounmap(hdata->regs_hdmiphy);
 err_ddc:
-	put_device(&hdata->ddc_adpt->dev);
+	i2c_put_adapter(hdata->ddc_adpt);
 
 	return ret;
 }
@@ -2094,7 +2094,7 @@ static void hdmi_remove(struct platform_device *pdev)
 	if (hdata->regs_hdmiphy)
 		iounmap(hdata->regs_hdmiphy);
 
-	put_device(&hdata->ddc_adpt->dev);
+	i2c_put_adapter(hdata->ddc_adpt);
 
 	drm_bridge_put(hdata->bridge);
 
-- 
2.54.0

