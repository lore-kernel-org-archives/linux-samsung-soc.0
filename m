Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1C8A943
	for <linux-samsung-soc@vger.kernel.org>; Sat,  3 Aug 2024 06:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722666637; cv=none; b=ERX6kSQugQsxn8iPPcGVatPekt9095JxBa8N5fx3aeRrZQRnNO8tTTjbNiqTmyDWteBdYdQNeMJ1LoV4MQeG0FsUzTARg9RBsycCeMciQLvFoEZCsfS6fyrsKq4A5UFgh/AFd/9cnn9GU1z6O1uepXjOC+uKCbHt+ywCYP7ab8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722666637; c=relaxed/simple;
	bh=TqTyXuTVCudV4nZ4m4nsTxzNqGpFxws6iOQdHZjCRBg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMW9ku1zMfO40x0zj2+DK+QmUpAC5TrMnOqea3jUpnQK4llZs+P/ByDrpVWJ7x90FTaKBlP0enHeaS0Z8N63URJkZw9huPfqgAAOHr2T0/MqETlO3dpD+mxfoeEEzQeQPD6yDfSrIgJY0IdccYfwm8udheVqvS74hER/yk2Ilrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WbXpK22wkzfZMT;
	Sat,  3 Aug 2024 14:28:41 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 23C361400D1;
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
Subject: [PATCH -next 2/3] drm/gem: Add missing clk_disable_unprepare in ade_power_up
Date: Sat, 3 Aug 2024 14:30:29 +0800
Message-ID: <20240803063030.316390-3-cuigaosheng1@huawei.com>
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
ade_power_up().

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 871f79a6b17e..942560a717ff 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -229,12 +229,14 @@ static int ade_power_up(struct ade_hw_ctx *ctx)
 	ret = reset_control_deassert(ctx->reset);
 	if (ret) {
 		DRM_ERROR("failed to deassert reset\n");
+		clk_disable_unprepare(ctx->media_noc_clk);
 		return ret;
 	}
 
 	ret = clk_prepare_enable(ctx->ade_core_clk);
 	if (ret) {
 		DRM_ERROR("failed to enable ade_core_clk (%d)\n", ret);
+		clk_disable_unprepare(ctx->media_noc_clk);
 		return ret;
 	}
 
-- 
2.25.1

