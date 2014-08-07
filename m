From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Thu, 7 Aug 2014 13:09:30 +0200
Message-ID: <20140807110925.GA31594@ulmo.nvidia.com>
References: <1406512857-7213-2-git-send-email-inki.dae@samsung.com>
 <53D675D6.2000309@samsung.com> <20140805111223.GA27340@ulmo>
 <53E1D53A.9050703@samsung.com> <20140806074357.GA13788@ulmo>
 <CAAQKjZNei31upmmHB_HaVQo8=mRpiBKa4-gri8ftpuWDbS2eew@mail.gmail.com>
 <20140807065801.GD17340@ulmo> <53E32FF6.6050402@samsung.com>
 <20140807090859.GD13315@ulmo.nvidia.com>
 <53E3599F.3020301@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1300617443=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53E3599F.3020301@samsung.com>
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


--===============1300617443==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 07:49:03PM +0900, Inki Dae wrote:
> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 18:09, Thierry Reding wrote:
> > On Thu, Aug 07, 2014 at 04:51:18PM +0900, Inki Dae wrote:
> >> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 15:58, Thierry Reding wrote:
> >>> On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wrote:
> >>>> 2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.reding@gmail.com>:
> > [...]
> >>>>> As far as I can tell non-continuous mode simply means that the host=
 can
> >>>>> turn off the HS clock after a high-speed transmission. I think Andr=
zej
> >>>>> mentioned this already in another subthread, but this is an optional
> >>>>> mode that peripherals can support if they have extra circuitry that
> >>>>> provides an internal clock. Peripherals that don't have such circui=
try
> >>>>> may rely on the HS clock to perform in between transmissions and
> >>>>> therefore require the HS clock to be always on (continuous mode). T=
hat's
> >>>>> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advertises that =
the
> >>>>> peripheral supports non-continuous mode and therefore the host can =
turn
> >>>>> the HS clock off after high-speed transmissions.
> >>>>
> >>>> What I don't make sure is this sentence. With
> >>>> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible operations.
> >>>> One is,
> >>>> 1. host controller will generates signals if a bit of a register
> >>>> related to non-contiguous clock mode is set or unset.
> >>>> 2. And then video data is transmitted to panel in HS mode.
> >>>> 3. And then D-PHY detects LP-11 signal (positive and negative lane a=
ll
> >>>> are high).
> >>>> 4. And then D-PHY disables HS clock of host controller.
> >>>> 5. At this time, operation mode of host controller becomes LPM.
> >>>>
> >>>> Other is,
> >>>> 1. host controller will generates signals if a bit of a register
> >>>> related to non-contiguous clock mode is set or unset.
> >>>> 2. And then D-PHY detects LP-11 signal (positive and negative lane a=
ll
> >>>> are high).
> >>>> 3. And then video data is transmitted to panel in LPM.
> >>>> 4. At this time, operation mode of host controller becomes LPM.
> >>>>
> >>>> It seems that you says latter case.
> >>>
> >>> No. High speed clock and low power mode are orthogonal. Non-continuous
> >>> mode simply means that the clock lane enters LP-11 between HS
> >>> transmissions (see 5.6 "Clock Management" of the DSI specification).
> >>>
> >>
> >> It seems that clock lane enters LP-11 regardless of HS clock enabled if
> >> non-continous mode is used. Right?
> >=20
> > No, I think as long as HS clock is enabled the clock lane won't enter
> > LP-11. Non-continuous mode means that the controller can disable the HS
> > clock between HS transmissions. So in non-continuous mode the clock lane
> > can enter LP-11 because the controller disables the HS clock.
>=20
> It makes me a little bit confusing. You said "if HS clock is enabled,
> the the clock lane won't enter LP-11" But you said again "the clock lane
> can enter LP-11 because the controller disables the HS clock" What is
> the meaning?

It means that if the HS clock is enabled, then the clock lane is not in
LP-11. When the HS clock stops, then the clock lane enters LP-11.

> > In continuous mode, then the clock will never be disabled, hence the
> > clock lane will never enter LP-11.
> >=20
> >> And also it seems that non-continous mode is different from LPM at all
> >> because with non-continuous mode, command data is transmitted to panel
> >> in HS mode, but with LPM, command data is transmitted to panel in LP
> >> mode. Also right?
> >=20
> > No. I think you can send command data to the peripheral in low power
> > mode in both continuous and non-continuous clock modes.
> >=20
> >> If so, shouldn't the host driver disable HS clock, in case of LP mode,
> >> before the host driver transmits command data?
> >=20
> > No. If the peripheral doesn't support non-continuous mode, then the HS
> > clock must never be turned off. On the other hand, if the peripheral
> > supports non-continuous mode, then the DSI host should automatically
> > disable the HS clock between high-speed transmissions. That means if a
> > packet is transmitted in low power mode the DSI host will not be
> > transmitting in high-speed mode and therefore disable the HS clock.
>=20
> What is LPM you think? I thought LPM is LP-11 and HS clock disabled. So
> for LPM transfer, lanes should be LP-11 state and also HS clock of the
> host controller should be disabled.

No. I don't think any transmissions can happen when all lanes are in
LP-11 state. The MIPI_DSI_MSG_USE_LPM is used to specify that a packet
should be transmitted in low power mode (see LP Transmission in 2.1
"Definitions" of the MIPI DSI specification).

For low power transmissions, only data lane 0 is used (with a clock
embedded in the signal), therefore the clock lane (driven by the HS
clock) can be in LP-11.

Thierry

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT415lAAoJEN0jrNd/PrOhYswP/jAvG3fk/KW6y+h+7OOKObdX
qOpzG/dvfc4ZX1+hNtQPD8a1ntJKdKCjVFyvuC6Qa/+ikaThWXt2JXXWIhkzN7F/
Jsu0daVNExzQbNAud2i8+33ihCRZB2UUcSWCU1UqueNfQPJXMCg3kDpQ1haWf3kF
7UMRFY7lQu+/am0GvSVNghJSD71UCUgvMBhhUJy7+gw5e3bzPH3YX9LvORylqBDC
vQBwTqM4BYwiuST6RUxptKV4gTYgl1vrT+U0s7h6J3cjfnhGTlWwAkf9810ovnk/
HsTrnxr6Y38DzjUrATiJoT2vdupGfkadFlDNj7EanAolTKOERMD7CyTKbBwxTd7q
EKLDaOzfiMHEXMEjolkrkivyrIgL2BXVAwppr6uHT3eTzLydBjr/rU0McmWwG6Wg
TfdRiR2E1/uXHQr56rVfpacdG9TckGeSL2M34XFT4sUJ6a9lMi46V80Jjbj4iWE7
TXuNSIgwRw+qCBnd2KaTHZS9HUUQI+qwuRweHvUD1kx20k18vr6s+QlacFPTl9fo
7ZuoNjKsnXpFXr4w27K+Dapu436RfZe13c5UmA0Yr1FLaoVuayA5gFXJ/+NYxLSQ
dh1ROg1myDqqepWheBonyr0DiQnfIfHHF/xgbUaMaCmlmHq92g5PbmAROO/7EXIX
zHNbYEHzm5mkzLrExKON
=65ya
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--

--===============1300617443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1300617443==--
