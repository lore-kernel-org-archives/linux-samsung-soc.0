From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 1/2] usb: dwc2/gadget: add mutex to serialize
 init/deinit calls
Date: Fri, 14 Nov 2014 13:51:41 -0600
Message-ID: <20141114195141.GB16388@saruman>
References: <54535F82.7020406@samsung.com>
 <1414750354-19571-1-git-send-email-m.szyprowski@samsung.com>
 <A2CA0424C0A6F04399FB9E1CD98E0304844E7FDD@US01WEMBX2.internal.synopsys.com>
 <5464CBA5.9050702@samsung.com>
 <A2CA0424C0A6F04399FB9E1CD98E0304844EB636@US01WEMBX2.internal.synopsys.com>
 <5465C91C.7050409@samsung.com>
 <A2CA0424C0A6F04399FB9E1CD98E0304844EBC36@US01WEMBX2.internal.synopsys.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:33858 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753273AbaKNTvW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Nov 2014 14:51:22 -0500
Content-Disposition: inline
In-Reply-To: <A2CA0424C0A6F04399FB9E1CD98E0304844EBC36@US01WEMBX2.internal.synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Cc: Felipe Balbi <balbi@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 14, 2014 at 07:43:23PM +0000, Paul Zimmerman wrote:
> > >>>> @@ -3699,6 +3717,8 @@ static int s3c_hsotg_resume(struct platform_=
device *pdev)
> > >>>>    	s3c_hsotg_core_connect(hsotg);
> > >>>>    	spin_unlock_irqrestore(&hsotg->lock, flags);
> > >>>>
> > >>>> +	mutex_unlock(&hsotg->init_mutex);
> > >>>> +
> > >>>>    	return ret;
> > >>>>    }
> > >>>>
> > >>> Hmm. I can't find any other UDC driver that uses a mutex in its
> > >>> suspend/resume functions. Can you explain why this is needed only
> > >>> for dwc2?
> > >> I've posted this version because I thought you were not convinced th=
at
> > >> the patch
> > >> "usb: dwc2/gadget: rework suspend/resume code to correctly restore
> > >> gadget state"
> > >> can add code for initialization and deinitialization in suspend/resu=
me
> > >> paths.
> > > My problem with that patch was that you were checking the ->enabled
> > > flag outside of the spinlock. To address that, you only need to move
> > > the check inside of the spinlock. I don't see why a mutex is needed.
> >=20
> > It is not that simple. I can add spin_lock() before checking enabled,
> > but then
> > I would need to spin_unlock() to call regulator_bulk_enable() and
> > phy_enable(),
> > because both cannot be called from atomic context. This means that the
> > spinlock
> > in such case will not protect anything and is simply useless.
>=20
> Ah, OK. So you're using the mutex instead of the ->enabled flag that you
> proposed in the "rework suspend/resume code" patch. So this patch is a
> replacement for that one. Somehow I was thinking this patch was on top
> of that one.
>=20
> So I guess this is OK, but I would like to get Felipe's opinion about
> it before we apply this.
>=20
> Felipe?

I can't think of a better way, I'm afraid :-(

--=20
balbi

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUZl1NAAoJEIaOsuA1yqRER4IP/0dYHAR8MdhrCHQ39PCf3pKl
F9n0FDO0rHa451wONaIvfTeTvOj8hrRofYe5YvP0bjH8N29Vcii2cwLWDdOrCQ9V
8f4EwzqpUN+89ZU2LYkzbe5GoecC7bU3UQDGpHBBGnkG0Fi/rNahNw9yFDqVkKp5
KXG78O6XOwd/5rvVUmnjKeHbh3QBuDcYpq0ANwLWBRTI5RfpPMnBk2Kh/Thmfaoi
wI2wjYh9WuxqkGq3xKeYyLe90DBYZHS2c6hzpK154VSaBCrlN4PImBHCDWBqgoDz
w0f4Oe6hU6Jo78PYXvO67JF5j/s/yg6bSbbKNgtexvVHiBzfyVzhwXMocgrP6+M8
dk17X/33dkAB0CTwODMW3+YgOpF7IKokAgNhG1oZKjbYNJLkv4qNBo9orBaBF+6I
IsimpKANzVid4W95/kmFdMuNiPaW0JwLuClSnC56wYNAMrCFpML2BsDegzhuq6AO
NfEICYAh5s1N0QdsU4WCnMRDwpHDVTtweNylmB93UPRfRL8t3hqp7gAJVdCdBfzK
3Jm5ItPpgABZtQHLbSuVi6gvwYRWNZIl1IcXweqlNE+6STOHNam15nCWtN5EDVdk
+ttuoFW3GF1GiZIK07mX2KbFtE/AA78lDBjs8lE0An5gEE3/mXegreK5GHWDjYZa
HV83icBuRUPB2p2X7DQS
=joP2
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
