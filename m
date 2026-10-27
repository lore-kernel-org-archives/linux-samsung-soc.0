Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793102511;
	b=LNcUj3rLJijwbhVHhGV6cPfD3dKs7l5bc72muHFKPtholKEs0+okMaf/l82aq2qnqV5K
	 7PLehgA9Rj8EFU60nSO77fOKD/r3bHdXCKNZX0yxmP7Fw9HSPQDwcZlJSocHra+reo5FM
	 I6wO0POdSU1YzlEWo3SXnRd4ciLs89S/1OJP/m9McXioY4O1zffzd9DyOySMlgqBJpILT
	 ZU3Z/5pW920pLwTqs0+eCFpAzGqrXmelYrFHERsb8xxPj7w1WHvEzpPggN0m9JJHB1ZZR
	 P9VzqxcoceHVAzCGwQOIMXiLqzjDHeNuGapG/aTlXDYIOYOvxyk+sOGKDzdYMxM9zkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102511;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zqJI2dfXZF9d7B4udVpGK9vuvnRf2AkQaNV2frtpzOA=;
	b=XEHugiX+s75cmIJ7qP5AB+lCQCuhIwpTG2tYqzsaVmO9XmXQSWYO/foxFF3F7r7kDopf
	 3ef+wkRh2vXLve6li7uTXXCHZy2tGozQAeWn5Jk7TfWG6/9TPAoGZc5DdYff12vnG4Cuy
	 0FL9oCErjh56qFSTL99DeRh9qJvjBN2xDeSioeJ9/xMrUhx88JwmLDySB5G1m+TBbSsAG
	 7A/UvNJdJbacj+adzYwv8e6eUzQ5tNS2B6IaZGyrJUT8yZ+aAC9eesNmUuxhJG8z0FDa2
	 4xaIGN282b44w6JkdXsJG+pwtw+Ms3PJaxMspyX99DYLFi8Vuri433u2g3jSnjMgDBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2sP1Nwp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790B6606A332;
	Tue, 27 Oct 2026 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2sP1Nwp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793102510;
	b=MXlvWZEomAVTpgBJAhvfl/qvIrJ4sOeR2d6ZKOfny9YWritwUhBQ3XhGAOy4QClwmH7L
	 xVnX9OEk7ZiWgsRX+EEkDx58IG38MGPbKquNpuc0VA4WC3J6QbhPaeLPEu5KoHjThq2ow
	 4v2ct0JSqImyCNuHRlt0Atifq6l9s1D2whbdvJrCC0aYSqHpwGWaNUexwllAnDnr0UAJd
	 +67uKn4J6lAVlz0xMdLJZbrxVBBBTFc1awFoAFqiSATi6RDPd0NcgigOEbWhvGzngxsPe
	 QElXV6NfZvc3SDzHjA/oC786RqLRoPsZgQAc9HmFp7EhogWC5QtWe9WftQ5Akolyeog==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793102510;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zqJI2dfXZF9d7B4udVpGK9vuvnRf2AkQaNV2frtpzOA=;
	b=bwts3hVor18X3WhDgWgyy6EBg+B8LpLfHLBnWQLYOm+hfqAzy0ayDWtV7n4i9nIoT8L/
	 yNODwxCWm+L5ffRAHVil6wHCRdacMLWM5t/a50n5E5Ryqcruc9v4s17Bp31qTUFWWZIB4
	 jiyhxcHkNpZwwLpvyUbaEN87XvhUoxB5v/ZyQk8akaVVRG2WwWcRPzhUmWz7Oh0FqFG3m
	 TwwDU5GDyxmQ7q5/j4URIhM5MAIMu/VKq4Gt20LwFXM10SB1N0n//kfwiIcC2U+4pfEBx
	 C1DfIpIfnYkiVHADkcLCMvuxMpSdm6++2AwPUEMOIY6KvcnH1ty+7al+c2wH9XJUS0A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CAF71F01242;
	Tue, 27 Oct 2026 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102510;
	bh=zqJI2dfXZF9d7B4udVpGK9vuvnRf2AkQaNV2frtpzOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=H2sP1NwpadDkSF/T/wPTiAPS5LiNzI4w8slcALqrAQVD8ry7ETA6wWX2yjigKEARK
	 /9e8LiZ5imPzrt6L6UGrnsNj6Msk05msUKsB4rRQOphzNgxNcE8R9jUQlfbrZIC4sd
	 nEvgy2K7wfi8O2bu9q9kA5iUJjf7i25gIzNeU28quQ47vIOQy5KafXNkqPSeQWaVsu
	 NGd+RQaJmjm1nsB0tKQUVnny+l4FmKkmtA3BXNqtfoWRqccav1zFXPN6E8Ol9J4Q8t
	 bMt+QxLDvI63zAbgenjKSyqVUuVHgE2NG3Brq69hrqEs6IN5vVsG5BenncdAfff+gx
	 5QGJqcszPQWYQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F4060450A4;
	Tue, 27 Oct 2026 12:01:48 +0000 (UTC)
From: Alexandre Marquet via B4 Relay <devnull+tb.a-marquet.fr@kernel.org>
Date: Tue, 27 Oct 2026 13:01:42 +0100
Subject: [PATCH 1/3] drm/bridge: analogix_dp: deassert DP_PHY_PD on
 power-on for exynos
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Henrik Grimler <henrik@grimler.se>, Hendrik Noack <hendrik-noack@gmx.de>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793102508; l=3293;
 i=tb@a-marquet.fr; s=20261023; h=from:subject:message-id;
 bh=nz55NJx/Uu4x8f9w96Y5Aa8FlPatjRYi6gKldhgQyRY=;
 b=BDjAFMaKETqfYfJDRQJpBK7xZFOxJgEGoGMJlMGVBvYhrnwcpZ9mpeTxzvfsuuFikzLLrsANn
 tOK2NDejgz7ArsLISEgxDV35PlcTAfDn3TCjdD1oERf5G+PMKd04fCS
X-Developer-Key: i=tb@a-marquet.fr; a=ed25519;
 pk=zVRSO6FDK46rqmeA2GuzAhM24eFlUq1QpmXi9/KCFyk=
X-Endpoint-Received: by B4 Relay for tb@a-marquet.fr/20261023 with
 auth_id=1334
X-Original-From: Alexandre Marquet <tb@a-marquet.fr>
Reply-To: tb@a-marquet.fr
Content-Transfer-Encoding: 7bit

From: Alexandre Marquet <tb@a-marquet.fr>

On exynos platforms at least, calling
analogix_dp_set_analog_power_down() to power on (with enable=false) CH0
to CH3 or the AUX bus currently produces no effect, unless the function
is first called to power on everything (by setting block to POWER_ALL or
ANALOG_TOTAL). The reason for this is that DP_PHY_PD being asserted
(which is its default state) renders every other register bit
ineffective.

This is particularly an issue for AUX bus initialization, that tends to
happen before anything else (e.g., to request EDID), and thus, before
anything has any chance to request a power on of the whole analog
section of the chip.

This commit allows analogix_dp_set_analog_power_down() to power on any
block, by deasserting DP_PHY_PD if needed.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index c1344a3f013a..9f634d4e4793 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -256,6 +256,19 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
 		phy_pd_addr = ANALOGIX_DP_PD;
 
+	reg = readl(dp->reg_base + phy_pd_addr);
+
+	if (dp->plat_data && (dp->plat_data->dev_type == EXYNOS_DP)) {
+		/* On exynos, register AUX_PD and CH[0-3]_PD have no effect if
+		 * DP_PHY_PD is asserted. So, when powering any of them up, we
+		 * need to deassert DP_PHY_PD first.
+		 */
+		if (!enable && (reg & DP_PHY_PD)) {
+			reg &= ~DP_PHY_PD;
+			reg |= AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_PD;
+		}
+	}
+
 	switch (block) {
 	case AUX_BLOCK:
 		if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
@@ -263,7 +276,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		else
 			mask = AUX_PD;
 
-		reg = readl(dp->reg_base + phy_pd_addr);
 		if (enable)
 			reg |= mask;
 		else
@@ -272,7 +284,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		break;
 	case CH0_BLOCK:
 		mask = CH0_PD;
-		reg = readl(dp->reg_base + phy_pd_addr);
 
 		if (enable)
 			reg |= mask;
@@ -282,7 +293,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		break;
 	case CH1_BLOCK:
 		mask = CH1_PD;
-		reg = readl(dp->reg_base + phy_pd_addr);
 
 		if (enable)
 			reg |= mask;
@@ -292,7 +302,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		break;
 	case CH2_BLOCK:
 		mask = CH2_PD;
-		reg = readl(dp->reg_base + phy_pd_addr);
 
 		if (enable)
 			reg |= mask;
@@ -302,7 +311,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		break;
 	case CH3_BLOCK:
 		mask = CH3_PD;
-		reg = readl(dp->reg_base + phy_pd_addr);
 
 		if (enable)
 			reg |= mask;
@@ -321,7 +329,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		else
 			mask = DP_PHY_PD;
 
-		reg = readl(dp->reg_base + phy_pd_addr);
 		if (enable)
 			reg |= mask;
 		else

-- 
2.43.0


