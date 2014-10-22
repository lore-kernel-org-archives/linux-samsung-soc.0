From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7] mfd: syscon: Decouple syscon interface from platform
 devices
Date: Wed, 22 Oct 2014 13:12:19 +0100
Message-ID: <20141022121219.GM4939@x1>
References: <1412066127-27063-1-git-send-email-pankaj.dubey@samsung.com>
 <20141007090923.GI25331@lee--X1>
 <001901cfede8$5554cc50$fffe64f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:58915 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933031AbaJVMM0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Oct 2014 08:12:26 -0400
Received: by mail-ig0-f175.google.com with SMTP id uq10so759714igb.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2014 05:12:26 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <001901cfede8$5554cc50$fffe64f0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, b29396@freescale.com, boris.brezillon@free-electrons.com, tomasz.figa@gmail.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, kgene.kim@samsung.com, Li.Xiubo@freescale.com, geert+renesas@glider.be, swarren@nvidia.com

On Wed, 22 Oct 2014, Pankaj Dubey wrote:

> Hello Lee,
>=20
> On Tuesday, October 07, 2014 2:39 PM, Lee Jones wrote,
> > On Tue, 30 Sep 2014, Pankaj Dubey wrote:
> >=20
> > > Currently a syscon entity can be only registered directly through=
 a
> > > platform device that binds to a dedicated syscon driver. However =
in
> > > certain use cases it is desirable to make a device used with anot=
her
> > > driver a syscon interface provider.
> > >
> > > For example, certain SoCs (e.g. Exynos) contain system controller
> > > blocks which perform various functions such as power domain contr=
ol,
> > > CPU power management, low power mode control, but in addition con=
tain
> > > certain IP integration glue, such as various signal masks, coproc=
essor
> > > power control, etc. In such case, there is a need to have a dedic=
ated
> > > driver for such system controller but also share registers with o=
ther
> > > drivers. The latter is where the syscon interface is helpful.
> > >
> > > In case of DT based platforms, this patch decouples syscon object=
 from
> > > syscon platform driver, and allows to create syscon objects first=
 time
> > > when it is required by calling of syscon_regmap_lookup_by APIs an=
d
> > > keep a list of such syscon objects along with syscon provider
> > > device_nodes and regmap handles.
> > >
> > > For non-DT based platforms, this patch keeps syscon platform driv=
er
> > > structure so that syscon can be probed and such non-DT based driv=
ers
> > > can use syscon_regmap_lookup_by_pdev API and access regmap handle=
s.
> > > Once all users of "syscon_regmap_lookup_by_pdev" migrated to DT b=
ased,
> > > we can completely remove platform driver of syscon, and keep only
> > > helper functions to get regmap handles.
> > >
> > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
> > > Tested-by: Vivek Gautam <gautam.vivek@samsung.com>
> > > Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> > > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >=20
> > Applied for v3.19.
>=20
> I can't see this in 3.18-rc1, as this patch is one of dependency for =
many of Exynos PMU related patches,
> will you please queue this patch for 3.18-rc2, so that already ready =
to be in patches having this patch as
> dependency can be taken in.

As my message implies, this isn't going to make it into v3.18 but it
is queued for v3.19.  It was sent far too late in the cycle (rc7 of 7)
to make it into the v3.18 merge-window.

In the meantime, please give this patch through testing whilst it's in
-next, to help mitigate any issues when it's applied into v3.19.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
