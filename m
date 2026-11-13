Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.52.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558214;
	b=0Ru+xsN/S62S3G6DlyhSLtBzeMyZF+3qsJOJF1dWxDRRJbBLtYXtbAieqDiX+0uh+VU1
	 kUp4jDBGXgLLhLp6WAFqQGNlt1vSFhwEub5idZDoxKoJerxTva6UYmHG08EOsZnk2QHwm
	 ieeDfEeoo+JHzvIek1Hrc8xTjT5+NI501AcHzwTvxVrQNW4Aj2pa5vwYI1dycred5YpkL
	 hEqJUkSnY2AV9NFWvk3X26m2jGg4sc2IQFisBG54QwTD42q/xhYpWQPVDzNbawUXcUhvT
	 Q5pv0ZehWnxytFg/q3EYNrDT9Vt2PC/mmTRIdVlQL+ydEAPKh1sUrPhTY6GKeICtmyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558214;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=7qcg2eHB9Ht6N3F8ngaiuNdJmsvBNonJKbUCmSxKIDg=;
	b=YO7aGwvKBBJvf6W+yjA4gajfFjFCwzAlMuT3K9uPOTibO5kA44CE1Ygei3OEgUZawdVL
	 wgmN3HUJwVTHgUGXTfyLwgPzKnwzODpvFTlxjlCyD9Ihafq3CZCJ/9LKd4DoPztP7vZL/
	 ka+0TkIdNLr75NLZhujcd7muK+eZUNeMyam291KJ6Y9MOb1qYulMi/uelIqk4flxi68t2
	 0EWfXXAMnehQ4MaxMsaZ8sBVg4Cn6ww6auIfmHGzsCckZ6vRRX7vldI6nrqZ0IaEhrboQ
	 liJ+av3WW9udTl/9S7IhIREQKbo/nr5ahpOdLWPo0nbOyzyUbMsl0JB0myBUtcjameA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="a/LA/W64";
	arc=none smtp.remote-ip=160.236.52.230
Received: from mail-m16023652230.xmail.ntesmail.com (mail-m16023652230.xmail.ntesmail.com [160.236.52.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239C260A383E;
	Fri, 13 Nov 2026 08:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 239C260A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=a/LA/W64
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be2b;
	Fri, 13 Nov 2026 16:23:22 +0800 (GMT+08:00)
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
	Damon Ding <damon.ding@rock-chips.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 05/18] drm/bridge: analogix_dp: Check all negative return values for &analogix_dp_device.irq
Date: Fri, 13 Nov 2026 16:22:52 +0800
Message-Id: <20261113082305.541652-6-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa1d401135c03a8kunm073aab0481a51
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHR0eVk0aGUJDHk4ZShhPSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=a/LA/W64PjaMCrBId/qfrQKD01RvArGaJcfUqaMtvbgnJCQ+Jlxn1FxjJb2D2QC71IBfEQ9oLOdmAHlwYURrf+VxhOLdUnNzXOECyatoFhQ6Aa5qbyrrI4CMkDbRtH2ZDQvaS7zDpzELFhxsLyO9kw4dfpF+3CNiTTgQAfh/EyM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=7qcg2eHB9Ht6N3F8ngaiuNdJmsvBNonJKbUCmSxKIDg=;
	h=date:mime-version:subject:message-id:from;

Currently only -ENXIO is checked for dp->irq from gpiod_to_irq(),
which ignores other possible error codes like -EPROBE_DEFER, -ENOENT.

Check for any negative value instead, and propagate the actual error
code rather than hardcoding -ENODEV.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260804083307.84ECA1F000E9@smtp.kernel.org/
Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Add Tested-by tag.

Changes in v5:
- Change the type of &analogix_dp_device.irq from unsigned int to int
  to fix the dead dp->irq < 0 check, which broke the probe deferral
  for the HPD GPIO. (Sashiko)

Changes in v6:
- Add Tested-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index a3871f28b835..c40ab7419f08 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1519,9 +1519,9 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		irq_flags = IRQF_NO_AUTOEN;
 	}
 
-	if (dp->irq == -ENXIO) {
+	if (dp->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq\n");
-		return ERR_PTR(-ENODEV);
+		return ERR_PTR(dp->irq);
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index dc189f0b7a19..cc3466304531 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -159,7 +159,7 @@ struct analogix_dp_device {
 	struct drm_bridge	bridge;
 	struct drm_dp_aux	aux;
 	struct clk		*clock;
-	unsigned int		irq;
+	int			irq;
 	void __iomem		*reg_base;
 
 	struct video_info	video_info;
-- 
2.34.1

