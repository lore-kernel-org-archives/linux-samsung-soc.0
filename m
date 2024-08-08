Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366734A1E;
	Thu,  8 Aug 2024 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723148062; cv=none; b=iQVaLf5Wdl08CgWMo7Ya9uvBvH4j5Oe0cF8m3wla4Q0q1C8Yrh5AlTRjUbySwxGHIG72Hwc1HLQgltCYWfMnDuRks+MSWoIX9e9YZkCAOJwJpeZFkpasqrkutqxZdmcU9y7fozfpE7t2Io0TFCqByArBHNAGcZNbv1FKVqtm+i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723148062; c=relaxed/simple;
	bh=hgURdvoV2LeV7xOJOhcOMVxZqCvVA2gvwLntm/DYCjI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Kwa2/6RFd47/cO6eiM0AWxHT3N9NjxmJhWpLuz0dKiscu/3x09H2NQOMRH1nm+axXIPvXD+4yy0BeGEH3YGYmbhOlFr8Ctm8WF9aIZeVKUdJaWg+lAGxAZwtYwWBvLf92J4cVfdYJklP/yKzGiPCBNAjT9egx9RTQEDbl+b0cgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0Th6AFl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0Th6AFl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712A4C32782;
	Thu,  8 Aug 2024 20:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723148061;
	bh=hgURdvoV2LeV7xOJOhcOMVxZqCvVA2gvwLntm/DYCjI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=d0Th6AFlewoGY+Bylt133GKr0MOdYKL4lmngVznZKKhj4h/QFSqkP62DUK5z3DSVC
	 NXAJ6pjnyWnuiw2MQpb5aMrVan9kkOCPXC6+WEU5II9OvN623fHkDh+T69wYt69cfa
	 he68f5JcHB6g7i/nwV+OVZAWajuWEHlv7sHISQxf92zlU2qxjTuqIjSqxwUHn11ROI
	 ZkvtHGlWBjAQezR4XrNFRgZ9nj+/gwhTYDfeT09sE6udYFvCQItcyLEGSnuy9Azn+Q
	 mQZmCcf5YoMUgZuwG5n8Wh9Dz0fnksqTnJSXfnXFAwTo03Czze3jMYSlmWBms2Z2tl
	 kKeL5FtPgQXuA==
Message-ID: <7fc258e4208a01748ef024f286a85ca0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v6-1-e91c537acedc@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org> <20240808-gs101-non-essential-clocks-2-v6-1-e91c537acedc@linaro.org>
Subject: Re: [PATCH v6 01/20] clk: bump stdout clock usage for earlycon
From: Stephen Boyd <sboyd@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 08 Aug 2024 13:14:19 -0700
User-Agent: alot/0.10

Quoting Andr=C3=A9 Draszik (2024-08-08 07:42:42)
> On some platforms, earlycon depends on the bootloader setup stdout
> clocks being retained. In some cases stdout UART clocks (or their
> parents) can get disabled during loading of other drivers (e.g. i2c)
> causing earlycon to stop to work sometime into the boot, halting the
> whole system.
>=20
> Since there are at least two platforms where that is the case, i.MX and
> the Exynos-derivative gs101, this patch adds some logic to the clk core
> to detect these clocks if earlycon is enabled, to bump their usage
> count as part of of_clk_add_hw_provider() and of_clk_add_provider(),
> and to release them again at the end of init.
>=20
> This way code duplication in affected platforms can be avoided.
>=20
> The general idea is based on similar code in the i.MX clock driver, but
> this here is a bit more generic as in general (e.g. on gs101) clocks
> can come from various different clock units (driver instances) and
> therefore it can be necessary to run this code multiple times until all
> required stdout clocks have probed.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---

Thanks for doing this!

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 7264cf6165ce..03c5d80e833c 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4923,6 +4923,131 @@ static void clk_core_reparent_orphans(void)
>         clk_prepare_unlock();
>  }
> =20
> +/**
> + * struct of_clk_stdout_clks - holds data that is required for handling =
extra
> + * references to stdout clocks during early boot.
> + *
> + * On some platforms, earlycon depends on the bootloader setup stdout cl=
ocks
> + * being retained. In some cases stdout UART clocks (or their parents) c=
an get
> + * disabled during loading of other drivers (e.g. i2c) causing earlycon =
to stop
> + * to work sometime into the boot, halting the system.
> + *
> + * Having logic to detect these clocks if earlycon is enabled helps with=
 those
> + * cases by bumping their usage count during init. The extra usage count=
 is
> + * later dropped at the end of init.
> + *
> + * @bump_refs: whether or not to add the extra stdout clock references
> + * @lock: mutex protecting access
> + * @have_all: whether or not we have acquired all clocks, to handle case=
s of
> + *            clocks coming from different drivers / instances
> + * @clks: clocks associated with stdout
> + * @n_clks: number of clocks associated with stdout
> + */
> +static struct of_clk_stdout_clks {
> +       bool bump_refs;
> +
> +       struct mutex lock;
> +       bool have_all;
> +       struct clk **clks;
> +       size_t n_clks;
> +} of_clk_stdout_clks =3D {

This can be initdata?

> +       .lock =3D __MUTEX_INITIALIZER(of_clk_stdout_clks.lock),
> +};
> +
> +static int __init of_clk_bump_stdout_clocks_param(char *str)
> +{
> +       of_clk_stdout_clks.bump_refs =3D true;
> +       return 0;
> +}
> +__setup("earlycon", of_clk_bump_stdout_clocks_param);
> +__setup_param("earlyprintk", of_clk_keep_stdout_clocks_earlyprintk,
> +             of_clk_bump_stdout_clocks_param, 0);
> +
> +static void of_clk_bump_stdout_clocks(void)

This can be __init?

> +{
> +       size_t n_clks;
> +
> +       /*
> +        * We only need to run this code if required to do so and only ev=
er
> +        * before late initcalls have run. Otherwise it'd be impossible t=
o know
> +        * when to drop the extra clock references again.
> +        *
> +        * This generally means that this only works if on affected platf=
orms
> +        * the clock drivers have been built-in (as opposed to being modu=
les).
> +        */
> +       if (!of_clk_stdout_clks.bump_refs)
> +               return;
> +
> +       n_clks =3D of_clk_get_parent_count(of_stdout);
> +       if (!n_clks || !of_stdout)
> +               return;
> +
> +       mutex_lock(&of_clk_stdout_clks.lock);
> +
> +       /*
> +        * We only need to keep trying if we have not succeeded previousl=
y,
> +        * i.e. if not all required clocks were ready during previous att=
empts.
> +        */
> +       if (of_clk_stdout_clks.have_all)
> +               goto out_unlock;
> +
> +       if (!of_clk_stdout_clks.clks) {
> +               of_clk_stdout_clks.n_clks =3D n_clks;
> +
> +               of_clk_stdout_clks.clks =3D kcalloc(of_clk_stdout_clks.n_=
clks,
> +                                             sizeof(*of_clk_stdout_clks.=
clks),
> +                                             GFP_KERNEL);
> +               if (!of_clk_stdout_clks.clks)
> +                       goto out_unlock;
> +       }
> +
> +       /* assume that this time we'll be able to grab all required clock=
s */
> +       of_clk_stdout_clks.have_all =3D true;
> +       for (size_t i =3D 0; i < n_clks; ++i) {
> +               struct clk *clk;
> +
> +               /* we might have grabbed this clock in a previous attempt=
 */
> +               if (of_clk_stdout_clks.clks[i])
> +                       continue;
> +
> +               clk =3D of_clk_get(of_stdout, i);
> +               if (IS_ERR(clk)) {
> +                       /* retry next time if clock has not probed yet */
> +                       of_clk_stdout_clks.have_all =3D false;
> +                       continue;
> +               }
> +
> +               if (clk_prepare_enable(clk)) {
> +                       clk_put(clk);
> +                       continue;
> +               }
> +               of_clk_stdout_clks.clks[i] =3D clk;
> +       }
> +
> +out_unlock:
> +       mutex_unlock(&of_clk_stdout_clks.lock);
> +}
> +
> +static int __init of_clk_drop_stdout_clocks(void)
> +{
> +       for (size_t i =3D 0; i < of_clk_stdout_clks.n_clks; ++i) {
> +               clk_disable_unprepare(of_clk_stdout_clks.clks[i]);
> +               clk_put(of_clk_stdout_clks.clks[i]);
> +       }
> +
> +       kfree(of_clk_stdout_clks.clks);
> +
> +       /*
> +        * Do not try to acquire stdout clocks after late initcalls, e.g.
> +        * during further module loading, as we then wouldn't have a way =
to
> +        * drop the references (and associated allocations) ever again.
> +        */
> +       of_clk_stdout_clks.bump_refs =3D false;
> +
> +       return 0;
> +}
> +late_initcall_sync(of_clk_drop_stdout_clocks);
> +
>  /**
>   * struct of_clk_provider - Clock provider registration structure
>   * @link: Entry in global list of clock providers
> @@ -5031,6 +5156,8 @@ int of_clk_add_provider(struct device_node *np,
> =20
>         fwnode_dev_initialized(&np->fwnode, true);
> =20
> +       of_clk_bump_stdout_clocks();

This can be a wrapper function that isn't marked __init but which calls
the init function with __ref. That lets us free up as much code as
possible. We need to set a bool in of_clk_drop_stdout_clocks() that when
false doesn't call the __init functions that are wrapped though, i.e.
'bump_refs'. Here's the structure:

	static bool bump_stdout_clks __ro_after_init =3D true;

	static int __init _of_clk_bump_stdout_clks(void)
	{
		...
	}

	static int __ref of_clk_bump_stdout_clks(void)
	{
		if (bump_stdout_clks)
			return _of_clk_bump_stdout_clks();

		return 0;
	}

	static int __init of_clk_drop_stdout_clks(void)
	{
		bump_stdout_clks =3D false;
		...
	}
	late_initcall_sync(of_clk_drop_stdout_clks);

> +
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_clk_add_provider);
