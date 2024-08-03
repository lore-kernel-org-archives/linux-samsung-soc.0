Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB33F76036
	for <linux-samsung-soc@vger.kernel.org>; Sat,  3 Aug 2024 06:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722666637; cv=none; b=QhnJF7c7WDZf9jKCZaVqOjVdsmsm8NHqdqSlhfFamXrwh0+d+mjP775KYmPakkHK6eqCHmZ12DZYkc+cvMaWjpJnCJ7tX92N7EIO4wKe2t8PJjkCcOG8G02U9d39Hplj70qXdLhabNkEkYTX9ILMOwWB/99fywPdbTda/9CTKe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722666637; c=relaxed/simple;
	bh=aWscC1sPf4N36Y9mqhch8iZYcRzvxEfBmb61a8PIt3A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQZ3Ihm8QSl2tRtcMe5yiO6ORGh+gg4gPDD8VlS24CVun1OVdSDCT51W2YcbxLsgrCjYxPqqmFChI3/nrMb308IilWoM7XQ1485XOiTPBRTD2qHNlllV4yv1hLiRc2Hrxu9HhtD8VpphdoWpl+eoQmIUqGIk4ifQRPxzm0mCL3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WbXrR2JvgzcdRj;
	Sat,  3 Aug 2024 14:30:31 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id EADEB1800A4;
	Sat,  3 Aug 2024 14:30:33 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 3 Aug 2024 14:30:32 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <inki.dae@samsung.com>, <sw0312.kim@samsung.com>,
	<kyungmin.park@samsung.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<krzk@kernel.org>, <alim.akhtar@samsung.com>, <xinliang.liu@linaro.org>,
	<tiantao6@hisilicon.com>, <kong.kongxinwei@hisilicon.com>,
	<sumit.semwal@linaro.org>, <yongqin.liu@linaro.org>, <jstultz@google.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <anitha.chrisanthus@intel.com>,
	<edmund.j.dea@intel.com>, <cuigaosheng1@huawei.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
Subject: [PATCH -next 3/3] drm/kmb: Add missing clk_disable_unprepare in kmb_dsi_clk_enable
Date: Sat, 3 Aug 2024 14:30:30 +0800
Message-ID: <20240803063030.316390-4-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240803063030.316390-1-cuigaosheng1@huawei.com>
References: <20240803063030.316390-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200011.china.huawei.com (7.221.188.251)

Add the missing clk_disable_unprepare() before return in
kmb_dsi_clk_enable().

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index cf7cf0b07541..02141ac593c6 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -1494,12 +1494,15 @@ static int kmb_dsi_clk_enable(struct kmb_dsi *kmb_dsi)
 	ret = clk_prepare_enable(kmb_dsi->clk_mipi_ecfg);
 	if (ret) {
 		dev_err(dev, "Failed to enable MIPI_ECFG clock: %d\n", ret);
+		clk_disable_unprepare(kmb_dsi->clk_mipi);
 		return ret;
 	}
 
 	ret = clk_prepare_enable(kmb_dsi->clk_mipi_cfg);
 	if (ret) {
 		dev_err(dev, "Failed to enable MIPI_CFG clock: %d\n", ret);
+		clk_disable_unprepare(kmb_dsi->clk_mipi);
+		clk_disable_unprepare(kmb_dsi->clk_mipi_ecfg);
 		return ret;
 	}
 
-- 
2.25.1

