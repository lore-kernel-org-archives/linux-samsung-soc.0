From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH V2 1/5] Documetation: samsung-phy: add the exynos-pcie-phy
 binding
Date: Thu, 05 Jan 2017 09:46:13 +0530
Message-ID: <4110cfa2-bbe8-337e-5f2c-13d82cd23713@samsung.com>
References: <20170104123435.30740-1-jh80.chung@samsung.com>
 <CGME20170104123436epcas1p1d3d840e4ade396a60ce690b09d486990@epcas1p1.samsung.com>
 <20170104123435.30740-2-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170104123435.30740-2-jh80.chung@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>, linux-pci@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org, kishon@ti.com, jingoohan1@gmail.com, vivek.gautam@codeaurora.org, pankaj.dubey@samsung.com, cpgs@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jaehoon,

On 01/04/2017 06:04 PM, Jaehoon Chung wrote:
> Adds the exynos-pcie-phy binding for Exynos PCIe PHY.
> This is for using generic PHY framework.
>
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
> Changelog on V2:
> - Remove the child node.
> - Add 2nd address to the parent reg prop.
>
>  Documentation/devicetree/bindings/phy/samsung-phy.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
> index 9872ba8..ab80bfe 100644
> --- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
> @@ -191,3 +191,20 @@ Example:
>  		usbdrdphy0 = &usb3_phy0;
>  		usbdrdphy1 = &usb3_phy1;
>  	};
> +
> +Samsung Exynos SoC series PCIe PHY controller
> +--------------------------------------------------
> +Required properties:
> +- compatible : Should be set to "samsung,exynos5440-pcie-phy"
> +- #phy-cells : Must be zero
> +- reg : a register used by phy driver.
> +	- First is for phy register, second is for block register.
> +- reg-names : Must be set to "phy" and "block".
> +
In general PHY uses a "reference clock" to work, if that is true for 
5440 also, will you consider adding an (may be) optional clock 
properties as well?

otherwise this binding looks ok to me.
> +Example:
> +	pcie_phy0: pcie-phy@270000 {
> +		#phy-cells = <0>;
> +		compatible = "samsung,exynos5440-pcie-phy";
> +		reg = <0x270000 0x1000>, <0x271000 0x40>;
> +		reg-names = "phy", "block";
> +	};
>
