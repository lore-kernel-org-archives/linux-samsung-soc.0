From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5] mfd: syscon: Decouple syscon interface from platform devices
Date: Thu, 25 Sep 2014 14:21:52 +0200
Message-ID: <4389453.TP96FZcCbx@phil>
References: <1411360807-7750-1-git-send-email-pankaj.dubey@samsung.com> <CAGhQ9VzZ8LadDT5RWUSX89q0WP3fGiQ8f=bWbRVfEz5Vy_zZKw@mail.gmail.com> <13449286.k3JCbR2ABy@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:50860 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750774AbaIYMWE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 08:22:04 -0400
In-Reply-To: <13449286.k3JCbR2ABy@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Joachim Eastwood <manabian@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kgene.kim@samsung.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, naushad@samsung.com, b29396@freescale.com, tomasz.figa@gmail.com, joshi@samsung.com, thomas.ab@samsung.com, Li.Xiubo@freescale.com, vikas.sajjan@samsung.com, chow.kim@samsung.com, lee.jones@linaro.org, dianders@chromium.org

Am Mittwoch, 24. September 2014, 20:35:10 schrieb Heiko St=FCbner:
> Hi Pankaj, Joachim,
>=20
> Am Dienstag, 23. September 2014, 20:12:50 schrieb Joachim Eastwood:
> > On 22 September 2014 06:40, Pankaj Dubey <pankaj.dubey@samsung.com>=
 wrote:
> > > Currently a syscon entity can be only registered directly through=
 a
> > > platform device that binds to a dedicated syscon driver. However =
in
> > > certain use cases it is desirable to make a device used with anot=
her
> > > driver a syscon interface provider.
> > >=20
> > > For example, certain SoCs (e.g. Exynos) contain system controller
> > > blocks which perform various functions such as power domain contr=
ol,
> > > CPU power management, low power mode control, but in addition con=
tain
> > > certain IP integration glue, such as various signal masks,
> > > coprocessor power control, etc. In such case, there is a need to =
have
> > > a dedicated driver for such system controller but also share regi=
sters
> > > with other drivers. The latter is where the syscon interface is h=
elpful.
> > >=20
> > > In case of DT based platforms, this patch decouples syscon object=
 from
> > > syscon platform driver, and allows to create syscon objects first=
 time
> > > when it is required by calling of syscon_regmap_lookup_by APIs an=
d keep
> > > a list of such syscon objects along with syscon provider device_n=
odes
> > > and regmap handles.
> > >=20
> > > For non-DT based platforms, this patch keeps syscon platform driv=
er
> > > structure where is can be probed and such non-DT based drivers ca=
n use
> > > syscon_regmap_lookup_by_pdev API and get access to regmap handles=
=2E
> > > Once all users of "syscon_regmap_lookup_by_pdev" migrated to DT b=
ased,
> > > we can completly remove platform driver of syscon, and keep only =
helper
> > > functions to get regmap handles.
> > >=20
> > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
> > > Tested-by: Vivek Gautam <gautam.vivek@samsung.com>
> > > Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> > > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> >=20
> > I wrote a clk driver using syscon and your patch. clk driver uses
> > CLK_OF_DECLARE, btw.
> >=20
> > It works but I get a '(null): Failed to create debugfs directory'
> > message in the boot log.
> >=20
> > Tested-by: Joachim Eastwood <manabian@gmail.com>
>=20
> on Rockchip platforms this syscon support also helps quite a bit, as =
the
> pll lock-status is sitting in an external syscon register, so setting=
 target
> pll-rates through assigned-clocks is not easily doable without it.
> Therefore I'm very much looking forward to this.
>=20
>=20
> Similar to Joachim I get an error about debugfs from regmap, which se=
ems
> to be caused by
> 	name =3D dev_name(map->dev);
> returning NULL in regmap_debugfs_init in regmap-debugfs.c for such an
> "early" syscon.

It looks like of_device_make_bus_id would be able to do the necessary s=
teps
to populate the dev_name seemingly correctly.

With the diff below I now get a syscon that can init clocks and also a
sane regmap debugfs init:

/debug/regmap # ls -la
total 0
drwxr-xr-x    5 0        0                0 Jan  1  1970 .
drwx------   19 0        0                0 Jan  1  1970 ..
drwxr-xr-x    2 0        0                0 Jan  1  1970 0-001b
drwxr-xr-x    2 0        0                0 Jan  1  1970 ff730000.power=
-management
drwxr-xr-x    2 0        0                0 Jan  1  1970 ff770000.sysco=
n


But of course I don't know enough about device-internals to determine i=
f
this is an insane solution or not :-)


Heiko


diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 8ebc1c6..3734434 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -73,6 +73,7 @@ static struct syscon *of_syscon_register(struct devic=
e_node *np)
                        goto err_pdev;
                }
                pdev->dev.of_node =3D of_node_get(np);
+               of_device_make_bus_id(&pdev->dev);
        }
=20
        regmap =3D devm_regmap_init_mmio(&pdev->dev, base, &syscon_regm=
ap_config);
