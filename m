From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] PCI: exynos: remove redundant code in exynos_pcie_establish_link
Date: Mon, 9 Oct 2017 16:43:53 +0200
Message-ID: <CAJKOXPeC=cS2cvAXHrKuK5F4tEqH6PppwYkxC+Z8+5D--48CAg@mail.gmail.com>
References: <CGME20171009141438epcas2p4ead7e2f2d1af7e0950f2c026e3a9943b@epcas2p4.samsung.com>
 <1507558478-3218-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754640AbdJIOn4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 10:43:56 -0400
In-Reply-To: <1507558478-3218-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: inux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Anvesh Salveru <anvesh.s@samsung.com>

On Mon, Oct 9, 2017 at 4:14 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> From: Anvesh Salveru <anvesh.s@samsung.com>
>
> In exynos_pcie_establish_link if driver is not using generic phy,
> we are resetting PHY twice, which is redundant, so this patch removes

Hi Pankaj,

This lacks the information why it is redundant.

> repeated lines of code for PHY reset.
>
> Signed-off-by: Anvesh Salveru <anvesh.s@samsung.com>

Your Signed-off-by is needed here.

Best regards,
Krzysztof

> ---
>  drivers/pci/dwc/pci-exynos.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/pci/dwc/pci-exynos.c b/drivers/pci/dwc/pci-exynos.c
> index 5596fde..85d2f4b 100644
> --- a/drivers/pci/dwc/pci-exynos.c
> +++ b/drivers/pci/dwc/pci-exynos.c
> @@ -423,13 +423,6 @@ static int exynos_pcie_establish_link(struct exynos_pcie *ep)
>                 exynos_pcie_deassert_phy_reset(ep);
>                 exynos_pcie_power_on_phy(ep);
>                 exynos_pcie_init_phy(ep);
> -
> -               /* pulse for common reset */
> -               exynos_pcie_writel(ep->mem_res->block_base, 1,
> -                                       PCIE_PHY_COMMON_RESET);
> -               udelay(500);
> -               exynos_pcie_writel(ep->mem_res->block_base, 0,
> -                                       PCIE_PHY_COMMON_RESET);
>         }
>
>         /* pulse for common reset */
> --
> 2.7.4
>
