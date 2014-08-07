From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Thu, 7 Aug 2014 11:09:01 +0200
Message-ID: <20140807090859.GD13315@ulmo.nvidia.com>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-2-git-send-email-inki.dae@samsung.com>
 <53D675D6.2000309@samsung.com> <20140805111223.GA27340@ulmo>
 <53E1D53A.9050703@samsung.com> <20140806074357.GA13788@ulmo>
 <CAAQKjZNei31upmmHB_HaVQo8=mRpiBKa4-gri8ftpuWDbS2eew@mail.gmail.com>
 <20140807065801.GD17340@ulmo> <53E32FF6.6050402@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1061506330=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53E32FF6.6050402@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, treding@nvidia.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============1061506330==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T7mxYSe680VjQnyC"
Content-Disposition: inline


--T7mxYSe680VjQnyC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 04:51:18PM +0900, Inki Dae wrote:
> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 15:58, Thierry Reding wrote:
> > On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wrote:
> >> 2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.reding@gmail.com>:
[...]
> >>> As far as I can tell non-continuous mode simply means that the host c=
an
> >>> turn off the HS clock after a high-speed transmission. I think Andrzej
> >>> mentioned this already in another subthread, but this is an optional
> >>> mode that peripherals can support if they have extra circuitry that
> >>> provides an internal clock. Peripherals that don't have such circuitry
> >>> may rely on the HS clock to perform in between transmissions and
> >>> therefore require the HS clock to be always on (continuous mode). Tha=
t's
> >>> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advertises that the
> >>> peripheral supports non-continuous mode and therefore the host can tu=
rn
> >>> the HS clock off after high-speed transmissions.
> >>
> >> What I don't make sure is this sentence. With
> >> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible operations.
> >> One is,
> >> 1. host controller will generates signals if a bit of a register
> >> related to non-contiguous clock mode is set or unset.
> >> 2. And then video data is transmitted to panel in HS mode.
> >> 3. And then D-PHY detects LP-11 signal (positive and negative lane all
> >> are high).
> >> 4. And then D-PHY disables HS clock of host controller.
> >> 5. At this time, operation mode of host controller becomes LPM.
> >>
> >> Other is,
> >> 1. host controller will generates signals if a bit of a register
> >> related to non-contiguous clock mode is set or unset.
> >> 2. And then D-PHY detects LP-11 signal (positive and negative lane all
> >> are high).
> >> 3. And then video data is transmitted to panel in LPM.
> >> 4. At this time, operation mode of host controller becomes LPM.
> >>
> >> It seems that you says latter case.
> >
> > No. High speed clock and low power mode are orthogonal. Non-continuous
> > mode simply means that the clock lane enters LP-11 between HS
> > transmissions (see 5.6 "Clock Management" of the DSI specification).
> >
>=20
> It seems that clock lane enters LP-11 regardless of HS clock enabled if
> non-continous mode is used. Right?

No, I think as long as HS clock is enabled the clock lane won't enter
LP-11. Non-continuous mode means that the controller can disable the HS
clock between HS transmissions. So in non-continuous mode the clock lane
can enter LP-11 because the controller disables the HS clock.

In continuous mode, then the clock will never be disabled, hence the
clock lane will never enter LP-11.

> And also it seems that non-continous mode is different from LPM at all
> because with non-continuous mode, command data is transmitted to panel
> in HS mode, but with LPM, command data is transmitted to panel in LP
> mode. Also right?

No. I think you can send command data to the peripheral in low power
mode in both continuous and non-continuous clock modes.

> If so, shouldn't the host driver disable HS clock, in case of LP mode,
> before the host driver transmits command data?

No. If the peripheral doesn't support non-continuous mode, then the HS
clock must never be turned off. On the other hand, if the peripheral
supports non-continuous mode, then the DSI host should automatically
disable the HS clock between high-speed transmissions. That means if a
packet is transmitted in low power mode the DSI host will not be
transmitting in high-speed mode and therefore disable the HS clock.

Obviously if the controller can't do that automatically then it might be
necessary to explicitly do that in the driver. But I doubt that any DSI
controller wouldn't be able to do that automatically. On Tegra we have a
control bit that enables non-continuous mode:

	DSI_HS_CLK_CTRL: control for the HS clock lane
	  - 0 =3D CONTINUOUS: HS clock is on all the time
	  - 1 =3D TX_ONLY: HS clock is only active during HS transmissions

> And  it seems that only one of these two flags, MSG_LPM and NON-CONTINUOU=
S,
> should be set by panel driver because with NON-CONTINUOUS clock mode, host
> controller generate clock and data lane signals regardless of controlling
> HS clock.

No. Non-continuous mode is something that's specific to the peripheral
and is always valid, whereas the MSG_LPM flag is only used to mark a
packet to be transmitted in low power mode (as opposed to high speed
mode). For peripherals that don't support non-continuous mode the
NON_CONTINUOUS flag needs to be set. But the driver for the peripheral
can still initiate low power mode packet transmissions by setting the
MSG_LPM flag.

Thierry

--T7mxYSe680VjQnyC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT40IrAAoJEN0jrNd/PrOhr2QQAJTKwyGbRD1lb4yUzqG5vuWO
PEMWCT258kH2lpwdjUsRjYZ86kgKkUTDisHs63WdrjxYxTZdqgN4krhKSlsAM70f
nBqq101HovwRnTxh7Cl1i4hqd3KRkTgqkKrrs8ORBAIa9AmlR1VA39wEP1qf9VB/
C9FkuONBcexsH1GNsnVe+BSrKzxY6ReK/zTYtG8Gf6MvEuMq043kraCG+42vppil
plxHq3HiE3yevUJbvRpK1DFoyevZ6pw0jheMi0B6ffHFC6yYGbwddtyH6ssTpNFJ
vjC4YPTiMP/XimgEgBsgzTsHArYB5NqjvM4zM/fD0+P9SKPkvTRGOZxH5IIrWvox
tmMHUdnduaZKxr6pYNPMnvq7qoO/1qW205k6UHAM/BcPagayZu6JUj3GVqm6BfA6
ftxnuiEOn2DsoJH3HsQkJuBT+lriaTdTvMqU5GXPNXL32/UK17KPR3lkfAExsc4/
dWGfO75eZZY1djhBG5GQTd7Lya42ptSZoCUhcAKJFqj9oCWZIjaxSjxMmM2Kfq3k
7Gn9IX6M5qYtlmhErKucAm2RRdE3ip+KVTmlN+FimCsAb3SW88iGb0Pqejk11BXh
dE8ZSQg/Hqkthv6ECaVc8ElDoBqE6jq1Tik8QciK94P2EunKuxFYhEeKvjDzPUXR
qSSZwhF6gvBfeXo5eGDn
=3p9J
-----END PGP SIGNATURE-----

--T7mxYSe680VjQnyC--

--===============1061506330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1061506330==--
