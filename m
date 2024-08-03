Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AA982D98
	for <linux-samsung-soc@vger.kernel.org>; Sat,  3 Aug 2024 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722666637; cv=none; b=JdpW2RXmU1KyiyS7G0ahCrsR9ztV5YJEaTj9PvVRfXUJ/0/WTZ3UdyEl30vjCwfxHzCQiQWiFjTJ6mmW9ZfyWmgQWYX/qqjAaVZimdKlIrQAljQvs+Og9oBsE7mFjQR9XPkZ5RzUvEnh1Ogk4Ys/8+sl0a3AaWJ263DJoxZlnws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722666637; c=relaxed/simple;
	bh=I49B2DPWtx+voZl+4eUfFxTiVTNG7b4TJmp2W/RDMM4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GyP/5rvx/F1UTbrXojSMeC/HRTBw9GLptHUcKcro7Q8yYySGa9EZCI/pfg2XKhiOPDfd2d8k9656Yp9Nm+q50N7nRfV6LPpwEG+61kPueFOxFMe74S/rEW0WjF8UVB9wqjVJQZTM5TsZVI/gkkTvMOqavyOKiPuci8IQ+DX3VyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WbXpJ3jTqzfZVK;
	Sat,  3 Aug 2024 14:28:40 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 5BF421400DC;
	Sat,  3 Aug 2024 14:30:32 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 3 Aug 2024 14:30:31 +0800
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
Subject: [PATCH -next 1/3] drm/exynos: Add missing clk_disable_unprepare in exynos_fimd_resume
Date: Sat, 3 Aug 2024 14:30:28 +0800
Message-ID: <20240803063030.316390-2-cuigaosheng1@huawei.com>
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
exynos_fimd_resume().

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index f57df8c48139..7be90f120a7e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1312,6 +1312,7 @@ static int exynos_fimd_resume(struct device *dev)
 		DRM_DEV_ERROR(dev,
 			      "Failed to prepare_enable the lcd clk [%d]\n",
 			      ret);
+		clk_disable_unprepare(ctx->bus_clk);
 		return ret;
 	}
 
-- 
2.25.1

