Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEACC1FECA1;
	Thu, 24 Jul 2025 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753362551; cv=none; b=rfxduhKPDYDeTnIwRdJXf41XLAFkM6z16tlKy7FXDpl0tMgc4h7kzPcTHRB5L6U7hVOtiV3Eno3tbjy68yPEQNZCSvXJlAgE2HumGUr6BL2aPLVgF19V6/T7wVzwMCo1yxn1L1Cmjo3YXDXpMTzd+jrtQk+KSX9q101oet0ktug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753362551; c=relaxed/simple;
	bh=lAeQ5wByui8hUtS+uQZMIpI+P8Jp9tYUUd4AGfchuao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQtT6pwrgPKUi9F1T3GUf7HqVHJO0c29Ubd0Vzk2MGe0T4ZtGF6QrpX9DjgYpaH/uK23EG/iF84JB/PkPYtqywR3udhoSwEhJ7IjP20gTUVq8XIqGk3qC4lBYJDh1OWgYL0DOKdMBhT6oXBofOHBH6YVeCGWoEWtMo2lJumANrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=gMB3Z0Re; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="gMB3Z0Re"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HYbBR/vjtvPGQp6a/iAl/VH02ieL5RdhqTwrGy8yYEg=; b=gMB3Z0Re5e0Ku5KUYsXpWeF6CW
	QTTfHmKKsDRzxk4T4aBUpRGwLEoZrxHmYjiovGZX1VOCUh58SwscvBejmCwgkSNdaVonI2jMY1dfT
	6EDnSdXL5pyB2j/4FW038FEkOKguyLnl1YIxkunwLitGklZFTetQ4A2KBe1p90S2t8y7RYuAnNHT6
	iVTPEVC8iAFCxbCcJ7X91AQsohrM5Pww0SCpXexABY9T99TZuntmT9XD+bVFVq9udOzushM1nYBzT
	TEfGEUkZR8FxrnvwukqxJ455zKRq/IPB8bzMJhvjW+ff6MxSVeYIDRcAoH9kKMIsl3vMlV5Msy8nS
	IvCaybUw==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uevgU-0005mk-HK; Thu, 24 Jul 2025 15:08:30 +0200
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
 Re: [PATCH v3 14/14] drm/bridge: analogix_dp: Apply panel_bridge helper
Date: Thu, 24 Jul 2025 15:08:29 +0200
Message-ID: <22774005.EfDdHjke4D@diego>
In-Reply-To: <20250724080304.3572457-15-damon.ding@rock-chips.com>
References:
 <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-15-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Damon,

Am Donnerstag, 24. Juli 2025, 10:03:04 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Damon Ding:
> In order to unify the handling of the panel and bridge, apply
> panel_bridge helpers for Analogix DP driver. With this patch, the
> bridge support will also become available.
>=20
> The following changes have ben made:
> - Apply plane_bridge helper to wrap the panel as the bridge.
> - Remove the explicit panel APIs calls, which can be replaced with
>   the automic bridge APIs calls wrapped by the panel.
> - Unify the API of getting modes to drm_bridge_get_modes().
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

To keep the code bisectable, I think patches 12+13+14 need to be one patch?
Removing the panel-handling fefore this conversion to the panel-bridge
would produce a gap, where previously hooked up panels would not work
if a git bisect lands directly before this patch 14, I think


Heiko



