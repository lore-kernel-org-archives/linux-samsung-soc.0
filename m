From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] PCI: exynos: refactor exynos pcie driver
Date: Tue, 27 Dec 2016 14:35:54 +0100
Message-ID: <3335251.c58Y1Zf7PB@amdc3058>
References: <CGME20161223105411epcas1p3727f726e757ec6c6d7bff04a9af40077@epcas1p3.samsung.com>
 <1482490587-13611-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-reply-to: <1482490587-13611-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-pci-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org, jingoohan1@gmail.com, Niyas Ahmed S T <niyas.ahmed@samsung.com>, krzk@kernel.org, jh80.chung@samsung.com, kgene@kernel.org, alim.akhtar@samsung.com, bhelgaas@google.com, sanath@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Friday, December 23, 2016 04:26:27 PM Pankaj Dubey wrote:
> From: Niyas Ahmed S T <niyas.ahmed@samsung.com>
> 
> Currently Exynos PCIe driver is only supported for Exynos5440 SoC.
> This patch does refactoring of Exynos PCIe driver to extend support
> for other Exynos SoC.
> 
> Following are the main changes done via this patch:
> 1) It adds separate structs for memory, clock resources.
> 2) It add exynos_pcie_ops struct which will allow us to support the
> differences in resources in different Exynos SoC.
> 
> No functional change intended.
> 
> Signed-off-by: Niyas Ahmed S T <niyas.ahmed@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>

I would also like to see the explanation for 1) (as already
requested by Jingoo).  Otherwise it all looks fine to me:

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
