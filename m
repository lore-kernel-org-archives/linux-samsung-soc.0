From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 4/5] regulator: tps65090: Allow setting the
 overcurrent wait time
Date: Thu, 1 May 2014 11:49:41 -0700
Message-ID: <20140501184941.GV3245@sirena.org.uk>
References: <1397689950-1568-1-git-send-email-dianders@chromium.org>
 <1397689950-1568-5-git-send-email-dianders@chromium.org>
 <20140423115102.GO21613@lee--X1>
 <CAD=FV=WN4hVibiK_8+mpNfO7UQnd35ZT9EXA9fuw-mnBzzb1cA@mail.gmail.com>
 <CAOesGMiMiqk1mKcVF8SwePhUS-8cAmM3Ut3f+qRvjz27iw7CTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1c4XeR3HBwmMPD2z"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54360 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751881AbaEASuX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 14:50:23 -0400
Content-Disposition: inline
In-Reply-To: <CAOesGMiMiqk1mKcVF8SwePhUS-8cAmM3Ut3f+qRvjz27iw7CTA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Doug Anderson <dianders@chromium.org>, Lee Jones <lee.jones@linaro.org>, Anton Vorontsov <anton@enomsg.org>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Simon Glass <sjg@chromium.org>, Michael Spang <spang@chromium.org>, Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@wwwdot>


--1c4XeR3HBwmMPD2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 01, 2014 at 11:17:58AM -0700, Olof Johansson wrote:

> so it looks like tps_pdata is NULL. Should likely be a check for it?

Yes, just about to post a fix.

--1c4XeR3HBwmMPD2z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTYpc+AAoJELSic+t+oim9tvEP/2SdEta4yW18xpsPeiM2ojoD
bGPS7a3dmSTyl2Chw9qz34wKfgwTkes0utnyEhYV/7eANkfUowFTwpKWgYnENGwY
jXdrS49N9Hp+ra7S2Ugk65woWYZYVqVhH5KyoSU4tJZNNn7NdxYr9RVuOzZzIfUW
gs+tw2S3f5tD18Zu8cuqnDzq4iVYYzsShNfHwVAyrawMfva9iKLeUA4nHlGX4G28
qL77d7j6kdOR/BHA5r4wkbbSj/7piNbgqI0vgD7icW9ttGWyLaCie1XFlq0UK3De
URIyfY4RUvIwSAO3pxr+gGF/Yg7ROkbhC5urbDTlO0mNOHpYum5FiDYmmp/5tve4
efPxwfHZfnEBChO0wuoiOHlekuvE6vB4XRXpdDFmgkXJPn9bk89SLL5MryCPt+XA
UIaRllv87TdRyzdzDhYjM40Ha1D1n1krlta2pGChCt/nL/tzFjWASx3Koa4ONKpB
OYe0KBWmzqLSqVMd3BNVTYd++PEstqZ12I78Pcapi2e2yWQ5xz8Q6wgdG6W+Ormj
vTf26pK+YkeS0nzZVckLvfVXQSdOe8jJ87O420pYZh/YIkLSCJxPvOyE4hYWqi98
qqZv48Sd3ADxaqn/GD5dLo20M9F/VtpWBHp97+vDC5cjbedp/8ET9OLNFlu6+WZE
XwM0c8SKw3ww0M/6bJTt
=KJbg
-----END PGP SIGNATURE-----

--1c4XeR3HBwmMPD2z--
