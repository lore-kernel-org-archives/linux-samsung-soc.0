From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH V2 5/5] ARM: dts: exynos5440: support the phy-pcie node for
 pcie
Date: Thu, 05 Jan 2017 14:34:07 +0530
Message-ID: <e8ba6f6b-378e-0d7b-8416-2b578f78334a@samsung.com>
References: <20170104123435.30740-1-jh80.chung@samsung.com>
 <CGME20170104123436epcas1p10b52f24e7d6c00edb44e4331a1870e4d@epcas1p1.samsung.com>
 <20170104123435.30740-6-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170104123435.30740-6-jh80.chung@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>, linux-pci@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org, kishon@ti.com, jingoohan1@gmail.com, vivek.gautam@codeaurora.org, alim.akhtar@samsung.com, cpgs@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jaehoon,

On Wednesday 04 January 2017 06:04 PM, Jaehoon Chung wrote:
> Add phy-pcie node for using Exynos5440 pcie.
> And use the reg-names as "elbi" and "config".
> Because the getting configuratioin space address from ranges is old way.
> It also is helpful to distinguish more clearly.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
> Changelog on V2:
> - Removes the child-node
> - Fixes the typo
> - Removes the unnecessary comments
> 
>  arch/arm/boot/dts/exynos5440.dtsi | 34 ++++++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 12 deletions(-)
> 

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Thanks,
Pankaj Dubey
