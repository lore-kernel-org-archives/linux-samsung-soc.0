From: Felipe Balbi <balbi@kernel.org>
Subject: Re: PROBLEM: DWC3 USB 3.0 not working on Odroid-XU4 with Exynos 5422
Date: Mon, 17 Oct 2016 11:08:17 +0300
Message-ID: <874m4btn2m.fsf@linux.intel.com>
References: <1472414695.3845.3.camel@mniewoehner.de>
 <87lgzgdof3.fsf@linux.intel.com> <57C41582.1030604@linux.intel.com>
 <1472468730.4925.3.camel@mniewoehner.de>
 <CANAwSgQMsK8YPxR==UXtR49kiJzYhkzvSCNwn8mDJfj-3wpa2w@mail.gmail.com>
 <CAFp+6iGrS0DTP=KUKDvk3NwWB32+1uj-irKT6fn5XTcfk572Hg@mail.gmail.com>
 <1475578687.1912.28.camel@mniewoehner.de>
 <CAFp+6iGx-jf+xrdHF=0J3FK9dDBg54zESYNVo8bz2Qz6G4gEZg@mail.gmail.com>
 <1475771380.22019.5.camel@mniewoehner.de> <87y420wqoy.fsf@linux.intel.com>
 <1475871962.1697.12.camel@mniewoehner.de>
 <1476627597.1752.3.camel@mniewoehner.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4373249788608520865=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1476627597.1752.3.camel@mniewoehner.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael =?utf-8?Q?Niew=C3=B6hner?= <linux@mniewoehner.de>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Anand Moon <linux.amoon@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============4373249788608520865==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Michael Niew=C3=B6hner <linux@mniewoehner.de> writes:
> Hi Felipe,
> On Fri, 2016-10-07 at 22:26 +0200, Michael Niew=C3=B6hner wrote:
>> Hi Felipe,
>>=20
>> On Fr, 2016-10-07 at 10:42 +0300, Felipe Balbi wrote:
>> > Hi,
>> >=20
>> > Michael Niew=C3=B6hner <linux@mniewoehner.de> writes:
>> > >=20
>> > > >=20
>> > > > The clocks are same across working/non-working.
>> > > > Is it possible to bisect the commit that's causing hang for 4.8x ?
>> > >=20
>> > >=20
>> > > [c499ff71ff2a281366c6ec7a904c547d806cbcd1] usb: dwc3: core: re-facto=
r init and exit paths
>> > > This patch causes both the hang on reboot and the lsusb hang.
>> >=20
>> > How to reproduce? Why don't we see this on x86 and TI boards? I'm
>> > guessing this is failed bisection, as I can't see anything in that
>> > commit that would cause reboot hang. Also, that code path is *NOT*
>> > executed when you run lsusb.
>> >=20
>>=20
>> I've tested this procedure multiple times to be sure:
>>=20
>> - checkout=C2=A0c499ff71, compile, boot the odroid
>> - run lsusb -v =3D> lsusb hangs, can't terminate with ctrl-c
>> - hard reset, after boot run poweroff or reboot =3D> board does not comp=
letely power off / reboot (see log below)
>> - revert c499ff71, mrproper, compile, boot the odroid
>> - run lsusb -v =3D> shows full output, not hanging
>> - run reboot or poweroff =3D> board powers off / reboots just fine
>>=20
>>=20
>> dmesg poweroff not working:
>> ...
>> [=C2=A0=C2=A0120.733519] systemd-journald[144]: systemd-journald stopped=
 as pid 144=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0120.742663] systemd-shutdown[1]: Sending SIGKILL to remaini=
ng processes...=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0120.769212] systemd-shutdown[1]: Unmounting file systems.=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0120.773713] systemd-shutdown[1]: Unmounting /sys/kernel/deb=
ug.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0120.827211] systemd-shutdown[1]: Unmounting /dev/mqueue.=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.081672] EXT4-fs (mmcblk1p2): re-mounted. Opts: (null)=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.091687] EXT4-fs (mmcblk1p2): re-mounted. Opts: (null)=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.095608] EXT4-fs (mmcblk1p2): re-mounted. Opts: (null)=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.101014] systemd-shutdown[1]: All filesystems unmounted.=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.106523] systemd-shutdown[1]: Deactivating swaps.=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.111585] systemd-shutdown[1]: All swaps deactivated.=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.116661] systemd-shutdown[1]: Detaching loop devices.=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.126395] systemd-shutdown[1]: All loop devices detached.=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.130525] systemd-shutdown[1]: Detaching DM devices.=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.135824] systemd-shutdown[1]: All DM devices detached.=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.166327] systemd-shutdown[1]: /lib/systemd/system-shutdo=
wn succeeded.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.171739] systemd-shutdown[1]: Powering off.
>>=20
>> =3D> at this point removing the sd card would show a message=C2=A0
>> "removed mmc0" (not sure what the real message was...) so the board is n=
ot completely off.
>>=20
>>=20
>> dmesg poweroff working:
>> ...
>> [=C2=A0=C2=A0120.733519] systemd-journald[144]: systemd-journald stopped=
 as pid 144=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0120.742663] systemd-shutdown[1]: Sending SIGKILL to remaini=
ng processes...=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0120.769212] systemd-shutdown[1]: Unmounting file systems.=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0120.773713] systemd-shutdown[1]: Unmounting /sys/kernel/deb=
ug.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0120.827211] systemd-shutdown[1]: Unmounting /dev/mqueue.=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.081672] EXT4-fs (mmcblk1p2): re-mounted. Opts: (null)=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.091687] EXT4-fs (mmcblk1p2): re-mounted. Opts: (null)=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.095608] EXT4-fs (mmcblk1p2): re-mounted. Opts: (null)=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.101014] systemd-shutdown[1]: All filesystems unmounted.=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.106523] systemd-shutdown[1]: Deactivating swaps.=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.111585] systemd-shutdown[1]: All swaps deactivated.=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.116661] systemd-shutdown[1]: Detaching loop devices.=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.126395] systemd-shutdown[1]: All loop devices detached.=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.130525] systemd-shutdown[1]: Detaching DM devices.=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.135824] systemd-shutdown[1]: All DM devices detached.=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.166327] systemd-shutdown[1]: /lib/systemd/system-shutdo=
wn succeeded.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> [=C2=A0=C2=A0121.171739] systemd-shutdown[1]: Powering off.
>> [=C2=A0=C2=A0121.182331] rebo=EF=BF=BD
>>=20
>>=20
>>=20
>> Best regards
>> Michael Niew=C3=B6hner
>
>
> I did some more tests with next-20161016. Reverting / commenting out
> one part of your patch "solves" the lsusb hang, the reboot problem
> and also the "debounce failed" message. [1]
> Another "solution" is to call phy_power_off before phy_power_on. [2]
>
> Disclaimer: I have no idea what I was doing ;-) These were just some
> simple trial-and-error attempts that maybe help to find the real
> cause of the problems.
>
> [1]
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 7287a76..5ef589d 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -724,6 +724,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
> =C2=A0	/* Adjust Frame Length */
> =C2=A0	dwc3_frame_length_adjustment(dwc);
> =C2=A0
> +/*
> =C2=A0	usb_phy_set_suspend(dwc->usb2_phy, 0);
> =C2=A0	usb_phy_set_suspend(dwc->usb3_phy, 0);
> =C2=A0	ret =3D phy_power_on(dwc->usb2_generic_phy);
> @@ -733,6 +734,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
> =C2=A0	ret =3D phy_power_on(dwc->usb3_generic_phy);
> =C2=A0	if (ret < 0)
> =C2=A0		goto err3;
> +*/
> =C2=A0
> =C2=A0	ret =3D dwc3_event_buffers_setup(dwc);
> =C2=A0	if (ret) {
>
> [2]
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 7287a76..f6c8e13 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -726,6 +726,8 @@ static int dwc3_core_init(struct dwc3 *dwc)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usb_phy_set_suspend(dwc->=
usb2_phy, 0);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usb_phy_set_suspend(dwc->=
usb3_phy, 0);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0phy_power_off(dwc->usb2_generi=
c_phy);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0phy_power_off(dwc->usb3_generi=
c_phy);

This looks like a PHY driver bug to me. Which PHY driver are you using?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYBIbxAAoJEMy+uJnhGpkGS8MQALKmFQUOOG54sFY3VliB4U+3
1Ne4RMdT+iFJEPtUZtThUgE+idZ3BZpdOrOlAncPOEYQuSr03uBBZhunruB9zFQJ
HZVqmOhb2MB6O+tu/0kE4DG4ADUJVwIQWEc0zCBBaFkmgKp0YR0QItJlbe+zeUao
TDYqWskN2ObLsNKFSvXCC6/Y7WIljGqcEcRwL3MjoZQsm+HZNPJfZUlnxb1OJZJJ
tiL6JtVgUbODlts+jOrwGDj+u9LrneSEzCalH00RROsnhFbJPR7Hpp3ZquCmhDRQ
1lTEDPSHqHt4IpCOHYfpSJll/5FFpCBZGte5fpDnRhc24eEyaIRM4C4P4rWGxOb6
xfOvPlc/0Q4gEDYod/vqjRCDm3GjyVoqoc8BCT7jDDYAQ5EWPwq/HusumUzciSlE
07dqSr44LlhRPpXk+OPxQxhP2+Quc1hTH8Dw1EwHJER4Xwgv3kSWEpCLW3HiTpJp
SRrNSyw8uFSwikCAWSqXk3MHoFRQvH2DPOvLeNnXDQrbMU6HsJFCj1Nr9c01SGbI
KfNWKbBvuwStNKnx3HSt1dreszSxxLO8uA/W+OGF61Fd0cdPToBqnvKUCvBEqKpA
/GhIl2cSk0zPL1sBi9icik5Mbmm54SEVtJ5UX8plWGzP523VjxzwmsHVjT93O7KC
konN/NoNKJkYvfpFDtEH
=xzIb
-----END PGP SIGNATURE-----
--=-=-=--


--===============4373249788608520865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4373249788608520865==--
