Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046BB4B828A;
	Mon, 28 Sep 2026 12:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597005; cv=none; b=o7V0DPDo6T0arQoB86KezKOrQkSQQE67/iBPTaNnnPBLMpGpIXMXxA5zKF0LG32jt7toGWQzGQpsFUIZdxYUiWG2Vz3LdbO6yHUA7LpkZxIGUuQUJrg32d8kVadG2V/ZJxRgoXYPkRIQ7lPkCE16F6ZVdTt5RMIvkh9Cdg7DEJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597005; c=relaxed/simple;
	bh=hIgXNSb+1LdNPzFyrPiOIc71YpY2oZSEoljN4A2bK/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cCXit6eFZz60TKr+oDDpL6nXXve3Vf1l1PAIcx2/ijV0XVJ/NF3j6Cn7Lbt2JdK/Hlu/EqOz6gL95hB/IXpUdM7hYrQrMOZ6Q9/C1yTXWhEMPIauhQ6UD8qAPQz5OLCkQeiBeBpQOr9c4MAhTOaPAXk7/+slgTNQGUT/ErUEYKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ECHJ3cZw; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ECHJ3cZw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JS5dd5f9mWNpybqKgfuEd/QJ8IUXo+CpfbvRDEoiIGk=; b=ECHJ3cZwUWSupvEzyzR1mPXOLK
	VK19JixYTDfT7fybYoFw9vuFW0SbnORD4Y9j8GdDG9U0x9ll+cMggmyyksZSibgyPky0jIZd9+52W
	0htIfPxgQIkqF1zy95076+JaRF1wxQO8It9j4Ch+hEUzB/qGtobQbbooz+Of3zfmBVp9BCNTCcS5f
	oZ/fo1tAlJA8vAJQG+hv1+g2hi8sxj6JDQmpbtgP6RN9UCZa2dRfAR4rfB4nuQ/Itfbs3LLphZKk8
	UjHJNwa39/cTltFE+yjkzF6teFeYb8PsICQ/fTQpmq2Zx1djAdWIYGQsCxAErGU/HHsafXnccJO4L
	ocKRP2tA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 00/14] Add HPD support for Rockchip Analogix DP
Date: Mon, 28 Sep 2026 14:02:34 +0200
Message-ID: <3772572.AiC22s8V5E@diego>
In-Reply-To: <20260928081418.3605775-1-damon.ding@rock-chips.com>
References: <20260928081418.3605775-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Damon,

Am Montag, 28. September 2026, 10:14:04 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Damon Ding:
> Rebase after the following two patch series:
> [0] https://lore.kernel.org/all/20260915-drm-bridge-drm_panel-cleanup-v4-=
0-30401d9406f3@bootlin.com/
> [1] https://lore.kernel.org/all/20260916-drm-bridge-every-panel-v3-0-83af=
b4f1a707@bootlin.com/
>=20
> This series improves the HPD (Hotplug Detect) interrupt handling in
> the Analogix DP driver to enable reliable native HPD pin detection on
> Rockchip platforms, and introduces platform-specific HPD detection
> schemes with fine-grained interrupt control.


on my eDP panel with gpio-hotplug via the dp-connector as before, I get
a successful display output even on boot.

=2D plugged in on boot - display works / reported as connected
    - plugged out - correctly reported as disconnected
    - plugged in again - display works / reported as connected

=2D unplugged on boot - correctly reported as disconnected
    - plugged in - display works / reported as connected

Multiple plugin/plugout operations afterwards also worked nicely.

So
Tested-by: Heiko Stuebner <heiko@sntech.de>

Will do reviewing of patches now ;-)


Thanks for working on that
Heiko


