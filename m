From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH] usb: dwc3: remove generic PHYs forwarding for XHCI device
Date: Fri, 9 Aug 2019 13:31:19 +0300
Message-ID: <754c3127-dd78-3afd-e047-68404d6ebec5@ti.com>
References: <CGME20190719093045eucas1p1a1c6f26ae4103e9ed283fff2396beaef@eucas1p1.samsung.com>
 <20190719093037.16181-1-m.szyprowski@samsung.com> <87h86rn7r9.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87h86rn7r9.fsf@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 08/08/2019 15:47, Felipe Balbi wrote:
> 
> Hi,
> 
> Marek Szyprowski <m.szyprowski@samsung.com> writes:
> 
>> Commit 08f871a3aca2 ("usb: dwc3: host: convey the PHYs to xhci") added
>> forwarding of the generic PHYs from DWC3 core to the instantiated XHCI-plat
>> device. However XHCI(-plat) driver never gained support for generic PHYs,
>> thus the lookup added by that commit is never used. In meantime the commit
>> d64ff406e51e ("usb: dwc3: use bus->sysdev for DMA configuration")
>> incorrectly changed the device used for creating lookup, making the lookup
>> useless and generic PHYs inaccessible from XHCI device.
>>
>> However since commit 178a0bce05cb ("usb: core: hcd: integrate the PHY
>> wrapper into the HCD core") USB HCD already handles generic PHYs acquired
>> from the HCD's 'sysdev', which in this case is DWC3 core device. This means
>> that creating any custom lookup entries for XHCI driver is no longer needed
>> and can be simply removed.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  drivers/usb/dwc3/host.c | 22 ++++------------------
>>  1 file changed, 4 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
>> index f55947294f7c..8deea8c91e03 100644
>> --- a/drivers/usb/dwc3/host.c
>> +++ b/drivers/usb/dwc3/host.c
>> @@ -85,7 +85,7 @@ int dwc3_host_init(struct dwc3 *dwc)
>>  						DWC3_XHCI_RESOURCES_NUM);
>>  	if (ret) {
>>  		dev_err(dwc->dev, "couldn't add resources to xHCI device\n");
>> -		goto err1;
>> +		goto err;
>>  	}
>>  
>>  	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
>> @@ -112,37 +112,23 @@ int dwc3_host_init(struct dwc3 *dwc)
>>  		ret = platform_device_add_properties(xhci, props);
>>  		if (ret) {
>>  			dev_err(dwc->dev, "failed to add properties to xHCI\n");
>> -			goto err1;
>> +			goto err;
>>  		}
>>  	}
>>  
>> -	phy_create_lookup(dwc->usb2_generic_phy, "usb2-phy",
>> -			  dev_name(dwc->dev));
>> -	phy_create_lookup(dwc->usb3_generic_phy, "usb3-phy",
>> -			  dev_name(dwc->dev));
>> -
>>  	ret = platform_device_add(xhci);
>>  	if (ret) {
>>  		dev_err(dwc->dev, "failed to register xHCI device\n");
>> -		goto err2;
>> +		goto err;
>>  	}
>>  
>>  	return 0;
>> -err2:
>> -	phy_remove_lookup(dwc->usb2_generic_phy, "usb2-phy",
>> -			  dev_name(dwc->dev));
>> -	phy_remove_lookup(dwc->usb3_generic_phy, "usb3-phy",
>> -			  dev_name(dwc->dev));
>> -err1:
>> +err:
>>  	platform_device_put(xhci);
>>  	return ret;
>>  }
>>  
>>  void dwc3_host_exit(struct dwc3 *dwc)
>>  {
>> -	phy_remove_lookup(dwc->usb2_generic_phy, "usb2-phy",
>> -			  dev_name(dwc->dev));
>> -	phy_remove_lookup(dwc->usb3_generic_phy, "usb3-phy",
>> -			  dev_name(dwc->dev));
>>  	platform_device_unregister(dwc->xhci);
>>  }
> 
> Roger, could you verify that this doesn't regress any of your platforms?

Patch is fine with our platforms.

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
