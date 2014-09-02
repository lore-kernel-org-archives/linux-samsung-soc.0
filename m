From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: syscon: Decouple syscon interface from syscon
 devices
Date: Tue, 2 Sep 2014 09:05:16 +0100
Message-ID: <20140902080516.GE17117@lee--X1>
References: <1408694991-21615-1-git-send-email-pankaj.dubey@samsung.com>
 <12348292.z1qJl96tVA@wuerfel>
 <20140901160426.GJ8796@lee--X1>
 <3343901.7HpqcTBEp1@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:40015 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778AbaIBIFX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Sep 2014 04:05:23 -0400
Received: by mail-ig0-f178.google.com with SMTP id hn18so6807542igb.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Sep 2014 01:05:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <3343901.7HpqcTBEp1@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-kernel@vger.kernel.org, joshi@samsung.com, linux-samsung-soc@vger.kernel.org, broonie@kernel.org, thomas.ab@samsung.com, vikas.sajjan@samsung.com, chow.kim@samsung.com

On Mon, 01 Sep 2014, Arnd Bergmann wrote:

> On Monday 01 September 2014 17:04:26 Lee Jones wrote:
> > On Mon, 01 Sep 2014, Arnd Bergmann wrote:
> > > Maybe I'm misreading the patch, but I don't see how it creates a
> > > migration path. What I want to end up with is infrastructure that
> > > lets anybody call syscon_regmap_lookup_by_pdevname or
> > > syscon_regmap_lookup_by_compatible (if they really need to)
> > > without needing the platform_driver for syscon. That should not
> > > require any form of compatibility layer because to the driver
> > > using it there is no API change.
> >=20
> > Somehow I think the likelyhood is that I am misreading the patch.
> >=20
> > I thought that before this patch drivers we had to register a sysco=
n
> > device to bind to this driver, which was fine for the first use-cas=
es
> > of syscon as it wasn't required too early during boot.  However, no=
w
> > there are use-cases where systems require access to syscon register=
s
> > eariler in boot we require a means to obtain access prior to device
> > probing.  I thought this patch not only provides that possibilty, b=
ut
> > also leaves in the ability to register direct from DT.
>=20
> Right, it does provide the ability to have syscon before devices
> are registered, I missed that part.
>=20
> > > In contrast, this patch introduces a new of_syscon_{un,}register(=
)
> > > interface that would get removed after the the above has
> > > been implemented, causing extra churn for any driver that also
> > > wants to provide a regmap-like interface.
> >=20
> > When will we ever not have to register syscon?
>=20
> The idea is that we implicitly register the syscon block when someone
> calls syscon_regmap_lookup_by_compatible or syscon_regmap_lookup_by_p=
handle
> and then return a reference to that new syscon. When another driver
> looks up the same device node, we just pass a reference to the existi=
ng
> syscon.

Doesn't sound too unreasonable.  So how about instead of exporting
these new of_syscon_{un,}register() calls, we make them static and
call them from syscon_regmap_lookup_by_{phandle,compatible}?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
