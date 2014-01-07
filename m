From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] clk: Correct handling of NULL clk in __clk_{get, put}
Date: Tue, 7 Jan 2014 14:00:19 +0100
Message-ID: <20140107140019.7220eed6@ipc1.ka-ro>
References: <1389096223-23934-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.karo-electronics.de ([81.173.242.67]:55871 "EHLO
	mail.karo-electronics.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751741AbaAGNAd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 08:00:33 -0500
In-Reply-To: <1389096223-23934-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: sachin.kamat@linaro.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org

Hi,

Sylwester Nawrocki wrote:
> Ensure clk->kref is dereferenced only when clk is not NULL.
>=20
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Hi Sachin,
>=20
> please try if this patch fixes the exyno5420 boot crash.
>=20
> Thanks,
> Sylwester
>=20
>  drivers/clk/clk.c |   13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index e3e0327..a1fe86f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2179,24 +2179,25 @@ EXPORT_SYMBOL_GPL(devm_clk_unregister);
>   */
>  int __clk_get(struct clk *clk)
>  {
> -	if (clk && !try_module_get(clk->owner))
> -		return 0;
> +	if (clk) {
> +		if (!try_module_get(clk->owner))
> +			return 0;
>=20
This change is unnecessary! The part after the && is only evaluated
when clk is not NULL.

Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
