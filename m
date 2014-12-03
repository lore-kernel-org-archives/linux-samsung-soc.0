From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 1/2] soc: samsung: add exynos chipid driver support
Date: Wed, 03 Dec 2014 11:43:24 +0100
Message-ID: <19026872.NZqUJn3Abb@wuerfel>
References: <1417594658-2931-1-git-send-email-pankaj.dubey@samsung.com> <1417594658-2931-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:64801 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963AbaLCKoT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 05:44:19 -0500
In-Reply-To: <1417594658-2931-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, heiko@sntech.de, Linus Walleij <linus.walleij@linaro.org>, tomasz.figa@gmail.com, Rob Herring <robh+dt@kernel.org>, thomas.ab@samsung.com, Grant Likely <grant.likely@linaro.org>

> Exynos SoCs have Chipid, for identification of product IDs
> and SoC revisions. This patch intendes to provide initialization
> code for all these functionalites, at the same time it provides some
> sysfs entries for accessing these information to userspace.
> 
> This driver usese existing binding for exnos-chipid.

Nice!

On Wednesday 03 December 2014 13:47:37 Pankaj Dubey wrote:

> +       soc_dev_attr->soc_id = exynos_product_id_to_name(soc_product_id);
> +
> +       soc_dev = soc_device_register(soc_dev_attr);
> +       if (IS_ERR(soc_dev))
> +               goto free_rev;
> +
> +       device_create_file(soc_device_to_device(soc_dev), &exynos_product_attr);
> +       device_create_file(soc_device_to_device(soc_dev),
> +                               &exynos_main_rev_attr);
> +       device_create_file(soc_device_to_device(soc_dev), &exynos_sub_rev_attr);
> +

I don't like the idea of having three extra nonstandard properties here,
especially when you are not using the machine field for anything useful.

Also, all three of these just come from the same register, why expose
them all as the machine and revision standard properties.

	Arnd
