Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.195.24.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558224;
	b=SuPXAKwIs0BCcGGOBafl9RHNhXNdPUr/6OL32GsnXJ2AL18TNzrq8gTG+E1h3TyJtgpd
	 VwK2KyNba6r16MR4Wo/tDN+u/q51DMUnza3/DGHqxaAkLKH1Dx4/ovzAMZMKRLGXgznZa
	 iZyjvXEw3w9nCleVMX2W+Aczfuxqd5gtVZU7Rcq/Wqf03gcoRobbwWhdOi7GbscodhSfB
	 ET1tAWZuHPNcvxUs7FfrkXtfROmmr4NbWzO/BaHt9wcSnkV6+gphogsHKMqC5jakCUyPO
	 Q0Bz4XQ4zoDKt2xtqKv3DWXK/hSMvKYIV1EDR5SsGjZvH4LOEQ2IQ8QQKh5TqRWcJeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558224;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=DekORoAGOSqODtCTN3k+su3EjPXM6F+iIpkaRyqo9rU=;
	b=O4Vk9l1hVpZ2YYNUvyPeV4IyBWiGAn0hLTK86kLUGrovxlE/eogX0JiTl2OO8Hf5OqLU
	 Y0nrFgngrn5WNY9vyzu89woDOqXHEd5RCmtPb4h9ecMpGYAh9UL5SJo/8v0W/m5qL6GLg
	 fnDBPItwjLfMhY70Si7Aa7MALwhnVx1GVL2AbSvsB4MeGeYSup/jMQvqoWQGgBleYLj43
	 cKrTH6ktjh3ZGoLsSeqzM+I4Od5zFV+O+xQafzap+OEWiKrBA6pf8zB6C7CDRDw4uc2IO
	 k3P93GjO5GdashtGFNjZ1l0SQkHDW/g4GhX2mi7eSUnDf/NPa7dlun7cfLPgk4fmgkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=X+ud+el7;
	arc=none smtp.remote-ip=45.195.24.57
Received: from mail-m2457.xmail.ntesmail.com (mail-m2457.xmail.ntesmail.com [45.195.24.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F83E606B604;
	Fri, 13 Nov 2026 08:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F83E606B604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=X+ud+el7
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be6e;
	Fri, 13 Nov 2026 16:23:33 +0800 (GMT+08:00)
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
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 13/18] drm/exynos: exynos_dp: Unbind bridge when connector init fails
Date: Fri, 13 Nov 2026 16:23:00 +0800
Message-Id: <20261113082305.541652-14-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113082305.541652-1-damon.ding@rock-chips.com>
References: <20261113082305.541652-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa1d4013d3b03a8kunm073aab0481ad0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE0dVh9IHkNIGEhNQ0pIQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=X+ud+el7kYt42ANScFp2NsA99RK/r8irjQ8YNIk5r44GkjMRBrZQX0Cpeeqa86FvSE9l1cS97Arwl3h4r1RMixD58BM55y+WI9qVQcobXVOw0UtAQIxMWEUj7pp3NmrZQxT+WtgfXlUCEOPhnb3/g/hto5iZd5p12Tr8RDAfkRM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=DekORoAGOSqODtCTN3k+su3EjPXM6F+iIpkaRyqo9rU=;
	h=date:mime-version:subject:message-id:from;

The exynos_dp_bind() returns without unwinding analogix_dp_bind() when
drm_bridge_connector_init() fails.  The aux device registered by
analogix_dp_bind() is then left behind with a dangling drm_dev
pointer, which could be accessed on later AUX transfers.

Call analogix_dp_unbind() in the error path to release the aux device.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v6:
- Add Tested-by tag.
---
 drivers/gpu/drm/exynos/exynos_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 572e261e09da..86dc53014fff 100644
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

