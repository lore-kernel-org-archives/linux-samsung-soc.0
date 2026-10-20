Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492753;
	b=dGyjOAI/9ec44K8OSQXmkx3ke1NTwFT6c0bDqq0ylO5aZMXo+7cixToJzKNTgqkA5+Ag
	 Wg3mz1hk0SpKFwAJGOlMO4sauqGBz4PA8h47eEsVOsRiGeRjB6wbckAoMWEtNmsrTX5xx
	 C2QBlo5nsewhaBrn9xqhLYEFOTpSWU+Wg3+LJBOuRGXJYXLvwTlykmvfMhOqF/hmoJQJx
	 TQtR2mw86UESYsmR31PiewCi9VkbhWbV5goojsygL4FwCn6jWQiAEm/D8YYD1TSfEF8oQ
	 oySj9Tey0OXlD6mjCMvYR/HIKLEi2tCCgzvsE0mRh9TN7wlRQUS/ogHz2BGzPxEOreQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492753;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=bw4/okksoRkUbBbA6VAqfuKBL2BrJlcyGwLFcSc0aos=;
	b=CT9xVUXzI1CUueO6lbngeg0SvHwWxpkr4InDFgX8L7Ns4SbhwKV3yS0FrZxTVEhkc+Ly
	 FOp9935auTMSCe2Qq+b0LZdmhRyrjZLY44Xp9/QUvK9yx0mKTRymZMyhgmrg9cnSFV33c
	 v8v7647fZkrYasfb0uNb/cGCfhG9Zi5PKQoHwvRwUEHUAURyYP9rnwuqbHKCt4zEj+7xY
	 0Riu5xabV3xBBHpbvqWm9aV81kZQRUhk4JbusFEzXudUIjky0n7kHVAzz2CM6VCI4IlKl
	 XVWNiVNcy6cY+bBZvlQY4elU3Y1VYWcbKzjY2DoYLkhYjf9NpUwLZJihMtEdl/JnAhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=RDYqua2h;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA7606A31A;
	Tue, 20 Oct 2026 10:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DBA7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=RDYqua2h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=bw4/okksoRkUbBbA6VAqfuKBL2BrJlcyGwLFcSc0aos=; b=RDYqua2hibY5Y9+ULdSMC18aV8
	sN34brcWE7sKFlJIajiNTpa6rzVPfC8B5hUEzmPws8uoqk4jSoSZdsNJV0SA9pjzHFn/yhGK3jo11
	z9LxoPi8J5wnoUQNCdUmgGmtGVRl7DG2CZB0pat02Sjf0Egk3hgpvZmdqC1ZRozk7Oyoeaxj8hEli
	oFTxHPgV1XwIeaCoYaT9QXDNMzD/8pUXIApTlsm/91mFD33wwTFyDvdpgOHEL5lAH8s+u9AKcvF/r
	KLVJ69QRyWon6hajjUlrPte8dSSSKIIxdoc7msg/g+3lnrLn9f9EaWHdjkRQ3NSBOfpXcfgAVgGTB
	l3Li1UAA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject:
 Re: [PATCH v4 11/14] drm/bridge: analogix_dp: Use bridge->next_bridge instead
 of plat_data field
Date: Tue, 20 Oct 2026 12:38:50 +0200
Message-ID: <3789853.R56niFO833@diego>
In-Reply-To: <202610201309.w3JSXlP5-lkp@intel.com>
References:
 <20261019085836.3065008-12-damon.ding@rock-chips.com>
 <202610201309.w3JSXlP5-lkp@intel.com>
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

Am Dienstag, 20. Oktober 2026, 07:36:21 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb kernel test robot:
> Hi Damon,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on drm-misc/drm-misc-next]
> [also build test ERROR on drm/drm-next next-20261019]
> [cannot apply to daeinki-drm-exynos/exynos-drm-next linus/master v7.3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bri=
dge-analogix_dp-Return-bitmask-from-analogix_dp_get_irq_type/20261019-165823
> base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
> patch link:    https://lore.kernel.org/r/20261019085836.3065008-12-damon.=
ding%40rock-chips.com
> patch subject: [PATCH v4 11/14] drm/bridge: analogix_dp: Use bridge->next=
_bridge instead of plat_data field
> config: nios2-randconfig-1000-20261020 (https://download.01.org/0day-ci/a=
rchive/20261020/202610201309.w3JSXlP5-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261020/202610201309.w3JSXlP5-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610201309.w3JSXlP5-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    nios2-linux-ld: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o: in=
 function `analogix_dp_aux_done_probing':
> >> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1669:(.text+0xb80):=
 undefined reference to `devm_drm_of_display_mode_bridge'
> >> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1669:(.text+0xb80):=
 relocation truncated to fit: R_NIOS2_CALL26 against `devm_drm_of_display_m=
ode_bridge'

I guess the Rockchip kconfig for the Analogix-DP also needs a

	select DRM_OF_DISPLAY_MODE_BRIDGE

similar to exynos and imx.


Heiko


