Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B539546B8;
	Tue, 29 Jul 2025 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753803850; cv=none; b=JEbk/hKcr7gou7+IO8311KU9o3YeEPN6blpm3JauRRMhbckqgejAo1FscLAEAVQPgD+z30PM64PuWKbkLnYmb76sRk9vnygBz2hMDxEGxHQmGj6fD86zNqNd/IJtzQ5RsYgMbUZBp8jEJoWeaFQa/nBFDJmj2YMD/smZ1r+ubkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753803850; c=relaxed/simple;
	bh=S3+XNf1yB0GDaxhHAShTKUqmAkpZEnuxO7naqLjaIp0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=G92haavPdn3Blw0pzFoaIJNfCQkjmOrGth4FInzgIB7y0yB9lfcM0P3YH5qdA5exBCtBVbfBgn0Y3Eiu0GdXQEF8hnI4lPq7chT+Ossuw1lYcRMbIStZ8otPw8vEJSJA/EyKUAY0ENPrBsQ637ri9Wt5qD4BJNJeqISqKmVSfJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=iZQ1tSWY; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="iZQ1tSWY"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9266420231;
	Tue, 29 Jul 2025 17:44:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVLsDY5o5ZQS; Tue, 29 Jul 2025 17:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753803843; bh=S3+XNf1yB0GDaxhHAShTKUqmAkpZEnuxO7naqLjaIp0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iZQ1tSWYX5L6Yo1i6M+b1Tm3/khKQdTTo1AkT+gqo0UvP8q0D0/XAKFELWuBZ0A5U
	 cxunVuSc1jFRgl7lTjZA4lHi0ebzENkCXF4zD5BNTtL5rY/xm8yGg4fL4WHIFwTt1/
	 4PYG0blQXlUpcNA5bR6tVoEGTizlXc02GI5ISZ8NurKzjobaBO65D5gJfgJARGOaKD
	 E0AO5fEbhDT3Tur00p7H74RwpQohy3iSWq0jGqbS9Ph82/Bz3QG/Q4PtbpnW96pNP+
	 ZQDHwPJuy38mM3y999pZDeU36pa/Pd4Gvz3c0Xu6FpB7Nw7BvEmTIbLG3IDymWrVAC
	 8gmGiZmTNo/nQ==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 15:44:03 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/13] drm/bridge: samsung-dsim: increase timeout value
 for PLL_STABLE
In-Reply-To: <CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
 <20250706-exynos7870-dsim-v3-9-9879fb9a644d@disroot.org>
 <CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com>
Message-ID: <b732d2588112932ab399df47fb58e3f5@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-29 05:44, Inki Dae wrote:
> 2025년 7월 7일 (월) 오전 3:28, Kaustabh Chakraborty 
> <kauschluss@disroot.org>님이 작성:
>> 
>> Exynos7870's DSIM requires more time to stabilize its PLL. The current
>> timeout value, 1000, doesn't suffice. Increase the value to 3000, 
>> which
>> is just about enough as observed experimentally.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 
>> fb2cb09cfd5a4f2fb50f802dc434c0956107b4e9..4b49707730db76aa8fd3ab973b02507436750889 
>> 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -755,7 +755,7 @@ static unsigned long samsung_dsim_set_pll(struct 
>> samsung_dsim *dsi,
>> 
>>         samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
>> 
>> -       timeout = 1000;
>> +       timeout = 3000;
> 
> Relying on an implicit loop to wait for PLL stabilization is not an
> ideal solution.
> According to the datasheet, this can be addressed more explicitly by
> using the DSIM_PLLTMR (PLL timer) register instead.
> 
> By configuring the pll timer field in DSIM_PLLTMR appropriately, we
> can avoid arbitrary loops.
> For example according to data sheet:
> If the APB clock is 80 MHz and the desired delay is 20 µs,
> the pll timer field should be set to:
> delay_time * apb_clock = 20 * 80 = 1600 (0x3E80)
> 
> Once this value is set and the MskPllStable field in the DSIM_INTMSK
> register is unmasked,
> the pll_stable field in the DSIM_INTSRC register will be set after the
> specified delay (20 µs in this example).
> We can then check this field to determine whether the PLL has 
> stabilized.
> 
> While the current patch relies on an implicit method, I’m fine with
> merging it as-is for now.
> However, since this patch series likely has sufficient time to
> mainline, I believe this is a good opportunity to improve the related
> logic.
> 
> Would you be open to trying the approach described above?

Interesting. I will try implementing it sometime in the near future.
(can't commit to it at the moment, preoccupied)

> 
> Thanks,
> Inki Dae
> 
>>         do {
>>                 if (timeout-- == 0) {
>>                         dev_err(dsi->dev, "PLL failed to 
>> stabilize\n");
>> 
>> --
>> 2.49.0
>> 
>> 
