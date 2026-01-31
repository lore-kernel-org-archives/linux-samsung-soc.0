Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFDA25A34F;
	Sat, 31 Jan 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866899; cv=none; b=UVV192o47YPIJV903jAG72+L1iMC3kuD41YZUctaq/S02Nf/zPqWzIxa/FfJ2ImSpBjoVL/23bVfM2Zqtxx/bDMrxklrmhbIPQGhYRsGXlQ7tIuqCK2k2ni7BMdDA6dh41Gystu2kCmFafZWBEfVmkifgm2f1mi5ymau7bvTEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866899; c=relaxed/simple;
	bh=Lj8iwZ6EUO8gYZYfyUyDFt5AjJ1lvkxeyXDxTyIEnE0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=UCca8cr7wDgTVvioauuaH39a5tRZQk2lOLbeERk7RqAP2eVp98bgyAYWvxfW7AlKNxiLSyJNBsKg0RmxVoNzf0MOCkwWEtB/ggvWJoZlmS+l+K98KXmMFpI8wZK/I7OU8hc6LIuq230JoBSvoHVGNc6EmVwqXAR7BQxlZi1Yaqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D2WoB0kD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D2WoB0kD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8B0E44E42382;
	Sat, 31 Jan 2026 13:41:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EE19606B6;
	Sat, 31 Jan 2026 13:41:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96957119A8886;
	Sat, 31 Jan 2026 14:41:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769866893; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Lj8iwZ6EUO8gYZYfyUyDFt5AjJ1lvkxeyXDxTyIEnE0=;
	b=D2WoB0kD19f7FC8uabxA5frVmDRNS7fqqgky8NzIkrsRnfwiWTLuEskJEDLKYMlKhKTDJH
	aUO617aeS3F3x8/HEEuRdaqk3A9Gk/y6xfOwYgrNPMncoCNzyyVtODzg8lz/QuvRmmUI0z
	juqEkpIPMZEdJU6TUjdvrcUoC5DXje2HwUF8lNGYuSAkdkAa+VJPfWGu/yCcrFiY5wb+hx
	QSfUvUEXEHMg1JjW3cLE8zZ1YJKXa7rzZOAPjmHsZog70rizcJ5y99rMrtxlMVi9pgZRKj
	JuOYUBzsaJtcNkpHCLNcFE0tBazaKR54lEIs5ZlfC6dYnc1bqmNtzKXN6kWzzg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 14:41:21 +0100
Message-Id: <DG2TG4NCMKXQ.36REPVMTQ7WWD@bootlin.com>
Subject: Re: [PATCH v8 04/18] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.next_bridge
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
 <20251217093321.3108939-5-damon.ding@rock-chips.com>
 <DFCCU8AN0GZQ.2CYTKKV40JYLI@bootlin.com>
 <187b2c32-5a10-4555-8d49-cf1ee86a8eaa@rock-chips.com>
 <f644a5ab-5dd1-4f4e-b2e9-3585dec81a96@rock-chips.com>
In-Reply-To: <f644a5ab-5dd1-4f4e-b2e9-3585dec81a96@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Jan 7, 2026 at 3:36 AM CET, Damon Ding wrote:
> Hi Luca,
>
> On 1/4/2026 10:51 AM, Damon Ding wrote:
>> Hi Luca,
>>
>> On 12/31/2025 7:11 PM, Luca Ceresoli wrote:
>>> Hello Damon,
>>>
>>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>>>> In order to move the panel/bridge parsing and attachmenet to the
>>>> Analogix side, add component struct drm_bridge *next_bridge to
>>>> platform data struct analogix_dp_plat_data.
>>>>
>>>> The movement makes sense because the panel/bridge should logically
>>>> be positioned behind the Analogix bridge in the display pipeline.
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v4:
>>>> - Rename the &analogix_dp_plat_data.bridge to
>>>> =C2=A0=C2=A0 &analogix_dp_plat_data.next_bridge
>>>> ---
>>>> =C2=A0 include/drm/bridge/analogix_dp.h | 1 +
>>>> =C2=A0 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/
>>>> analogix_dp.h
>>>> index cf17646c1310..582357c20640 100644
>>>> --- a/include/drm/bridge/analogix_dp.h
>>>> +++ b/include/drm/bridge/analogix_dp.h
>>>> @@ -27,6 +27,7 @@ static inline bool is_rockchip(enum
>>>> analogix_dp_devtype type)
>>>> =C2=A0 struct analogix_dp_plat_data {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum analogix_dp_devtype dev_type;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_panel *panel;
>>>> +=C2=A0=C2=A0=C2=A0 struct drm_bridge *next_bridge;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_encoder *encoder;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector *connector;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool skip_connector;
>>>
>>> It took a while to understand why you are adding the next_bridge
>>> pointer in
>>> struct analogix_dp_plat_data instead of struct analogix_dp_device,
>>> where it
>>> would be more natural. I found an answer in patch 16: with current
>>> code you
>>> need to place next_bridge in struct analogix_dp_plat_data because it is
>>> used by user drivers to attach, and those drivers have no access to
>>> struct
>>> analogix_dp_device. However patch 16 (which looks a very good cleanup
>>> BTW)
>>> next_bridge can be moved to struct analogix_dp_device.
>>>
>>> So I'd suggest to move patch 16 before this one if it easily doable, so
>>> that you can introduce next_bridge in struct analogix_dp_device from th=
e
>>> beginning. Should that be impossible, you can send a separate patch to
>>> move
>>> next_bridge, after patch 16.
>>>
>>>
>>
>> Thanks for your nice suggestion! After patch 16, bridge attachment is
>> unified to the Analogix side, which acts as a common bridge driver for
>> both the Rockchip and Exynos sides, so moving next_bridge there makes
>> perfect sense. I will add a separate patch to move next_bridge in v9.
>>
>>
>
> My apologies for reversing the plan to move next_bridge to the Analogix
> side in v9 -- I only considered the Rockchip side before.
>
> When I tried modifying the code based on your suggestion, I found it
> better to keep &analogix_plat_data.next_bridge as is. This is because
> the Exynos side needs to maintain compatibility with the legacy method
> of parsing panels and bridges, so the next bridge isn't always parsed by
> the common Analogix side driver.
>
> This patch series has been pending for ages, and I'm even a bit fuzzy on
> the details myself. ;-)

OK, makes sense.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
