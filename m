From: Joe Perches <joe@perches.com>
Subject: Re: [RFC PATCH 1/8] drm: exynos/dp: fix code style
Date: Thu, 06 Aug 2015 08:05:36 -0700
Message-ID: <1438873536.2679.61.camel@perches.com>
References: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
	 <1438869866-23028-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438869866-23028-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Fabio Estevam <fabio.estevam@freescale.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, djkurtz@google.com, dianders@google.com, Takashi Iwai <tiwai@suse.de>, Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <treding@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 2015-08-06 at 09:04 -0500, Yakir Yang wrote:
> make checkpatch.pl script happy

That should not be the primary reason to submit a patch.

Making it easier for human code reader to understand
what the code does should be though.

> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
[]
> @@ -123,10 +123,11 @@ static int exynos_dp_read_edid(struct exynos_dp_device *dp)
>  		dev_dbg(dp->dev, "EDID data includes a single extension!\n");
>  
>  		/* Read EDID data */
> -		retval = exynos_dp_read_bytes_from_i2c(dp, I2C_EDID_DEVICE_ADDR,
> -						EDID_HEADER_PATTERN,
> -						EDID_BLOCK_LENGTH,
> -						&edid[EDID_HEADER_PATTERN]);
> +		retval =
> +		exynos_dp_read_bytes_from_i2c(dp, I2C_EDID_DEVICE_ADDR,
> +					      EDID_HEADER_PATTERN,
> +					      EDID_BLOCK_LENGTH,
> +					      &edid[EDID_HEADER_PATTERN]);

This is a relatively uncommon style.

Because the code uses relatively long variable and
function names as well as longish macro #defines,
prefer to ignore the 80 column limit.
