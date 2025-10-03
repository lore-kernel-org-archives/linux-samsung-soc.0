Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D151A08DB
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Oct 2025 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759476906; cv=none; b=HE4daPxx8hc1Yq5TBCbv6/d8AxWwdeMKxigrZNkjUa+simGZOUPfPSYM7oSXgdpRDO9UHQpW8CsZ4GWMpGJwaueDX2X/d9C8X/gV+TuVZ0VwAKm7XKxK9Qr9/vx/TUjBVBsaOw/Frfe3oyajR3P9zsygcaXWHpZ4Tcco5yqHC9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759476906; c=relaxed/simple;
	bh=q8KmMWVi+Ow8bFd43KdrPUX25hn5WOvjfeVsU/BZfn4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=glHveNB6OftbWa3ege3XNVh5OYagsKqka6hxwN0yN4NbqZpr+l3+01s5762KxM455tFL9v5X+UKm4hXjnkFcelhf5bnJUqJ38Wcs2xtMmKIaEMBletMlgFCb/wS77ftIQ7BRhl8IpCHbhSFvybX1GQZx7QzIhQ4YlQ8O6ylhWuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UOuzOIjM; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UOuzOIjM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8F4DAC00D9D;
	Fri,  3 Oct 2025 07:34:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 865FF60683;
	Fri,  3 Oct 2025 07:35:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B157102F1C25;
	Fri,  3 Oct 2025 09:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759476901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DniS63K40mZp/zefKvHAEKMgyEYOkDSoRUV3MskhVNs=;
	b=UOuzOIjMWBTMrpGD/VHIltalTbABDWzlzm/0eWOj7r4d7cathtY0DLrjIYc2gZmOnWxme2
	u68J4G+CKIlcGLbDAXifRgxNS2/9+l/ZuO9baNqTeNaLPa6Xb0Q4tQ7RMVEEJmybvzK9DR
	weJ6wE9ndD7E/6zeWFMVOigjQqZCx9cG6gkt6eh9ziaE6SZ+UNuHEtazk56voORfirupVx
	4zVOLDxqDX9mhs7kTn4iu3Mly2bdrECTlw3OinNdGmNg2kGi3wz56AuDyih1hktbTkDWpG
	48ahzOit15uRdHOgWYOWfUsSFhd0yVupBDWZgv5FTrpVvfCnZR6Q3tf9EJfLEw==
Date: Fri, 3 Oct 2025 09:34:35 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <20251003093435.415866c7@booty>
In-Reply-To: <20251001180922.6bbe42ac@booty>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
	<20250930090920.131094-12-damon.ding@rock-chips.com>
	<20251001180922.6bbe42ac@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Wed, 1 Oct 2025 18:09:22 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Another thing to note is that this patch conflicts with [0], which I
> plan to apply in the next few days. The two patches are orthogonal but
> they insist on the same lines (those assigning
> bridge_connector->bridge_* = bridge). Not a big deal, whichever patch
> comes later will be easily adapted. Just wanted to ensure you are aware.
> 
> [0] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/

The patch I mentioned is now merged on drm-misc-next [1], so you'll
need to rebase yours on top adapting the changes. I expect it to be
simple enough, but don't hesitate to ask here in case it's not.

[1] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2be300f9a0b6f6b0ae2a90be97e558ec0535be54

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
