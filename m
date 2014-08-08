From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Fri, 8 Aug 2014 11:55:08 +0200
Message-ID: <20140808095507.GE15852@ulmo>
References: <20140807090859.GD13315@ulmo.nvidia.com>
 <53E3599F.3020301@samsung.com>
 <20140807110925.GA31594@ulmo.nvidia.com>
 <53E379A8.1020506@samsung.com>
 <20140807131713.GB1540@ulmo.nvidia.com>
 <53E38191.1050308@samsung.com>
 <20140807135500.GA27417@ulmo.nvidia.com>
 <53E42BCB.5090608@samsung.com>
 <20140808070311.GA5387@ulmo>
 <53E47E23.1050302@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZRyEpB+iJ+qUx0kp"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:39760 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755618AbaHHJzM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Aug 2014 05:55:12 -0400
Received: by mail-wi0-f170.google.com with SMTP id f8so2281092wiw.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Aug 2014 02:55:11 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <53E47E23.1050302@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: treding@nvidia.com, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org


--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2014 at 04:37:07PM +0900, Inki Dae wrote:
> On 2014=EB=85=84 08=EC=9B=94 08=EC=9D=BC 16:03, Thierry Reding wrote:
> > On Fri, Aug 08, 2014 at 10:45:47AM +0900, Inki Dae wrote:
> >> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 22:55, Thierry Reding wrote:
> >>> On Thu, Aug 07, 2014 at 10:39:29PM +0900, Inki Dae wrote:
> >>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 22:17, Thierry Reding wrote:
> >>>>> On Thu, Aug 07, 2014 at 10:05:44PM +0900, Inki Dae wrote:
> >>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 20:09, Thierry Reding wro=
te:
> >>>>>>> On Thu, Aug 07, 2014 at 07:49:03PM +0900, Inki Dae wrote:
> >>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 18:09, Thierry Reding w=
rote:
> >>>>>>>>> On Thu, Aug 07, 2014 at 04:51:18PM +0900, Inki Dae wrote:
> >>>>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 15:58, Thierry Reding=
 wrote:
> >>>>>>>>>>> On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wrote:
> >>>>>>>>>>>> 2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.reding@gm=
ail.com>:
> >>>>>>>>> [...]
> >>>>>>>>>>>>> As far as I can tell non-continuous mode simply means that =
the host can
> >>>>>>>>>>>>> turn off the HS clock after a high-speed transmission. I th=
ink Andrzej
> >>>>>>>>>>>>> mentioned this already in another subthread, but this is an=
 optional
> >>>>>>>>>>>>> mode that peripherals can support if they have extra circui=
try that
> >>>>>>>>>>>>> provides an internal clock. Peripherals that don't have suc=
h circuitry
> >>>>>>>>>>>>> may rely on the HS clock to perform in between transmission=
s and
> >>>>>>>>>>>>> therefore require the HS clock to be always on (continuous =
mode). That's
> >>>>>>>>>>>>> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advertis=
es that the
> >>>>>>>>>>>>> peripheral supports non-continuous mode and therefore the h=
ost can turn
> >>>>>>>>>>>>> the HS clock off after high-speed transmissions.
> >>>>>>>>>>>>
> >>>>>>>>>>>> What I don't make sure is this sentence. With
> >>>>>>>>>>>> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible oper=
ations.
> >>>>>>>>>>>> One is,
> >>>>>>>>>>>> 1. host controller will generates signals if a bit of a regi=
ster
> >>>>>>>>>>>> related to non-contiguous clock mode is set or unset.
> >>>>>>>>>>>> 2. And then video data is transmitted to panel in HS mode.
> >>>>>>>>>>>> 3. And then D-PHY detects LP-11 signal (positive and negativ=
e lane all
> >>>>>>>>>>>> are high).
> >>>>>>>>>>>> 4. And then D-PHY disables HS clock of host controller.
> >>>>>>>>>>>> 5. At this time, operation mode of host controller becomes L=
PM.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Other is,
> >>>>>>>>>>>> 1. host controller will generates signals if a bit of a regi=
ster
> >>>>>>>>>>>> related to non-contiguous clock mode is set or unset.
> >>>>>>>>>>>> 2. And then D-PHY detects LP-11 signal (positive and negativ=
e lane all
> >>>>>>>>>>>> are high).
> >>>>>>>>>>>> 3. And then video data is transmitted to panel in LPM.
> >>>>>>>>>>>> 4. At this time, operation mode of host controller becomes L=
PM.
> >>>>>>>>>>>>
> >>>>>>>>>>>> It seems that you says latter case.
> >>>>>>>>>>>
> >>>>>>>>>>> No. High speed clock and low power mode are orthogonal. Non-c=
ontinuous
> >>>>>>>>>>> mode simply means that the clock lane enters LP-11 between HS
> >>>>>>>>>>> transmissions (see 5.6 "Clock Management" of the DSI specific=
ation).
> >>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> It seems that clock lane enters LP-11 regardless of HS clock e=
nabled if
> >>>>>>>>>> non-continous mode is used. Right?
> >>>>>>>>>
> >>>>>>>>> No, I think as long as HS clock is enabled the clock lane won't=
 enter
> >>>>>>>>> LP-11. Non-continuous mode means that the controller can disabl=
e the HS
> >>>>>>>>> clock between HS transmissions. So in non-continuous mode the c=
lock lane
> >>>>>>>>> can enter LP-11 because the controller disables the HS clock.
> >>>>>>>>
> >>>>>>>> It makes me a little bit confusing. You said "if HS clock is ena=
bled,
> >>>>>>>> the the clock lane won't enter LP-11" But you said again "the cl=
ock lane
> >>>>>>>> can enter LP-11 because the controller disables the HS clock" Wh=
at is
> >>>>>>>> the meaning?
> >>>>>>>
> >>>>>>> It means that if the HS clock is enabled, then the clock lane is =
not in
> >>>>>>> LP-11. When the HS clock stops, then the clock lane enters LP-11.
> >>>>>>>
> >>>>>>>>> In continuous mode, then the clock will never be disabled, henc=
e the
> >>>>>>>>> clock lane will never enter LP-11.
> >>>>>>>>>
> >>>>>>>>>> And also it seems that non-continous mode is different from LP=
M at all
> >>>>>>>>>> because with non-continuous mode, command data is transmitted =
to panel
> >>>>>>>>>> in HS mode, but with LPM, command data is transmitted to panel=
 in LP
> >>>>>>>>>> mode. Also right?
> >>>>>>>>>
> >>>>>>>>> No. I think you can send command data to the peripheral in low =
power
> >>>>>>>>> mode in both continuous and non-continuous clock modes.
> >>>>>>>>>
> >>>>>>>>>> If so, shouldn't the host driver disable HS clock, in case of =
LP mode,
> >>>>>>>>>> before the host driver transmits command data?
> >>>>>>>>>
> >>>>>>>>> No. If the peripheral doesn't support non-continuous mode, then=
 the HS
> >>>>>>>>> clock must never be turned off. On the other hand, if the perip=
heral
> >>>>>>>>> supports non-continuous mode, then the DSI host should automati=
cally
> >>>>>>>>> disable the HS clock between high-speed transmissions. That mea=
ns if a
> >>>>>>>>> packet is transmitted in low power mode the DSI host will not be
> >>>>>>>>> transmitting in high-speed mode and therefore disable the HS cl=
ock.
> >>>>>>>>
> >>>>>>>> What is LPM you think? I thought LPM is LP-11 and HS clock disab=
led. So
> >>>>>>>> for LPM transfer, lanes should be LP-11 state and also HS clock =
of the
> >>>>>>>> host controller should be disabled.
> >>>>>>>
> >>>>>>> No. I don't think any transmissions can happen when all lanes are=
 in
> >>>>>>> LP-11 state. The MIPI_DSI_MSG_USE_LPM is used to specify that a p=
acket
> >>>>>>> should be transmitted in low power mode (see LP Transmission in 2=
=2E1
> >>>>>>> "Definitions" of the MIPI DSI specification).
> >>>>>>>
> >>>>>>
> >>>>>> Hm.. I see. I meant,
> >>>>>>
> >>>>>> if (flags & MIPI_DSI_MSG_USE_LPM)
> >>>>>>        disable HS clock <- required.
> >>>>>>
> >>>>>> transmit command data <- in LPM.
> >>>>>
> >>>>> No. Disabling the HS clock is not required for LPM mode. In fact if=
 the
> >>>>> peripheral specifies that it doesn't support non-continuous mode th=
en
> >>>>> the HS clock must *never* be disabled as long as the peripheral is =
in
> >>>>> use.
> >>>>>
> >>>>> MIPI_DSI_MSG_USE_LPM and MIPI_DSI_CLOCK_NON_CONTINUOUS are unrelate=
d and
> >>>>> need to be considered separately.
> >>>>
> >>>> I mentioned already LPM and NON_CONTINUOUS are unrelated.
> >>>>
> >>>> It seems that you say the only way to transfer command data in LPM is
> >>>> non-continuous clock mode.
> >>>
> >>> No, that's not what I'm saying.
> >>>
> >>>> However, you said and also the spec says, "Non-continuous mode simply
> >>>> means that the clock lane enters LP-11 between HS transmissions".
> >>>> Doesn't *between HS transmissions" mean the command data is transmit=
ted
> >>>> in HS, *not in LPM*, and clock lane enters LP-11 between them?
> >>>
> >>> Not necessarily. You can transmit command packets in high-speed mode,
> >>> but you don't have to. If you transmit packets in low power mode, then
> >>
> >> That would may why we are mentioning same comments repeatedly.
> >>
> >> In my case, host driver waits for the lane stop state (LP-11), and then
> >> disables HS clock to transmit command data in LPM. Of course, I'm not
> >> sure that yet it's correct way.
> >=20
> > That's confusing. How can the lane go to LP-11 when the clock is still
> > running?
>=20
> Actually, we are doing so. If the clock is still running then dsi driver
> will wait for stop state of the clock and data lanes. Know that this is
> valid only when initial time - just one time since power up.
>=20
> 	/* Check clock and data lane state are stop state */
> 	timeout =3D 100;
> 	do {
> 		if (timeout-- =3D=3D 0) {
> 			dev_err(dsi->dev, "waiting for bus lanes timed out\n");
> 			return -EFAULT;
> 		}
>=20
> 		reg =3D readl(dsi->reg_base + DSIM_STATUS_REG);
> 		if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
> 		    !=3D DSIM_STOP_STATE_DAT(lanes_mask))
> 			continue;
> 	} while (!(reg & (DSIM_STOP_STATE_CLK | DSIM_TX_READY_HS_CLK)));
>=20
> >=20
> >> In Tegra, What to do for it?
> >=20
> > There are two bits in two separate registers for this:
> >=20
> > 	DSI_HOST_CONTROL:
> > 	  bit 5: DSI_HIGH_SPEED_TRANS: DSI high speed transmission of
> > 	                               packets
> > 	    - 0 =3D LOW: low speed
> > 	    - 1 =3D HIGH: high speed
> >=20
> > 	DSI_CONTROL:
> > 	  bit 20: DSI_HS_CLK_CTRL: Control for the HS clock lane
> > 	    - 0 =3D CONTINUOUS: HS clock is on all the time
> > 	    - 1 =3D TX_ONLY: HS clock is only active during HS
> > 	                   transmissions
> >=20
> > So if the peripheral supports non-continuous mode of operation we set
> > the DSI_HS_CLK_CTRL bit, otherwise we clear it to make sure the clock
> > remains on all the time.
> >
> > When a packet is to be transmitted in high speed mode, we set the
> > DSI_HIGH_SPEED_TRANS bit. For low power mode transmissions that bit is
> > cleared.
>=20
> That is exactly what I want. In your case, if you want to transmit
> command data in Low Power Mode in case of supporting non-continuous
> clock mode, then you would set DSI_HS_CLK_CTRL (TX_ONLY), and also you
> would clear DSI_HIGH_SPEED_TRANS (LOW).
>=20
> So I guess,
>=20
> if (flags & MIPI_DSI_MODE_NON_CONTINUOUS) {
>         disable DSI_HIGH_SPEED_TRANS;   <- LOW
>         enable DSI_HS_CLK_CTRL; <- TX_ONLY
> }
>=20
> transmit command data <- in LPM.
>=20
> However, what if the peripheral doesn't support non-continuous but want
> to transmit command data in LPM? Is that  impossible?

The above is actually more like this:

	if ((flags & MIPI_DSI_MODE_NON_CONTINUOUS) =3D=3D 0)
		clear DSI_HS_CLK_CTRL;
	else
		set DSI_HS_CLK_CTRL;

	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
		clear DSI_HIGH_SPEED_TRANS;
	else
		set DSI_HIGH_SPEED_TRANS;

So for peripherals that don't support non-continuous clock mode, this
will result in the following for low-power transmissions:

	clear DSI_HS_CLK_CTRL; /* HS clock always on */
	clear DSI_HIGH_SPEED_TRANS;

Thierry

--ZRyEpB+iJ+qUx0kp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT5J57AAoJEN0jrNd/PrOhieMP/016izizAnv8oxBKvwkjzld+
TirXaZ+4GECimvKyZG3+1S0K162Vj2x70IrQYmhkqMLqRBQSRsCZF23mRk2HmiW0
gn4mQo3hn8vXR2CbqTXxFknj6+j+GbibuJK+OPD+0Fgh5eX7+F5IM5sp1zqP32JE
M2f+4Sc1TkUK5zftThLfVo0ymXPqLV9rlMzGMX2Kp/8x5UeJAN+WkESbIvFEFBuW
3waToq9kQKE5Sxa5EGB82/G5V93Oo7+jBc8JcA2aWTVPxDhgRyzanWjr/+6qDXUO
TUc9RY9VHLXIWB+lENShUJ0rWvZrp7Vij1DiP4nlq14S1awLlDiFjqqXla8a67EF
IoPYtEjE+2lEOnNlhdk7FKh4PisiOay2T4aJ+LDJdXCE43gYvRmMsK+YbYtXfHKS
T0mFTK7xdALnD16K1pbkysjyN6+VckQfe8j8+urYMo5tODt0bFF4KcMPIyM+6oYP
u/XRfxgV2kr4cH3Jm31wm/srtp3S/JH8PPWuUAqVSW//OX+zRGiH9bTCEP9DTO5j
YBcA/amZ1FeUqZ+muFQtlADvi2/Dau9d0u+R8eMGjiTutJ68VxjZOaSSnilDsuEz
BytPOkQgLOCgXVYBbzZQ1ZNZvLV03KuhdpwNVzMbVCuNiabFbW/msfyuWVdVkrtO
4oeVPKRhkz4f18zUAPbf
=GgFN
-----END PGP SIGNATURE-----

--ZRyEpB+iJ+qUx0kp--
