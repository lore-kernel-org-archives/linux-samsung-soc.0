From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 5/6] memory: samsung/exynos-srom: make it explicitly
 non-modular
Date: Mon, 20 Jun 2016 09:50:03 +0200
Message-ID: <5767A02B.4070401@samsung.com>
References: <20160617003748.12188-1-paul.gortmaker@windriver.com>
 <20160617003748.12188-6-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160617003748.12188-6-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 06/17/2016 02:37 AM, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> memory/samsung/Kconfig:config EXYNOS_SROM
> memory/samsung/Kconfig: bool "Exynos SROM controller driver" if COMPILE_TEST
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
> 
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
> 
> Cc: Pankaj Dubey <pankaj.dubey@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  drivers/memory/samsung/exynos-srom.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)

Thanks, applied for v4.8.

Best regards,
Krzysztof
