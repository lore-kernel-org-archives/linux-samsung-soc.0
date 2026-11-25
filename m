Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=8.221.36.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605729;
	b=EKnScc546jrABWHVSA3081Sh1TeYjFFwK1rkb82NSx7rvLzD7cyo3sDI5gJmfQ901PI1
	 M62XgcE8GcKj2XuG2QD02DCSO8RGSOawh5rHrb15eNdDq9JrIqJTV2v1gjpyBFYRiMamT
	 J4jFoKF5rCeAWNzspxqXki4sYaDh52kSJ8nQfQsNZ5JAtb/EZJ3Jnu7tAulT4k9KSKk18
	 NS0qeOZanosMYplP7EzoAazL0P/D798nmI8UcmIHNFtjPd6AG4A/YctBoRcM+IBaKSDkA
	 pr2U02Q93/U1sDXH1ERIuCQX+hNd1Dya5/9GbW8P7US4IL7ucFcYKIvYRFDODeHk6LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605729;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=LN55FevueCSpgrf/yglA1ahNWl9iVPOBwH9tWUd+Rbo=;
	b=jaPe9lGYrr8nv0ZRpDvLjS1l5hSgPW1Lj8N02pvAT8CaZS9EjQSdHzYJNs/F+KhSi3To
	 9a9OIO0nHrHuy/sLAkY7KoISDtvbBxjve6Ypoa+YL5b/Y3eQWdykVX9LW1eeP683OcqX7
	 4+//XmYVwDFPpv/ENijuZ0rVOu721KJQiO3mUDqWl7mMmBgycifqYvLthwakKUu1oHMEv
	 K3QWs8YyciqW4vZ3ADHdMh361vjOvrnfRoy2v5tLa6li05/sTiu1aVSdwWr+8pTnPVqu7
	 PE+4eLvXFdV25iV+DJGZTbSRYJv55X0X4kDyQWf6hevT/+C9tbMrRJLyGK/KoEN0jow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ql6dAdDB;
	arc=none smtp.remote-ip=8.221.36.202
Received: from mail-m822136202.xmail.ntesmail.com (mail-m822136202.xmail.ntesmail.com [8.221.36.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E550C606A321;
	Wed, 25 Nov 2026 11:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E550C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ql6dAdDB
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f81602c;
	Wed, 25 Nov 2026 19:21:56 +0800 (GMT+08:00)
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
Subject: [PATCH v7 02/20] drm/bridge: analogix_dp: Drop the redundant pm_runtime_mark_last_busy() calls
Date: Wed, 25 Nov 2026 19:21:23 +0800
Message-Id: <20261125112141.1434903-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125112141.1434903-1-damon.ding@rock-chips.com>
References: <20261125112141.1434903-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa21270dfad03a8kunm17c23050775861
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSRlMVkNJSB8fTh9KHk9JGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ql6dAdDBICliEpE0zaJBKkomwfjmr5mRu2VrmabrPTLBWAfg2j531J6ktUsjgmd+VE5ZkOgR1Bqm9tIm/qa6yI08cOosdZyeghzfsCrE+AdcMmWPjrYmoXfAgm7LiKAn9q1vf+MwcZtHBsE/u4tgdi5tK4MmxfhJMzFPmIde824=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=LN55FevueCSpgrf/yglA1ahNWl9iVPOBwH9tWUd+Rbo=;
	h=date:mime-version:subject:message-id:from;

Since commit b3db492e8335 ("PM: runtime: Mark last busy stamp in
pm_runtime_put_autosuspend()"), pm_runtime_put_autosuspend() updates
the last busy timestamp itself, so the explicit
pm_runtime_mark_last_busy() calls right before it are no longer needed.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v7:
- Add this patch to drop the redundant pm_runtime_mark_last_busy()
  calls, as pm_runtime_put_autosuspend() updates the last busy stamp
  since commit b3db492e8335.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 8bb4c48aa3b4..50da43d64034 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1369,7 +1369,6 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 
 	ret = analogix_dp_transfer(dp, msg);
 out:
-	pm_runtime_mark_last_busy(dp->dev);
 	pm_runtime_put_autosuspend(dp->dev);
 
 	return ret;
@@ -1389,7 +1388,6 @@ static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned lon
 	ret = readx_poll_timeout(analogix_dp_get_plug_in_status, dp, val, !val,
 				 wait_us / 100, wait_us);
 
-	pm_runtime_mark_last_busy(dp->dev);
 	pm_runtime_put_autosuspend(dp->dev);
 
 	return ret;
-- 
2.34.1

