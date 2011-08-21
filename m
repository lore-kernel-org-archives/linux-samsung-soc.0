From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/4] S3C2443: Move i2s clock definitions to common code
Date: Sun, 21 Aug 2011 18:13:32 +0100
Message-ID: <20110821171332.GF28546@n2100.arm.linux.org.uk>
References: <201108201757.56483.heiko@sntech.de> <201108201801.29541.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:39686 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752092Ab1HURN4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Aug 2011 13:13:56 -0400
Content-Disposition: inline
In-Reply-To: <201108201801.29541.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sat, Aug 20, 2011 at 06:01:29PM +0200, Heiko St=FCbner wrote:
> +/* i2s-ref
> + *
> + * i2s bus reference clock, selectable from external, esysclk or epl=
lref
> + *
> + * Note, this used to be two clocks, but was compressed into one.
> +*/
> +
> +struct clk *clk_i2s_srclist[] =3D {
> +	[0] =3D &clk_i2s_eplldiv.clk,
> +	[1] =3D &clk_i2s_ext,
> +	[2] =3D &clk_epllref.clk,
> +	[3] =3D &clk_epllref.clk,
> +};

Is there any reason not to make this static (have you run your patch
through checkpatch.pl ?)
