From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: s3c24xx pinctrl help
Date: Fri, 08 Mar 2013 19:57:09 +0100
Message-ID: <2034100.l6yoVjE7uo@flatron>
References: <201303081538.04877.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:50350 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759647Ab3CHS5M convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Mar 2013 13:57:12 -0500
Received: by mail-wg0-f50.google.com with SMTP id es5so2939975wgb.29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Mar 2013 10:57:10 -0800 (PST)
In-Reply-To: <201303081538.04877.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org

Hi Heiko,

On Friday 08 of March 2013 15:38:04 Heiko St=FCbner wrote:
> Hi Thomas,
>=20
> taking you up on your offer of helping, I would be cool if you could
> simply give me a push in the right direction :-) .
>=20
>=20
> From what I've seen so far, the bank handling itself is very similar
> between exynos and s3c24xx as the underlying structures already handl=
e
> multiple widths of the register contents. More interesting is the ein=
t
> handling around which I couldn't wrap my head yet.
>=20
> The basic structure is again similar with special eint registers, but
> adds some quirks. EINT banks are gpf (8 eints) and gpg (8 or 16 eints
> depending on the SoC).
>=20
> The current way on Exynos seems to be to mark the offset in the eint
> register and attach an irq_domain to the bank, which gets mapped to t=
he
> eints starting at the offset. The eints seem to have a parent interru=
pt
> that is provided via the dt.
>=20
> On the S3C24xx the gpg bank is doing this similar but gpf is very
> strange.
>=20
> The first half of the bank (gpf0 to gpf3) is not handled in eintpend
> registers but in the main interrupt controller (bits 0 to 3), while t=
he
> second half of gpf is handled in eintpend. The new interrupt
> declaration might show this better, which can be found at [0].
>=20
> An exception is the s3c2412 which adds still another quirk where each
> interrupt of gpf0 to gpf3 is represented in both the normal intc and
> eint registers, again for reference probably easier to see in [1].
>=20
>=20
> So I'm still quite stumped on how this could fit into the current
> framework and would be really glad for some small pointers :-)

I wonder if some of my patches for pinctrl on S3C64xx might be helpful:

https://github.com/tom3q/linux/commits/v3.8-s3c64xx-dt-pinctrl

Best regards,
Tomasz
