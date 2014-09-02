From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: syscon: Decouple syscon interface from syscon
 devices
Date: Tue, 2 Sep 2014 09:34:00 +0100
Message-ID: <20140902083400.GF17117@lee--X1>
References: <1408694991-21615-1-git-send-email-pankaj.dubey@samsung.com>
 <3343901.7HpqcTBEp1@wuerfel>
 <20140902080516.GE17117@lee--X1>
 <3109076.4UMHArqVbl@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:41539 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778AbaIBIeH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Sep 2014 04:34:07 -0400
Received: by mail-ie0-f179.google.com with SMTP id tr6so7303586ieb.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Sep 2014 01:34:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <3109076.4UMHArqVbl@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-kernel@vger.kernel.org, joshi@samsung.com, vikas.sajjan@samsung.com, linux-samsung-soc@vger.kernel.org, broonie@kernel.org, thomas.ab@samsung.com, chow.kim@samsung.com

On Tue, 02 Sep 2014, Arnd Bergmann wrote:

> On Tuesday 02 September 2014 09:05:16 Lee Jones wrote:
> > On Mon, 01 Sep 2014, Arnd Bergmann wrote:
> >=20
> > > On Monday 01 September 2014 17:04:26 Lee Jones wrote:
> > > > On Mon, 01 Sep 2014, Arnd Bergmann wrote:
> > > > > Maybe I'm misreading the patch, but I don't see how it create=
s a
> > > > > migration path. What I want to end up with is infrastructure =
that
> > > > > lets anybody call syscon_regmap_lookup_by_pdevname or
> > > > > syscon_regmap_lookup_by_compatible (if they really need to)
> > > > > without needing the platform_driver for syscon. That should n=
ot
> > > > > require any form of compatibility layer because to the driver
> > > > > using it there is no API change.
> > > >=20
> > > > Somehow I think the likelyhood is that I am misreading the patc=
h.
> > > >=20
> > > > I thought that before this patch drivers we had to register a s=
yscon
> > > > device to bind to this driver, which was fine for the first use=
-cases
> > > > of syscon as it wasn't required too early during boot.  However=
, now
> > > > there are use-cases where systems require access to syscon regi=
sters
> > > > eariler in boot we require a means to obtain access prior to de=
vice
> > > > probing.  I thought this patch not only provides that possibilt=
y, but
> > > > also leaves in the ability to register direct from DT.
> > >=20
> > > Right, it does provide the ability to have syscon before devices
> > > are registered, I missed that part.
> > >=20
> > > > > In contrast, this patch introduces a new of_syscon_{un,}regis=
ter()
> > > > > interface that would get removed after the the above has
> > > > > been implemented, causing extra churn for any driver that als=
o
> > > > > wants to provide a regmap-like interface.
> > > >=20
> > > > When will we ever not have to register syscon?
> > >=20
> > > The idea is that we implicitly register the syscon block when som=
eone
> > > calls syscon_regmap_lookup_by_compatible or syscon_regmap_lookup_=
by_phandle
> > > and then return a reference to that new syscon. When another driv=
er
> > > looks up the same device node, we just pass a reference to the ex=
isting
> > > syscon.
> >=20
> > Doesn't sound too unreasonable.  So how about instead of exporting
> > these new of_syscon_{un,}register() calls, we make them static and
> > call them from syscon_regmap_lookup_by_{phandle,compatible}?
>=20
> Yes, that would be a good start. We should think about whether we wan=
t
> to remove the existing DT probing at the same time, since it becomes
> unused, and we might want to move the code to drivers/base/regmap_*.c
> at some point

I'd support that move - and can even draft the patch if required.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
