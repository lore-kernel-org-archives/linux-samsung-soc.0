From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 1/6] clk: samsung: move common plls registration into separate function
Date: Thu, 11 Jul 2013 09:46:53 +0200
Message-ID: <1874409.iWz7oWBuYA@thinkpad>
References: <201307100057.06061.heiko@sntech.de> <201307100057.48265.heiko@sntech.de> <CAKew6eUPBUZj4TuhNAjp6NitFUaeFBZscr_jqU3Y_wLi1m7Ekg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:33788 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752330Ab3GKHq7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 03:46:59 -0400
Received: by mail-wg0-f41.google.com with SMTP id y10so11685141wgg.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2013 00:46:58 -0700 (PDT)
In-Reply-To: <CAKew6eUPBUZj4TuhNAjp6NitFUaeFBZscr_jqU3Y_wLi1m7Ekg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Russell King <linux@arm.linux.org.uk>

Hi,

On Wednesday 10 of July 2013 22:29:13 Yadwinder Singh Brar wrote:
> Hi Heiko,
>=20
> On Wed, Jul 10, 2013 at 4:27 AM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > All Samsung PLLs use similar code to register the clocks and clkdev
> > lookups. Therefore move these into a separate function to reduce co=
de
> > duplication.
> >=20
> > Suggested-by: Russell King <linux@arm.linux.org.uk>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
>=20
> I have posted patch for adding common pll registration function
> which some how missed to get merged. I hope will get merged after rc1=
=2E
> Please give a look at that :
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg1954=
3.html

Yeah, I was going to post a link to it, but I couldn't find it on any m=
ailing=20
list archive. I think we should go with the way of registration introdu=
ced by=20
Yadwinder.

Best regards,
Tomasz
