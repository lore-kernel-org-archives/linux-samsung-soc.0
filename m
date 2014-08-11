From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Mon, 11 Aug 2014 09:24:17 +0200
Message-ID: <20140811072414.GA30762@ulmo>
References: <20140807110925.GA31594@ulmo.nvidia.com>
 <53E379A8.1020506@samsung.com>
 <20140807131713.GB1540@ulmo.nvidia.com>
 <53E38191.1050308@samsung.com>
 <20140807135500.GA27417@ulmo.nvidia.com>
 <53E42BCB.5090608@samsung.com>
 <20140808070311.GA5387@ulmo>
 <53E47E23.1050302@samsung.com>
 <20140808095507.GE15852@ulmo>
 <53E85259.2000204@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:37617 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752030AbaHKHYW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Aug 2014 03:24:22 -0400
Received: by mail-we0-f173.google.com with SMTP id q58so8219586wes.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Aug 2014 00:24:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <53E85259.2000204@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: treding@nvidia.com, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 02:19:21PM +0900, Inki Dae wrote:
> On 2014=EB=85=84 08=EC=9B=94 08=EC=9D=BC 18:55, Thierry Reding wrote:
> > On Fri, Aug 08, 2014 at 04:37:07PM +0900, Inki Dae wrote:
> >> On 2014=EB=85=84 08=EC=9B=94 08=EC=9D=BC 16:03, Thierry Reding wrote:
> >>> On Fri, Aug 08, 2014 at 10:45:47AM +0900, Inki Dae wrote:
> >>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 22:55, Thierry Reding wrote:
> >>>>> On Thu, Aug 07, 2014 at 10:39:29PM +0900, Inki Dae wrote:
> >>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 22:17, Thierry Reding wro=
te:
> >>>>>>> On Thu, Aug 07, 2014 at 10:05:44PM +0900, Inki Dae wrote:
> >>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 20:09, Thierry Reding w=
rote:
> >>>>>>>>> On Thu, Aug 07, 2014 at 07:49:03PM +0900, Inki Dae wrote:
> >>>>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 18:09, Thierry Reding=
 wrote:
> >>>>>>>>>>> On Thu, Aug 07, 2014 at 04:51:18PM +0900, Inki Dae wrote:
> >>>>>>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 15:58, Thierry Redi=
ng wrote:
> >>>>>>>>>>>>> On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wrote:
> >>>>>>>>>>>>>> 2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.reding@=
gmail.com>:
> >>>>>>>>>>> [...]
> >>>>>>>>>>>>>>> As far as I can tell non-continuous mode simply means tha=
t the host can
> >>>>>>>>>>>>>>> turn off the HS clock after a high-speed transmission. I =
think Andrzej
> >>>>>>>>>>>>>>> mentioned this already in another subthread, but this is =
an optional
> >>>>>>>>>>>>>>> mode that peripherals can support if they have extra circ=
uitry that
> >>>>>>>>>>>>>>> provides an internal clock. Peripherals that don't have s=
uch circuitry
> >>>>>>>>>>>>>>> may rely on the HS clock to perform in between transmissi=
ons and
> >>>>>>>>>>>>>>> therefore require the HS clock to be always on (continuou=
s mode). That's
> >>>>>>>>>>>>>>> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advert=
ises that the
> >>>>>>>>>>>>>>> peripheral supports non-continuous mode and therefore the=
 host can turn
> >>>>>>>>>>>>>>> the HS clock off after high-speed transmissions.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> What I don't make sure is this sentence. With
> >>>>>>>>>>>>>> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible op=
erations.
> >>>>>>>>>>>>>> One is,
> >>>>>>>>>>>>>> 1. host controller will generates signals if a bit of a re=
gister
> >>>>>>>>>>>>>> related to non-contiguous clock mode is set or unset.
> >>>>>>>>>>>>>> 2. And then video data is transmitted to panel in HS mode.
> >>>>>>>>>>>>>> 3. And then D-PHY detects LP-11 signal (positive and negat=
ive lane all
> >>>>>>>>>>>>>> are high).
> >>>>>>>>>>>>>> 4. And then D-PHY disables HS clock of host controller.
> >>>>>>>>>>>>>> 5. At this time, operation mode of host controller becomes=
 LPM.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Other is,
> >>>>>>>>>>>>>> 1. host controller will generates signals if a bit of a re=
gister
> >>>>>>>>>>>>>> related to non-contiguous clock mode is set or unset.
> >>>>>>>>>>>>>> 2. And then D-PHY detects LP-11 signal (positive and negat=
ive lane all
> >>>>>>>>>>>>>> are high).
> >>>>>>>>>>>>>> 3. And then video data is transmitted to panel in LPM.
> >>>>>>>>>>>>>> 4. At this time, operation mode of host controller becomes=
 LPM.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> It seems that you says latter case.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> No. High speed clock and low power mode are orthogonal. Non=
-continuous
> >>>>>>>>>>>>> mode simply means that the clock lane enters LP-11 between =
HS
> >>>>>>>>>>>>> transmissions (see 5.6 "Clock Management" of the DSI specif=
ication).
> >>>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> It seems that clock lane enters LP-11 regardless of HS clock=
 enabled if
> >>>>>>>>>>>> non-continous mode is used. Right?
> >>>>>>>>>>>
> >>>>>>>>>>> No, I think as long as HS clock is enabled the clock lane won=
't enter
> >>>>>>>>>>> LP-11. Non-continuous mode means that the controller can disa=
ble the HS
> >>>>>>>>>>> clock between HS transmissions. So in non-continuous mode the=
 clock lane
> >>>>>>>>>>> can enter LP-11 because the controller disables the HS clock.
> >>>>>>>>>>
> >>>>>>>>>> It makes me a little bit confusing. You said "if HS clock is e=
nabled,
> >>>>>>>>>> the the clock lane won't enter LP-11" But you said again "the =
clock lane
> >>>>>>>>>> can enter LP-11 because the controller disables the HS clock" =
What is
> >>>>>>>>>> the meaning?
> >>>>>>>>>
> >>>>>>>>> It means that if the HS clock is enabled, then the clock lane i=
s not in
> >>>>>>>>> LP-11. When the HS clock stops, then the clock lane enters LP-1=
1.
> >>>>>>>>>
> >>>>>>>>>>> In continuous mode, then the clock will never be disabled, he=
nce the
> >>>>>>>>>>> clock lane will never enter LP-11.
> >>>>>>>>>>>
> >>>>>>>>>>>> And also it seems that non-continous mode is different from =
LPM at all
> >>>>>>>>>>>> because with non-continuous mode, command data is transmitte=
d to panel
> >>>>>>>>>>>> in HS mode, but with LPM, command data is transmitted to pan=
el in LP
> >>>>>>>>>>>> mode. Also right?
> >>>>>>>>>>>
> >>>>>>>>>>> No. I think you can send command data to the peripheral in lo=
w power
> >>>>>>>>>>> mode in both continuous and non-continuous clock modes.
> >>>>>>>>>>>
> >>>>>>>>>>>> If so, shouldn't the host driver disable HS clock, in case o=
f LP mode,
> >>>>>>>>>>>> before the host driver transmits command data?
> >>>>>>>>>>>
> >>>>>>>>>>> No. If the peripheral doesn't support non-continuous mode, th=
en the HS
> >>>>>>>>>>> clock must never be turned off. On the other hand, if the per=
ipheral
> >>>>>>>>>>> supports non-continuous mode, then the DSI host should automa=
tically
> >>>>>>>>>>> disable the HS clock between high-speed transmissions. That m=
eans if a
> >>>>>>>>>>> packet is transmitted in low power mode the DSI host will not=
 be
> >>>>>>>>>>> transmitting in high-speed mode and therefore disable the HS =
clock.
> >>>>>>>>>>
> >>>>>>>>>> What is LPM you think? I thought LPM is LP-11 and HS clock dis=
abled. So
> >>>>>>>>>> for LPM transfer, lanes should be LP-11 state and also HS cloc=
k of the
> >>>>>>>>>> host controller should be disabled.
> >>>>>>>>>
> >>>>>>>>> No. I don't think any transmissions can happen when all lanes a=
re in
> >>>>>>>>> LP-11 state. The MIPI_DSI_MSG_USE_LPM is used to specify that a=
 packet
> >>>>>>>>> should be transmitted in low power mode (see LP Transmission in=
 2.1
> >>>>>>>>> "Definitions" of the MIPI DSI specification).
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Hm.. I see. I meant,
> >>>>>>>>
> >>>>>>>> if (flags & MIPI_DSI_MSG_USE_LPM)
> >>>>>>>>        disable HS clock <- required.
> >>>>>>>>
> >>>>>>>> transmit command data <- in LPM.
> >>>>>>>
> >>>>>>> No. Disabling the HS clock is not required for LPM mode. In fact =
if the
> >>>>>>> peripheral specifies that it doesn't support non-continuous mode =
then
> >>>>>>> the HS clock must *never* be disabled as long as the peripheral i=
s in
> >>>>>>> use.
> >>>>>>>
> >>>>>>> MIPI_DSI_MSG_USE_LPM and MIPI_DSI_CLOCK_NON_CONTINUOUS are unrela=
ted and
> >>>>>>> need to be considered separately.
> >>>>>>
> >>>>>> I mentioned already LPM and NON_CONTINUOUS are unrelated.
> >>>>>>
> >>>>>> It seems that you say the only way to transfer command data in LPM=
 is
> >>>>>> non-continuous clock mode.
> >>>>>
> >>>>> No, that's not what I'm saying.
> >>>>>
> >>>>>> However, you said and also the spec says, "Non-continuous mode sim=
ply
> >>>>>> means that the clock lane enters LP-11 between HS transmissions".
> >>>>>> Doesn't *between HS transmissions" mean the command data is transm=
itted
> >>>>>> in HS, *not in LPM*, and clock lane enters LP-11 between them?
> >>>>>
> >>>>> Not necessarily. You can transmit command packets in high-speed mod=
e,
> >>>>> but you don't have to. If you transmit packets in low power mode, t=
hen
> >>>>
> >>>> That would may why we are mentioning same comments repeatedly.
> >>>>
> >>>> In my case, host driver waits for the lane stop state (LP-11), and t=
hen
> >>>> disables HS clock to transmit command data in LPM. Of course, I'm not
> >>>> sure that yet it's correct way.
> >>>
> >>> That's confusing. How can the lane go to LP-11 when the clock is still
> >>> running?
> >>
> >> Actually, we are doing so. If the clock is still running then dsi driv=
er
> >> will wait for stop state of the clock and data lanes. Know that this is
> >> valid only when initial time - just one time since power up.
> >>
> >> 	/* Check clock and data lane state are stop state */
> >> 	timeout =3D 100;
> >> 	do {
> >> 		if (timeout-- =3D=3D 0) {
> >> 			dev_err(dsi->dev, "waiting for bus lanes timed out\n");
> >> 			return -EFAULT;
> >> 		}
> >>
> >> 		reg =3D readl(dsi->reg_base + DSIM_STATUS_REG);
> >> 		if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
> >> 		    !=3D DSIM_STOP_STATE_DAT(lanes_mask))
> >> 			continue;
> >> 	} while (!(reg & (DSIM_STOP_STATE_CLK | DSIM_TX_READY_HS_CLK)));
> >>
> >>>
> >>>> In Tegra, What to do for it?
> >>>
> >>> There are two bits in two separate registers for this:
> >>>
> >>> 	DSI_HOST_CONTROL:
> >>> 	  bit 5: DSI_HIGH_SPEED_TRANS: DSI high speed transmission of
> >>> 	                               packets
> >>> 	    - 0 =3D LOW: low speed
> >>> 	    - 1 =3D HIGH: high speed
> >>>
> >>> 	DSI_CONTROL:
> >>> 	  bit 20: DSI_HS_CLK_CTRL: Control for the HS clock lane
> >>> 	    - 0 =3D CONTINUOUS: HS clock is on all the time
> >>> 	    - 1 =3D TX_ONLY: HS clock is only active during HS
> >>> 	                   transmissions
> >>>
> >>> So if the peripheral supports non-continuous mode of operation we set
> >>> the DSI_HS_CLK_CTRL bit, otherwise we clear it to make sure the clock
> >>> remains on all the time.
> >>>
> >>> When a packet is to be transmitted in high speed mode, we set the
> >>> DSI_HIGH_SPEED_TRANS bit. For low power mode transmissions that bit is
> >>> cleared.
> >>
> >> That is exactly what I want. In your case, if you want to transmit
> >> command data in Low Power Mode in case of supporting non-continuous
> >> clock mode, then you would set DSI_HS_CLK_CTRL (TX_ONLY), and also you
> >> would clear DSI_HIGH_SPEED_TRANS (LOW).
> >>
> >> So I guess,
> >>
> >> if (flags & MIPI_DSI_MODE_NON_CONTINUOUS) {
> >>         disable DSI_HIGH_SPEED_TRANS;   <- LOW
> >>         enable DSI_HS_CLK_CTRL; <- TX_ONLY
> >> }
> >>
> >> transmit command data <- in LPM.
> >>
> >> However, what if the peripheral doesn't support non-continuous but want
> >> to transmit command data in LPM? Is that  impossible?
> >=20
> > The above is actually more like this:
> >=20
> > 	if ((flags & MIPI_DSI_MODE_NON_CONTINUOUS) =3D=3D 0)
> > 		clear DSI_HS_CLK_CTRL;
> > 	else
> > 		set DSI_HS_CLK_CTRL;
> >=20
> > 	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
> > 		clear DSI_HIGH_SPEED_TRANS;
> > 	else
> > 		set DSI_HIGH_SPEED_TRANS;
> >=20
> > So for peripherals that don't support non-continuous clock mode, this
> > will result in the following for low-power transmissions:
> >=20
> > 	clear DSI_HS_CLK_CTRL; /* HS clock always on */
> > 	clear DSI_HIGH_SPEED_TRANS;
>=20
> Right, then how host driver should check it if peripheral doesn't
> support non-continuous clock mode? Or how the peripheral should notify
> it to host driver? It would need a new flag instead of
> MIPI_DSI_MODE_NON_CONTINUOUS.

MIPI_DSI_MODE_NON_CONTINUOUS is exactly the flag that devices need to
set to signal that they support non-continuous mode. If devices don't
have that set, then the controller should always provide the HS clock.

So, if MIPI_DSI_MODE_NON_CONTINUOUS is *not* set, then the peripheral
does *not* support non-continuous mode.

Thierry

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT6G+eAAoJEN0jrNd/PrOhXwYP/0WmcJE9nYeJuBXQRpldxJIG
28TjyXC7RdP6pAd1hkcg5T2fnf3b0YbxOpsdNmzSuzJyK96FKMKnac766j2WKlDx
wXMh1C5qka86aOiLVOVpnHh4tvYjaOoGDV8eAzmTjbtwtClsIW6UhVuKtShlbLwG
5+tUn1zsq0RpoYzPo6yOGmXxjQr8yo254/GxbIKuNL0YD3p6JQ6SJ92ZJxCXWraR
U+Pj7IEQWqKhD6BVtwzKOEIZKK6pZuSQP9zPmtyuE9P2Zr4cI3v5dnRURgvYeYc5
T0V03ACCS9lDUItvwU/F2w5i0oWmywNipnKdrcDGM6N3juJERdV0S8wJGzNwXb9q
cFRwtezjkiBDCZyU30MeQytn6v85jmAkY9YwNh2hJDd6b+wQEM5RpMLntEUh8kmf
WSkGl1Nz0rmSMfPK/HACf+V/xA//bxdmu+asxRFCmaHHhTDBBUrfyNidkFmPjM/f
u2QdfFyJ+gQUJ41p5CApmQupPMAeKNwbvmn8ZhNCAV2k4dWXh0iX5UfMZsjSqduA
CyUuCwp+2qey4lbpnIFGHp7MdzxgB2nL8HxbbnZ6eO+ywldgcuSKG9lZn1KT+Qbt
2Xjd3Dmu2rZc7U365yD30Dgibrz8ZG5Do+qIYmeDoymvI4WtFLtx4UWyALgqrof1
4bH01qNftEzANEsCaTnq
=rwoL
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
