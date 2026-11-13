Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.88.81.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558223;
	b=fw40dq08Kz8ls7R+yyHgWSr3Il4J4pi/ysGwQ3dFjWz3X+dRFlbxD8bPH7oFFwtcGF8w
	 cGBZbAYai9Ls+NKoOQdm7z8+997vV45/ukPoOBn6hk5j64fj8yvK38ZhO1yBwS9kg/kVA
	 Wsz85b9F0axZJVxa7oVltTN/Q8KNYGZm2tcXQj8NsOBIGmJ33E3iiLzg0K71UaiGIXzNt
	 9nmCQRW2Ptc/jOHUzBZvhNat5CHN3YMhsRoBZlLB1brmokajTRMGY2Nq0On+1uDbdoGDM
	 v3JkMfrKfPAG6acJzc97KjmZKFQoQva7vM82XkKqlwI5GsTNA4HUrzfhunXWwdnrraQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558223;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=ec6awz2rPOwPo3s2ojMeeQLtGJuhRw+MMLiAWSlyn1k=;
	b=tTG5UxcnnLeFy+3lbgRs1IBHq6OUhLe26kSJcuUmPC7UUUFq0rnJEnsxd5oGhxM+QxAt
	 +TOD7kPPOYjeSv0PXYReT6fhY6NLfIgyD5X05JjaCUIgyGyLJK8qMm145RhNt9XUS9xf9
	 5CB70hpczjnlZJZ4QYvNkdm0RD4xFp8KzCaHeypi8MPdfuauis5LrAADRSodJb0CMFgQv
	 QaseG+SH9QAFU3RtHRelew6rHvQQh/+qutLum8Rh4uAJy3xIAYZB/lxs32FJ+dqlDQedU
	 tcG0DHpJYAP80sD8EwkoS3F5cODX5iupDOhofymukRC/+CfJhKUZG+ixG5ExMLAcZbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Hvj2q2Tn;
	arc=none smtp.remote-ip=47.88.81.145
Received: from mail-m81145.netease.com (mail-m81145.netease.com [47.88.81.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D14B606BDF0;
	Fri, 13 Nov 2026 08:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D14B606BDF0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Hvj2q2Tn
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be64;
	Fri, 13 Nov 2026 16:23:32 +0800 (GMT+08:00)
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
Subject: [PATCH v6 12/18] drm/rockchip: analogix_dp: Unbind bridge when connector init fails
Date: Fri, 13 Nov 2026 16:22:59 +0800
Message-Id: <20261113082305.541652-13-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa1d401381b03a8kunm073aab0481ac3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSR9IVhlLThhCSkwfSU9MQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Hvj2q2TnZ38x1P+LwuO1t72YWtriPL8ZTvFkvOesdFMfz3JZ8qze28OKz7H3FIgbOwPCPacJKTlkVSYf3uKvUbmFiREj/i+IhqTg4P6a0HvL+latrvhaSHoQBJKrqTJ1Z/TI9JuFjwOE54ML6Qn3TYZFo0RMI9isV7KA2a6EhZE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ec6awz2rPOwPo3s2ojMeeQLtGJuhRw+MMLiAWSlyn1k=;
	h=date:mime-version:subject:message-id:from;

The rockchip_dp_bind() returns without unwinding analogix_dp_bind()
when drm_bridge_connector_init() fails.  The aux device registered by
analogix_dp_bind() is then left behind with a dangling drm_dev
pointer, which could be accessed on later AUX transfers.

Call analogix_dp_unbind() in the error path to release the aux device.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v6:
- Add Tested-by tag.
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 635146746b42..39eca3ec7160 100644
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

