From: Doug Anderson <dianders@chromium.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Wed, 10 Sep 2014 12:51:04 -0700
Message-ID: <CAD=FV=WStUY=8jwwbPx_3J-=owv+YPd6QaS90DGL9r+bpAmJGw@mail.gmail.com>
References: <20140908112112.GK26030@arm.com>
	<CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
	<CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
	<CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
	<CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
	<20140910143144.GF7960@sirena.org.uk>
	<CACxGe6u=QkGTKGfaE_jJ5VFMhdVKQNggp3qVBUgNP7rDbZss_A@mail.gmail.com>
	<20140910153919.GH7960@sirena.org.uk>
	<CACxGe6uBcTPMh4p=oi7m_TVpjUrkgbQvxbStAn27HXEJxYe5fw@mail.gmail.com>
	<CAD=FV=W0qQZF58AvF8kZW+z4CsfnruQZLw_TA-eGy3fUruLbcg@mail.gmail.com>
	<20140910194522.GM7960@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f181.google.com ([209.85.220.181]:35324 "EHLO
	mail-vc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753272AbaIJTvF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 15:51:05 -0400
Received: by mail-vc0-f181.google.com with SMTP id ij19so5376019vcb.40
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Sep 2014 12:51:04 -0700 (PDT)
In-Reply-To: <20140910194522.GM7960@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Mark,

On Wed, Sep 10, 2014 at 12:45 PM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Sep 10, 2014 at 09:45:21AM -0700, Doug Anderson wrote:
>
>> Right now I know that clock disabling is supposed to be inhibited
>> during the early boot process.  I think regulators too?
>
> No, for regulators we'll quite happily disable anything a consumer asks
> us to at any point but we'll only do a sweep for regulators that were
> enabled on startup then not subsequently referenced and turn them off in
> late_initcall.

Ah, that sounds exactly like the clock framework then.  I think I just
didn't explain the clock framework properly.

-Doug
