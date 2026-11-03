Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713584;
	b=BglTZD5e9kmMXS4s7EsgVzEPYR6MvrTOVm1V92k1hMMkIe9A8lMNR1WrBfN65mtSGBXH
	 GcRO1ZLbFDOROEH7FTeih7dLzWWwSFk0kMsu9p0izssTdkYIKPghztIPIfdm9Sg9o1h+e
	 WrqHvcybCrrmP1ptoK4rsSjgtMNoHLvpUia7BXvtuznluMWN1dOif5fND/zt2NBmP4DIL
	 1Crq5Hmxq0V0y126r7l+YlzGFHNLR9wuseuZiFmL8vT0+dQeqBbqd1CSppk1WhUSGawmh
	 uTqqAjs2Ta8a3QIig2zqRFGCo3/34bfJzbYKxrU6b8Uf576Tk8BnPTH2/8t9JVyJ3YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713584;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=QeBIzSBgbncOGqlM98hwD+JA9fUoC+6t2mWGJwt78Kw=;
	b=oOVfigRCylldqLrPekZ8/H6Nwme9Hpg5E1X6moqy3aAnbagwnEBmUcl3uHKlFE+y8heg
	 jYeby8VOJS6PIKWyvX6ZrIS0WkDsH48mDFs/VAl09Sr5ErYcpGQm3zwreh3sOjFYpoZtE
	 plCJa2fM5m5z8W2bQA2MP7pvm5hff2SaQHxFLCftHPysc0dyjv9/BVJ/fxoZZTsAEiI7z
	 YPpew0Vrys7bVFfWL7+yay/jrZ27urNqqQvhoyXnpo9Zpqpyo+dFdyv2dhfJFt5v+XZ3o
	 4IB2IHAcuFu7Cpr9LTQT94Ca+/HZE55ouJUePWk8ZQOFB8R/PHiAzWL3qVw7CIcHpDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=hT1uyxmX;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC06606A326;
	Tue,  3 Nov 2026 13:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC06606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=hT1uyxmX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QeBIzSBgbncOGqlM98hwD+JA9fUoC+6t2mWGJwt78Kw=; b=hT1uyxmXlGd35FvwuJi86gP5fh
	jJrzYSLnWjbn9JrgM1rOrYootc4LL5NwR+NlFuitkSw7wZftZ9ZwVbceHpXJ0pgnmW1XFOVY0ebfQ
	HV9g62vS9L6dqKIRX8jKqMSoGGM565N2LVqlrKtNU7HOV3PDrb+zQTwbBINLiM+UgUtsdlvAmiMYs
	/l45+mUYAT1M5Ouw3p7oDCkLni+r+V3Cmegi7eI/tCgbZO5+9LMt2OVQXn7CpEv4my1az7GreJ5UW
	0jJ/eKX19DRD/5u1dyjZGs9VcfS/rS4ZGNdRg3hTsY94ZlSJR0S+PkmqXA/pVzgcZ+ct0vyRID0d4
	q96ujZmQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v5 00/18] Add HPD support for Rockchip Analogix DP
Date: Tue, 03 Nov 2026 14:45:41 +0100
Message-ID: <6109289.1B3tZ46Xf9@diego>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 27. Oktober 2026, 14:27:52 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Damon Ding:
> Changes in v5:
> - Add four new patches:
>   - Select VIDEOMODE_HELPERS for DRM_OF_DISPLAY_MODE_BRIDGE to fix
>     the undefined references for non-Exynos users.
>   - Unbind the bridge when drm_bridge_connector_init() fails on the
>     Rockchip and Exynos platforms.
>   - Declare DRM_BRIDGE_OP_HPD on the Analogix DP bridge and report
>     the hotplug events via drm_bridge_hpd_notify().
> - Move the next_bridge resolving patch and the forced connected
>   status restriction to the front of the series.
> - Use a pure threaded IRQ handler and hold runtime PM references in
>   the IRQ thread and the detect paths. (Sashiko)
> - Limit the runtime PM holding to the RK3576/RK3588 platforms and
>   exclude the boards with a fixed panel. (Sashiko)
> - Fix the display timings leak in analogix_dp_aux_done_probing().
>   (Sashiko)
> - Change the type of &analogix_dp_device.irq to int to fix the dead
>   dp->irq < 0 check. (Sashiko)
> - Rebase onto the latest drm-misc-next.

Everything still works, so for the new patches also
Tested-by: Heiko Stuebner <heiko@sntech.de>



