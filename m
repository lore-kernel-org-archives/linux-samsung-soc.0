From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: SAMSUNG: Add keypad device support
Date: Sun, 30 May 2010 01:52:24 -0700
Message-ID: <20100530085224.GA28188@core.coreip.homeip.net>
References: <1275188784-23395-1-git-send-email-jy0922.shim@samsung.com>
 <201005300542.37715.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f204.google.com ([209.85.222.204]:61587 "EHLO
	mail-pz0-f204.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751502Ab0E3Iwa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 30 May 2010 04:52:30 -0400
Content-Disposition: inline
In-Reply-To: <201005300542.37715.marek.vasut@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, kyungmin.park@samsung.com

On Sun, May 30, 2010 at 05:42:37AM +0200, Marek Vasut wrote:
> Dne Ne 30. kv=C4=9Btna 2010 05:06:20 Joonyoung Shim napsal(a):
> > + */
> > +struct samsung_kp_platdata {
> > +	const struct matrix_keymap_data	*keymap_data;
> > +	unsigned int		rows;
> > +	unsigned int		cols;
> > +	unsigned int		rep;
>=20
> I don't know, maybe using uint32_t here? On ARM, it doesn't matter so=
 far as int=20
> will be always 32bit, but maybe we should just type the variables wel=
l ?
>=20
> Guys, what do you think ?
>=20

I think unsigned int is fine, we do not care about particular size, jus=
t
need "big enough". I'd change 'rep' to be a boolean though.

Thanks.

--=20
Dmitry
