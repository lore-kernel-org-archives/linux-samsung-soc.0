From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v8 1/8] soc: samsung: add exynos chipid driver support
Date: Tue, 27 Dec 2016 15:02:53 +0100
Message-ID: <1482850387.FvemkoIpaX@amdc3058>
References: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
 <1481375323-29724-2-git-send-email-pankaj.dubey@samsung.com>
 <CGME20161227140255epcas1p1a2c2b50ede0e9b2378c8ac052b1617f6@epcas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1481375323-29724-2-git-send-email-pankaj.dubey@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, arnd@arndb.de, geert+renesas@glider.be, Linus Walleij <linus.walleij@linaro.org>, krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org, thomas.ab@samsung.com, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Saturday, December 10, 2016 06:38:36 PM Pankaj Dubey wrote:
> Exynos SoCs have Chipid, for identification of product IDs and SoC revisions.
> This patch intends to provide initialization code for all these functionalities,
> at the same time it provides some sysfs entries for accessing these information
> to user-space.
> 
> This driver uses existing binding for exynos-chipid.
> 
> CC: Grant Likely <grant.likely@linaro.org>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> [m.szyprowski: for suggestion and code snippet of product_id_to_soc_id]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/soc/samsung/Kconfig         |   5 ++
>  drivers/soc/samsung/Makefile        |   1 +
>  drivers/soc/samsung/exynos-chipid.c | 116 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 drivers/soc/samsung/exynos-chipid.c

[...]

> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> new file mode 100644
> index 0000000..cf0128b
> --- /dev/null
> +++ b/drivers/soc/samsung/exynos-chipid.c

[...]

> +/**
> + *  exynos_chipid_early_init: Early chipid initialization
> + */
> +int __init exynos_chipid_early_init(void)
> +{
> +	struct soc_device_attribute *soc_dev_attr;
> +	struct soc_device *soc_dev;
> +	struct device_node *root;
> +	struct device_node *np;
> +	void __iomem *exynos_chipid_base;
> +	const struct of_device_id *match;
> +	u32 product_id;
> +	u32 revision;
> +
> +	np = of_find_matching_node_and_match(NULL,
> +			of_exynos_chipid_ids, &match);
> +	if (!np)
> +		return -ENODEV;
> +
> +	exynos_chipid_base = of_iomap(np, 0);

of_node_put(np) is missing here.

> +	if (!exynos_chipid_base)
> +		return PTR_ERR(exynos_chipid_base);

PTR_ERR use here is incorrect - of_iomap() returns valid pointer or
NULL.  Please just return -NODEV on of_iomap() failure.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
