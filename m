Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B906169AE6;
	Thu, 24 Jul 2025 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753362649; cv=none; b=LN72WsqHEBWR2wgV8CRP/+X9KtmviV3bolA641ERKpdcCXuPx8wySkCBd1ot1IgqWUit6qmQ2o09S0SmRnJecMl8LK7EfEDyP3XMtRluxE4+/iV3j5Y5tkrzKs6z6gPDUefCMgadbof+gZWN90CcGedLS5qoMl+dgBK7222Q5WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753362649; c=relaxed/simple;
	bh=oslcU2z5E9VNKbs5VzEQgy0a5q5NibBzjbcK3BaZxXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=miGBpEhTfCwO7q2jT5TCzCWA0gAhz+/7uw2Cm6tNqI+/IB/vu2NEKXH1TbUFMCcE5w5WKpcPv1jQyzo/8ondKq8jzXKTiIrCuVgdWXVKvdoC8ghqdlHNET7fYEAhouPu4v9IOAPQd4NzfkO02DoxfnuUPNnRB2isqYIGKXP0hyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=G0bWLgCG; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="G0bWLgCG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oslcU2z5E9VNKbs5VzEQgy0a5q5NibBzjbcK3BaZxXM=; b=G0bWLgCGIKAEYwjd5FPaoCKZUD
	PYSktF7e05P9oNthQAXoGLcRrn972qSx5o3jR79UmzuBSAvXZzwlnEhOwX0sAiHRhLToBG9qUR2BS
	XPvmNdO0PnSfvjJsd+m+PZCy3zcQBLK1o26OccU51QRsx9wS4LKO+CBzHixeyN1/67JBTRw+0RWEF
	b68x7MYQ7gBfVCeRI8WBL83E1i3amGXGrc9EQssqseaaTVSP+a924HfxiK8wk0PtmhBzxX6FqIB6S
	tx7LkuIdJNq8+HHTtcMwgQU2VSHoHKZceQyR3htodYZfkCkBOWLEzb3fO/NqR+bAhruuSYOi/JGed
	C/YCK6KQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uevi5-0005on-NF; Thu, 24 Jul 2025 15:10:09 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject:
 Re: [PATCH v3 00/14] Apply drm_bridge_connector and panel_bridge helper for
 the Analogix DP driver
Date: Thu, 24 Jul 2025 15:10:08 +0200
Message-ID: <3890785.kQq0lBPeGt@diego>
In-Reply-To: <20250724080304.3572457-1-damon.ding@rock-chips.com>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 24. Juli 2025, 10:02:50 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Damon Ding:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3 is to apply a better API for the encoder initialization.
> PATCH 4-7 are preparations for apply drm_bridge_connector helper.
> PATCH 8 is to apply the drm_bridge_connector helper.
> PATCH 9-11 are to move the panel/bridge parsing to the Analogix side.
> PATCH 12-13 are preparations for apply panel_bridge helper.
> PATCH 14 is to apply the panel_bridge helper.

for future revisions, please provide a changelog on what changed since
the previous version, I guess ideally here in the cover-letter.


On my rk3588-tiger-displayport-carrier this works like a charm
Tested-by: Heiko Stuebner <heiko@sntech.de>


