Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53842556E
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jan 2026 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769863942; cv=none; b=sRXvvc5vUIQskfSqSxKgFqqJafM6R4djXme9k6lW0z+EFAhUhh5Sc/gKU3Thk5y8SxA04N8+mu4gFDhtN2nZVY/n7NzCQepuDdq9wuLNIjjMQC6aGS1DbVxMXEEqQeQjZFhPlLVB03MzSd7OAcWsjuF1VgD1xu/MFVA6pfSXaqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769863942; c=relaxed/simple;
	bh=mM7MD9sB9U4nlX6xoer7BRT1Lqr5aMyrRDscZ+wcBkE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=DHSwyE9CR7HrqTMWOksHmGFBeNGgw0BxehMnHFCkW+KU59PLH48L/kwL9PDsPwdZH6py77cypbmzLB04bV3vIJ8LCv1FphGEooNpeo/XzWSZ7zrXaZRXJuQ5HbzeO7FxX9oj4Czmsoz4mlXcEyfxgc8Ra/MsYat4AEH6qFdzMsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fDgxO6Mp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fDgxO6Mp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7CB301A2B5E;
	Sat, 31 Jan 2026 12:52:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 522DA606B6;
	Sat, 31 Jan 2026 12:52:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA0F6119A8886;
	Sat, 31 Jan 2026 13:52:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769863937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RxyFnWgbUAYvhpMdYr/N5vyAI+H1oL4nAc3ZU6Inhdc=;
	b=fDgxO6MpgRZyihSKd+5jBWPrdf8LpxE1hSaDbW9Mvvs57WZymPmqhA4k9vp9beotZi02f/
	Tpr7wrnWzg25aiajUyQRlxD1SaOCo/g+cRuPf19riEF8V3TDjBSNp8k2OYPdukD21qFzSm
	i5oaqHmH9YLl+Ow64sXn/8bpJzJLCW1V1KyLV5TLk2bqfbZ5Rp71U1FZmlQCH3n+EP3pf6
	2ZyTo/c83fTEJH3KcHDoYtTPgQXpe2uk/+6xiQChhrROszlENHUJ8pVQpaTsErJqwsQzkW
	mkiIbWU4Y7RgIA84Ru6lLy6cS+jJE5gBANoVsCC1HDVcGdGo2MHTLo5NsrxcjA==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 13:52:06 +0100
Message-Id: <DG2SEFJHOTZZ.19VQUW2FYSWAC@bootlin.com>
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 02/18] drm/bridge: analogix_dp: Formalize the struct
 analogix_dp_device
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-3-damon.ding@rock-chips.com>
In-Reply-To: <20251217093321.3108939-3-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
> Use the tap instead of the space for &analogix_dp_device.aux and
          tab

(no need to resend yust to fix this minor typo)

> &analogix_dp_device.force_hpd.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
