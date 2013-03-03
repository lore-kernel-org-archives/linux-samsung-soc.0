From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v6 01/16] clk: samsung: add common clock framework helper functions for Samsung platforms
Date: Sun, 03 Mar 2013 12:45:01 +0100
Message-ID: <2984153.Xctncej7hL@flatron>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org> <201303030208.49722.heiko@sntech.de> <51333149.1060105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:45423 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753158Ab3CCLpB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Mar 2013 06:45:01 -0500
Received: by mail-ee0-f53.google.com with SMTP id e53so3366451eek.40
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Mar 2013 03:45:00 -0800 (PST)
In-Reply-To: <51333149.1060105@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, t.figa@samsung.com

Hi,

On Sunday 03 of March 2013 12:17:29 Sylwester Nawrocki wrote:
> Hi,
>=20
> On 03/03/2013 02:08 AM, Heiko St=FCbner wrote:
> > But is there an easy way to define more than one alias? On the s3c2=
416
> > for example the hsmmc hclk is the "hsmmc" io-clock, as well as the
> > source for the "mmc_busclk.0". Same for the "uart" pclk, that is al=
so
> > a baud clock source.
> This driver currently provides for only one additional clkdev lookup
> entry per a platform clock. I pointed out this desing issue in the
> early version of the patch set. It's because a machine clock definiti=
on
> is coupled with a clock consumer definition. And IMO various
> samsung_clock_register_* functions should not have
> clk_register_clkdev() inside them. I.e. first step could be registeri=
ng
> all machine clocks and in the second one clkdev lookup entries could =
be
> created. This is how most (all?) existing SoC clock drivers are
> working.
>=20
> But those multiple aliases are important only for machines with devic=
e
> tree support, aren't they ?

I suppose you meant _without_ device tree support, right?

> I hope this patch series gets merged early to linux-next in the 3.10
> cycle so the multiple accumulated fixup patches for this clock driver
> can be merged as well and issues like that you pointed out can be
> resolved with incremental patches.

Yes, I hope so too.

Best regards,
Tomasz
