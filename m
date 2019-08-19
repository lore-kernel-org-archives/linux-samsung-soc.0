From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH][next] soc: samsung: exynos-chipid: fix memory leak
Date: Mon, 19 Aug 2019 19:09:05 +0200
Message-ID: <20190819170905.GA14115@kozik-lap>
References: <20190816222151.11098-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190816222151.11098-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Aug 16, 2019 at 11:21:51PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call to product_id_to_soc_id fails there
> is a memory leak of soc_dev_attr->revision and soc_dev_attr
> on the error return path.  Fix this by adding a common error
> return path that frees there obects and use this for two
> error return paths.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 3253b7b7cd44 ("soc: samsung: Add exynos chipid driver support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/soc/samsung/exynos-chipid.c | 14 ++++++++++----

Thanks, applied.

Best regards,
Krzysztof
