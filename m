Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43834D8D96;
	Tue, 14 Jul 2026 16:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046882; cv=none; b=UyLN7zHmC/4zSD2sfeGIYb5z5ar4krJgFBE7wv9Ie9YQuv7ZEpTPp08wB5judLS4c9OM44jWI7PYmV/Ln1ICALH66WW2gtNYYth0godzGKFZZK3ooBnfXKUqFATbda+MMzignVexYEVKt6kntdH5M0IDBIwFCVKNddy7iz3yt0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046882; c=relaxed/simple;
	bh=Voh7QA+mlaHybsuIHD2RLEAwER5u/8l1nyqVtVZJW0A=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kbG6HjIEQ0J5lN6mND50mhxtp7aaOZTEZNW5iXNrr5cY0mAUSbiqNW1DtDeTN1GmvFfpHBErY73IHFuX7pLXiISj7nBcKExraObQjwRypvFPsqkXkda+fmtI11eXto/lIXd0d6Czek+o86BZMfDZieULIx4m0MhOCUFUiSexRXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KBzVrcUT; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KBzVrcUT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CF8D4C2BB2D;
	Tue, 14 Jul 2026 16:34:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42AC660346;
	Tue, 14 Jul 2026 16:34:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6036B11BD3A80;
	Tue, 14 Jul 2026 18:34:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784046878; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SKYgT+wXxrcMsBFxPbs7I+LRMyhwX0Td19B02OaLwYs=;
	b=KBzVrcUT1y1iGHSzo3Jd6kfdGX0NkK6aFoXW25jyYwTzRN0yV04GA63XR2/YQGx59eqTEF
	Gy7spiysy2fpj+J+lW2IpeWHjz8JcuTG0mHBhkX6al2b94FAzILG2BmJToosuQ8jaHWgCm
	2OIDRGs+9wz/71dSkfPGCCO9bYT5Dl7ilJuLNay+NrwkTgnFy3iCAM5KTHFgaXW2UNJyfU
	URZTl1rNp8NPGaKSq3pXnUcAqMoXvJyPJd03Be+kiZC1yBt7gy93Wa8YNhqkUq/kgMvVpt
	WVNdc0jGsYxI60/KZsnTcE2jV0+Ka2QZZg2lpBzzvy0LMgvD4PjafNgIGkPASw==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RESEND v4 2/3] drm/bridge: sii9234: use dev_err_probe
 where applicable
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
In-Reply-To: <20260602-exynos4-sii9234-driver-v4-2-9b2fc38e104a@grimler.se>
References: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
 <20260602-exynos4-sii9234-driver-v4-2-9b2fc38e104a@grimler.se>
Date: Tue, 14 Jul 2026 18:34:20 +0200
Message-Id: <178404686054.173179.2640070008998027997.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 02 Jun 2026 20:36:49 +0200, Henrik Grimler <henrik@grimler.se> wrote:
> In case of error during resource acquisition the driver should print
> an error message only if it is not deferred probe. Use dev_err_probe
> helper to handle this, which will also record defer probe reason for
> debugging.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

