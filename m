From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] clk: make several parent names const
Date: Thu, 28 May 2015 12:35:12 +0200
Message-ID: <4095482.AGzSOmiiYQ@phil>
References: <1432802751-6397-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:48928 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751845AbbE1Ke2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 06:34:28 -0400
In-Reply-To: <1432802751-6397-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michal Simek <michal.simek@xilinx.com>, kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Donnerstag, 28. Mai 2015, 10:45:51 schrieb Uwe Kleine-K=F6nig:
> Since commit 2893c379461a ("clk: make strings in parent name arrays
> const") the name of parent clocks can be const. So add more const in
> several clock drivers.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>


Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
> Hello,
>=20
> commit 2893c379461a isn't in Linus Torvald's tree yet, so the commit
> message needs adaption if clk-next is rewritten.
>=20
> Should I split this patch per subdir?

I don't have any Rockchip-related clock changes for 4.2, so for me it's=
 not=20
important if you split it or keep it together.


Thanks
Heiko
