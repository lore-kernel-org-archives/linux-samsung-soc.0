Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AE04A35
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 00:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765929714; cv=none; b=I3UBIGtU66YgiXsvY6pYMVhkkVU8Bc3lUPkMoiNawjB3JySuIbSV+zNZc+amvlIVechqjfPteshoF6N+SZeOJmmgtNn2OwDISRPR0W6owCK2OrZWwmbrOhHogDKqkU3Kzeq77ExjrA4Ymc3pP0CsEcKJbvvdJNZT017z6T5HHpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765929714; c=relaxed/simple;
	bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g6MCpUcMy9TY6OVl/7WOenpL+brhcijCFSOBpHcC5F4LJL7C9bs1eVBma4bX2GAL6fgJtOav89vQLHN8d7tSD8YPFwDu8VRzZI5VEgBnalpdfrrvWYzKtpm9wrr3IG5JH2K2NAOdUh4TAnEumuSY/dDczjmmbBbuOm7Yaz9BRPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=DPNTeLVd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DPNTeLVd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29f2676bb21so57662965ad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Dec 2025 16:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1765929712; x=1766534512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
        b=DPNTeLVdj6Yg78EERLmeJ/omTSXwJVJF/IH/5lX07mRuYY0gbR69nkDm6u15+2tOxm
         3ki+cO1XlzRvuFqY0c6FP0RzLSSB7wPTurU7bf2ztXdvEjojvFsIYqhMIYh062QBpy0q
         8L2Dq7b5ioHl6dbGYPXw/meGF8fa7b3ZPAgGLbOaePF/MYQe7nIzCzF2FMSqZeGiS0BV
         RtZu3szHewiclrSIFnbfLoAT7iiTzh97i3DJgiHzDfPWpxCXBAbCj190wpSXzQCy94p6
         ag17cKvnE7guHvy6tUazTT/WHqy1I/h/7debstrh1OIa4eA2D7tSke3WvGNNz6nY8l9g
         bTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765929712; x=1766534512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
        b=UeCCffQVpD1n9swLctL65v13KxMwBr0HYLeXz3iUQdpznddAy9/5cSR5t9RyK0H+y0
         L/2ntmRue6ozIFYfg+nfpxoRlmb7LV1Phpan0e8MQp8c/oWDnNZZeGOfM9Nzg91a1X17
         6+JW+Hb7IMU7tMws6GOxTnjmHA8/jBEtPFaEabC97jRIDS1aqVN19zB/Hx/VPd/1sjqg
         6XLo7X+fGVQiQJWFumSnvNuoNZ1JVy7wNQTnX3hdzmTeXYPE9psXZdNTzU5nuZSsRxsV
         Ntvaz9iMdhr9St9Ft+GEBT041peqTkzna1QVo01mjL8suOViJL6i+AO9rRemyttfK7Dl
         nnfg==
X-Forwarded-Encrypted: i=1; AJvYcCWu7j0S+39aIBd3ad0tGJwYDyaNTRx5/nMw8RyiLnEnAOckfN1i2bu28SIT4tIzcwn8ccFAOjjKp7HXgbtKkjbmxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj1YNLG/DYhJ60rtIeDEGN/Zsk6iY6zyNt+irOaL1PK4lWHZYK
	xb998w+8omWSQ5z8DfXcsxjM8Pj6UHvuZ7NneWBVbAhPTYvFVWae7JXKYueSB2vXY/gEdGkQFzQ
	a4ZFKfwtMN6N8PExvCWpveUiqlgP7GYU=
X-Gm-Gg: AY/fxX5qtyycqLzIPv16bev02FADSfL70CPx8Lcn9oAL7/FjB+Jf2pSj+jQ1bmjwTUQ
	1gGCMef66XtSaFr4tLuftiH89x6BfYQih0g4gNbS+Z4xZHZkX6rDKMiu6NJqyNoLsMhlhRHDydw
	MKKXCcjm07x1mDBfnz83txx0xQLLFQyg0hYfYm4m2GrXUsJfVFTI5VOWUPvtKIHIZVEHL65PYkl
	cwB5QoqTd72wJa197SEdQSEvAk+BStE4qzxYrd5zeuqReH6c2/JTGyZX5nKaNNs5mNVxAIv7Ze6
	9jFNWRXyYZw628mygx7xpg+DAl0=
X-Google-Smtp-Source: AGHT+IGJCumVLPI6LXTb+R3wbQ5b6SSgqQC0QLByiXYYrEmbkjlG0jzydWOiaHp0sl9AgFqwMi+afZ8/iOgSdsy9IWU=
X-Received: by 2002:a17:903:1446:b0:295:425a:350e with SMTP id
 d9443c01a7336-29f23de66ebmr152982955ad.8.1765929712310; Tue, 16 Dec 2025
 16:01:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
 <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com> <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
In-Reply-To: <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 17 Dec 2025 01:01:40 +0100
X-Gm-Features: AQt7F2qigiuBf-2umKIaZyZh98eVY_wIo1vz8CYcqmMw3ZJiZleOgoOUFsOFlyM
Message-ID: <CAFBinCBaXRNBHpY2uYy4FxyAOnRA4NxJtHbraG0=j_U6Dzz2=A@mail.gmail.com>
Subject: Re: [PATCH v2 17/26] drm/meson: encoder_*: use devm_of_drm_get_bridge()
 to put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Tue, Dec 16, 2025 at 1:46=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
[...]
> > What I'm not sure about is how this series interacts with
> > devm_drm_of_get_bridge() which is why I'm asking before cooking a
> > patch.
>
> Apologies for the long delay in getting back to you. You might have notic=
ed
> some discussion about the overall approach, and I waited for it to settle=
.
That hasn't gone unnoticed!

> About devm_drm_of_get_bridge(), it is a very different function so it doe=
s
> not affect this series. The name similarity is confusing indeed, but
> devm_of_drm_get_bridge() has been removed from my approach, so one less
> source of confusion.
I have to confess that I'm still confused. drivers/gpu/drm/drm_bridge.c sta=
tes:
"Display drivers are responsible for linking encoders with the first bridge
 in the chains. This is done by acquiring the appropriate bridge with
 devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to t=
he
 encoder with a call to drm_bridge_attach().

 Bridges are responsible for linking themselves with the next bridge in the
 chain, if any. This is done the same way as for encoders, with the call to
 drm_bridge_attach() occurring in the &drm_bridge_funcs.attach operation."
Does this mean your series effectively deprecates devm_drm_of_get_bridge()?

> I'm soon sending v3, and I have updated my patch to
> eson_encoder_{cvbs,dsi,hdmi}.c, actually splitting it in 3. I'd be gratef=
ul
> if you could reviewd and/ot test them when I send v3. But I don't think
> there is a need for you to send any patches related to this topic.
Regardless of the questions I still have around
devm_drm_of_get_bridge(): I'll give your patches a go in the next
days.


Best regards,
Martin
