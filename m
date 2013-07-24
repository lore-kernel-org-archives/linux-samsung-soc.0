From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/3] ARM: exynos5420: dt: add clock entries to watchdog node
Date: Wed, 24 Jul 2013 17:23:22 +0200
Message-ID: <3085421.nG4J1A2WQC@amdc1227>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
 <1689874.JhDjmL3yxX@amdc1227> <51EFEA3B.6070909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40581 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751260Ab3GXPXZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 11:23:25 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQG005R75EJ9280@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 16:23:23 +0100 (BST)
In-reply-to: <51EFEA3B.6070909@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-samsung-soc@vger.kernel.org, dianders@chromium.org, jg1.han@samsung.com, grant.likely@secretlab.ca, swarren@wwwdotorg.org, arnd@arndb.de, olof@lixom.net

On Wednesday 24 of July 2013 16:52:43 Sylwester Nawrocki wrote:
> On 07/24/2013 04:09 PM, Tomasz Figa wrote:
> > On Wednesday 24 of July 2013 20:56:15 Kukjin Kim wrote:
> >> Sachin Kamat wrote:
> >>> On 24 July 2013 16:42, Tomasz Figa <t.figa@samsung.com> wrote:
> >>>> On Wednesday 24 of July 2013 15:31:43 Sachin Kamat wrote:
> >>>>> On 24 July 2013 15:24, Tomasz Figa <t.figa@samsung.com> wrote:
> >>>>>> On Wednesday 24 of July 2013 15:18:26 Sachin Kamat wrote:
> >>>>>>> On 24 July 2013 15:08, Leela Krishna Amudala
> >>>>>>> <l.krishna@samsung.com>
> >>>>>>=20
> >>>>>> wrote:
> >>>>>>>> This patch adds clock entries to watchdog node for exynos542=
0
> >>>>>>>> as per the common clock framework of exynos5420
> >>>>>>>>=20
> >>>>>>>> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> >>>>>>>> Reviewed-by: Doug Anderson <dianders@chromium.org>
> >>>>>>>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> >>>>>>>> ---
> >>>>>>>>=20
> >>>>>>>>  arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
> >>>>>>>>  1 file changed, 6 insertions(+)
> >>>>>>>>=20
> >>>>>>>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> >>>>>>>> b/arch/arm/boot/dts/exynos5420.dtsi index 8c54c4b..e1d2d20
> >>>>>>>> 100644
> >>>>>>>> --- a/arch/arm/boot/dts/exynos5420.dtsi
> >>>>>>>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> >>>>>>>> @@ -145,4 +145,10 @@
> >>>>>>>>=20
> >>>>>>>>                 clocks =3D <&clock 260>, <&clock 131>;
> >>>>>>>>                 clock-names =3D "uart", "clk_uart_baud0";
> >>>>>>>>        =20
> >>>>>>>>         };
> >>>>>>>>=20
> >>>>>>>> +
> >>>>>>>> +       watchdog {
> >>>>>>>> +               clocks =3D <&clock 316>;
> >>>>>>>> +               clock-names =3D "watchdog";
> >>>>>>>> +               status =3D "okay";
> >>>>>>>=20
> >>>>>>> Generally you do "okay" in specific board dts files.
> >>>>>>=20
> >>>>>> Not necessarily. The status property should be set to okay
> >>>>>> whenever the
> >>>>>> device represented by such node can already work with given se=
t of
> >>>>>> information (properties).
> >>>>>>=20
> >>>>>> Given the fact that watchdog driver does not require any board
> >>>=20
> >>> specific
> >>>=20
> >>>>>> information, it can be instantiated regardless of the board.
> >>>>>=20
> >>>>> Yes you are right. But I was thinking of keeping this (enabling=
) as
> >>>>> an
> >>>>> option at the board level.
> >>>>> We do this for some of the other IPs too where even though we h=
ave
> >>>>> all
> >>>>> the properties we keep them disabled.
> >>>>=20
> >>>> Yes and this is wrong. Device tree is only a way to list all the
> >>>=20
> >>> hardware
> >>>=20
> >>>> present on particular platform. You don't define which component=
s
> >>>> are
> >>>=20
> >>> used
> >>>=20
> >>>> or not depending on use case, but rather all the hardware that c=
an
> >>>> be
> >>>=20
> >>> used
> >>>=20
> >>>> on given board should be enabled on DT level.
> >>>=20
> >>> This is contrary to the fact that we disable everything by defaul=
t in
> >>> the top level dt files and only enable them as required in the bo=
ard
> >>> dts files.
> >>>=20
> >>>> To illustrate the problem please consider that in the end, a dtb
> >>>> file
> >>>=20
> >>> will
> >>>=20
> >>>> be fused into board ROM (or at most flash memory) and passed to =
the
> >>>=20
> >>> kernel
> >>>=20
> >>>> by the bootloader. If you disable some hardware on DT level even=
 if
> >>>> it can
> >>>> be physically used on the board, there will be no way to reenabl=
e
> >>>> it,
> >>>> if
> >>>> some user wanted to use it, because that would require editing t=
he
> >>>> fused dtb.
> >>>=20
> >>> I believe some h/w will be disabled in dt only if it should not b=
e
> >>> used for whatever reason. If there is no reason then ofcourse the=
y
> >>> would be enabled IMHO. Whatever be the case the choice of enablin=
g or
> >>> disabling should be done at the leaf node (at board level). No?
> >>=20
> >> In my opinion, some IPs can be disabled according to the board
> >> manager.
> >> And if updated DTB is required due to kernel updating or whatever,=
 DTB
> >> should be updated accordingly.
> >=20
> > No, not really. DTB should considered as immutable and modification=
 of
> > which should be allowed only in special cases. Currently such huge
> > special case is that our DT bindings are still in development and s=
o
> > device tree is likely to change, but we are getting towards
> > stabilizing them and so things should be done with correct
> > assumptions.
> >=20
> >> One more, actually we don't have no general way to fuse DTB in
> >> firmware
> >> when kernel is updated. So board manger who controls/decides what
> >> features should be supported on their board should consider the
> >> board's
> >> features and environments...
>=20
> I agree, device tree needs to be really stable and well standardized
> to even consider storing it in OTP memory. In most cases it's not a b=
ig
> deal to update the firmware and same applies to DTB. And disabling IP
> blocks that will never be used in a complex SoC, depending on how the
> SoC is wired up on the board, should be IMO nothing unusual.

Yes, the case of IPs that are not wired up on the board is obvious, but=
 if=20
such IP can be used even if it's not wired (consider our FIMC as an=20
example, which can be used as a mem to mem device, even without any cam=
era=20
sensors connected) then DTB should allow users to use it. Users should =
not=20
be restricted by DTB.

> I think this discussion is more on _where_ we disable devices - in dt=
si
> or board dts files, rather than _if_ we disable some IP blocks in
> firmware.

Where we put the status =3D "okay" or "disabled" clause is a completely=
=20
different question. It is just a convention. I suggested using followin=
g=20
convention:
 - a device should have status =3D "disabled" in top level instance of =
its=20
node, if it can't be used without extra data from lower levels, otherwi=
se=20
no status should be set for it, which defaults to "okay",
 - status should be overridden to "okay" in an instance of device node=20
which provides sufficient amount of data to make the device operational=
, at=20
least to some extent.

> > Again, device tree is not a way to specify use cases. It is a way t=
o
> > list hardware available on the platform and its parameters. DTB sho=
uld
> > be set up in a way enabling users to use any hardware available on
> > their machines, without the need to change DTB.
>=20
> I don't think there is a reason not to allow to have some functionali=
ty
> disabled by the firmware. Embedded systems are often highly specializ=
ed
> and may use only a subset of functionality an SoC provides. And the
> Application Processor SoCs are often loaded with so many features it =
is
> sensible to have all disabled by default and enable only what's neede=
d
> in the board dts file.

If firmware can set up the unused hardware to defined, disabled (powere=
d=20
down) state, then it's fine. But as we all know, state left after firmw=
are is=20
rarely ideal and we need drivers even for unused hardware to put it int=
o=20
some defined (powered down) state.

In addition, having the device enabled in device tree doesn't imply tha=
t=20
such device must be used. The same for binding a driver to such device.=
=20
Having the driver loaded should not have any negative effects if the=20
hardware is not used. If it does, then something is wrong with such dri=
ver.

> It's probably better to stick to one rule - either
> all devices have status property set to "disabled" by default in comm=
on
> dtsi files or all are enabled by default. Having a mixture of both is=
 a
> bit messy IMHO.

Not really. This is a well defined rule. According to ePAPR Version 1.1=
=20
chapter 2.3.4:

The status property indicates the operational status of a device.

=E2=80=9Cokay=E2=80=9D
Indicates the device is operational

=E2=80=9Cdisabled=E2=80=9D
Indicates that the device is not presently operational, but it might
become operational in the future (for example, something is not
plugged in, or switched off).

This is not about the device being used or not, but whether it is=20
operational and can be used. Where we define value of this property is =
just=20
our convention, but it should represent the real environment, not somet=
hing=20
a manager decided.

> Besides, I believe it should be all considered individually for each
> chipset. IMHO there is not much point in enforcing general rule that
> everything what's possible but not necessarily sensible should be
> enabled.

Device Tree is all about general rules. This is not a board file where =
you=20
are free to define whatever kind of proprietary method to pass platform=
=20
specific data to your drivers. If we don't enforce some general rules w=
e=20
will end up with a real mess of each platform (or even parts of the sam=
e=20
platforms) doing completely different things, stretching device tree=20
infrastructure just to fit their needs.

Best regards,
Tomasz
