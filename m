From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH V2 2/5] phy: phy-exynos-pcie: Add support for Exynos PCIe
 phy
Date: Thu, 05 Jan 2017 11:48:25 +0530
Message-ID: <d1db94b0-a758-cd9a-2fc6-2db64e0fd741@samsung.com>
References: <20170104123435.30740-1-jh80.chung@samsung.com>
 <CGME20170104123436epcas1p1a729583c3c2307d8539a186f1050ea98@epcas1p1.samsung.com>
 <20170104123435.30740-3-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170104123435.30740-3-jh80.chung@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>, linux-pci@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org, kishon@ti.com, jingoohan1@gmail.com, vivek.gautam@codeaurora.org, alim.akhtar@samsung.com, cpgs@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jaehoon,

On Wednesday 04 January 2017 06:04 PM, Jaehoon Chung wrote:
> This patch supports to use Generic Phy framework for Exynos PCIe phy.
> When Exynos that supported the pcie want to use the PCIe,
> it needs to control the phy resgister.
> But it should be more complex to control in their own PCIe device drivers.
> 
> Currently, there is an exynos5440 case to support the pcie.
> So this driver is based on Exynos5440 PCIe.
> In future, will support the Other exynos SoCs likes exynos5433, exynos7.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
> Changelog on V2:
> - Not include the codes relevant to pci-exynos.
> - Remove the getting child node.
> 

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Thanks,
Pankaj Dubey
