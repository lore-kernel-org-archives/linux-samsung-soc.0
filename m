Received: from mail-m49213.qiye.163.com (mail-m49213.qiye.163.com [45.254.49.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C0A27B34A;
	Fri, 12 Sep 2025 09:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667875; cv=none; b=fzGGMFtZvpu01hJ5EgcwLo7McMrwQ97cyODz8KTa/roa5TN6UkZaDUEfSMOQF6wHy9DCJ93Iej/Z3XuIlBsvBFbTlYxP6X9qQckGV/x/CFi1xWEAqMkwy9Dh4d/RVEAVXB7DRyeQ+uwvbT26aqpP+H6rq85ZbgDdCsbmyfyB3CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667875; c=relaxed/simple;
	bh=LwNEyS6QhYGZj3sqUnPIyHwPadPh1KAMWab5EPcU24U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V4e5GzrviIlt/+dlxBm3WordbS3XpO0zVnrfWzo5lyYCTW4Hu0doBDdc63r8ueTx3r3fmdRKCEnkI7llNX9QdEhjsT67CevJUX85Pr90BcM8xH9jSV3uFWCwiWqpl6ygvagis+NrElWKH2MBpxxHuui6+bNI0AwJRmZ7OzRsYPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=dDj+jrkR; arc=none smtp.client-ip=45.254.49.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="dDj+jrkR"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 229880a5d;
	Fri, 12 Sep 2025 16:59:19 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 09/17] drm/bridge: analogix_dp: Remove unused &analogix_dp_plat_data.get_modes()
Date: Fri, 12 Sep 2025 16:58:38 +0800
Message-Id: <20250912085846.7349-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d26893a03a3kunm813a8c8ea45eec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0JMTVZOQhkeSkJMTkNNGkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=dDj+jrkR/dkCe3rxCz4nUU3ox5+cB2+QKDpCO/tB6xFv17IF36uQKgz+JqhKm4mpy+aDyGbgmKrBE+p7z855fAovf6736akud26f9dlJWkAfMxwOm13b9hPNFyhsaX1Ovz9CX6dc8Sl72ZOoVVvUDoR7tk0DBjIdexxmAB9dwf4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=UjIhDc9kComjgNGOxQJKlI/oiKaUUNqcaR2XyNLMxkA=;
	h=date:mime-version:subject:message-id:from;

The callback &analogix_dp_plat_data.get_modes() is not implemented
by either Rockchip side or Exynos side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ---
 include/drm/bridge/analogix_dp.h                   | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 5d15fdf88c92..9bf91d7595d6 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -875,9 +875,6 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 		}
 	}
 
-	if (dp->plat_data->get_modes)
-		num_modes += dp->plat_data->get_modes(dp->plat_data, connector);
-
 	return num_modes;
 }
 
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index f06da105d8f2..3301392eda5f 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -35,8 +35,6 @@ struct analogix_dp_plat_data {
 	int (*power_off)(struct analogix_dp_plat_data *);
 	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
 		      struct drm_connector *);
-	int (*get_modes)(struct analogix_dp_plat_data *,
-			 struct drm_connector *);
 };
 
 int analogix_dp_resume(struct analogix_dp_device *dp);
-- 
2.34.1

