From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Fri, 8 Aug 2014 09:03:12 +0200
Message-ID: <20140808070311.GA5387@ulmo>
References: <20140807065801.GD17340@ulmo> <53E32FF6.6050402@samsung.com>
 <20140807090859.GD13315@ulmo.nvidia.com>
 <53E3599F.3020301@samsung.com>
 <20140807110925.GA31594@ulmo.nvidia.com>
 <53E379A8.1020506@samsung.com>
 <20140807131713.GB1540@ulmo.nvidia.com>
 <53E38191.1050308@samsung.com>
 <20140807135500.GA27417@ulmo.nvidia.com>
 <53E42BCB.5090608@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1468216242=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53E42BCB.5090608@samsung.com>
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


--===============1468216242==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2014 at 10:45:47AM +0900, Inki Dae wrote:
> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 22:55, Thierry Reding wrote:
> > On Thu, Aug 07, 2014 at 10:39:29PM +0900, Inki Dae wrote:
> >> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 22:17, Thierry Reding wrote:
> >>> On Thu, Aug 07, 2014 at 10:05:44PM +0900, Inki Dae wrote:
> >>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 20:09, Thierry Reding wrote:
> >>>>> On Thu, Aug 07, 2014 at 07:49:03PM +0900, Inki Dae wrote:
> >>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 18:09, Thierry Reding wro=
te:
> >>>>>>> On Thu, Aug 07, 2014 at 04:51:18PM +0900, Inki Dae wrote:
> >>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 15:58, Thierry Reding w=
rote:
> >>>>>>>>> On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wrote:
> >>>>>>>>>> 2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.reding@gmai=
l.com>:
> >>>>>>> [...]
> >>>>>>>>>>> As far as I can tell non-continuous mode simply means that th=
e host can
> >>>>>>>>>>> turn off the HS clock after a high-speed transmission. I thin=
k Andrzej
> >>>>>>>>>>> mentioned this already in another subthread, but this is an o=
ptional
> >>>>>>>>>>> mode that peripherals can support if they have extra circuitr=
y that
> >>>>>>>>>>> provides an internal clock. Peripherals that don't have such =
circuitry
> >>>>>>>>>>> may rely on the HS clock to perform in between transmissions =
and
> >>>>>>>>>>> therefore require the HS clock to be always on (continuous mo=
de). That's
> >>>>>>>>>>> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advertises=
 that the
> >>>>>>>>>>> peripheral supports non-continuous mode and therefore the hos=
t can turn
> >>>>>>>>>>> the HS clock off after high-speed transmissions.
> >>>>>>>>>>
> >>>>>>>>>> What I don't make sure is this sentence. With
> >>>>>>>>>> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible operat=
ions.
> >>>>>>>>>> One is,
> >>>>>>>>>> 1. host controller will generates signals if a bit of a regist=
er
> >>>>>>>>>> related to non-contiguous clock mode is set or unset.
> >>>>>>>>>> 2. And then video data is transmitted to panel in HS mode.
> >>>>>>>>>> 3. And then D-PHY detects LP-11 signal (positive and negative =
lane all
> >>>>>>>>>> are high).
> >>>>>>>>>> 4. And then D-PHY disables HS clock of host controller.
> >>>>>>>>>> 5. At this time, operation mode of host controller becomes LPM.
> >>>>>>>>>>
> >>>>>>>>>> Other is,
> >>>>>>>>>> 1. host controller will generates signals if a bit of a regist=
er
> >>>>>>>>>> related to non-contiguous clock mode is set or unset.
> >>>>>>>>>> 2. And then D-PHY detects LP-11 signal (positive and negative =
lane all
> >>>>>>>>>> are high).
> >>>>>>>>>> 3. And then video data is transmitted to panel in LPM.
> >>>>>>>>>> 4. At this time, operation mode of host controller becomes LPM.
> >>>>>>>>>>
> >>>>>>>>>> It seems that you says latter case.
> >>>>>>>>>
> >>>>>>>>> No. High speed clock and low power mode are orthogonal. Non-con=
tinuous
> >>>>>>>>> mode simply means that the clock lane enters LP-11 between HS
> >>>>>>>>> transmissions (see 5.6 "Clock Management" of the DSI specificat=
ion).
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> It seems that clock lane enters LP-11 regardless of HS clock ena=
bled if
> >>>>>>>> non-continous mode is used. Right?
> >>>>>>>
> >>>>>>> No, I think as long as HS clock is enabled the clock lane won't e=
nter
> >>>>>>> LP-11. Non-continuous mode means that the controller can disable =
the HS
> >>>>>>> clock between HS transmissions. So in non-continuous mode the clo=
ck lane
> >>>>>>> can enter LP-11 because the controller disables the HS clock.
> >>>>>>
> >>>>>> It makes me a little bit confusing. You said "if HS clock is enabl=
ed,
> >>>>>> the the clock lane won't enter LP-11" But you said again "the cloc=
k lane
> >>>>>> can enter LP-11 because the controller disables the HS clock" What=
 is
> >>>>>> the meaning?
> >>>>>
> >>>>> It means that if the HS clock is enabled, then the clock lane is no=
t in
> >>>>> LP-11. When the HS clock stops, then the clock lane enters LP-11.
> >>>>>
> >>>>>>> In continuous mode, then the clock will never be disabled, hence =
the
> >>>>>>> clock lane will never enter LP-11.
> >>>>>>>
> >>>>>>>> And also it seems that non-continous mode is different from LPM =
at all
> >>>>>>>> because with non-continuous mode, command data is transmitted to=
 panel
> >>>>>>>> in HS mode, but with LPM, command data is transmitted to panel i=
n LP
> >>>>>>>> mode. Also right?
> >>>>>>>
> >>>>>>> No. I think you can send command data to the peripheral in low po=
wer
> >>>>>>> mode in both continuous and non-continuous clock modes.
> >>>>>>>
> >>>>>>>> If so, shouldn't the host driver disable HS clock, in case of LP=
 mode,
> >>>>>>>> before the host driver transmits command data?
> >>>>>>>
> >>>>>>> No. If the peripheral doesn't support non-continuous mode, then t=
he HS
> >>>>>>> clock must never be turned off. On the other hand, if the periphe=
ral
> >>>>>>> supports non-continuous mode, then the DSI host should automatica=
lly
> >>>>>>> disable the HS clock between high-speed transmissions. That means=
 if a
> >>>>>>> packet is transmitted in low power mode the DSI host will not be
> >>>>>>> transmitting in high-speed mode and therefore disable the HS cloc=
k.
> >>>>>>
> >>>>>> What is LPM you think? I thought LPM is LP-11 and HS clock disable=
d. So
> >>>>>> for LPM transfer, lanes should be LP-11 state and also HS clock of=
 the
> >>>>>> host controller should be disabled.
> >>>>>
> >>>>> No. I don't think any transmissions can happen when all lanes are in
> >>>>> LP-11 state. The MIPI_DSI_MSG_USE_LPM is used to specify that a pac=
ket
> >>>>> should be transmitted in low power mode (see LP Transmission in 2.1
> >>>>> "Definitions" of the MIPI DSI specification).
> >>>>>
> >>>>
> >>>> Hm.. I see. I meant,
> >>>>
> >>>> if (flags & MIPI_DSI_MSG_USE_LPM)
> >>>>        disable HS clock <- required.
> >>>>
> >>>> transmit command data <- in LPM.
> >>>
> >>> No. Disabling the HS clock is not required for LPM mode. In fact if t=
he
> >>> peripheral specifies that it doesn't support non-continuous mode then
> >>> the HS clock must *never* be disabled as long as the peripheral is in
> >>> use.
> >>>
> >>> MIPI_DSI_MSG_USE_LPM and MIPI_DSI_CLOCK_NON_CONTINUOUS are unrelated =
and
> >>> need to be considered separately.
> >>
> >> I mentioned already LPM and NON_CONTINUOUS are unrelated.
> >>
> >> It seems that you say the only way to transfer command data in LPM is
> >> non-continuous clock mode.
> >
> > No, that's not what I'm saying.
> >
> >> However, you said and also the spec says, "Non-continuous mode simply
> >> means that the clock lane enters LP-11 between HS transmissions".
> >> Doesn't *between HS transmissions" mean the command data is transmitted
> >> in HS, *not in LPM*, and clock lane enters LP-11 between them?
> >
> > Not necessarily. You can transmit command packets in high-speed mode,
> > but you don't have to. If you transmit packets in low power mode, then
>=20
> That would may why we are mentioning same comments repeatedly.
>=20
> In my case, host driver waits for the lane stop state (LP-11), and then
> disables HS clock to transmit command data in LPM. Of course, I'm not
> sure that yet it's correct way.

That's confusing. How can the lane go to LP-11 when the clock is still
running?

> In Tegra, What to do for it?

There are two bits in two separate registers for this:

	DSI_HOST_CONTROL:
	  bit 5: DSI_HIGH_SPEED_TRANS: DSI high speed transmission of
	                               packets
	    - 0 =3D LOW: low speed
	    - 1 =3D HIGH: high speed

	DSI_CONTROL:
	  bit 20: DSI_HS_CLK_CTRL: Control for the HS clock lane
	    - 0 =3D CONTINUOUS: HS clock is on all the time
	    - 1 =3D TX_ONLY: HS clock is only active during HS
	                   transmissions

So if the peripheral supports non-continuous mode of operation we set
the DSI_HS_CLK_CTRL bit, otherwise we clear it to make sure the clock
remains on all the time.

When a packet is to be transmitted in high speed mode, we set the
DSI_HIGH_SPEED_TRANS bit. For low power mode transmissions that bit is
cleared.

Thierry

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT5HYvAAoJEN0jrNd/PrOh4zoQAJTnjOBWPaiVR2ddHRgZk38F
BBeux2RnJzSDQi2+YWyqKM6TeV7Hbx0tk+Swf6YepvIKqjO/kqWFOaqQTveuTViD
6wMUh/nm+ZnZgwd8975XJADIY0uTOHXRskurrYJLqaS6B2cyRzPKaIMh6OmirVjt
lyEso1bBc5WaIePm7k6+iDJFYgBzD9W9rH4KVLj+2cn9ROFtTrhU/p0gHeTjZZEI
FMQYM4M7TT8wa1d5YnKoySBwrrzpQb2VISWLER2uwMvzWZ5KlmY3IouWYSKwcfTk
UOo03tN56McYYCTC1byz6M4hxfxqvjzhzqtNZRnU27FjGi66xCPxocMTI8ydRXd9
Sdh1c8F6S4cignv8RGmJpIE/wTF8liol01gcyPltOAFyLoYUzWtCsQxYC7odmYKC
UDZQzS2Eaevs/CM6etxwKL3tc+PUxw0EZlhCaOmCyUtvnlSUvZUs6Vgy2DTuzeDc
++GeoIAFT07ut4Y1BAZfcwSNP7SGQSDrJGxwBQ3Z9Fie41XOEtD9Wf7C+Flo7+Hr
l3xp85QDrJGZMhWCb11tKEu7oLfyYGj2MMIfGdmmDKxNyac46xwT/P57JuWGw8CC
UzsR9kbEwWWW0ppdRawifylHSp7C7pAmvEvXWs1r0H3RSZW6UZ1JNWWbaLzQwQyp
SksFpTs8aJWd6wityng1
=U5Bt
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--

--===============1468216242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1468216242==--
