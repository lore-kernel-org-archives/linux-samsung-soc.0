From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 0/4] mfd: sec: Add support for S2MPS14
Date: Fri, 28 Feb 2014 11:11:53 +0000
Message-ID: <20140228111153.GC31720@lee--X1>
References: <1393584104-18912-1-git-send-email-k.kozlowski@samsung.com>
 <20140228104927.GB31720@lee--X1>
 <1393585526.31997.1.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:62102 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbaB1LMA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Feb 2014 06:12:00 -0500
Received: by mail-we0-f176.google.com with SMTP id x48so415551wes.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2014 03:11:59 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1393585526.31997.1.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>

> > > Few days ago I sent patches adding support for S2MPS14 device to =
the
> > > sec-core/s2mps11 drivers. These patches were rather large as they=
 covered
> > > multiple subsystems so I decided to split everything into smaller=
, separate
> > > patches.
> > >=20
> > > The original patchset (version 3) can be found here:
> > > http://thread.gmane.org/gmane.linux.kernel.samsung-soc/27194/focu=
s=3D1649217
> > >=20
> > > This patchset is a small subset of the patchset related to the MF=
D core
> > > driver. It adds support for the S2MPS14 device only to the MFD co=
re driver.
> > > I already obtained acks from Lee Jones during previous reviews.
> > >=20
> > > The patchset is based on current Linus' tree *with* patch:
> > > mfd: sec-core: Fix possible NULL pointer dereference when i2c_new=
_dummy error
> > > (which is already in Lee Jones' MFD tree)
> >=20
> > Can all of these patches be applied as they are?
> >=20
> > Is anything going to break as a result?
>=20
> Yes, they can be applied as they are. That was the reason behind
> splitting everything. Nothing should break, as far as I reviewed this
> and tested.

Very well, all applied, thanks.

> > > Krzysztof Kozlowski (4):
> > >   mfd: sec: Add maximum RTC register for regmap config
> > >   mfd: sec: Select different RTC regmaps for devices
> > >   mfd: sec: Use consistent S2MPS11 RTC alarm interrupt indexes
> > >   mfd: sec: Add support for S2MPS14
> > >=20
> > >  drivers/mfd/sec-core.c              |   57 ++++++++++++-
> > >  drivers/mfd/sec-irq.c               |   97 ++++++++++++++++++++-=
-
> > >  include/linux/mfd/samsung/core.h    |    1 +
> > >  include/linux/mfd/samsung/irq.h     |   31 ++++++-
> > >  include/linux/mfd/samsung/rtc.h     |   57 +++++++++++--
> > >  include/linux/mfd/samsung/s2mps14.h |  152 +++++++++++++++++++++=
++++++++++++++
> > >  6 files changed, 378 insertions(+), 17 deletions(-)
> > >  create mode 100644 include/linux/mfd/samsung/s2mps14.h
> > >=20
> >=20
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
