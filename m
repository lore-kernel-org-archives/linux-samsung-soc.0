From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH] ARM: dts: Odroid XU4: fix USB3.0 ports
Date: Thu, 26 Jan 2017 00:04:45 +0530
Message-ID: <CANAwSgTUZFfm_PKn2Eq3nN0CBQV-TceJW9Et8Ay1U=rwNpX1eA@mail.gmail.com>
References: <20170124134809.23315-1-richard.genoud@gmail.com>
 <CANAwSgRAT0-XETx=yVRgM4GfukFLLEw-hqHjYGEWs0tqAx8g2g@mail.gmail.com>
 <CGME20170125075556epcas1p4b916a6d6acda28f8fc1959a1227520fa@epcas1p4.samsung.com>
 <CAJKOXPesCuYsK23466=6W9PPX7DtztdymZLBfNz0Dmjzwp4qBA@mail.gmail.com>
 <ef6c0d33-73d6-805e-aeab-86190e8b0aa0@samsung.com> <CAJKOXPd+CnmVG282NEVCFqS_3YEURCWx41udyQKpL21keGJOWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPd+CnmVG282NEVCFqS_3YEURCWx41udyQKpL21keGJOWg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Richard Genoud <richard.genoud@gmail.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Felipe Balbi <balbi@kernel.org>, Huang Rui <ray.huang@amd.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kukjin Kim <kgene@kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 25 January 2017 at 19:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Jan 25, 2017 at 3:48 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Hi Krzysztof,
>>
>> On 2017-01-25 08:55, Krzysztof Kozlowski wrote:
>>>
>>> On Wed, Jan 25, 2017 at 7:51 AM, Anand Moon <linux.amoon@gmail.com> wrote:
>>>>
>>>> On 24 January 2017 at 19:18, Richard Genoud <richard.genoud@gmail.com>
>>>> wrote:
>>>>>
>>>>> Since commit 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores"),
>>>>> the USB ports on odroid-XU4 don't work anymore.
>>>>>
>>>>> Inserting an usb key (USB2.0) on the USB3.0 port result in:
>>>>> [ 64.488264] xhci-hcd xhci-hcd.2.auto: Port resume took longer than
>>>>> 20000 msec, port status = 0xc400fe3
>>>>> [   74.568156] xhci-hcd xhci-hcd.2.auto: xHCI host not responding to
>>>>> stop endpoint command.
>>>>> [   74.574806] xhci-hcd xhci-hcd.2.auto: Assuming host is dying, halting
>>>>> host.
>>>>> [   74.601970] xhci-hcd xhci-hcd.2.auto: HC died; cleaning up
>>>>> [   74.606276] usb 3-1: USB disconnect, device number 2
>>>>> [   74.613565] usb 4-1: USB disconnect, device number 2
>>>>> [   74.621208] usb usb3-port1: couldn't allocate usb_device
>>>>> NB: it's not related to USB2.0 devices, I get the same result with an
>>>>> USB3.0 device (SATA to USB3 for instance).
>>>>> NB2: it doesn't happen on an odriod-XU3 board, that doesn't have the
>>>>> realtek RTL8153 chip.
>>>>>
>>>>> If the lines:
>>>>>          if (dwc->revision > DWC3_REVISION_194A)
>>>>>                  reg |= DWC3_GUSB3PIPECTL_SUSPHY;
>>>>> are commented out, the USB3.0 start working.
>>>>>
>>>>> For a full analyse: https://lkml.org/lkml/2017/1/18/678
>>>>>
>>>>> Felipe suggested that suspend should be disabled temporarily while
>>>>> what's wrong with DCW3 is figured out.
>>>>>
>>>>> Tested on Odroid XU4
>>>>>
>>>>> Suggested-by: Felipe Balbi <felipe.balbi@linux.intel.com>
>>>>> Tested-by: Richard Genoud <richard.genoud@gmail.com>
>>>>> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>>>>> Cc: stable@vger.kernel.org # 4.4+
>>>>> Fixes: 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores")
>>>>> ---
>>>>>   arch/arm/boot/dts/exynos5422-odroidxu4.dts | 9 +++++++++
>>>>>   1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>>>>> b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>>>>> index 2faf88627a48..f62dbd9b5ad3 100644
>>>>> --- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>>>>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>>>>> @@ -43,6 +43,15 @@
>>>>>          status = "okay";
>>>>>   };
>>>>>
>>>>> +&usbdrd_dwc3_0 {
>>>>> +       /*
>>>>> +        * without that, usb devices are not recognized when
>>>>> +        * they are plugged.
>>>>> +        * cf: https://lkml.org/lkml/2017/1/18/678
>>>>> +        */
>>>>> +       snps,dis_u3_susphy_quirk;
>>>>> +};
>>>>> +
>>>>>   &usbdrd_dwc3_1 {
>>>>>          dr_mode = "host";
>>>>>   };
>>>>> --
>>>>
>>>> Thanks for this patch.
>>>> But could you consider moving this changes as below.
>>>>
>>>> https://lkml.org/lkml/2015/3/18/400
>>>
>>> The patch above (and other DTS patches from the set) was not even sent
>>> to linux-samsung-soc nor to me... It is sad how easily one's work can
>>> disappear. Also, it is really worthless to solve the same problem
>>> twice.
>>
>>
>> Well, they were sent about 2 years ago... and you were also working on this
>> topic. ;)
>
> Nope, I have never worked on this. That time I was in Korea so my
> tasks were completely different. Later when I got back, I took for a
> second U3 OTG which was not involving this thing.
>
>>> Cc Marek and Bartlomiej,
>>> Guys, do you want to continue with Robert's patch (linked above by
>>> Anand)? If yes, please take the ownership (Robert's address is not
>>> valid anymore). If not, I will take Richard's patch after
>>> resubmission.
>>
>>
>> Take Richard's patch because it has a bit more details describing why such
>> quirk
>> is needed.
>>
>> Richard: in Roberts patch there is also a quirk for USB 2.0 mode
>> (snps,dis_u2_susphy_quirk). Could you check if it really needed?
>>
>> Maybe it would make sense to set those quirks for both DWC3 controllers, as
>> this
>> issue with PHY suspend seems to be a Exynos specific thing.
>
> Okay,
> Richard, please continue with your patch.
>
> Best regards,
> Krzysztof

Their is certainly some issue with respect PHY in phy-exynos5-usbdrd
or dwc3-exynos.c

odroid@odroidxu4n:~$ lsusb -v|egrep "^Bus|MaxPower"
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
    MaxPower                0mA
Bus 005 Device 002: ID 0bda:8153 Realtek Semiconductor Corp.
    MaxPower              180mA
    MaxPower              180mA
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
    MaxPower                0mA
Bus 004 Device 099: ID 174c:5106 ASMedia Technology Inc. ASM1051 SATA
3Gb/s bridge
    MaxPower                0mA
Bus 004 Device 002: ID 05e3:0616 Genesys Logic, Inc. hub
    MaxPower                0mA
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
    MaxPower                0mA
Bus 003 Device 002: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
    MaxPower              100mA
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
    MaxPower                0mA
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
    MaxPower                0mA
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
    MaxPower                0mA

1 When the board boot cold boot these two dwc3 controller initializes correctly.
     usbdrd_dwc3_0 ------> usb 3.0 port1
     usbdrd_dwc3_0-------> usb 3.0 port2

     usbdrd_dwc3_1 ------> usb 3.0 ethernet port

None of the usb 3.0 host port get powered via usb .
    ie these port are not mapped to phy.
what is the correct way to enable power on the ports ?

2 When we remove the usb device it dose not disconnect in correct way.
   port or phy poweroff is not happening correctly.

3 But on warm boot their is no reset of port.
   the reset of port is not happening, the power on the port remain on.

I have tried to debug the some of these issues but I was not able to
solve this complete.

do you think some similar fix is needed to power enable ports on exynos dwc3

commit 1c17675d6c733232f10afceec0bcd016ad3849f0 (usb: ehci-exynos:
Change to use phy provided by the generic phy framework)
commit 366126d5c6a5d9381a5f6a4e061ad0aba33e789e (ARM: dts: add port
sub-nodes to exynos usb host modules for exynos4)

Best Regards
-Anand
