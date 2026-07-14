Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A6F43FD24
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jul 2026 16:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046881; cv=none; b=VRlqvE0ISwp2+fJB72TU2oe5EG9EAKc3aKaMlcLrdYyt1Svda22aGIlYaFcBaGuyJJUm6i3H2O6ZUMRnT3VEtC0W5QEsOslxMAtIopGqu7n8HstRAR+FeXPEzou6xtmJqceTFt66c2m7QgsROGTIpro7b1W6Kv80croQPXM5lx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046881; c=relaxed/simple;
	bh=GEXlJMuznRZ7gqV31yts4NVuQwdpCilvVVRmkrf87+8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=eusTNI7lPdDJb8MnOP0FZ4vaI6qHjDGInFamYjDxwLllEnRBR7dO+y9BAEtz8u7Lztwh6R5JGwwRAbX9LuyBA4ATSsWjnE7cZC+CDPL/6nwHlysGydBa/Z9gSM5Vsth+7c4HtaqYsQSDwBuON6HPRNd/Fw62569RAzNttFE48fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k+gecyEI; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k+gecyEI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CF930C2BB2C;
	Tue, 14 Jul 2026 16:34:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3569E60346;
	Tue, 14 Jul 2026 16:34:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A274611BD2234;
	Tue, 14 Jul 2026 18:34:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784046874; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PdmXjJmTMkA5IgREpa6sgPX0v03y/SAS7xpjrJi1lEw=;
	b=k+gecyEINTkQBu4B73ZP6+GAH30+zXyO8Bu5oWseXpzm65+Eqmmh4EREjqpeBezIhvCHtM
	Y0LpulaIEIafhrmXCdEiQMVUJQgClf2gVR5/+kZun1xb3qxD9TE2g4DOjTk/F9j3Cn0ZJT
	pOnWwkGD7X+Vn/Gmx5dMv4itq/gqXqPbk4h5FE9fyctl9CFuDTRu1x85nRVnbDYtaNTSjj
	R3w4xoHqOPR6vrXpZrXVkc20j8h2t0Ok100MHcses1URRAcXRDKkP1IdsHWRo4SXRbm/HB
	6C1YrZMJtB3zrBDjHGhGIGXtmoi4ueTNIAwbvOmtDY0O22EPLANLBKD/6XNM5A==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RESEND v4 1/3] drm/bridge: sii9234: fix some typos in
 comments and messages
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Henrik Grimler <henrik@grimler.se>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260602-exynos4-sii9234-driver-v4-1-9b2fc38e104a@grimler.se>
References: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
 <20260602-exynos4-sii9234-driver-v4-1-9b2fc38e104a@grimler.se>
Date: Tue, 14 Jul 2026 18:34:20 +0200
Message-Id: <178404686053.173179.13431201091765549763.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 02 Jun 2026 20:36:48 +0200, Henrik Grimler <henrik@grimler.se> wrote:
> Fix spelling and formatting so that the code is easier to follow, and
> so that it is more searchable.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

