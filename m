From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] mfd: syscon: Decouple syscon interface from platform devices
Date: Wed, 17 Sep 2014 17:23:04 +0200
Message-ID: <201409171723.04549.arnd@arndb.de>
References: <1410935510-1567-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410935510-1567-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, lee.jones@linaro.org, tomasz.figa@gmail.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday 17 September 2014, Pankaj Dubey wrote:
> ---
> V2 of this patchset and related discussion can be found here [1].
> 
> Changes since v2:
>  - Added back platform device support from syscon, with one change that
>    syscon will not be probed for DT based platform.
>  - Added back syscon_regmap_lookup_by_pdevname API so that non-DT base
>    users of syscon will not be broken.
>  - Removed unwanted change in syscon.h.
>  - Modified Signed-off-by list, added Suggested-by of Tomasz Figa and
>    Arnd Bergmann.
>  - Added Tested-by of Vivek Gautam for testing on Exynos platform.

Looks fine. Provided you can figure out the problem that Dong Aisheng
reported, please add my

Acked-by: Arnd Bergmann <arnd@arndb.de>

> -}
> +static struct syscon *of_syscon_register(struct device_node *np);
>

One  minor comment: please avoid doing forward declarations of
local functions. It took me a while to understand what is going on
because I expect all functions to be ordered such that they only get
called by functions below, and don't need this.

Just move of_syscon_register() here directly.

	Arnd
