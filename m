From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH V2 2/5] phy: phy-exynos-pcie: Add support for Exynos PCIe
 phy
Date: Wed, 4 Jan 2017 19:52:57 +0200
Message-ID: <20170104175257.yte3ntw6nyvh47xt@kozik-lap>
References: <20170104123435.30740-1-jh80.chung@samsung.com>
 <CGME20170104123436epcas1p1a729583c3c2307d8539a186f1050ea98@epcas1p1.samsung.com>
 <20170104123435.30740-3-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170104123435.30740-3-jh80.chung@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org, kishon@ti.com, jingoohan1@gmail.com, vivek.gautam@codeaurora.org, pankaj.dubey@samsung.com, alim.akhtar@samsung.com, cpgs@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 04, 2017 at 09:34:32PM +0900, Jaehoon Chung wrote:
> This patch supports to use Generic Phy framework for Exynos PCIe phy.
> When Exynos that supported the pcie want to use the PCIe,
> it needs to control the phy resgister.
> But it should be more complex to control in their own PCIe device drivers.
> 
> Currently, there is an exynos5440 case to support the pcie.
> So this driver is based on Exynos5440 PCIe.
> In future, will support the Other exynos SoCs likes exynos5433, exynos7.

I have troubles understanding this. Please, work on the commit message.

For the code itself:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
... but commit message is really important to understand why/what was
done.

Best regards,
Krzysztof
