Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793316467;
	b=LLePwjK4PDlXkN0V+PmMkL7v3NuBEv8QIioaBBMWQ7aj9Sprzqy+zYcVbSPrNKMyQo33
	 xO9xwtsfkD4jPqkHv8SRWgK9Da81SwN/wOpi1Sk9eEk3z1pvbTz0GV3hHArNf9doVvCad
	 KMKwv7rDmcKn14zKDx2jyeIwKpGKOqnuZoY6TLecekcTDgvCtS70W35SHdhHAFfSq8Hu6
	 Ivmcyf0576tldR/qbH9UbRRy1juih7nc8CGumsgWM4cnzniPCu0hj1qDH/rM5GDvghwyj
	 pl0Uo1Q7wAv4m5183dLsmUdM+2dHsAN2NS3vbi5nl57NOgadyNBiuTqePrcCfj3EmWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793316467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lnVNxxbt+qbN8QJ5DPYiLdQeqrQxagvjKYBjiz3eH8c=;
	b=jP9U68+fU5TMDfNwy3f+wKqDPkq/6uEYkJx2wa47/CB49FmxsG3/zaW9nYmAdscOfTDZ
	 pp5tISZ+nLI2Oyyym2JvtRnhVzMn1Tgvdk+/ODVDIIaC5I/Qsg2QYDUIX3aICdP1NuCKL
	 JOfPfLIL89YpUIEIA9F/ApgazUweyYaWma2DBUUB+uK9s5HCoHrzkYsHYuK/Kn208tmX6
	 MDG5d/5ki3Nkx8+I7Y0m6OoC6pMoe9SSne6BZFIo9Srn359cK6RWKeBeyJztPpS4ZOmGD
	 zkvYLDlMnStdr+270rN1wy0cQstUelHEgoy0WXKRbDZH7yxGY/2jaJOncfmqb6qTe2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FGRdL4OI;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7349606A325
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 23:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7349606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FGRdL4OI
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4550d8ab15so8425266b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 16:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793316465; x=1793921265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lnVNxxbt+qbN8QJ5DPYiLdQeqrQxagvjKYBjiz3eH8c=;
        b=FGRdL4OIjnSQ+c/iJDv3UA0D+9fMoI/TtzplLe03HwUSXtqdQTJKmGKmfpt3P9Vj67
         6/knuiU7M5o5Ce1ojCU/erjTIXvRlkP9f+Q0hdbF54B5UunbusIpXvazmuKLqvdoVuQc
         kMqHics007u+qZng7jNC4KVsUqFscEz6RADh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316465; x=1793921265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnVNxxbt+qbN8QJ5DPYiLdQeqrQxagvjKYBjiz3eH8c=;
        b=LUBFjCSH1Fn8H+mM/H3PNqFHNsM2tAOUDzN3/7ToqrUyOoZuzcTjs97LyDTH0avLfO
         A3DqH59MGQroa9uXI8JPAgSZ8XsmbaLfW7/JsFvwJ5Gtvl+yqD2uq9cZ6+wnkxk11klN
         aVrtkdBlv973VnDVlx+aI3MLwANRx6+m6xW3edsegd0n3Nv0s2T2jM4xiJWbMdLLUHVk
         Z9V3K1ohBSsQCS2pAWxOpEysDXp6b3E06qKq//aSjX+dY/TaWv5dbsZd4GqZsr92uoID
         VvNXIUZQ7mC6VxEz/5mLG2lo3L7o+GpxBcLsAIyjaEiTnPWfDfBz8nC5suVh3qMmtYTb
         n7cw==
X-Forwarded-Encrypted: i=1; AKwUvByUuNvsujXzSM9tqQVQam2BXHyQD5sR9EuAgOltmyT8OJKSJXJaku35swAAociCTp62aTAAGhuCdj7unldGr04+LA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLHdiFugwRZvKLjd9rwhHxOBDh7w0yuliEEGD23TxwfjbJC+75Y
	EmiZqZ7UJY8sMGH9pHC9R/5w6rv2at0mo4NzYib744kkB5MT30qdGiHRHLvQkjpNOgb73E4wkhc
	goD0BOnl7
X-Gm-Gg: AYBFou0XuRZ/hhqTN2Kgzzeb0PDKogcQjXVtlC5fn9vLFiQhUwJkR9mA4xGWW9VC/8v
	9D5zWb9eb2YM2jVqNgZS3Lqv25s3SsIwAjIKoPDdEhOqdnSJJdN5ZE16Qn7XLOvi+sbvTLMeXbq
	ODYKzPK/cBqSQvnzImK0+0YVTzZxav8idKXSL27mUFFDJ626s5Pi6h0Pbe02GFRYs4JZpT3sswF
	cqjhzxK1horf2CeVNv+P73mJAsVqkWSnl+5sWYkTQLWTmFf517w+exoBy21khOLDQGSiyToALef
	/GLd3iZp3F5Jp50pDrQdd0Y5XAHyYcpEycV7mQljGYqYtXAu2hdg/PCO6zlFX+IrBTXRUxJTQxs
	L44EIvzmxMU1bpAkxz6EgBbYtya1Wuq7T5jBp9GTJfBY9WFBlW9gl/V178fHR2fc+4KGFWljQGW
	JMZ2ad55MdRMzks/nw9JGc36mCLcN4ch2RNi7RTe1nsYWK8rdPZ0bBd5VVUO65pqKKAdv1u7viL
	/gYJNsWElvW49SeKiXZcct6Tn/LayPEZbHU24bkkhmhADUInxWaN8kpg/w8E+JCuhzSBenps/h5
	RijR3Kc+UzQZzYnO+29q6NUX39G0shSpofe/cvE7jBXGFfM2asJiYGPJyfVnFyf4wuDSIA==
X-Received: by 2002:a17:907:cb88:b0:c26:19e3:e98d with SMTP id a640c23a62f3a-c4ca7af17a5mr49852466b.45.1793316465206;
        Thu, 29 Oct 2026 16:27:45 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4caa43e03asm9537566b.84.2026.10.29.16.27.43
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 16:27:44 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso749905e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 16:27:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxciPycvA5a5qslQTl4Ih+hyToLA0YlLeGImPvaAK7lHeI/aPGVSjiDXPTRjwhqLHY8MXRnVHnc8SMle+NLD//ZgQ==@vger.kernel.org
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id
 5b1f17b1804b1-4ac150b28bamr10449115e9.4.1793316462561; Thu, 29 Oct 2026
 16:27:42 -0700 (PDT)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-3-3a45c3cf531d@a-marquet.fr>
 <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com> <auOyxKTuSNysAA3X@laptop-218>
In-Reply-To: <auOyxKTuSNysAA3X@laptop-218>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2026 16:27:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VV82NG1CAL9DtLeDYQdjC9Su6nYfLYbjzmhzEY9a0JSg@mail.gmail.com>
X-Gm-Features: AclHuK-RAnD-cE_PStAvE_4zQkeWnl1muDgR4l5_h3nIFbUe3wcXyeLuhes_lRY
Message-ID: <CAD=FV=VV82NG1CAL9DtLeDYQdjC9Su6nYfLYbjzmhzEY9a0JSg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel_edp: Add SEC LTL101DL02-002 panel
To: Alexandre Marquet <tb@a-marquet.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Lukas Timmermann <linux@timmermann.space>, Henrik Grimler <henrik@grimler.se>, 
	Hendrik Noack <hendrik-noack@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 29, 2026 at 1:55=E2=80=AFPM Alexandre Marquet <tb@a-marquet.fr>=
 wrote:
>
> > > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pane=
l/panel-edp.c
> > > index 94bc54c3833a..c92985363093 100644
> > > --- a/drivers/gpu/drm/panel/panel-edp.c
> > > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > @@ -2198,6 +2198,8 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> > >         EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d2=
00, "134WT1"),
> > >         EDP_PANEL_ENTRY('L', 'G', 'D', 0x07fe, &delay_200_500_e200_d2=
00, "LP116WHA-SPB1"),
> > >
> > > +       EDP_PANEL_ENTRY('S', 'E', 'C', 0x9c0f, &delay_200_500_e50, "L=
TL101DL02-002"),
> > > +
> >
> > It would also be good to note in the commit message where you got the
> > timings from. Datasheet? Downstream code? Guessing?
>
> Both downstream code and guessing, as I could not get my hand on a
> datasheet. I will add an explanation to the commit description.
>
> Basically, the downstream code waits: at least 500ms before toggling the =
LCD_EN
> GPIO for power on; and 200ms after. I matched the 200ms to the hpd_absent
> delay, since in panel-edp.c, hpd_absent is also the delay that happens
> right after enabling the LCD regulator (or toggling the enable GPIO, as
> appropriate). Similarly, the unprepare delay is called just before
> enabling the LCD regulator, through panel_edp_wait(), which matches the
> way the 500ms delay is used in the downstream code.
>
> For the enable delay, I went with the smallest value that would still
> work, but I admit that I did not try anything below 50ms.
>
> >
> > I had my AI agent take a look for itself. It found evidence suggesting
> > the enable delay should be 97ms, not 50ms. The other ones seem to be
> > OK.
>
> In the downstream code, 97ms is the delay used before setting the
> backlight on. My understanding is that this should be used elsewhere
> (e.g.: in the backlight node of the device's DTS).

I don't believe I've ever seen a delay in the backlight node of the
device's DTS, so that sounds wrong.

The .enable delay here is described as:

/**
 * @enable: Time for the panel to display a valid frame.
 *
 * The time (in milliseconds) that it takes for the panel to
 * display the first valid frame after starting to receive
 * video data.
 *
 * This is (T6-min + max(T7-max, T8-min)) on eDP timing diagrams or
 * the delay after link training finishes until we can turn the
 * backlight on and see valid data.
 */

That sounds like exactly what you're looking for, no?
