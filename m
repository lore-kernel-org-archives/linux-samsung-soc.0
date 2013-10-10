From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 3/5] drm/bridge: Add PTN3460 bridge driver
Date: Thu, 10 Oct 2013 20:40:38 +0900
Message-ID: <063a01cec5ad$8afd1920$a0f74b60$%dae@samsung.com>
References: <1380670860-17621-1-git-send-email-seanpaul@chromium.org>
 <1380670860-17621-4-git-send-email-seanpaul@chromium.org>
 <CAAQKjZN_r-=-sj=Vb-o-KUS4ab5=cjCq1ni3VZeMeVc3NL=MMg@mail.gmail.com>
 <CAOw6vbLiJLLKn=gb1=j5TBeM0ijEK13+goG-=mw7MZTyNT1kpQ@mail.gmail.com>
 <CAAQKjZPwyKCpju4Ndd+MB_aN24-zA5xTHFsFsun2617h7YT6dw@mail.gmail.com>
 <CAOesGMgKastzdFHYQzyL8gxkBN=86wFZ4jbgP8BHxfkOuZvJxg@mail.gmail.com>
 <CAAQKjZMhovKLxNfnXnbF-6diM2zF1cWyi+xHGyL3v83vBh4p6g@mail.gmail.com>
 <20131009182905.GY21581@sirena.org.uk>
 <05c701cec56f$b79eea50$26dcbef0$%dae@samsung.com>
 <20131010093708.GC21581@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <20131010093708.GC21581@sirena.org.uk>
Content-language: ko
Sender: linux-doc-owner@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Sean Paul' <seanpaul@chromium.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 'DRI mailing list' <dri-devel@lists.freedesktop.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Thursday, October 10, 2013 6:37 PM
> To: Inki Dae
> Cc: 'Olof Johansson'; 'Sean Paul'; devicetree@vger.kernel.org; linux-
> samsung-soc@vger.kernel.org; linux-doc@vger.kernel.org; linux-
> kernel@vger.kernel.org; 'DRI mailing list'; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH 3/5] drm/bridge: Add PTN3460 bridge driver
> 
> On Thu, Oct 10, 2013 at 01:18:05PM +0900, Inki Dae wrote:
> 
> > > > I still think the pin could be replaced with a regulator. But
> > > > lvds-bridge node has "powerdown-gpio" property - it say this board
> > > > will use gpio pin - specific to board.  So it seems no problem.
> 
> > > No, don't model things that aren't regulators as regulators - it's
> > > just confusing from a usability standpoint and causes breakage when
> > > the pins don't behave like regulators.
> 
> > It seems that there was your missing point. That _is not_ what I
> mentioned.
> > I mean that other boards can use a regulator instead of gpio pin.
> 
> What I'm saying is no boards should use a regulator to control that GPIO
> pin, obviously if they're controlling the actual regulators that's fine

That is what I mentioned. Some boards _could control_ the actual regulator
for lvds-bridge, and that would be depended on how HW engineer designs the
board. 

> but the reset signal should not be controlled via the regulator API (there
> are some unfortunate cases where people have done that already but let's
> not have any more).

