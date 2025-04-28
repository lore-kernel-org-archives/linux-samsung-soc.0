Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3525A84D02
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 21:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875120; cv=none; b=qFm9ZcqT8xrOouL3yVSsxp6TDdv1iAXDEvxuHvlUTRT/1OAIYEJaRrP8gftk19wup+2bXP4OzeZNlzZ6MpN/JCL8FEq4zH+/WaciKmZtjXrfDXAbSY58wgYoVqb9JfMvLEYfxck9Nqsy9ZFc6LqCOFjVeLlEMBpX/3QW9Akhj6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875120; c=relaxed/simple;
	bh=n4WGwCItyZewiOJcBSp4Eaj+wnGcnc5O6i3QGT0fNG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+Cpr2SpA/lvhjNqUBZMXrp4czuWTIpxaDAKnzrBNwWnekUNSjoeI3OnKsgO1B3ekfjVy4ONvtTQTB98qJ7qHjdH07iuZyKJ+Nahb2R8qmJb5dmcuIsu8PbbDzZ0eYS7qkM3nIBEz/Hz3h4gigByktqalhiFvgWA1QGhYE7Gkk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KUSLwjaQ; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KUSLwjaQ"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5e1b40f68so594475385a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 14:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745875117; x=1746479917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=KUSLwjaQUp74Y35+m/jzcje9yiRRA1vDSjPVaq+ebr7rCc48YfU98ZgwTewSLTKJQG
         veim/xIHref57ZygEJ65jIh6MKg69PTRtd/MuVas6cRWbSPQUFhsfuLb6Jf7ju3sV55H
         GEAuy2DR0wWhu77V/auxkIJLMgEJULDe8qcaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875117; x=1746479917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=c4HmIVM36P0rblscSJj01KUmW4qPhN05tmGjwOBduhsPiw3nqh8pAiq5kq8j6pq8da
         FowC9mP1YOtgSko8F9YUEAzwqPVRgsPFCYZO9n2siW1BnJ6I4V6FyE5lkKr2qAKXHs0f
         qm3GvLJ3ngnsmhwmyZNJYYpAigiYMrtLUU4ajXDerqvuOjFsMm09+fcYP3xUfJbyM9Sr
         iAE3EXDg4h4mQaHPefstpqlwpnZLbSD7T80VveMEBXSQrFCpN2cJwV6tGLsy9F/DY7lQ
         BEQ3IMkvt+klr6Nkiqhy65QXm1P5MT8wu+Aq9NPi/J/TkyXBv0N9nArkCpeXdgWpaJKK
         tTyA==
X-Forwarded-Encrypted: i=1; AJvYcCXLZ6dYn92FjhIabWx9dH8/DqU0KYYqV5X50JmeduRzuTdLv5z+/sKJ/UKfRfhrgEjq+yuqtHhNYiCnZgm5/7F86A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQEbcj+C/Q6pWRJQpL+nFGBWpOTwU5iV8iqbvNwEk0y6cv5EB
	Ebg0UAOmGGMbhuSIJHwAiav0VdxQasqELXrr68d2efslUz1srhMEc4T241dMzwIsEqIIlkvP7Rg
	=
X-Gm-Gg: ASbGncuCQ+CWvq2uzIB2tSIMOo3O3tGEWuMquEmew7tkleqhLP+uO5VFS0CkK8EixvG
	RUKvlp7B3pd5qr1+FVDFrXzxydgCqnnEo/7QPT8/XKCLFjJ6uWrafGnmXpuSeFFJV8n2rbu13rt
	yhXlg9jfOy9AvV7nLRGpJ4iOLRiQhpZ2srmqm+F00kgoxrOP4Exl53b7E6Y8dB+sEWQch2cPHI2
	qeq/oPDC1n7N9U6PvAnNEmEvPgaOaM2Ve/JrE57BTn0Uj8DxpTrgvxJ5lpjv7j7uvKUecOrUBdi
	fJvlVVW+CmhXyyG49wdKbwJdgpzU6d6aQg8fpjY0C0HherXT1JGrQ5N5WlRm+clmPTMTYOXE2Up
	2nay7UIoR
X-Google-Smtp-Source: AGHT+IHAGUann5ouPYY/PYuV4pAsq/MHNS9D1EOHAgDW2CaO/HyTJKfmO49TOKW6Wq4gNJYrNL/xiA==
X-Received: by 2002:a05:620a:4012:b0:7c5:588a:5c1e with SMTP id af79cd13be357-7cabdd8eb7emr208456085a.30.1745875117034;
        Mon, 28 Apr 2025 14:18:37 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e7c001sm662460985a.82.2025.04.28.14.18.36
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:18:36 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476b4c9faa2so84124371cf.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 14:18:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzWPToELi7SOQoRCrGko/4M0XAD5tnxkAC/CDpSd4/B0CP92X51JGmVIEsxQo8j62xfOy3onnyU9K3avE3tK9Lrw==@vger.kernel.org
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.
