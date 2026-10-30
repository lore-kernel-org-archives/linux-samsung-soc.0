Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793403440;
	b=k+dxbNtVTn0z2ew18bppVXovDws+HVCo+5GwVPxtO20aIsz4/ZgA3iymM2CFYoOAi6Z8
	 nNZcrDuGcnptUnl6rzsdyh37kh3ebFhxn1ux5sz1Iymg8xj1ngWYkWnM7nXyA5OUjRcAC
	 +8LFcPjcRvbNXkXZa/qVEHXTjpZgsDJzSHU0vT0tp7jg6SlyYGB0MFXo3e+iRuE1oVCwD
	 GgPLr7ohxYi2SiWcFABUVg07cLM19pVEOhBIQibUSD8vbJ3kp/gRVGlnRz08exWgSbNra
	 /g3uYCbJIBc0j6Te6d4PE+5lW+TwT0jURzBLqpkhEOC241l3qFy/wZ3sWXo06G9a+hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793403440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F6RKSKoXJzKlNaMzDigqrXvD7n1HyX5zOJi75UDgxuY=;
	b=1zTk3Jh8RWZja2ubxz4uhU/G9txo/llg0Rrrv42UcqHwaiIj9BsH/c37KNYsvCOVhPDB
	 3+NqGMiUgl1D9lMXszDNHcKe1u7Sx/e14XmeeZSP/RHm1YNeMvPfPkgtzqUmxFQd74xUQ
	 OPAVppyMeUkpC4HDTAYtVTKmkJFJsGNbFqKrIYaiC0Dd9aprJXzgK6aMoZDREmof3Wz8P
	 fO1kcCX+Ru5NHOzjTKd5+2uK+rbh5UqHXAGleVAMNNqNMXX5JQ4ES9rhiADxfnZm1K1FS
	 iElmNG4OVXADAJb9/3aSRQTLVzo4QJ3mQaXmLidthtFpNgsIdUmD+fBasumyw8oLOgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QgA5zSX8;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A44606A31E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 23:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A44606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QgA5zSX8
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c423b145922so162914566b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 16:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793403438; x=1794008238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6RKSKoXJzKlNaMzDigqrXvD7n1HyX5zOJi75UDgxuY=;
        b=QgA5zSX8KoxGELX6y2GT8P9XroD1Fo3D+AqxgxDLdF6hknGtv6wVoUgyTjz/51vxsq
         5Ew1slA58N6xV4w4GHwAwmS30g2xjiPObMKIRxRFzhe2SQ3gkkRJZx+iNLuJItYtz+jc
         zdwI08gXP2ZOWpdGjpL6+CFs7jG0ZM/eJZ8W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793403438; x=1794008238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6RKSKoXJzKlNaMzDigqrXvD7n1HyX5zOJi75UDgxuY=;
        b=gIzmOg2hw1AkFOMH6kqEfd0woxNuhS+4tImbHb475NKL5wtHg7qRainSlUY8kLWCK4
         zpJ//kme6yFxMWlwBMIuuQTXcKnblvK1uNIkS0xI79wzj+0LLtx/umKA5ASlnIfINZ2H
         Pe+FToiIzVZlTC85wWWaDJN0jmyL/zvCuz3pa/mKmYgpJ7TVzgc+irUXjkvNi0AqB6zZ
         SU9WvlqiEl5Obo/fdPSyCLpEUTt/FWJiH2GfYQjhcHnol29eOUdLVbOczMyypjAZEekU
         wwGYLKSrqjukbXpDTZDWpra6mnWrcEHq2W2BmuT7C41ixM/imIrRV3i+CgYOpJWe6RAf
         smLg==
X-Forwarded-Encrypted: i=1; AKwUvBz4DaAkkeIeGtdnk5eoMEkGk9wi6LnuCpAkMxzzxe6GmAWMAYMKMOZxaPZt/coxgLT4+nMOfAVQk4nTBdB7n7yc6w==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2y//xSa9Uv/PxJ8uvkinyUDzjw+v+4XVJEfvHBqf3i7GlGXG4
	AkbgVimNCIMBtd2o8qaTZsdCbhLqb4dJMx122WU9PuTC7w6PUKq2t8xwV9nPIcTL7Y3EI0qEvIp
	kctnXtw==
X-Gm-Gg: AYBFou3U9DHaFoyRO+orQhJqNQ3Pr1QV2CkVZJ1At47uU5zyC3H0nxaZKToYQcYDb25
	WgKcE3TUA9INhaYXM3L6B5Fs5DqgjdjaIbfgdXjm2v77owCT5NEa5ExvewmzHpbvLEFZXq9wfYl
	oRmZTNkPBdCdxc8eN9I1acNphSPu8ZMHqZk/4R/GTOv5xhq9/1oom1gzpSdWHgzO1sz6B9pQSSS
	TX4SR4MnIfV2iwkz3Q3Laydh2NjKndQBw/blyYzlktvzDTOcFKAHif2+uGnr6HchWlFed2Luxoe
	qo/z/7NEBz8FEJBtIsaoai0/6KXzFyVdNQQJw0VzH8EGTBpARHsxHB60Y9BGCrfk4I+a/COlPDI
	4wtQYZpZMxMprk3nkAptfxfFALwxoYHJZzizXKRHxiUN2RdGD+pEd60sZn0Kia9KxHlEEi1sex4
	RkgVEig8BfA8fxLBDBvTgluhE9mZ6xuZIFBEOfrsaw0tdpjWHc47AZAyCHvExLsCzKjcMbMDeLC
	Vn7KzPCNFeSFXz2iBGS7Bzn+Uw8zgdTm2w0kaTfGnCu5XhHE2snf9TQMNZIiykvAGiW207jO9F7
	HOfu9AbRkc/V8JTq+SBY4y9jQmpinCqWuFLGDlg1KT2H8V7aYozG9MJUaMODvEJVIVvc
X-Received: by 2002:a17:907:7290:b0:c3f:7270:10ab with SMTP id a640c23a62f3a-c4ca7a54f7dmr358704666b.14.1793403438355;
        Fri, 30 Oct 2026 16:37:18 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc05sm116114366b.24.2026.10.30.16.37.17
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 16:37:18 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1201464f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 16:37:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy15DFXEds49PqyzhYHmbjyyT+rB4ORwNEqX6rn2O+RD3a9f6ATJUQzZ/pplYTfEweNTqz+dbhvFQDc1HAAOVSKtg==@vger.kernel.org
X-Received: by 2002:a05:6000:47d4:b0:48e:60bf:4177 with SMTP id
 ffacd0b85a97d-48e6e3024f2mr6586994f8f.9.1793403436187; Fri, 30 Oct 2026
 16:37:16 -0700 (PDT)
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
 <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
 <auOyxKTuSNysAA3X@laptop-218> <CAD=FV=VV82NG1CAL9DtLeDYQdjC9Su6nYfLYbjzmhzEY9a0JSg@mail.gmail.com>
 <auUTV87eElVyIeTw@laptop-218>
In-Reply-To: <auUTV87eElVyIeTw@laptop-218>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 16:37:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X24gZgixqSb4SoD2wYt93Z9tDO5dyaeg=jdH4wUwk81Q@mail.gmail.com>
X-Gm-Features: AclHuK-J1ggLxz07KiiLvF7KuKegFXEk98IgNkkyMHaorZ-92pfQb4x0ipGnZnQ
Message-ID: <CAD=FV=X24gZgixqSb4SoD2wYt93Z9tDO5dyaeg=jdH4wUwk81Q@mail.gmail.com>
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

On Fri, Oct 30, 2026 at 3:00=E2=80=AFPM Alexandre Marquet <tb@a-marquet.fr>=
 wrote:
>
> > /**
> >  * @enable: Time for the panel to display a valid frame.
> >  *
> >  * The time (in milliseconds) that it takes for the panel to
> >  * display the first valid frame after starting to receive
> >  * video data.
> >  *
> >  * This is (T6-min + max(T7-max, T8-min)) on eDP timing diagrams or
> >  * the delay after link training finishes until we can turn the
> >  * backlight on and see valid data.
> >  */
> >
> > That sounds like exactly what you're looking for, no?
>
> Indeed. Also having the 97ms value from the downstream code in .enable
> removes the guessing associated with the 50ms in my initial proposal. So
> I will implement this in v2.
>
> Any preference as to where I should put the new delay_200_500_e97
> panel_delay struct? I was thinking after delay_200_500_e80_d50, but
> I noticed that the delays are not strictly in alphabetical order.

Yeah, it's a bit of a mess. Probably they need to be fully sorted as
you said, and I probably should have been enforcing that all this
time. If you wanted to send a patch sorting them, I wouldn't object.
;-) Otherwise then after "delay_200_500_e80_d50" sounds fine.

-Doug
