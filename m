Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7855E38F254
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Mar 2026 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530953; cv=none; b=eC95J6U8mKfa8JxcB7v4U9LbV63yl7Cv9HLhSlvsxPOVXNwF+WjGQgmJqvZhFnmThtbRPMDIQjl6f6KmS9PI3T3rDuInWEysgkT935RNVR08zudJthgpCKwD9xD9gOmc+zFnloxfiyiVQJOsG+iF68nsnST2DUUisYZidDf5oYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530953; c=relaxed/simple;
	bh=8VqdSiLdqihQlbAtlaHr1NspuDH4FWX3VxbhCxMkVSw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ILJzXpKu1STxj1TDmlLxOrFT/90fQTaaBzkbimfNSQFjdPws1iZnBipg7NF2p8D1VWdyLiakJyz6WtHLVrB/xbLx0pZ+9k5M62AMxX3ALrPc98rnT6GsrhCkAnN+jUtvRLqEmGgy/f+c5wzWlI8Bb/Yxqe8ssCzlD1V8chO6k1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q4yN03ia; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q4yN03ia"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 360661A2357;
	Tue,  3 Mar 2026 09:42:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F11E85FF29;
	Tue,  3 Mar 2026 09:42:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 165681036968D;
	Tue,  3 Mar 2026 10:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772530946; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8VqdSiLdqihQlbAtlaHr1NspuDH4FWX3VxbhCxMkVSw=;
	b=Q4yN03iaCyv/eV6BAbQKagJi/sG1eDx8Wk6XLx0lSZrymBDDPXno5pN1Vo4oMkcWHpxMC+
	H/A6aU6BriokmFMb16Ol5ITx1snr1WlTlj2XAva17n1/Te5SJcB1R6sHPg86lUuKx8Di4S
	yt27W16DPPZv6M8K+wUKPV9FbyCnrs6esZbGvVxHY4wmNNs3xC/VYu7j3KsBriqrBC9PYQ
	RlRugbk+ji2iX7TLEaAD1qmGRqlPz8Euzhe8PXqis52T06pD5qBkNdPE2f4NuMrp+mCnw+
	u5sxz0Ek4zAb51JLymcBcoZZHiZGCo2jBkhp53f1fX62tg7+hQaGiTyhiphHwQ==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 10:42:18 +0100
Message-Id: <DGT1RZRC2HD6.1LRG837BCF1UH@bootlin.com>
Subject: Re: [PATCH v9 06/15] drm/bridge: analogix_dp: Remove redundant
 &analogix_dp_plat_data.skip_connector
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
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-7-damon.ding@rock-chips.com>
In-Reply-To: <20260210071225.2566099-7-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
> The &analogix_dp_plat_data.skip_connector related check can be replaced
> by &analogix_dp_plat_data.bridge.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
