From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mfd: syscon: Decouple syscon interface from syscon devices
Date: Mon, 01 Sep 2014 19:05:51 +0200
Message-ID: <3343901.7HpqcTBEp1@wuerfel>
References: <1408694991-21615-1-git-send-email-pankaj.dubey@samsung.com> <12348292.z1qJl96tVA@wuerfel> <20140901160426.GJ8796@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:57155 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754396AbaIARGP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Sep 2014 13:06:15 -0400
In-Reply-To: <20140901160426.GJ8796@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-kernel@vger.kernel.org, joshi@samsung.com, linux-samsung-soc@vger.kernel.org, broonie@kernel.org, thomas.ab@samsung.com, vikas.sajjan@samsung.com, chow.kim@samsung.com

On Monday 01 September 2014 17:04:26 Lee Jones wrote:
> On Mon, 01 Sep 2014, Arnd Bergmann wrote:
> > Maybe I'm misreading the patch, but I don't see how it creates a
> > migration path. What I want to end up with is infrastructure that
> > lets anybody call syscon_regmap_lookup_by_pdevname or
> > syscon_regmap_lookup_by_compatible (if they really need to)
> > without needing the platform_driver for syscon. That should not
> > require any form of compatibility layer because to the driver
> > using it there is no API change.
> 
> Somehow I think the likelyhood is that I am misreading the patch.
> 
> I thought that before this patch drivers we had to register a syscon
> device to bind to this driver, which was fine for the first use-cases
> of syscon as it wasn't required too early during boot.  However, now
> there are use-cases where systems require access to syscon registers
> eariler in boot we require a means to obtain access prior to device
> probing.  I thought this patch not only provides that possibilty, but
> also leaves in the ability to register direct from DT.

Right, it does provide the ability to have syscon before devices
are registered, I missed that part.

> > In contrast, this patch introduces a new of_syscon_{un,}register()
> > interface that would get removed after the the above has
> > been implemented, causing extra churn for any driver that also
> > wants to provide a regmap-like interface.
> 
> When will we ever not have to register syscon?

The idea is that we implicitly register the syscon block when someone
calls syscon_regmap_lookup_by_compatible or syscon_regmap_lookup_by_phandle
and then return a reference to that new syscon. When another driver
looks up the same device node, we just pass a reference to the existing
syscon.

	Arnd
