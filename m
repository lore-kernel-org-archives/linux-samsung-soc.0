Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E5577107
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2024 18:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718822617; cv=none; b=J6pUtKvHF9iiLFVZvbPt6bmvHlB/79uHeufOf2HrUFp9HDsYl7rexjoy2O5z5M63woyX+Vo4s3+sYj9bYvZp9uTObLG6LtUnxx9KG/rluHVHaa1FLGE+lR6Ax+EtQf0ptAxDfWlEU42x1b0UQFx7eiVlZeTLZcyIyciGlSUszsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718822617; c=relaxed/simple;
	bh=HXuJQvlPwkvwPlisX7xAOTCKArqYbocgSMBoNkfMhrY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fy8QiszgQmSzEaGFFTK2s7ZG0Maq45v5aHvsK+bjK8iOmW8sFJO56dx7lx/QyLrxys6uNNV/Qx7+aigTVZRv5Hyv1DIZcnWFiH2jVb6ruYMnz0smroPwJz6dPvwgtyZvarYEbc42ell3oYnXI791wexz+Xf58QVHA6kdC4AreI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sK0H5-0005be-UT; Wed, 19 Jun 2024 20:43:15 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwX-003WTo-A7; Wed, 19 Jun 2024 20:22:01 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patchwork-lst@pengutronix.de,
	kernel@pengutronix.de
Subject: [PATCH v2 13/14] drm/bridge: analogix_dp: only read AUX status when an error occured
Date: Wed, 19 Jun 2024 20:21:59 +0200
Message-Id: <20240619182200.3752465-13-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619182200.3752465-1-l.stach@pengutronix.de>
References: <20240619182200.3752465-1-l.stach@pengutronix.de>
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

All AUX error responses raise the AUX_ERR interrupt, so there is no
need to read the AUX status register in normal operation. Only read
the status when an error occurred and we can expect a different
status than OK.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 143a78b1d156..0f016dca9f3d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -924,7 +924,6 @@ ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
 			     struct drm_dp_aux_msg *msg)
 {
 	u32 reg;
-	u32 status_reg;
 	u8 *buffer = msg->buffer;
 	unsigned int i;
 	int ret;
@@ -1011,12 +1010,14 @@ ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
 
 	/* Clear interrupt source for AUX CH access error */
 	reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA);
-	status_reg = readl(dp->reg_base + ANALOGIX_DP_AUX_CH_STA);
-	if ((reg & AUX_ERR) || (status_reg & AUX_STATUS_MASK)) {
+	if ((reg & AUX_ERR)) {
+		u32 aux_status = readl(dp->reg_base + ANALOGIX_DP_AUX_CH_STA) &
+				 AUX_STATUS_MASK;
+
 		writel(AUX_ERR, dp->reg_base + ANALOGIX_DP_INT_STA);
 
 		dev_warn(dp->dev, "AUX CH error happened: %#x (%d)\n",
-			 status_reg & AUX_STATUS_MASK, !!(reg & AUX_ERR));
+			 aux_status, !!(reg & AUX_ERR));
 		goto aux_error;
 	}
 
-- 
2.39.2

