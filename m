From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/7] clk: samsung: add plls used in s3c2416 and s3c2443
Date: Tue, 12 Mar 2013 11:27:50 +0000
Message-ID: <20130312112750.GR4977@n2100.arm.linux.org.uk>
References: <201303120141.31262.heiko@sntech.de> <201303120142.19842.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:33188 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755077Ab3CLL2F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 07:28:05 -0400
Content-Disposition: inline
In-Reply-To: <201303120142.19842.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, t.figa@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org

On Tue, Mar 12, 2013 at 01:42:19AM +0100, Heiko St=FCbner wrote:
> +	clk =3D clk_register(NULL, &pll->hw);
> +	if (IS_ERR(clk)) {
> +		pr_err("%s: failed to register pll clock %s\n", __func__,
> +				name);
> +		kfree(pll);
> +	}
> +
> +	if (clk_register_clkdev(clk, name, NULL))
> +		pr_err("%s: failed to register lookup for %s", __func__, name);

The above looks wrong to me.

> +	clk =3D clk_register(NULL, &pll->hw);
> +	if (IS_ERR(clk)) {
> +		pr_err("%s: failed to register pll clock %s\n", __func__,
> +				name);
> +		kfree(pll);
> +	}
> +
> +	if (clk_register_clkdev(clk, name, NULL))
> +		pr_err("%s: failed to register lookup for %s", __func__, name);

Same pattern here.

> +	clk =3D clk_register(NULL, &pll->hw);
> +	if (IS_ERR(clk)) {
> +		pr_err("%s: failed to register pll clock %s\n", __func__,
> +				name);
> +		kfree(pll);
> +	}
> +
> +	if (clk_register_clkdev(clk, name, NULL))
> +		pr_err("%s: failed to register lookup for %s", __func__, name);

And again here.

> +	clk =3D clk_register(NULL, &pll->hw);
> +	if (IS_ERR(clk)) {
> +		pr_err("%s: failed to register pll clock %s\n", __func__,
> +				name);
> +		kfree(pll);
> +	}
> +
> +	if (clk_register_clkdev(clk, name, NULL))
> +		pr_err("%s: failed to register lookup for %s", __func__, name);

And again here... do you notice something about these?  They're all the
same.  Do you know what we do when we have the same thing repeated and
only the data is different?
