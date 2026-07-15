Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415E8305047;
	Wed, 15 Jul 2026 07:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101863; cv=none; b=pTmCaHHeEmkSLatPh1oKXsP8fitaNOHRGL+S3ErvVlxm4rfRNM1MR6okqSXcsW1uDUxobHq9Ntsh9QUY6GZz3eVjRSASyJgbC8vCQdhI+xHP9ITVYXCdX+vuZTfQnpCq0koF6IklL3ME/+MtNo+tNco91CR1knVewgugVzarOSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101863; c=relaxed/simple;
	bh=kK2aBMlJcHcBgeuLGRXA7rf1eHb/N7JvvFH29FtNekA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g8YLa6eAkPTLokyWAGj+Cg/HeY/bra7BDdlLAqQ6JCFqFGKhJPJhJVmwiW097dTH5xSTFZvdVycqILhC8CyZCxbY+apQAaVHMGLVWMP1Q6PUNGW9Wk3Am0E3BzjAiULYBCnc8uoGhE2MNPEWQsGTpDfoZnFmWFJBM4K0D9inxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWLtEZZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWLtEZZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4233D1F000E9;
	Wed, 15 Jul 2026 07:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784101861;
	bh=u2xNjQMKnxOxV+YIQMMgbHvL77Gl204HIj3OPEzRzsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JWLtEZZ2CK+RaDqDe5EsHoQ92youKV2BQAAQlaGJgphg5k/mzjYpg36OjbHXCF0LU
	 L1Y44OGtN3iW7cGAZcdkABWxxSsSwNIe3J3HXLSrVDLhkRNVKlPGhmxsW8VJ0LYZVe
	 kuckzsBquT8Bg2aTLWGuvbRhdskKXfpn7/pV1xKmwLlVXUd8Ljp99hWyXa42uCk1xj
	 Xe1MeTI6c87qN6VIFN1C+xvlYYR1qGRhb2UfBhXWGb97BoTWYYsncELSaIdmxEfRfg
	 L6+E8kZKPgscKW1i2KjiaCKSpPWZ1MnI3ZWyRobQz5dHLOfBNRAxRQbPL+POzb/nGz
	 j+pPTVb/xOArQ==
From: Maxime Ripard <mripard@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	freedreno@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: Re: [PATCH v2 00/37] drm/bridge: Convert all bridges to atomic
Date: Wed, 15 Jul 2026 09:50:57 +0200
Message-ID: <178410185255.27166.12276953519235775875.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707-drm-all-atomic-bridges-v2-0-21d03cbca446@kernel.org>
References: <20260707-drm-all-atomic-bridges-v2-0-21d03cbca446@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 07 Jul 2026 17:11:07 +0200, Maxime Ripard wrote:
> Over the years, most of the bridges have been converted to atomic
> modesetting and hooks, but not all of them. This forces us to maintain
> two different code path in quite a few places, which is pretty
> bothersome. The switch to atomic modesetting for legacy bridges though
> is pretty trivial, and we don't have a lot of drivers still using the
> legacy path.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
