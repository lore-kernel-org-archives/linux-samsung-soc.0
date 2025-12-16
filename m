Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFEB31E0EB;
	Tue, 16 Dec 2025 13:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892955; cv=none; b=JmWaKfXzvVTPFXm0K0clfHj0CKnArM/cJBz2T3vORkaMH7iTHIEfvbAAnZWd28mhQi5Egyv6qVhHDEAJy7d6dBLvsBVhK5MHbmlUEyONvFOe1dfFbO/RURef2S32hEmK/iHaasegYv0Ua8WqvOwmiqRSfpE8aPpxEvwHrE5E4XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892955; c=relaxed/simple;
	bh=sFLsYOIToyI1CYsLfOe9PNPAZa7SMcZGDRLeye3TkV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W6ITLo9p0HnXAzwN99Ii4I/trYKulM4t+eFuRtE6CYPz/G9bY4LRYfOnJK7oGwaOkfDMsLpaaebFkJH++se0rg44h6JX16Q/q6IUI9bPQZNOttL/4VnEaRDfuXyADEqb2G8mvPSa8Kl2scTZJmx7/b4xJb6YFqmAW97usFLv/GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=1cVIG/eg; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="1cVIG/eg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sFLsYOIToyI1CYsLfOe9PNPAZa7SMcZGDRLeye3TkV4=; b=1cVIG/eg7I6sS8hSAue2feSosa
	fs9JYZLPNZbpWOz+5uum2rewSRjwJieZr8xzpUV4bVReoRWYTT+mHCMkrJwoHhPQSGGR4sPYkzGME
	RDsFsScNiP6CEnjPay7NzFuwIgrFnlWdjIBcjNaVq8fDUXuIaKOW1yPFJct87k4LnqJiex01iAtJC
	+Fz+7SV96+v9afwrM24tqAFdJ6qSg/CFjF9ANZ2MwSKnE6OQY6GWDS9sX+mM66a1RGHlrF4XCy4eq
	tmRZp4LuDiR8emPv9NnninxunaM3+fUtsB+aMFPl4oLO0sv1kYMOkT8HpqoosgGfpuXJ0fkaxQjwv
	m+v2sXhw==;
Received: from [141.76.253.243] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vVVPc-0004Lk-DA; Tue, 16 Dec 2025 14:48:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject:
 Re: [PATCH v7 01/18] drm/display: bridge_connector: Ensure last bridge
 determines EDID/modes detection capabilities
Date: Tue, 16 Dec 2025 14:48:23 +0100
Message-ID: <3351986.usQuhbGJ8B@phil>
In-Reply-To: <ff65f453-68a9-41fc-b9e3-02733bba96e3@rock-chips.com>
References:
 <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <DDNXIYL494D2.2N8L1J7XTBT4S@bootlin.com>
 <ff65f453-68a9-41fc-b9e3-02733bba96e3@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 22. Oktober 2025, 03:15:52 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Damon Ding:
> Hi Luca,
>=20
> On 10/21/2025 6:31 PM, Luca Ceresoli wrote:
> > Hello Damon,
> >=20
> > On Tue Oct 21, 2025 at 4:31 AM CEST, Damon Ding wrote:

> >=20
> > This does not apply on current drm-misc-next, due to the patch I mentio=
ned
> > in a previous iteration, now applied as commit 2be300f9a0b6 ("drm/displ=
ay:
> > bridge_connector: get/put the stored bridges").
> >=20
> > However I'm sorry I have to mention that patch turned out being buggy, =
so
> > I've sent a series to apply a corrected version [0]. I suggest watching=
 the
> > disucssion about the fix series, and if that gets approved rebase on to=
p of
> > that and adapt your changes.
> >=20
> > Sorry about the mess. :(
> >=20
> > [0] https://lore.kernel.org/r/20251017-drm-bridge-alloc-getput-bridge-c=
onnector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com
> >=20
> >=20
>=20
> I saw your fix patches before sending this series. I think your patches=20
> will likely be merged relatively quickly, so I plan to wait until the=20
> other patches in my patch series are confirmed to be fine, then submit=20
> v8 version based on the latest bridge_connector driver. :-)

I think with 6.19-rc1 out, now is a great time for v8? :-)

Heiko


