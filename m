Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DA45FBB1
	for <linux-samsung-soc@vger.kernel.org>; Sat,  3 Aug 2024 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722666637; cv=none; b=GeTw2jYmuuUgJ63V/OWsKZQ7mLoA340tVNcE57dkd9Zwmpnoj+KdGpSfuUB64mj9Wa63IhPyy3QBIbWzxRiemOFivcspJWg9VkuQw3XcdSe3IxcMJOZ7G9lr9FERdiCxA/YTFyFxewZOhxB64JLIdIeC8uk6oBIYSU/aLYH5Gu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722666637; c=relaxed/simple;
	bh=Wqm+DzgCNQEX+Oc0t1iMX9iG8wi2YJ/8Mjh6Rl0ZPzg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PkJpCY/25JPL9saIAfw7Pi17q4jfpPIMBgA9iRCKG2Ya9skptrazU3dafrOx6N2W3OtC0ygHXD/bfx/1Sdx9W1FtA4z84iVyfGZD4XtufvmAjtp7Tj7+Xl6DAVi+Vv8yTsp85CNz3lcRBxxmn/xeS0wWvd9jPZBrsHbj8vi1NIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WbXrN6s8XzcdTP;
	Sat,  3 Aug 2024 14:30:28 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 9442B1800A4;
	Sat,  3 Aug 2024 14:30:31 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 3 Aug 2024 14:30:30 +0800
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
Subject: [PATCH -next 0/3] Add missing clk_disable_unprepare
Date: Sat, 3 Aug 2024 14:30:27 +0800
Message-ID: <20240803063030.316390-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
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

Add missing clk_disable_unprepare, thanks!

Gaosheng Cui (3):
  drm/exynos: Add missing clk_disable_unprepare in exynos_fimd_resume
  drm/gem: Add missing clk_disable_unprepare in ade_power_up
  drm/kmb: Add missing clk_disable_unprepare in kmb_dsi_clk_enable

 drivers/gpu/drm/exynos/exynos_drm_fimd.c        | 1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 2 ++
 drivers/gpu/drm/kmb/kmb_dsi.c                   | 3 +++
 3 files changed, 6 insertions(+)

-- 
2.25.1

