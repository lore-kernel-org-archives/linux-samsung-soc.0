Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205743;
	b=25F7jVeEhy23qZO4YWUqzmWc/dHooO0zyFy7WM4Vv+npTrWK1YkezKkBibYXv+TDa5OB
	 e/pV1uRVokHIa85rvn8+bzFAuAz28Fds0kbXof3GQc9HlKic2jO5+WXYG94D+Gxt6pcLd
	 SzhT70WJ4xjXQLZmu7lXmMR0KzYzwefeAweWVY4263dFIAM7zzy5YyPOBjmSwvFYQp5Jf
	 /EZHgU9WGDkRcu+OPBeIkG1IX+PFD8nUVryiranmBiBUbRJsCOCjYw5z0shDt3pqCTR2V
	 3s4RKHB9nDQKIxcdzq0Epx5NRDoWI+MOtvOvrHk/FzzVWUbl7onuvGBeOkQ+XAG2BQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8aqqOJYr4Hmv6RgN8CmHQlYy+DEU2NSLFnHtd0L0hA4=;
	b=pX8qrk0UN/MyJZjOHanArl67VWwbwXeOLZv8EnZO0hbn2nt1sBkJqZeZWFHK3FUmBYwf
	 UMSvkbeoMJ5e0V/ozXF1FmuCakjB1IdJ8PPtUAXSJ0T99F6DJT3WaLKhC9AQMu6cWQX75
	 ZkB8+wBCpk3AtSbQocjGemTUSy/VF2JJ6IpvMqAhOoureinp9Xsr7pjZfdU+bTVd/2rLr
	 F8jD2/e3nps142hJqVUbh+pHxtt985hICGeXhnLhNjgTT2ErygkUilRWyB3i2BnNAl3RD
	 dYxQFaqs+qbRLfE9Z5MU1pvyBBBtSmXZqCEbd2hVyx66EXAJqZEKQGHPLiPY5HAyGZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LRDwvnIq;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02543606A31A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2026 16:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02543606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LRDwvnIq
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so9299491fa.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2026 09:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793205741; x=1793810541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aqqOJYr4Hmv6RgN8CmHQlYy+DEU2NSLFnHtd0L0hA4=;
        b=LRDwvnIq0VTFb2Zpp4Lku2W2oEcwATC0LaNjxIGn/q6EnZ3SjNbqX9bzHs/ONr6M38
         ycUpnAIWjD4Mvma1ZuiqkUGROBdHrhRadVT8qx0kZp7H+nDKAeZfbXtfxDtbGzXT1UT/
         WHdM69owBS7gh0yRmSRaoZPT6SbTtGDF6jluc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205741; x=1793810541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aqqOJYr4Hmv6RgN8CmHQlYy+DEU2NSLFnHtd0L0hA4=;
        b=PoG2p8C+lB2XgXM6HdIMy8nx3Cv0Ym9R2BF3AeItREpqAW4Mq2e/kM+yBebyL7SFq3
         yte2OwVSDgWUH/E810V7uiA72fdlG0ND978PPdr+nqG2bPWZv0J5ZNCUTI07i+soeyqQ
         W6s8UjpfqIfjGejjIt9LDB3/jd+f1LFzXesmtrYFj+aznFS/O7Yj2M+PVX99h16U4CyY
         bG+qL3rbFojvZHaiLxEqYytYiWtWGi6dq+0f2cekBiSpvKxz1v6uXwsN0T/HKm1oHo0J
         tlAFpBoRbUUVY2rV6vosm0rZp4952jy+jz3k5suEejbVxLhy093dqc9LOOpUoaVracna
         cNkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNWSvyM3tcFqQzRYdWTl6JD3+vrwyWrxnVpVzFFgTGv+Ud47mNISPUqr+WdBLmQfbtmoqZJKsC98qMMWcFSw+yXQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJgBIbbC4IpXBTww0ibBJZUc301AhNCsHKshk7d9YteEZto4cDB
	2HYZxTG3n8JE1tYltylrk6a8HQ4NQQ/7QlDjM3p+GlDz7f6VMwcZWBNEaQNfFLKM4AfCXR6xHsK
	/YulpjV7U
X-Gm-Gg: AYBFou3jHUyyG0W8x0AWpW6wbXKCW28tCyoEyoqlcSWD4JTIbI4T6yGwO5WVVgl+obP
	NVIRkzgzr1EEauIrLhH8OVOe0CObGtT2vqnUIfbLgv18AoNW/I8qFzrUgaTTjCQkn3/yrsPq5jq
	Tjukd/uh7/0aRwKC0D3giy/F3n4GTqO9P4mDLK4QjjR9iGEpzBTjpXv4b3qSHYkDx3VJsOFbIGp
	OW2OaH/ZAU4rxqT2youlbuhCCKNHuunsMZ8ih2OTIukmSHTVUPhycVUXLOeZbKa8Q3yIKWMKSrJ
	0oCENF2NtfhSG0RlR26OhwU0b6BWSoIcIKwF0uXcX2V9EdxBLvo9HDMv0Kz/mw/GvQskjnc5/j/
	LCVH5wlBj8muIO8nNEU+4HYm16BoGhDvqfhAQX+ERYLOUxlmvcgxBCuxlJdk7iA+uvi9303AT3O
	BWPCgxNHtnDgj8BVojTB8XAme4ce5DkjmE74X/s5fhu2dpnqHNvrHHkN9LPVR8IxVIR/zid7B5j
	hGzzhctF3H7S41tXLoYp4R+4djUhk4Rx/HT/JVPSjJovomlu6zEBLimo1UuWRZ3PexuGmveV282
	4HCJQ6BXbidC+RYMgXhyKfcXXWXFscCzAj+xOV6gOMDyjAF2g9htnH48bRvwy9fcpJWC
X-Received: by 2002:a05:651c:3463:b0:3ac:4b79:5726 with SMTP id 38308e7fff4ca-3ac9cf7f5dcmr7167321fa.17.1793205741008;
        Wed, 28 Oct 2026 09:42:21 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e63sm28679151fa.10.2026.10.28.09.42.20
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 09:42:20 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1450546e87.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2026 09:42:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpUfgJGXoBl5vMCCrjDefxC6+2jTOca5t6kAUrkDD/Pca4mcX8eCzdkuvHxWh/Hb16OgBsc1OfW3HilWPd1JBKCQ==@vger.kernel.org
X-Received: by 2002:a5d:5f07:0:b0:48b:9d2:1a6a with SMTP id
 ffacd0b85a97d-48e5d45a3c2mr6625980f8f.1.1793205267445; Wed, 28 Oct 2026
 09:34:27 -0700 (PDT)
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
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-3-3a45c3cf531d@a-marquet.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 09:34:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
X-Gm-Features: AclHuK_LwyJo9CN0zxlkO30oKOFraZ6PCLD3VchvtC_WbqyDogSG-WeDzg__Frs
Message-ID: <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel_edp: Add SEC LTL101DL02-002 panel
To: tb@a-marquet.fr
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

On Tue, Oct 27, 2026 at 5:01=E2=80=AFAM Alexandre Marquet via B4 Relay
<devnull+tb.a-marquet.fr@kernel.org> wrote:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> Add an entry for the eDP SEC LTL101DL02-002 panel used in
> google-manta.
>
> Raw EDID dump:
>
> 00 ff ff ff ff ff ff 00 4c a3 0f 9c 00 00 00 00
> 05 0e 01 03 80 21 19 78 0a 87 fe 98 57 51 8c 27
> 21 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 14 69 00 a0 a0 40 2e 60 30 20
> 36 00 1e d6 10 00 00 19 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9e
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)

nit: subject doesn't quite fit the pattern of recent commits (_ vs -).


> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 94bc54c3833a..c92985363093 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2198,6 +2198,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, =
"134WT1"),
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x07fe, &delay_200_500_e200_d200, =
"LP116WHA-SPB1"),
>
> +       EDP_PANEL_ENTRY('S', 'E', 'C', 0x9c0f, &delay_200_500_e50, "LTL10=
1DL02-002"),
> +

It would also be good to note in the commit message where you got the
timings from. Datasheet? Downstream code? Guessing?

I had my AI agent take a look for itself. It found evidence suggesting
the enable delay should be 97ms, not 50ms. The other ones seem to be
OK.

-Doug
