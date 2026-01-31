Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CDD13D539;
	Sat, 31 Jan 2026 13:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866846; cv=none; b=Eay3NW0nWGOv1LgRVGLzyGdk4qJ9iDdEbWQiA+KrqdYe8+jFxN3uzC47j5GFj/lGNebX0XZV4mZBzcVAD/9K5b3XO4YpyeV26XCYsgAbiWUn8PqNS3qXqa9ijF3BtR/nRHn8hFcTq47MaVg4/+z8MoW80uPm5+g8Sm5HMFJV1pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866846; c=relaxed/simple;
	bh=XSxS9wHGDtdAjX1/5+mH0Huzdhx7zLjNEB5f+DdlTHs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dUqVuL6XkwG26Illimxl6Dfj6UtSMO0tWR2RXAQ5+u7XFTI5MmAJiprZwLxj2dqEaKC3U0kyDpELjmR1PvPCNyNYAGCHDCD8/im/KQSbhB3SrchLE38gtp9mId80wkhXtLY+sr0eQkh+FGgB4mSJOHq4sc+ZiCMLuJFfSqPPDyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WTuQ2mha; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WTuQ2mha"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 62F88C22F7D;
	Sat, 31 Jan 2026 13:40:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68E36606B6;
	Sat, 31 Jan 2026 13:40:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 915C8119A8886;
	Sat, 31 Jan 2026 14:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769866840; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XSxS9wHGDtdAjX1/5+mH0Huzdhx7zLjNEB5f+DdlTHs=;
	b=WTuQ2mhaaXw/P7Q25lzFfVTRcWPv/hugf9DkEQvyFph1whXGvriM4dSVQvFK4TtrcxnOQu
	IAMhT3QpPx2uJAbmP8FqQUPbtPh/g4NUG3r9iSs8IC1BM4ptqVxeF9JgZ3oUy1SToqGgAz
	FywDfiaBr+6xyHGJq9KCWX2rrECQtJKsSSLuAhSYB7WRmgjVNhdUoXJXnFDeMv70xeHxcW
	VSMFMHQqwqVrXq6zx+RYNMQ2OesienWcAOHAVgUpRY0aOweknThfG5iGej6R1TEpxBI8TB
	t4pNxRlvealMsJ+yFWLRGtldVaRAdu53+YnKrwyp3aN89lawwYRC0LJaxEwJ+w==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 14:40:29 +0100
Message-Id: <DG2TFGURV519.27PQFYSUMS6C7@bootlin.com>
Subject: Re: [PATCH v8 07/18] drm/exynos: exynos_dp: Remove unused
 &exynos_dp_device.connector
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
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-8-damon.ding@rock-chips.com>
In-Reply-To: <20251217093321.3108939-8-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
> The &exynos_dp_device.connector is assigned in exynos_dp_bridge_attach()
> but never used. It should make sense to remove it.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
