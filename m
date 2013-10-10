From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 3/5] drm/bridge: Add PTN3460 bridge driver
Date: Thu, 10 Oct 2013 13:18:05 +0900
Message-ID: <05c701cec56f$b79eea50$26dcbef0$%dae@samsung.com>
References: <1380670860-17621-1-git-send-email-seanpaul@chromium.org>
 <1380670860-17621-4-git-send-email-seanpaul@chromium.org>
 <CAAQKjZN_r-=-sj=Vb-o-KUS4ab5=cjCq1ni3VZeMeVc3NL=MMg@mail.gmail.com>
 <CAOw6vbLiJLLKn=gb1=j5TBeM0ijEK13+goG-=mw7MZTyNT1kpQ@mail.gmail.com>
 <CAAQKjZPwyKCpju4Ndd+MB_aN24-zA5xTHFsFsun2617h7YT6dw@mail.gmail.com>
 <CAOesGMgKastzdFHYQzyL8gxkBN=86wFZ4jbgP8BHxfkOuZvJxg@mail.gmail.com>
 <CAAQKjZMhovKLxNfnXnbF-6diM2zF1cWyi+xHGyL3v83vBh4p6g@mail.gmail.com>
 <20131009182905.GY21581@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40797 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752251Ab3JJESH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 00:18:07 -0400
In-reply-to: <20131009182905.GY21581@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Sean Paul' <seanpaul@chromium.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 'DRI mailing list' <dri-devel@lists.freedesktop.org>, linux-arm-kernel@lists.infradead.org



> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Thursday, October 10, 2013 3:29 AM
> To: Inki Dae
> Cc: Olof Johansson; Sean Paul; devicetree@vger.kernel.org; linux-samsung-
> soc@vger.kernel.org; linux-doc@vger.kernel.org; linux-
> kernel@vger.kernel.org; DRI mailing list; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH 3/5] drm/bridge: Add PTN3460 bridge driver
> 
> On Fri, Oct 04, 2013 at 11:05:48AM +0900, Inki Dae wrote:
> > 2013/10/4 Olof Johansson <olof@lixom.net>:
> 
> > > "If PD_N is LOW, then the device is in Deep power-down completely,
> > > even if supply rail is ON; for the device to be able to operate, the
> > > PD_N pin must be HIGH."
> 
> > I still think the pin could be replaced with a regulator. But
> > lvds-bridge node has "powerdown-gpio" property - it say this board
> > will use gpio pin - specific to board.  So it seems no problem.
> 
> No, don't model things that aren't regulators as regulators - it's just
> confusing from a usability standpoint and causes breakage when the pins
> don't behave like regulators.

It seems that there was your missing point. That _is not_ what I mentioned.
I mean that other boards can use a regulator instead of gpio pin.
