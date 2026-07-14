Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9147ECF7
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jul 2026 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047479; cv=none; b=EAuKhHhFjYXALmSNihHyRFw+/QVG1P/dmBSXuOjIPOuZF8D0+wZL2QYMEldAxO387kH6oN4fnEi0bPaqUl3Ymc5t511dbzpcKFQR0xVYa7/7zreuvuX9zDaoO1/PqbW2sCXIF61hhgoSGJTcsuv1HsgQlIOqmhp1ADW6GGILSWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047479; c=relaxed/simple;
	bh=RqnAQaWApVjF7YzyhGavgYqZVl4QHJphZ+CSTAodH1E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AiGeWNiU/ucvRmXOzZfbD2M8urFD6ur12L2t4XV6nlIC7SJuuxCccq5B6nC0iwoieGoOHCR9XrBk+5BQTnLFBU/WBgW2nE6Ek89VjoiD2BkoaZ9JTx/rBa88GLNZzsB8giGGzakyU/BTd3UqLgJ9FY/UDg0w6KlkAmxFwm+/vRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NpLgkyx1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NpLgkyx1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 721734E40DAF;
	Tue, 14 Jul 2026 16:44:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17A6860346;
	Tue, 14 Jul 2026 16:44:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F05211BD3B90;
	Tue, 14 Jul 2026 18:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784047473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d5B5ZPV9+qhIoN+5rR8YuXgTr/TKM6k/1xr3NrI3/70=;
	b=NpLgkyx1FJLMvADanmmwQh1OlgXY5iL/dyXquVqQSmhC85Ba/1GzlMpy6YnaJbaof7TEfG
	vpmFm0Cm3K2XolqMNxmdPGnj8bxvNuHwZjaOm1t83KrcsEG3GqdNmkm420I5Lh/hWCFy8j
	DCcZF9W/iFDkcGVUUY32pRpcTxLPtn18ht4uA6siF7daCUgXgjFexIPci7vffWh2eG7WSs
	e76+L0nJFBDdZBJ9rzdOEove3cbKMeMH8CTNe6NWKnLFIcRn/nSyOrnz1lXg6vyHA7M/sH
	h73mOVtIlPbdfqqbUrAWUaKxKEKju4vBGWmCOibm6S5Mm2BWOtVKYswXls/nJQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Henrik Grimler <henrik@grimler.se>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
References: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
Subject: Re: (subset) [PATCH RESEND v4 0/3] drm/bridge: sii9234: use extcon
 to detect cable attachment
Message-Id: <178404746733.242094.13579113773760674255.b4-ty@b4>
Date: Tue, 14 Jul 2026 18:44:27 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3


On Tue, 02 Jun 2026 20:36:47 +0200, Henrik Grimler wrote:
> This series fixes so HDMI through the sii9234 MHL chip works when
> cable is hotplugged, by making the MHL chip use extcon cable detection
> functions. Patch 3, that actually implements the extcon parts, is heavily
> inspired by commit 688838442147 ("drm/bridge/sii8620: use micro-USB
> cable detection logic to detect MHL") by Maciej Purski.
> 
> Before these changes, HDMI only worked if cable was plugged in before
> booting. If no cable was connected, then wlr-randr still showed HDMI
> as connected, with 0x0 px, which confused at least some UIs (phosh)
> and caused problems:
> https://gitlab.gnome.org/World/Phosh/phosh/-/issues/828
> 
> [...]

Applied, thanks!

[1/3] drm/bridge: sii9234: fix some typos in comments and messages
      commit: 511ee3e5f7e4e82b6a5a0f9aa16895ab9a96fd08
[2/3] drm/bridge: sii9234: use dev_err_probe where applicable
      commit: a3bbe1f4877d372da713b79764787e01306b12aa

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


