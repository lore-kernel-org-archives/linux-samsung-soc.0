Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ECF241665
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Feb 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113528; cv=none; b=DLcuwudlZGeQF67jMNa63tASNG/GxMlW1boq6jtQ0ONoqnT4axvv7Qe9BSe4fLat64IRqkZpUf/fN9GjYfXNtDxHxLRTZI5d2L8k8wm50AoWYlB7A8RC1w6sNZ9vha0P4ffVlMp880XzepnG3UwVtPGpeiPxJ2y6Gb8K+3ujlNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113528; c=relaxed/simple;
	bh=kaxurYH+pSZiT55rBegAYaKI+3y+ZBTAe+5LlaGS5Qc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TaZAMt3IDMq8Cpc92mbDvUUbImgoGSj8L8MS6MSx1Pn9Os9XEcXzHRZNBuBuPpnVQJrG2IOgdF9xsU6LylVsX2RiWV1MwDw7pDIiDuahd+rDNgfvTpMifYrHUEo2xSSJuGY/aDQ26DPs4K7dMWuC6y221JsTOZZfvRHmu3uecL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=soDBBG2b; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="soDBBG2b"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 381854E423E2;
	Tue,  3 Feb 2026 10:12:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0765E60728;
	Tue,  3 Feb 2026 10:12:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C634119A8888;
	Tue,  3 Feb 2026 11:11:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770113521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kaxurYH+pSZiT55rBegAYaKI+3y+ZBTAe+5LlaGS5Qc=;
	b=soDBBG2bgMR8f2LbgIrwrYZOZzYJcpbUWVYRItBu2O1PQqna30rioLkNHxmoqkhNvMoty+
	if15F8cH7NZWu28bObiIMmjSXkf/cYBNUhfuBPoO76QtFqb1UQUMLfLDYevJwW/p1Kl7Lu
	+I3G0dxG+J6RhTJVOFeRfdIz+h/B9NG/cjr+thEijncqEHuyHKZUwYUANoWLQg294fKT8y
	TDLWlGQamhmukciHP6cONfNmeBtpmJaloA59+nUyzJxHvdVhD6JznC5KaF3u+dPqNNeDk7
	seesqobwi6ZjgtZhhsyn/aWw21kF+XuG5pXLFvYh5MYavI/tXRZlfn3DYpa2Fg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 11:11:50 +0100
Message-Id: <DG58VCQ54OZA.2QHGR8JFIATY2@bootlin.com>
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <jani.nikula@intel.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <dmitry.baryshkov@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
 <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
 <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
 <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
In-Reply-To: <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Tue Feb 3, 2026 at 2:31 AM CET, Damon Ding wrote:
> Hi,
>
> On 2/2/2026 10:54 AM, Damon Ding wrote:
>> Hi Luca,
>>
>> On 1/31/2026 8:33 PM, Luca Ceresoli wrote:
>>> Hello Damon, Dmitry,
>>>
>>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>>>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>>>> out of imx/ subdir for multi-platform use. The driver is also renamed
>>>> to make it more generic and suitable for platforms other than i.MX.
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v7:
>>>> - Rename legacy-bridge to of-display-mode-bridge.
>>>> - Remove unnecessary API drm_bridge_is_legacy().
>>>
>>> ...
>>>
>>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>>> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NXP PTN3460 eDP-LVDS bridge=
 chip driver.
>>>>
>>>> +config DRM_OF_DISPLAY_MODE_BRIDGE
>>>> +=C2=A0=C2=A0=C2=A0 tristate
>>>> +=C2=A0=C2=A0=C2=A0 depends on DRM_BRIDGE && OF
>>>> +=C2=A0=C2=A0=C2=A0 help
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is a DRM bridge implementation th=
at uses
>>>> of_get_drm_display_mode
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to acquire display mode.
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Newer designs should not use this brid=
ge and should use proper
>>>> panel
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver instead.
>>>
>>> "Newer designs should not use this bridge", but in patch 8 you are
>>> introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't y=
ou
>>> instead "use proper panel driver instead" in patch 8?
>>>
>>> Can you point to the conversation where the converstaion where Dmitry
>>> suggested this change? Maybe it already contains the answer to my
>>> qustion. Also adding a link to that conversation in the commit message
>>> woule be useful.
>>>
>>
>> First of all, thanks for your reviews on this patch series.
>>
>> link: https://lore.kernel.org/all/
>> xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22/
>>
>> I think it may be a misleading issue caused by directly copying the
>> previous Kconfig description. Now that the new
>> devm_drm_of_display_mode_bridge() helper has been added, drivers using
>> the panel-bridge framework can rely on it to maintain compatibility with
>> legacy display mode parsing.

Ah, I think I got the point: the mode description in device tree is legacy,
but the driver itself is not legacy and will be current until we need to
support legacy device tree. Correct?

If that's correct, this patch looks OK to me with a new Kconfig help text.

>> It would be better to update the comment as follows:
>>
>> This is a DRM bridge implementation that uses of_get_drm_display_mode to
>> acquire display mode.
>>
>> It exists for compatibility with legacy display mode parsing, in order
>> to conform to the panel-bridge framework.
>>
>
> Dmitry, what's you take on this?

Dmitry's opinion would be much more relevant than mine. I don't know much
myself about this driver.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
