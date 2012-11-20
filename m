From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/4] i2c-s3c2410: use exponential back off while polling
 for bus idle
Date: Tue, 20 Nov 2012 18:10:59 +0900
Message-ID: <20121120091056.GZ10560@opensource.wolfsonmicro.com>
References: <1352981613-2098-1-git-send-email-ch.naveen@samsung.com>
 <1352981613-2098-4-git-send-email-ch.naveen@samsung.com>
 <20121120044859.GA10154@sirena.org.uk>
 <CAGS+omCKm+aN9ZXApmQJh1OrST-t2sA8WP7NyDOzKnv-xqJ5vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UNifc18z8z6e1QHx"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGS+omCKm+aN9ZXApmQJh1OrST-t2sA8WP7NyDOzKnv-xqJ5vg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux I2C <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--UNifc18z8z6e1QHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 20, 2012 at 04:57:16PM +0800, Daniel Kurtz wrote:
> On Tue, Nov 20, 2012 at 12:49 PM, Mark Brown

> > On the hardware I was using when I wrote the original code here we were
> > hitting 1-2 spins often enough to be interesting - starting off with a
> > direct busy wait was definitely useful when doing large batches of I/O,
> > especially compared to sleeps which might cause us to schedule.

> We check the status first to avoid any sleep()/schedule() in the case,
> that the CPU is slower than I2C transaction.

Right, but this only works if we hit this on the very first spin.

> Remember, this loop only happens after the event_wait loop has been
> woken up by the i2c irq.

Duh.

> Since you are talking about hitting a tiny window of time at some
> arbitrary point after an irq, the CPU time to this point & I2C
> finishing would have to be very precisely aligned for the 1-2 loops
> (at CPU clock rate) to matter.

On some systems that can happen enormously reliably, finger in the air
it's your fast case on the A15s you're playing with scaled down to a
much slower CPU.  The 20 spins I was setting the loop to was a massive
overestimate for conservativism but more than 1 was common enough, IIRC
spinning 5 times would have covered essentially everything.

--UNifc18z8z6e1QHx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQq0j5AAoJELSic+t+oim9H0IP/Ah114xBBRVH5YoabeJ+RLYD
IHiSPlOgDnVGLrJ7SuhbmnR9bd/ZyXxprOmr1au/0dGJicEw+YD2/MRdN6/N5Doc
G+KF4SoaMQeI5kNjPT2D4/WkpYdO0GfqRUu9uscCB4QMyRNYdsaEOcYHRPj2KBuJ
iG09k/wlfvfw13lU1EgCbPA1tVekdFvTVMJ2hgqWGJ10M5z/vPvmson6maMeM5OE
A8G9VHk9Y6VoY9e3SJ0Y4BzSnhsxTzp3gsmh6lM1tJPahBvU9yOFZpGUSqaQOVUe
J0hK8vhDEy5jVzwJFMgUJMLtxLzB2wuzYl8jepMSAjwXmA2wp6pvgND/1/prN/VN
jFBEhLcKQu2Dd0bnYe20tVYHuYOECDVMaeLAVO+s7C2gPoV35kuau0YwS2IRxJcd
lkfVYTvTDU5hdx/D4QvLOxGkC41CEfrzPk+XeHOdwTegsL3Fgayuci6F7Ss8zxun
/mf3NFQG5mFIli/SM/gKagWAPk7ZRa/NGXMkJvNlGxRzy+rS4NKqSjx1WgL/C8Qy
fclN0qpZoT3Z2QuBYFyuf1GhUJoOSIG3EZXC7Oxrg+EYdOq/foEFUlK82X7EeTA0
ZcDwdpuyvySrOLeHDUqQow8sYvh4OHkg8kbZ4BSVKkwYKjR62yikaG6BqTv2w5jk
Gr+U9n3y5/lINI5YYkba
=5bGD
-----END PGP SIGNATURE-----

--UNifc18z8z6e1QHx--
