From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v7] mfd: syscon: Decouple syscon interface from platform
 devices
Date: Wed, 22 Oct 2014 16:36:28 +0530
Message-ID: <001901cfede8$5554cc50$fffe64f0$@samsung.com>
References: <1412066127-27063-1-git-send-email-pankaj.dubey@samsung.com>
 <20141007090923.GI25331@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20141007090923.GI25331@lee--X1>
Content-language: en-us
Sender: linux-kernel-owner@vger.kernel.org
To: 'Lee Jones' <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, b29396@freescale.com, boris.brezillon@free-electrons.com, tomasz.figa@gmail.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, kgene.kim@samsung.com, Li.Xiubo@freescale.com, geert+renesas@glider.be, swarren@nvidia.com
List-Id: linux-samsung-soc@vger.kernel.org

Hello Lee,

On Tuesday, October 07, 2014 2:39 PM, Lee Jones wrote,
> On Tue, 30 Sep 2014, Pankaj Dubey wrote:
>=20
> > Currently a syscon entity can be only registered directly through a
> > platform device that binds to a dedicated syscon driver. However in
> > certain use cases it is desirable to make a device used with anothe=
r
> > driver a syscon interface provider.
> >
> > For example, certain SoCs (e.g. Exynos) contain system controller
> > blocks which perform various functions such as power domain control=
,
> > CPU power management, low power mode control, but in addition conta=
in
> > certain IP integration glue, such as various signal masks, coproces=
sor
> > power control, etc. In such case, there is a need to have a dedicat=
ed
> > driver for such system controller but also share registers with oth=
er
> > drivers. The latter is where the syscon interface is helpful.
> >
> > In case of DT based platforms, this patch decouples syscon object f=
rom
> > syscon platform driver, and allows to create syscon objects first t=
ime
> > when it is required by calling of syscon_regmap_lookup_by APIs and
> > keep a list of such syscon objects along with syscon provider
> > device_nodes and regmap handles.
> >
> > For non-DT based platforms, this patch keeps syscon platform driver
> > structure so that syscon can be probed and such non-DT based driver=
s
> > can use syscon_regmap_lookup_by_pdev API and access regmap handles.
> > Once all users of "syscon_regmap_lookup_by_pdev" migrated to DT bas=
ed,
> > we can completely remove platform driver of syscon, and keep only
> > helper functions to get regmap handles.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
> > Tested-by: Vivek Gautam <gautam.vivek@samsung.com>
> > Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.u=
k>
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>=20
> Applied for v3.19.

I can't see this in 3.18-rc1, as this patch is one of dependency for ma=
ny of Exynos PMU related patches,
will you please queue this patch for 3.18-rc2, so that already ready to=
 be in patches having this patch as
dependency can be taken in.

Thanks,
Pankaj Dubey
>=20
> --
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead Linaro.org =E2=94=82 Open=
 source software
> for ARM SoCs Follow Linaro: Facebook | Twitter | Blog
