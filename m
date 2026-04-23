Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECF233D6F9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 21:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776981015; cv=none; b=qC5CrkFMWv+ho2gDrhk/R0IGEAVL8+LaWaUSPgeasAXkIh3FU8q8HR7BLubKsovOK5tKX+2p39PN+gfZ6GqUoN5X7otH+BFYxEqvSGL4wTY6hGkS0RRsG4r9WPenPajrWDqCTNtcYshoL7kFGT5zB4j90IjZP0gVfGwjUx1NX70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776981015; c=relaxed/simple;
	bh=LSRVDpEOamzQs0THbHW6eRIUrSeuuslIY0FvfldgvzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPbtzh7gfB4H3ADj+F9bjdQDq9cXEw9wUnmcd3rIdKgRsA/qzyhzKjK1MQ5odsse0clLXV2Vr1LQfSGGOaxjDgToKy6uaWyatK0yev3goP8OvhIVzK4EYkJBdRTNib6l1NAjD0ZlfUqcXI1U2rvLcHhYtsW1TfPAs2PUFvxDV9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z6hnfLLJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z6hnfLLJ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b93698bb57aso1305584666b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 14:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776981008; x=1777585808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1fiSCPkq0DML3luJPuVMp7dn80QlXb/vZ8XRZ+msWc=;
        b=Z6hnfLLJ+XT7SJXsuBN2bs0HD1C0+zmpnZkGHupibh79G9MpDW00No10BTSPMtfimD
         D9md4gbPPY/pOxCQlNATPMaPlE6LV+N3UOfYtDIm8wqszvlcR+NOF8nDIFa69aNIOFBY
         BpdjVyeX2tUiroN3acIeArFb02vj/fFewKYXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776981008; x=1777585808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G1fiSCPkq0DML3luJPuVMp7dn80QlXb/vZ8XRZ+msWc=;
        b=i7XtoUjCgpMwiwRQHc3eIuKXuSNegjpFRpzyvjVbuS2XG5EVPXECE515k/7/M+bA1n
         kwIq5Xjx2WPtb8KCJB8tLTFhaMQZ2MjTaZS0Soc+EQCB+zg9i49x7b3wTYKCgvTZkjQG
         lrsGpRtVnPh27Bd2SLvk2v47Kwe3JiT3TU1p4s/T0sl7r/jbEkC9i5slRU471IUlifq6
         OIEw2jzimQTY4iQ2mGhV97+Ewv/ep0LEbweH11GknuRaZCq1dSeMEPD6dVntR/Snf6d4
         0Xkrx8TbHqZeVInce+pNnoSthHBGcECaKk23Ri9iDdP4yOxOnBxver/dOQZ/pkAmqoes
         MuJg==
X-Forwarded-Encrypted: i=1; AFNElJ+5r96Cx2r0SKhCh128Y0hcKQXn5IL9pd6WbLKOWohq95ovRB9bSMquSJMsqf6OUhcwb931aOpPDfHAGvaWuGpA3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx94zMURfAtdMV/4268swT0HXRs414gtyPYCgHb7YICV/9lDPuv
	zwU81PimUyX8Ro9tsJPcgNrdqZu58ENWoHYAM2tGisvBZR9iLmYuFipL/1ZLQYrG5gD8FUWNRXN
	nAo4Q/Q==
X-Gm-Gg: AeBDievrdXdeUpsRXdbJ4qUSFSmy0wQtIuaN6Ko262ndguJgsvCpQeeIUf6TMDIqgx1
	PGDHbmfdtz2FJyC0zqkG0SNZBi4Gx8NARlxcyHXzABa23VhzyFkslqsWL+R1gMoN4ekNmpBFH1h
	xrT9bzKf++4dDRg/eEbigKvfStbBrZ1ukeBsRV2qcTT5p6YIYNtflfCyND86dxNRyqKW2IbCLs+
	DdO3no/tz7CmSQ8b2u145fVNvwcm6giv1M50lhkXrBV75e/AY0cWK3FqI2TcrLTlhHndVgj4Gzo
	FR3q+PZUit8C+ITI1Wpg/2t2v506EypflVe6UjgyqkxO0rVCSqVCB9tWBqVtQbM7BZ9rA0AN4fv
	wZ+vR5IE8Q8vl8nRgCnGFattJ7zZv1hzW85aZjKoWIAdlijC3LA8Rn8OCgn90RzWb/8kLGn5+hR
	/bfzMp81Xx7Qyv8/cEwkRH9/yPX+4uVF3Y6o2O6MAdlkX/eg3iPn323t4mCBGm/KmO7zPMdJw8
X-Received: by 2002:a17:907:2d0f:b0:ba6:79c0:c743 with SMTP id a640c23a62f3a-ba679c0cceamr1006662366b.11.1776981007529;
        Thu, 23 Apr 2026 14:50:07 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba5498b3ddesm628146166b.22.2026.04.23.14.50.05
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 14:50:06 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d70c30767so4719806f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 14:50:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Jcclm0PI+bzIyFSDdM24NUfZ0HzGsuWiS7Fp3fRgBeuw7X7jUbjfn6wPCWNaK3V1rXnTyCXqDJPXfeTp+IlJ8Bg==@vger.kernel.org
X-Received: by 2002:a05:6000:208a:b0:43e:531f:720c with SMTP id
 ffacd0b85a97d-43fe407383cmr43673395f8f.11.1776981004287; Thu, 23 Apr 2026
 14:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space> <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
In-Reply-To: <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Apr 2026 14:49:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
X-Gm-Features: AQROBzBZ12eQ8JPtoHklunZA7baGhpheKR11CnReOtZ62TdnznxZp2PUusIRrN4
Message-ID: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/panel-edp: Add support for Samsung LTL101DL02-002 panel
To: Lukas Timmermann <linux@timmermann.space>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexandre Marquet <tb@a-marquet.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 23, 2026 at 2:15=E2=80=AFPM Lukas Timmermann <linux@timmermann.=
space> wrote:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> Add a panel entry for the Samsung LTL101DL02-002 panel, as found in
> Samsung Manta (Google Nexus 10).
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Adding new panels like this is discouraged these days. Is there a
reason you can't use the generic "edp-panel" compatible? I know that
the exynos5 driver is pretty old, but a quick glance shows that it's
based on the same analogix-dp core that "rockchip,analogix-dp" is, and
that seems to have support for aux-bus...

-Doug
