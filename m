Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307347;
	b=LW/OSikPlh9NjniDGfdVi4VGUnVkZyXoDiZFxjRW0tD4ZorceHGWfqxAWRBXFMVeIVlZ
	 VKWWo+DnAT0Um3FaYLc0In6IKBQzlBGnAqEmCcS2cofOeoEhZf0+9WFIdJlK+xJgzM3qT
	 g6SHXexuErC3jV9gonEOhZCANX3eAGysOtvrbb5jZ2rxbTCalYM4E4gvvCzKzw0KZyvFf
	 +D/5gkdkRvV+0SOQMwk5l7Ig0pPwgyVGlG0IaWa/20Tt/z34JDVtKPQc5oQikDr1T/n2B
	 JUTtuX5bmSf6WihzasJ7Ba6DnXdb+90RPiK4O+KIqC6iGmgyAL21Sx2l+PV0Iv47FbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307347;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-GND-Sasl:X-GND-State:
	 X-GND-Score:X-GND-Cause;
	bh=BCeY9APsxfmvH+XIUoqxjY0kS3crPoTx7BAYNg4i0WY=;
	b=Y7gfIJHJOxmeIulEWQgF3y2q+47TZ/dDp/RJWRl9SVGjLXcA00Y5Bsug6tYiPAePtpZk
	 q+P1QSL8wIKnzOcany4TKb/Hi1Bznzyj+v5r0p9Tzh5KpXdZQviVRnZ4HAmxr8y6Mr6LO
	 pdUCWHAEH60uNUQ8HVazyOMZdlDijGqsaHRVGJlFkV24ZopTDYHDzFkrTNZIzSu05eZWl
	 X4dfsjQtasBVZkzm8eaUMp7aB44PYT8d2TC5j1OHiFH8Wue4iMS7bvOLXpYbxlS0QIr3g
	 IW28kWGmLB1e6a78FT9Cccs5av/iKPtbr0jTivTz6cGAsbZy+CZaId6iGtkJS7xY0Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=a-marquet.fr;
	spf=pass smtp.mailfrom=a-marquet.fr;
	dkim=pass header.d=a-marquet.fr header.i=@a-marquet.fr header.a=rsa-sha256 header.s=gm1 header.b="fHNPpS6/";
	arc=none smtp.remote-ip=217.70.183.197
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBDD606A31C;
	Thu, 29 Oct 2026 20:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CBDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a-marquet.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a-marquet.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=a-marquet.fr header.i=@a-marquet.fr header.a=rsa-sha256 header.s=gm1 header.b=fHNPpS6/
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7616D3E80D;
	Thu, 29 Oct 2026 20:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a-marquet.fr;
	s=gm1; t=1793307337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BCeY9APsxfmvH+XIUoqxjY0kS3crPoTx7BAYNg4i0WY=;
	b=fHNPpS6/zRSIqBqW0irfQrba/Am6sjIe0bCyOZ9wSRemRCscDo88TA3tfrFBbE3GiwLt7Y
	3N2SPdppcp308rVqUai92uPlqYhZ2+K7xx2g3fU2BJBc0gu678ikHavLC1XVPHyuhgefGe
	bO4hpOZI0hRgDI8/Y3PMkNZbc9EJre/iDTusQ4JjL5D0Qp5MoX8xAEGKoN57kHc73WreZF
	yOKACCtkSVpBV93+2aE7HCiA9B8Z6xFbDEDmKBkyUDlByz+4RlGKVCu3ew6Lw0l3QWDkAb
	vsPhIrkW4Z/XKdY0nYZfv4nqknWlG9Uj0F0HoWNoRRQb7/3emhfS8AzB7w5VMg==
Date: Thu, 29 Oct 2026 21:55:32 +0100
From: Alexandre Marquet <tb@a-marquet.fr>
To: Doug Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Lukas Timmermann <linux@timmermann.space>,
	Henrik Grimler <henrik@grimler.se>,
	Hendrik Noack <hendrik-noack@gmx.de>
Subject: Re: [PATCH 3/3] drm/panel_edp: Add SEC LTL101DL02-002 panel
Message-ID: <auOyxKTuSNysAA3X@laptop-218>
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-3-3a45c3cf531d@a-marquet.fr>
 <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
X-GND-Sasl: tb@a-marquet.fr
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTGxku9aeGpo+7YMc4F4PvFpGsua428LZyVCxiu3ZWgW8HsKPegYmks3ajh0iP00ZRx4hi8T0K5ZaS2j9uikJ2QuMOT4yOHAarDYQ/vvPPSXaxQ9YiezR0t+7oZ4eh+B2zE3r6eUVUGyZ4uHSUMJMLGkL5aA4rnWYnOn1rXAzjdxtLJYHY2/1ABQODzEWZ8Hsc7aJohKnNtreJrq+OmZqVnNI8IRujZJfkJEWTPHT+wHz4/6JwmKHothvuxNPxfv+OzFjhdGR/x3mRLNO8Us1THXppONAs77llR98XJUNrwxrIX1oHy352yibAosFmCGLOfypPxGom41RVBtm+fdli5ujOvJQavDP2e89f6vc94LNpZV9nkW3fVkbnwbgEuHhI/I/HU2RCRXG9Tv398eMl8ZjQFZwyZjflbVReLRZktwQMzPf5y7ZVduqvKlncYQl+nTgz8yq3LfzYyl9/mwIXjhlTSJaK/7j3/iF1GiEFXV5di1y4SOk54XmIQS5AQQnYu1pDadCFAw820n9VCVyOsPIKS8p+rEdIJKtBNAd0twExBKmSKGj2sR9yv/YyvIllvM4E3dZcEP6Gavj7CtndjrBC2LM5kvfWOYkw5l09gJrhEnRg0K1g73dxTDZpW/An+kRuYkG3K/LN9NJDjxtOIjVmlmLbaQsmwOPwGeEBb35w

Hi,

Thank you for your feedback.

Le Wed, Oct 28, 2026 at 09:34:15AM -0700, Doug Anderson a écrit :
> Hi,
> 
> On Tue, Oct 27, 2026 at 5:01 AM Alexandre Marquet via B4 Relay
> <devnull+tb.a-marquet.fr@kernel.org> wrote:
> >
> > From: Alexandre Marquet <tb@a-marquet.fr>
> >
> > Add an entry for the eDP SEC LTL101DL02-002 panel used in
> > google-manta.
> >
> > Raw EDID dump:
> >
> > 00 ff ff ff ff ff ff 00 4c a3 0f 9c 00 00 00 00
> > 05 0e 01 03 80 21 19 78 0a 87 fe 98 57 51 8c 27
> > 21 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 14 69 00 a0 a0 40 2e 60 30 20
> > 36 00 1e d6 10 00 00 19 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9e
> >
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> nit: subject doesn't quite fit the pattern of recent commits (_ vs -).

Apologies for not noticing. I will fix that in v2.

> 
> 
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 94bc54c3833a..c92985363093 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -2198,6 +2198,8 @@ static const struct edp_panel_entry edp_panels[] = {
> >         EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, "134WT1"),
> >         EDP_PANEL_ENTRY('L', 'G', 'D', 0x07fe, &delay_200_500_e200_d200, "LP116WHA-SPB1"),
> >
> > +       EDP_PANEL_ENTRY('S', 'E', 'C', 0x9c0f, &delay_200_500_e50, "LTL101DL02-002"),
> > +
> 
> It would also be good to note in the commit message where you got the
> timings from. Datasheet? Downstream code? Guessing?

Both downstream code and guessing, as I could not get my hand on a
datasheet. I will add an explanation to the commit description.

Basically, the downstream code waits: at least 500ms before toggling the LCD_EN
GPIO for power on; and 200ms after. I matched the 200ms to the hpd_absent
delay, since in panel-edp.c, hpd_absent is also the delay that happens
right after enabling the LCD regulator (or toggling the enable GPIO, as
appropriate). Similarly, the unprepare delay is called just before
enabling the LCD regulator, through panel_edp_wait(), which matches the
way the 500ms delay is used in the downstream code.

For the enable delay, I went with the smallest value that would still
work, but I admit that I did not try anything below 50ms.

> 
> I had my AI agent take a look for itself. It found evidence suggesting
> the enable delay should be 97ms, not 50ms. The other ones seem to be
> OK.

In the downstream code, 97ms is the delay used before setting the
backlight on. My understanding is that this should be used elsewhere
(e.g.: in the backlight node of the device's DTS).

> 
> -Doug
Best regards,
Alex.
