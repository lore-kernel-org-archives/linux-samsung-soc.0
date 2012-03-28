From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: Samsung: Make PM_GENERIC_DOMAINS config depend on
 CONFIG_PM
Date: Wed, 28 Mar 2012 12:42:08 +0100
Message-ID: <20120328114208.GP3232@opensource.wolfsonmicro.com>
References: <1332843404-25476-1-git-send-email-thomas.ab@samsung.com>
 <20120328105122.GF3232@opensource.wolfsonmicro.com>
 <CAJuYYwQgZqN6nguddjS6bjLhx_ZhUZ5AfcrSAKBa7Ft-Bn6wPQ@mail.gmail.com>
 <20120328113419.GM3232@opensource.wolfsonmicro.com>
 <CAJuYYwRR6eo8LruyOtyi3Sp96jydRvPFhMnbF6wfk55eM-zjbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G+DT6X5ssgZ56VG3"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43866 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932285Ab2C1Lmf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 07:42:35 -0400
Content-Disposition: inline
In-Reply-To: <CAJuYYwRR6eo8LruyOtyi3Sp96jydRvPFhMnbF6wfk55eM-zjbw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org


--G+DT6X5ssgZ56VG3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 28, 2012 at 05:07:03PM +0530, Thomas Abraham wrote:
> On 28 March 2012 17:04, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:

> > Right, this does seem like something which it'd be better to handle
> > more gracefully in the PM core.

> Ok. Selecting PM_GENERIC_DOMAINS without checking for dependency on PM
> did not seem correct.

I dunno, perhaps the PM guys will disagree but it seems like if the
idiomatic way to use this is to select it the API ought to cope with
being selected when half enabled.

As I've said before I'm in favour of just making CONFIG_PM non-optional,
I'm not convinced there's much meaningful use case for disabling it.

--G+DT6X5ssgZ56VG3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPcvkHAAoJEBus8iNuMP3dE6UP/2ryaH/1YEOyyQ8nAgdlLTho
qHshGm+5S9jNY6aGdXcBQSvr+dyGCL7PxLY4iuIWLmJkOzatMUmfdyqDHHp/JIGu
/ZbkLYBc5pfMxSq0PiR5ZGnwEr9UAlfDwjaK00Pr+biDSKFwrioZD2OTBf3l4M5E
hT9HQh/vmehEV58je/gECEJKrglDqeoraeqOAG877JXWXjqUZFKWT8nS6iMRuH15
cGTWA9FKV/nNIUg8wocbBV2az3hsMJrDXIyBI2uPV+hIUCvDf8N/sVSwhDhpq+jl
wY5acjRv0W7gty7vV1s0UZHNZldKQU1E6Le4skYpoR8oc/VhPlx61ZwqdVVcDJEf
o2DeXFYD9mwbWNqnF4C4vid5v1XkNcb4+ueIyFZQVZuoCAjpHzXT44AZ61zuwAQn
cYYYHWsKMrxGm2XTzwpkeaKFEiIZqqowizDKsswf0k+p0kZ2nXAhg6h4r2RqSjYG
Ak9un+EX5fuu8gM7pKNCMr3EHsvMKRsS6DUeJE6mtNm60kw/gcXOE+8UskUxvMdg
qgh94ID6uMRfBVEjjv9GKMnZ3UN/X2Jsn3vJAaAksAwokkNHBkqUcNTawNq2tpGO
BmcRYpJ3pOLWx5Ijf9AsvnlKLRFVF0rTHBgGWBTLxOFMF1xMGQ1bT74ee9FBdzdh
fK0oLXKcYgGTmT/uczCt
=0Msg
-----END PGP SIGNATURE-----

--G+DT6X5ssgZ56VG3--
