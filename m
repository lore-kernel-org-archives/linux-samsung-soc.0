Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.83.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107722;
	b=3L1L/L+OPcRzF6iDy0vzlCupZ0MO5qXl9DTWfvJ70zTvXGlm2+OqMXwbCY5e61Iw9JCz
	 jEegtz4SvmyaS5M2Lvl7NnfDBCvOG/f5FIhVx5szv31uvNsPU6YIiXMtzmcZlD/JCAVv2
	 2QCjcMPCmAjCqujgCYNyE5goPzdvGl2QopzdkQpw3SB8ylrsfMIlfyhoELYDXZkAuLxj5
	 oH4JbLgpKwTEqisDnAtM6h22/02GolkZ4TDPNau/KHszilrkCXeG7331COUXFqNaRV40J
	 kbOcG4NyoiryMLf79MOs59AH2G6y2BI97nvKkdkLcW1ILY6QJu5PSACtB0dHlWe4nWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107722;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=RUbnQZd01npFxSkYgQ+GOJK5rQ+b+UxFGoQp+0x6DuA=;
	b=AtGPfW6i/CcQy1JPqC27VJLx3tzdCvSJYjwGutjWZroWvJsMqCmYiR+5PHEnKYGscx2e
	 +WIMGwKilJ84cBij6aU3vSIoy9QsUiQ1qZW3+kVeP0qOGxOwLjqtaXRjY5N+fMQzUZI0o
	 xj4hQBL2djQQYNVWntlQuSr8VSopv9dNzjN8+nB5wm/AyH94lAEK2aYCqz1T1ZDjVvP0d
	 VWHB/qO1/GE7Sm+yU4uBVsu9uhAdxZ3krWowAF8yy+6aOHSEFJHqrlnFQ6cyF3tPA877I
	 53YoVVVwYhlHYASEDuWVLKCrSevEd98t5/51OuuQqn87EfzNFEwok/H9IpKEBjgEnaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NPirnYZl;
	arc=none smtp.remote-ip=156.224.83.251
Received: from mail-m83251.xmail.ntesmail.com (mail-m83251.xmail.ntesmail.com [156.224.83.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25060A2610;
	Tue, 27 Oct 2026 13:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C25060A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NPirnYZl
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528777a3c;
	Tue, 27 Oct 2026 21:28:30 +0800 (GMT+08:00)
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
Subject: [PATCH v5 13/18] drm/exynos: exynos_dp: Unbind bridge when connector init fails
Date: Tue, 27 Oct 2026 21:28:05 +0800
Message-Id: <20261027132810.1746118-14-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa17d8c52f403a8kunm87c266213d5720
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkxPVkNPGR9PGR8YSEtOTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NPirnYZlPG1sPdOJ5EysWzLUSSCEHtFIgB4DXt/ssBfk0at08VF3GnSiY76pbuE/rtTgcYFnf15hXLyPoBrmpnCHy9hF8hmFpJ/rg687Tg/cFw2qqsx14CD9OFFAbvH+O1NuKTejTQ8VeR5WTcUo279jB6ahUcdjy/qHBR8x0fg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=RUbnQZd01npFxSkYgQ+GOJK5rQ+b+UxFGoQp+0x6DuA=;
	h=date:mime-version:subject:message-id:from;

The exynos_dp_bind() returns without unwinding analogix_dp_bind() when
drm_bridge_connector_init() fails.  The aux device registered by
analogix_dp_bind() is then left behind with a dangling drm_dev
pointer, which could be accessed on later AUX transfers.

Call analogix_dp_unbind() in the error path to release the aux device.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index b1e130278ecc..032c50d56179 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -121,6 +121,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
 		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
+		analogix_dp_unbind(dp->adp);
 		return ret;
 	}
 
-- 
2.34.1

