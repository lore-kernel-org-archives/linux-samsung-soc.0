From: "pankaj.dubey" <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2 1/5] Documetation: samsung-phy: add the exynos-pcie-phy
 binding
Date: Thu, 05 Jan 2017 11:36:32 +0530
Message-ID: <d6a81e81-3ac2-5d83-15f3-9de07fb2d421@samsung.com>
References: <20170104123435.30740-1-jh80.chung@samsung.com>
 <CGME20170104123436epcas1p1d3d840e4ade396a60ce690b09d486990@epcas1p1.samsung.com>
 <20170104123435.30740-2-jh80.chung@samsung.com>
 <4110cfa2-bbe8-337e-5f2c-13d82cd23713@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <4110cfa2-bbe8-337e-5f2c-13d82cd23713-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Thursday 05 January 2017 09:46 AM, Alim Akhtar wrote:
> Hi Jaehoon,
> 
> On 01/04/2017 06:04 PM, Jaehoon Chung wrote:
>> Adds the exynos-pcie-phy binding for Exynos PCIe PHY.
>> This is for using generic PHY framework.
>>
>> Signed-off-by: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>> Changelog on V2:
>> - Remove the child node.
>> - Add 2nd address to the parent reg prop.
>>
>>  Documentation/devicetree/bindings/phy/samsung-phy.txt | 17
>> +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> index 9872ba8..ab80bfe 100644
>> --- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> +++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> @@ -191,3 +191,20 @@ Example:
>>          usbdrdphy0 = &usb3_phy0;
>>          usbdrdphy1 = &usb3_phy1;
>>      };
>> +
>> +Samsung Exynos SoC series PCIe PHY controller
>> +--------------------------------------------------
>> +Required properties:
>> +- compatible : Should be set to "samsung,exynos5440-pcie-phy"
>> +- #phy-cells : Must be zero
>> +- reg : a register used by phy driver.
>> +    - First is for phy register, second is for block register.
>> +- reg-names : Must be set to "phy" and "block".
>> +
> In general PHY uses a "reference clock" to work, if that is true for
> 5440 also, will you consider adding an (may be) optional clock
> properties as well?
> 

Yes, right, second clock, referred as "bus_clk" in pcie node should
actually refer to "phy" clock. From Exynos5433 DT patch also you are
mapping it to CLK_PCLK_PCIE_PHY which is a phy clk. This is same in
Exynos7 as well. So better we have clocks property defined in pcie-phy
binding. What do you say?

>From Exynos5440 UM, PCIe-Phy needs 250 MHz, clock and second clock used
as "bus_clk" is providing 250 MHz, so this can be moved in phy driver.


Thanks,
Pankaj Dubey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
