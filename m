From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 5/5] regulator: tps65090: Make FETs more reliable by
 adding retries
Date: Tue, 22 Apr 2014 16:07:53 +0100
Message-ID: <20140422150753.GC21613@lee--X1>
References: <1397689950-1568-1-git-send-email-dianders@chromium.org>
 <1397689950-1568-6-git-send-email-dianders@chromium.org>
 <20140418174353.GX12304@sirena.org.uk>
 <CAD=FV=VQckC34rZwF2RP3F+2T1CRVs0JwtgoqUeA1NVmB20=sA@mail.gmail.com>
 <20140422074709.GD17657@lee--X1>
 <20140422110236.GN12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:33186 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932845AbaDVPIN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 11:08:13 -0400
Received: by mail-wi0-f177.google.com with SMTP id cc10so3432543wib.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 08:08:12 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140422110236.GN12304@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Simon Glass <sjg@chromium.org>, Michael Spang <spang@chromium.org>, Sean Paul <seanpaul@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> > If there are cross-subsystem dependencies I prefer to use immutable
> > branches to eliminate any change of merge conflicts in -next or the
> > next merge window. I'm happy to either create on with Mark's Acks, =
or
> > receive a pull-request from Mark with mine applied.
>=20
> > Up to Mark.
>=20
> Well, Doug didn't send me the MFD patch so I can't do anything with i=
t
> anyway.

Ah!

Doug,
  what exactly are the dependencies within the set?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
