From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 3/5] Documetation: binding: modify the exynos5440 pcie
 binding
Date: Wed, 4 Jan 2017 09:18:52 -0600
Message-ID: <20170104151852.knssejrhs3j562tu@rob-hp-laptop>
References: <20170104123435.30740-1-jh80.chung@samsung.com>
 <CGME20170104123436epcas1p1040f1e074748fabe58af52eb0b833713@epcas1p1.samsung.com>
 <20170104123435.30740-4-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170104123435.30740-4-jh80.chung@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, bhelgaas@google.com, mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org, kishon@ti.com, jingoohan1@gmail.com, vivek.gautam@codeaurora.org, pankaj.dubey@samsung.com, alim.akhtar@samsung.com, cpgs@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 04, 2017 at 09:34:33PM +0900, Jaehoon Chung wrote:
> According to using PHY framework, updates the exynos5440-pcie binding.
> For maintaining backward compatibility, leaves the current dt-binding.
> (It should be deprecated.)
> 
> Recommends to use the Phy Framework and "config" property to follow
> the designware-pcie binding.
> If you use the old way, can see "mssing *config* reg space" message.
> Because the getting configuration space address from range is old way.
> 
> NOTE: When use the "config" property, first name of 'reg-names' must be
> set to "elbi". Otherwise driver can't maintain the backward capability.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
> Changelog on V2:
> - Describes more commit message
> - Fixes the typos
> - Adds the new example for using PHY framework
> - Deprecated the old dt-binding description
> - Removes 'phy-names'
> 
>  .../bindings/pci/samsung,exynos5440-pcie.txt       | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
