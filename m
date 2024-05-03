Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEB14AEFE
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749160; cv=none; b=KPvQRNqjn8sgV/Kq9bgd54zB2GCizsJ19Z1QOKOEBQvNDxZgSjBhAifMa3n7+Uttw2zNL6rNMTtJs+z4HPdwKwHR1Nbxg4JIf2pHxJoqu0fILFIhlaMLt3b9mC6mtX3dvlLs0SFj4Fg2C957xcRVIlD4S3F4isiS1sVM4xXptuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749160; c=relaxed/simple;
	bh=C6NTTs0C4NYFtGR7vVyIHsaWPaumkK5U+SKLTGPBwoM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JSMRV9B+w5p7HL4KST511Q94ryRmWXE7ot39iH6I2ALaWQjJQ0hioAn1hexLSimYg2mDDpW6R14OvYoiB1fUIr83/b+1CCW1rRCAesjWPKWIrlDcWUN7rYVMe4jJw7xUseuzVXFW0thX++0UWn9vkQQZ/xWA6gHuX0sHdgyoIdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uaL-0004y4-Qw; Fri, 03 May 2024 17:12:29 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZO-00FjHY-Mf; Fri, 03 May 2024 17:11:30 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	kernel@pengutronix.de,
	patchwork-lst@pengutronix.de
Subject: [PATCH 14/14] drm/bridge: analogix_dp: handle AUX transfer timeouts
Date: Fri,  3 May 2024 17:11:29 +0200
Message-Id: <20240503151129.3901815-15-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503151129.3901815-1-l.stach@pengutronix.de>
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org

Timeouts on the AUX bus are to be expected in certain normal operating
conditions. There is no need to raise an error log or re-initialize the
whole AUX state machine. Simply acknowledge the AUX_ERR interrupt and
let upper layers know about the timeout.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 3 +++
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 0f016dca9f3d..3afc73c858c4 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -1016,6 +1016,9 @@ ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
 
 		writel(AUX_ERR, dp->reg_base + ANALOGIX_DP_INT_STA);
 
+		if (aux_status == AUX_STATUS_TIMEOUT_ERROR)
+			return -ETIMEDOUT;
+
 		dev_warn(dp->dev, "AUX CH error happened: %#x (%d)\n",
 			 aux_status, !!(reg & AUX_ERR));
 		goto aux_error;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
index e284ee8da58b..12735139046c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
@@ -361,6 +361,15 @@
 /* ANALOGIX_DP_AUX_CH_STA */
 #define AUX_BUSY				(0x1 << 4)
 #define AUX_STATUS_MASK				(0xf << 0)
+#define AUX_STATUS_OK				(0x0 << 0)
+#define AUX_STATUS_NACK_ERROR			(0x1 << 0)
+#define AUX_STATUS_TIMEOUT_ERROR		(0x2 << 0)
+#define AUX_STATUS_UNKNOWN_ERROR		(0x3 << 0)
+#define AUX_STATUS_MUCH_DEFER_ERROR		(0x4 << 0)
+#define AUX_STATUS_TX_SHORT_ERROR		(0x5 << 0)
+#define AUX_STATUS_RX_SHORT_ERROR		(0x6 << 0)
+#define AUX_STATUS_NACK_WITHOUT_M_ERROR		(0x7 << 0)
+#define AUX_STATUS_I2C_NACK_ERROR		(0x8 << 0)
 
 /* ANALOGIX_DP_AUX_CH_DEFER_CTL */
 #define DEFER_CTRL_EN				(0x1 << 7)
-- 
2.39.2

