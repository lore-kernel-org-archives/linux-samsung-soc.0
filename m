From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clk: exynos: File scope reg_save array should depend on
 PM_SLEEP
Date: Mon, 30 Dec 2013 18:51:06 +0100
Message-ID: <24377867.Lxp9m9lerI@amdc1227>
References: <1387274199-470-1-git-send-email-k.kozlowski@samsung.com>
 <20131219075510.18119.67210@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:22750 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755634Ab3L3Rva convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 12:51:30 -0500
In-reply-to: <20131219075510.18119.67210@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@nvidia.com>, James Hogan <james.hogan@imgtec.com>, Padmavathi Venna <padma.v@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 18 of December 2013 23:55:10 Mike Turquette wrote:
> Quoting Krzysztof Kozlowski (2013-12-17 01:56:39)
> > Move reg_save[] into CONFIG_PM_SLEEP dependency block as it is used=
 only
> > by suspend and resume functions.
> >=20
> > This fixes the warning on CONFIG_PM_SLEEP=3Dn:
> > drivers/clk/samsung/clk-exynos-audss.c:29:22: warning: =E2=80=98reg=
_save=E2=80=99 defined but not used [-Wunused-variable]
> >=20
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> Acked-by: Mike Turquette <mturquette@linaro.org>

Applied onto fixes branch.

Best regards,
Tomasz
