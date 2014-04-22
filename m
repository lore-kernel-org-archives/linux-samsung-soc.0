From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 5/5] regulator: tps65090: Make FETs more reliable by
 adding retries
Date: Tue, 22 Apr 2014 08:47:09 +0100
Message-ID: <20140422074709.GD17657@lee--X1>
References: <1397689950-1568-1-git-send-email-dianders@chromium.org>
 <1397689950-1568-6-git-send-email-dianders@chromium.org>
 <20140418174353.GX12304@sirena.org.uk>
 <CAD=FV=VQckC34rZwF2RP3F+2T1CRVs0JwtgoqUeA1NVmB20=sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:41022 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751562AbaDVHrP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 03:47:15 -0400
Received: by mail-wg0-f44.google.com with SMTP id m15so3483172wgh.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 00:47:14 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAD=FV=VQckC34rZwF2RP3F+2T1CRVs0JwtgoqUeA1NVmB20=sA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Simon Glass <sjg@chromium.org>, Michael Spang <spang@chromium.org>, Sean Paul <seanpaul@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> Mark,
>=20
> On Fri, Apr 18, 2014 at 10:43 AM, Mark Brown <broonie@kernel.org> wro=
te:
> > On Wed, Apr 16, 2014 at 04:12:29PM -0700, Doug Anderson wrote:
> >> An issue was discovered with tps65090 where sometimes the FETs
> >> wouldn't actually turn on when requested (they would report
> >> overcurrent).  The most problematic FET was the one used for the L=
CD
> >
> > This is basically fine but you said it depends on one of the previo=
us
> > patches which you didn't CC me on so I've no idea what's going on
> > there?
>=20
> Sorry about that.  :(
>=20
> Lee has Acked the caching patch.  Lee: what's the best way for you an=
d
> Mark to coordinate there?  Should he apply the caching patch with you=
r
> Ack?

If there are cross-subsystem dependencies I prefer to use immutable
branches to eliminate any change of merge conflicts in -next or the
next merge window. I'm happy to either create on with Mark's Acks, or
receive a pull-request from Mark with mine applied.

Up to Mark.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
