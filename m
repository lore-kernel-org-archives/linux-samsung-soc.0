Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107720;
	b=m+tf2Dyz6Qh4jANMdTfQWsBxldTEhwo6Kkntft/KIoiDFDpR6Z88qnFd3p8D3MX9Xuxa
	 ivDkN23K8W7x8L1Ltc8XhaHdfdPp5qoaDGykl5vh1b7kia/mXsiyolKs+Ta1drm5v520p
	 oT8jE/8lUy6msRcAjHxjfv/qKxdayfhEHC8LyrhAI+V686JZCLUS8tmc328YD7/pS8jw5
	 gcMqvS9oZfTnWgx29c9mcAW2CtcQd8JMmZrJG8FT1m+HbyaBk64M2rTEHDv54pqt1RTUj
	 +kMMc0b45NHHFvRA+SiSCKZQCbrs5weEqwAPeDDsN88DbvmVV4dhsVAYAnPeYlJ4pGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107720;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=CAzYdmJLVepJ08iaC2Wrs5PVOHKqjdTppJaoKTJ86Pw=;
	b=eu9BRKSghSn++O9w01HLU1WjcyM+xct++dBmZNB4iMdXAE8vT0F84ZZfFP/yu5VBAQqU
	 HD+XZR7VhBIu5dyPBBSciNWPbz/j1dj6C6KTET6amGaG5phbx0QAfRd87QyE3JFpw57+d
	 AZ8ZnD9YPp4quGD6OEJ5e1B6ectwCusaH2LjCp/0BvV/qFaxRv2WrKUtKCl0ikz21KsPM
	 o3YNpmRYs65qpB5YvfhOH/CW2EpFLtkhHLDdtcPnhkZ5wFmGL5diaLQ82Y4t96RSxsiTT
	 3ta8bxswbb+GjbWlETeS9ds9fy3vC8veopNwqv0dZy3Wtjd2/+ReJbJjkb5a8qZzTOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=IrIPNZFm;
	arc=none smtp.remote-ip=210.79.60.34
Received: from mail-m6034.netease.com (mail-m6034.netease.com [210.79.60.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E27606A33F;
	Tue, 27 Oct 2026 13:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E27606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=IrIPNZFm
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528777a3a;
	Tue, 27 Oct 2026 21:28:29 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 12/18] drm/rockchip: analogix_dp: Unbind bridge when connector init fails
Date: Tue, 27 Oct 2026 21:28:04 +0800
Message-Id: <20261027132810.1746118-13-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027132810.1746118-1-damon.ding@rock-chips.com>
References: <20261027132810.1746118-1-damon.ding@rock-chips.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17d8c4e3903a8kunm87c266213d571c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTxlPVh8eSExKHU9LGh9NS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=IrIPNZFmBwH0pCXfzEJEHVZQ+NPQJV3GTxc4VylSkHaNrwqoEwgl2idGW+YR345A8NS4ScPfWZiCUC8qOhoYYht00k8nZIAQSFFtrX4Wi4yiUJOSAvfWNdNODA9UT0hEYA7G1nsvasW8jqXDrabZt1xk0YMi4s9aBm2uhr7+bcs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=CAzYdmJLVepJ08iaC2Wrs5PVOHKqjdTppJaoKTJ86Pw=;
	h=date:mime-version:subject:message-id:from;

The rockchip_dp_bind() returns without unwinding analogix_dp_bind()
when drm_bridge_connector_init() fails.  The aux device registered by
analogix_dp_bind() is then left behind with a dangling drm_dev
pointer, which could be accessed on later AUX transfers.

Call analogix_dp_unbind() in the error path to release the aux device.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 38c78360842f..e6310d66e8e3 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -419,6 +419,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
 		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
+		analogix_dp_unbind(dp->adp);
 		goto err_cleanup_encoder;
 	}
 
-- 
2.34.1

