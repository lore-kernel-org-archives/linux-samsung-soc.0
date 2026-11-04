Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816075;
	b=2Met7IFwexdsykQzQZoqprUc8VO5KobrAzqvv/UXgXZZ44wD/pBz0qKeis6AjqZnmNf+
	 CGB5+jqbcQ8n20+NI2QSPXJ9gqeXY7mnuyQZQD2dXaXuedBZlOQk+C3ZuLX7gCHBNkCha
	 EQv437Hv/nADbfrzQaNJMg//j5CTVXnbFAbKfKQf9AM4vYIqC30EyaN/1aOPX0cj7gFQ1
	 3hRLTq/L2qPnOmGKd8QO9lQmR/QcfX3AMphlNvh1lPCYlGMQmS5OzaFgu4IPypagvzupY
	 Gs9r1aJK1/ZNz0GJgQJs5rU6VAhnO45qIpWMKrh6Wd6XSaHCHk+KS6R5ZFVRxE4DCKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816075;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3vEf+vYwX1hHqFnM7XUYCb2YLUrJ0anEL19nMME3t6o=;
	b=CjJXRvpj5VaUFokGtjW7row5zKNi/2z+gLGsQxSNuTQXC6Xa+YY8xP2JI45Aij6ju0LS
	 Tals007fqLoMCXWOfCovWwdc35P8srsvP5OdoLlcxN1mjyKWaJQIXPv8Wu83hZOTTxDw7
	 V86JOpTL3tPuVdEiC3ZuKYx+2qaWQ7QOPeYzz06ZyG3/vDCIY5KzGkiKiFtoAc6OJ8aEy
	 +E+8i1gMDL++zeJqMSzIVwzO8LlgSWxO01bVknjC4UlyEYEHM3zAYjJcyWiRg7ywhSZxX
	 V2dhqp3jGeEPwuXpnVIyEy1VBl9F540idWZOl8Ewro/s95jndAjq8N0FcI65zyFA4HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVzyqcSu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD7F606A326;
	Wed,  4 Nov 2026 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVzyqcSu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E791F000C1;
	Wed,  4 Nov 2026 18:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816074;
	bh=3vEf+vYwX1hHqFnM7XUYCb2YLUrJ0anEL19nMME3t6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TVzyqcSuF1PVT8ycEgOsBf03CoKbEElh0ICRsA70khRVt6jQiJqosC6oikwG5DMgV
	 sxnddqQk5RM+Yqv8c+AKtibwY71XD9gV4jnu+nGF376zwBJbCKF3/rJNNMuqYoWfT6
	 rtEZTztKSdnOU7KGq1V49jXYUchm6abelorGZQHUO0v5oM8eIHrFBJpoNYvVulJx+W
	 EmEeU4efluLzS0q7d2BgzdYaK2bTROTA61QjrvBWvaCVbGZWR8aL/W8fC5v9sJ3cPk
	 u063LFC6K5k8eqVxBmZH42TnJkpJkYxqO4E+tGnKAycwAusd5jKbIkHR8WaetsNxa7
	 BCjDLaI3JPErw==
Date: Wed, 4 Nov 2026 18:14:29 +0000
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <20261104181429.GE1650678@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>

On Sat, 24 Oct 2026, Dmitry Torokhov wrote:

> Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> data. This is useful for non-DT/non-ACPI platforms that want to
> associate device properties (like DVS GPIOs) with the regulator devices
> using software nodes.
> 
> Add software node pointers to the PMIC platform data and have the MFD
> core assign them to the buckv cells.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
>  include/linux/mfd/wm831x/pdata.h |  2 ++
>  2 files changed, 37 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
> index df8e76e000cc..c4793be419ba 100644
> --- a/drivers/mfd/wm831x-core.c
> +++ b/drivers/mfd/wm831x-core.c
> @@ -14,6 +14,7 @@
>  #include <linux/delay.h>
>  #include <linux/mfd/core.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/err.h>
>  
>  #include <linux/mfd/wm831x/core.h>
> @@ -1449,6 +1450,32 @@ const struct of_device_id wm831x_of_match[] = {
>  };
>  EXPORT_SYMBOL_GPL(wm831x_of_match);
>  
> +static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
> +			      const struct mfd_cell *cells, int num_cells)
> +{
> +	struct wm831x_pdata *pdata = &wm831x->pdata;
> +	int i;
> +
> +	struct mfd_cell *local_cells __free(kfree) =
> +		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
> +	if (!local_cells)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_cells; i++) {
> +		struct mfd_cell *cell = &local_cells[i];
> +
> +		if (strcmp(cell->name, "wm831x-buckv") == 0) {
> +			int id = cell->id - 1;
> +
> +			if (id >= 0 && id < WM831X_MAX_DCDC)
> +				cell->swnode = pdata->dcdc_swnodes[id];
> +		}
> +	}

I can't begin to tell you how much I hate this.

Why are we duplicating massive static const structs just to add a S/W
node?  Is there no other way we can do this statically?

Since pdata is being populated already, why not just pass that on to the
consuming child device (the regulator)?

> +	return mfd_add_devices(wm831x->dev, wm831x_num, local_cells, num_cells,
> +			       NULL, 0, NULL);
> +}

-- 
Lee Jones
