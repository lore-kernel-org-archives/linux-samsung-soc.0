Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB19233939
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jun 2026 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782303558; cv=none; b=Azl/E30GScaHhyhsSyjNzjTx/GIvqkzGav0bt/HDSFUGNw9AZWZSDMSxcysioPnXXMufrLk32TgOhhB/+XBlOny5/JPNV3ShhiD8w8hT94/LnUHTgbXLQi3bFB1L9NlLcLx4BokCFIv4TBINi0cK4W8a9O/X+TG28f84zob2PTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782303558; c=relaxed/simple;
	bh=xQoETzVYL7/fMAukFP1/FEY+oMvDH3rg5mFsB8017XU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hB0aQPKCsWYdM04FCga2ZOdnC4A+0WcRhPI7E3/Qr4rVsuk6VTLqqQ93XqmzM0NSIY/v1Al3mrs4uJ/nPqY4daH1cLJhSaSyoAU7XpEyiTOdmAlaau6ly/CKr6q3eQNBeR1t/NByijsi89pcQ93TzMViq/h2NxKGxsnX9s24z+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KEv1cfu/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KEv1cfu/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0F38C1A090E;
	Wed, 24 Jun 2026 12:19:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBC89601C5;
	Wed, 24 Jun 2026 12:19:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEFE4106C83D2;
	Wed, 24 Jun 2026 14:18:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782303545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xQoETzVYL7/fMAukFP1/FEY+oMvDH3rg5mFsB8017XU=;
	b=KEv1cfu/jYGfDwre6OwZ+P4Da5g/P5DLOoi4ufNgHjjSXbNTPwIbnYk/UOh9ec76Xi6r/G
	DFd6/DHGMh414txRBF40PoSxV+VlfEMI0dV693nAwprxYHVOsiF4l+Nu7k56WcpLJ+plKt
	M19npB/jcwdfaojICtMPjr+ioXw/rsjoqIyL5YLlhgzfWwm7gkFRNvDV3r+5fmxgiNLiGR
	Fpg//myj41KpNJxvcsa7CgwV2XAA3Pq1OFhNBG6SiZNr209BBBOm7pZ+5lA6O75NrZhmgM
	/YrgBuSybieaZhN5mTMsjq+GstetuZsbblHI6ibs2ayVSjRRAtJDYNmvgfkWLg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 14:18:48 +0200
Message-Id: <DJH9VDITIVKV.1UZLU2S53MLO9@bootlin.com>
Subject: Re: [PATCH 00/37] drm/bridge: Convert all bridges to atomic
Cc: "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 "Sasha Finkelstein" <k@chaosmail.tech>, "Janne Grunau" <j@jannau.net>,
 <asahi@lists.linux.dev>, "Benson Leung" <bleung@chromium.org>, "Guenter
 Roeck" <groeck@chromium.org>, <chrome-platform@lists.linux.dev>, "Francesco
 Dolcini" <francesco@dolcini.it>, "Peter Senna Tschudin"
 <peter.senna@gmail.com>, "Ian Ray" <ian.ray@ge.com>, "Martyn Welch"
 <martyn.welch@collabora.co.uk>, "Manikandan Muralidharan"
 <manikandan.m@microchip.com>, "Dharma Balasubiramani"
 <dharma.b@microchip.com>, "Russell King" <linux@armlinux.org.uk>, "Inki
 Dae" <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>,
 "Kyungmin Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <linux-mediatek@lists.infradead.org>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Alain Volmat"
 <alain.volmat@foss.st.com>, "Raphael Gallais-Pou" <rgallaispou@gmail.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260617-drm-all-atomic-bridges-v1-0-b63e6316166b@kernel.org>
In-Reply-To: <20260617-drm-all-atomic-bridges-v1-0-b63e6316166b@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Jun 17, 2026 at 12:14 PM CEST, Maxime Ripard wrote:
> Hi,
>
> Over the years, most of the bridges have been converted to atomic
> modesetting and hooks, but not all of them. This forces us to maintain
> two different code path in quite a few places, which is pretty
> bothersome. The switch to atomic modesetting for legacy bridges though
> is pretty trivial, and we don't have a lot of drivers still using the
> legacy path.
>
> This series converts all bridges to atomic modesetting and drops the
> legacy codepaths where relevant.
>
> Let me know what you think,
> Maxime
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Lovely cleanup!

Apart from what Laurent pointed out, it all LGTM. Instead of spamming with
an R-by on all patches except 37, I'll just wait for v2 to send a
full-series R-by in reply to the cover letter.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
