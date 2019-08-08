From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 2/2 RESEND] usb: dwc3: remove generic PHY calibrate()
 calls
Date: Thu, 8 Aug 2019 12:38:51 +0200
Message-ID: <e489412b-ce5d-7625-34e6-1af06b834620@samsung.com>
References: <20190808094128.27213-1-m.szyprowski@samsung.com>
        <CGME20190808094146eucas1p27c673846a5a9be0c55f1f87c89af4adf@eucas1p2.samsung.com>
        <20190808094128.27213-3-m.szyprowski@samsung.com> <875zn8t27b.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <875zn8t27b.fsf@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jochen Sprickerhof <jochen@sprickerhof.de>, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Felipe,

On 2019-08-08 11:51, Felipe Balbi wrote:
> Marek Szyprowski <m.szyprowski@samsung.com> writes:
>> Calls to USB2 generic PHY calibrate() method has been moved to HCD core,
>> which now successfully handles generic PHYs and their calibration after
>> every HCD reset. This fixes all the timing issues related to PHY
>> calibration done directly from DWC3 driver: incorrect operation after
>> system suspend/resume or USB3.0 detection failure when XHCI-plat driver
>> compiled as separate module.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Anand Moon <linux.amoon@gmail.com>
>> Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>
>> ---
>>   drivers/usb/dwc3/core.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index c9bb93a2c81e..7dd6d419254d 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -168,7 +168,6 @@ static void __dwc3_set_mode(struct work_struct *work)
>>   				otg_set_vbus(dwc->usb2_phy->otg, true);
>>   			phy_set_mode(dwc->usb2_generic_phy, PHY_MODE_USB_HOST);
>>   			phy_set_mode(dwc->usb3_generic_phy, PHY_MODE_USB_HOST);
>> -			phy_calibrate(dwc->usb2_generic_phy);
> are you sure you're the only one using phy_calibrate()? I don't want any
> regressions because of this :-p

Yes I've checked. In case of USB PHYs, the .calibrate method is only 
implemented by Exynos DRDUSB3 PHY driver:

# git grep \\\.calibrate drivers/phy
drivers/phy/broadcom/phy-brcm-sata.c:   .calibrate      = 
brcm_sata_phy_calibrate,
drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.c: .calibrate              = 
ufs_qcom_phy_qmp_14nm_phy_calibrate,
drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.c: .calibrate              = 
ufs_qcom_phy_qmp_20nm_phy_calibrate,
drivers/phy/samsung/phy-exynos5-usbdrd.c:       .calibrate      = 
exynos5_usbdrd_phy_calibrate,

(the other PHY drivers are for SATA or UFS).

To avoid the regression on Exynos it is enough to apply the 2 patches 
from this patchset together.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
