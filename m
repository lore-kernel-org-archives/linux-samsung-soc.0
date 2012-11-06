From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH v3 0/4] Adding usb2.0 host-phy support for exynos5250
Date: Tue, 6 Nov 2012 19:23:12 +0530
Message-ID: <CAFp+6iH=hs-Rr5CkcCWXLMeFQ+Q=xYC6xtZ1tybz=yeFRUcUwg@mail.gmail.com>
References: <1351518160-22369-1-git-send-email-gautam.vivek@samsung.com>
	<20121106131453.GL11931@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:46456 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750997Ab2KFNxO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 08:53:14 -0500
In-Reply-To: <20121106131453.GL11931@arwen.pp.htv.fi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, yulgon.kim@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com

Hi Balbi,


On Tue, Nov 6, 2012 at 6:44 PM, Felipe Balbi <balbi@ti.com> wrote:
> Hi,
>
> On Mon, Oct 29, 2012 at 07:12:36PM +0530, Vivek Gautam wrote:
>> This patchset is based on the work by Praveen Paneri for
>> samsung-usbphy driver:
>> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/12653
>>
>> Changes from v2:
>>  - Using "EXYNOS5_PHY_" as common prefix along with exact names for
>>    PHY SFRs for register definitions
>>  - Using register names with bit macros to make things more clear.
>>  - Removed parentheses around 0x230 in definition for EXYNOS5_USB_CFG
>>    in [patch 2/4 v2].
>>
>> Tested on smdk5250 target with usb-next branch along with arch patches
>> for exynos5250:
>> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13042
>> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13048
>>
>> Vivek Gautam (4):
>>   usb: phy: samsung: Add host phy support to samsung-phy driver
>>   ARM: Exynos5250: Enabling samsung-usbphy driver
>>   USB: ehci-s5p: Add phy driver support
>>   USB: ohci-exynos: Add phy driver support
>
> I really don't know what to do with this series. I know it depends on
> the other PHY changes which I have in my queue, but it touches too much
> arch specific code, plus the USB Host code which I don't maintain.
>

True, that it has dependency on the work by Praveen Paneri for samsung-usbphy
driver plus the arch support patches.

This is based on usb-next branch, so the host-code can be taken care of ?

> On top of all that, I have no platform to test these patches, which
> makes me even more worried about signing off under this series ;-)
>
The patches have however been tested. The two patches:
"USB: ehci-s5p: Add phy driver support",
"USB: ohci-exynos: Add phy driver support" have been acked by Jingoo Han
based on the patch-series.

Possibly Kukjin Kim can help on this one.

Kukjin,
Can we have a thought on this please.

> Would it be ok if we delay this to v3.9 ? At least the dependency with
> other PHY changes would be dropped by then.
>
This changes are almost in shape ;-) and i am updating the next patchset soon.
If possible can we try to get this in 3.8 please. :-)

> --
> balbi


-- 
Thanks & Regards
Vivek
