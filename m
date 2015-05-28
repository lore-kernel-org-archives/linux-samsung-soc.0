From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: make several parent names const
Date: Thu, 28 May 2015 11:04:27 +0200
Message-ID: <5566DA1B.8090205@samsung.com>
References: <1432802751-6397-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:58413 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753209AbbE1JEl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 05:04:41 -0400
In-reply-to: <1432802751-6397-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>, Michal Simek <michal.simek@xilinx.com>, kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 28/05/15 10:45, Uwe Kleine-K=C3=B6nig wrote:
> Since commit 2893c379461a ("clk: make strings in parent name arrays
> const") the name of parent clocks can be const. So add more const in
> several clock drivers.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks for the patch,
Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

--=20
Regards,
Sylwester
