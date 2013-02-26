From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [Suggestion] ARM:S5PV210: version merging compiling issue for
 'struct fimc_source_info'
Date: Tue, 26 Feb 2013 14:38:47 +0800
Message-ID: <512C5877.7090805@asianux.com>
References: <511F50CF.90403@asianux.com> <CAH9JG2WS5q4SR8zk5=OC32PHLZ2+ZYva7csyshG7oANacqbCuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:60442 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755915Ab3BZGjI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 01:39:08 -0500
In-Reply-To: <CAH9JG2WS5q4SR8zk5=OC32PHLZ2+ZYva7csyshG7oANacqbCuA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, s.nawrocki@samsung.com

=E4=BA=8E 2013=E5=B9=B402=E6=9C=8816=E6=97=A5 19:39, Kyungmin Park =E5=86=
=99=E9=81=93:
> Hi,
>=20
> You can find it at recent patch from Arnd.
>=20

  excuse me, could you please provide more information about it ?

  I have checked 2 tags:
    the next-20130225 tag in git://git.kernel.org/pub/scm/linux/kernel/=
git/next/linux-next.git

      in Feb 1 2013, by Sylwester Nawrocki, Kyungmin Park, Mauro Carval=
ho Chehab
      git number: 56bc911ac3b94c731db3a6de20258827f1a61c20
        in include/media/s5p_fimc.h, the structure fimc_source_info is =
changed.
        in arch/arm/mach-s5pv210/mach-goni.c, the structure fimc_source=
_info is not changed.
          still use .bus_type (not use .fimc_bus_type like others).

      it seems, the relative members forgot to change it to .fimc_bus_t=
ype.

      did the patch from Arnd still not applied into next tree ?

    the v3.8-rc7 tag in git clone git://git.kernel.org/pub/scm/linux/ke=
rnel/git/kgene/linux-samsung.git
      it seems no relative changes (change nothing).


  thanks.

  :-)

gchen.


> Thank you,
> Kyungmin Park
>=20
> On Saturday, February 16, 2013, Chen Gang wrote:
>=20
>     Hello Kukjin Kim:
>=20
>     =EF=BF=BD it is a compiling issue, please help check when you hav=
e time.
>=20
>     thanks.
>=20
>     gchen.
>=20
>     in arch/arm/mach-s5pv210/mach-goni.c:848:
>     =EF=BF=BD error: unknown field 'bus_type' specified in initialize=
r
>=20
>     843 static struct fimc_source_info goni_camera_sensors[] =3D {
>     844 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD {
>     845 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD .mux_id =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =3D 0,
>     846 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD .flags =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD=
=3D V4L2_MBUS_PCLK_SAMPLE_FALLING |
>     847 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD V4L2_MBUS_VSYNC_ACTIVE_LOW,
>     848 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD .bus_type =EF=BF=BD =EF=BF=BD =EF=BF=BD =3D FIMC_BUS_T=
YPE_ITU_601,
>     849 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD .board_info =EF=BF=BD =EF=BF=BD =3D &noon010pc30_board=
_info,
>     850 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD .i2c_bus_num =EF=BF=BD =EF=BF=BD=3D 0,
>     851 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD .clk_frequency =EF=BF=BD=3D 16000000UL,
>     852 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD },
>     853 };
>=20
>=20
>     in include/media/s5p_fimc.h:50
>=20
>     =EF=BF=BD37 /**
>     =EF=BF=BD38 =EF=BF=BD* struct fimc_source_info - video source des=
cription required
>     for the host
>     =EF=BF=BD39 =EF=BF=BD* =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD interface configuration
>     =EF=BF=BD40 =EF=BF=BD*
>     =EF=BF=BD41 =EF=BF=BD* @board_info: pointer to I2C subdevice's bo=
ard info
>     =EF=BF=BD42 =EF=BF=BD* @clk_frequency: frequency of the clock the=
 host interface
>     provides to sensor
>     =EF=BF=BD43 =EF=BF=BD* @fimc_bus_type: FIMC camera input type
>     =EF=BF=BD44 =EF=BF=BD* @sensor_bus_type: image sensor bus type, M=
IPI, ITU-R BT.601 etc.
>     =EF=BF=BD45 =EF=BF=BD* @flags: the parallel sensor bus flags defi=
ning signals
>     polarity (V4L2_MBUS_*)
>     =EF=BF=BD46 =EF=BF=BD* @i2c_bus_num: i2c control bus id the senso=
r is attached to
>     =EF=BF=BD47 =EF=BF=BD* @mux_id: FIMC camera interface multiplexer=
 index (separate
>     for MIPI and ITU)
>     =EF=BF=BD48 =EF=BF=BD* @clk_id: index of the SoC peripheral clock=
 for sensors
>     =EF=BF=BD49 =EF=BF=BD*/
>     =EF=BF=BD50 struct fimc_source_info {
>     =EF=BF=BD51 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD struct i2c_bo=
ard_info *board_info;
>     =EF=BF=BD52 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD unsigned long=
 clk_frequency;
>     =EF=BF=BD53 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD enum fimc_bus=
_type fimc_bus_type;
>     =EF=BF=BD54 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD enum fimc_bus=
_type sensor_bus_type;
>     =EF=BF=BD55 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD u16 flags;
>     =EF=BF=BD56 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD u16 i2c_bus_n=
um;
>     =EF=BF=BD57 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD u16 mux_id;
>     =EF=BF=BD58 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD u8 clk_id;
>     =EF=BF=BD59 };
>     =EF=BF=BD60
>=20
>=20
>     _______________________________________________
>     linux-arm-kernel mailing list
>     linux-arm-kernel@lists.infradead.org <javascript:;>
>     http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20


--=20
Chen Gang

Asianux Corporation
