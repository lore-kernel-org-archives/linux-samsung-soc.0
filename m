From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [BUG BISECT] USB on Exynos4412 fails after usb: dwc2: gadget:
 Replace phyif with phy_utmi_width
Date: Tue, 7 May 2019 08:43:05 +0200
Message-ID: <bf605524-705a-8dc1-e54c-413564efc29b@samsung.com>
References: <20190503204958.GA12532@kozik-lap>
        <CGME20190507062136epcas1p3729d57b9d22f834ccd2de0a081ddfbde@epcas1p3.samsung.com>
        <d198f061-3ed6-11d9-4e92-0e0fb2705238@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d198f061-3ed6-11d9-4e92-0e0fb2705238@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jules Maselbas <jmaselbas@kalray.eu>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Minas,

On 2019-05-07 08:21, Minas Harutyunyan wrote:
> Hi Krzysztof,
>
> On 5/4/2019 12:50 AM, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Bisect pointed commit 707d80f0a3c5 ("usb: dwc2: gadget: Replace phyif
>> with phy_utmi_width") as reason for failures of USB on Exynos4412,
>> Odroid U3 board (ARMv7, exynos_defconfig, TFTP boot with nfsroot from
>> NFSv4):
>>
>> [    4.333996] usb 1-2: new high-speed USB device number 3 using 
>> exynos-ehci
>> [    4.503942] usb 1-2: device descriptor read/64, error -71
>> [    4.793970] usb 1-2: device descriptor read/64, error -71
>> [    4.914748] usb usb1-port2: attempt power cycle
>> [    6.224267] usb 1-3: new high-speed USB device number 5 using 
>> exynos-ehci
>> [    6.393983] usb 1-3: device descriptor read/64, error -71
>> [    6.684243] usb 1-3: device descriptor read/64, error -71
>> [    6.954259] usb 1-3: new high-speed USB device number 6 using 
>> exynos-ehci
>> [    7.123980] usb 1-3: device descriptor read/64, error -71
>> [    7.413969] usb 1-3: device descriptor read/64, error -71
>> [    7.534778] usb usb1-port3: attempt power cycle
>>
>> The boot failure is effect of lack of network adapter (USB, smsc95xx).
>> Expected:
>> [    4.285831] usb 1-3: New USB device found, idVendor=0424, 
>> idProduct=3503, bcdDevice=a1.a0
>> [    4.288986] usb 1-3: New USB device strings: Mfr=0, Product=0, 
>> SerialNumber=0
>> [    4.299596] hub 1-3:1.0: USB hub found
>> [    4.300027] hub 1-3:1.0: 3 ports detected
>> [    5.895541] smsc95xx 1-2:1.0 eth0: link up, 100Mbps, full-duplex, 
>> lpa 0xCDE1
>>
>> Full kernel log is here:
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__krzk.eu_-23_builders_25_builds_1330_steps_14_logs_serial0&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=6z9Al9FrHR_ZqbbtSAsD16pvOL2S3XHxQnSzq8kusyI&m=OiD-VOiMNPgl24seQpn5JKZq7f85A4LNzaz8zX0YrKs&s=WBsxDt_1PXo9t9AxxJkUTTLE6zx_UDc7ac_U3EydCzI&e= 
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__krzk.eu_-23_builders_25_builds_1330&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=6z9Al9FrHR_ZqbbtSAsD16pvOL2S3XHxQnSzq8kusyI&m=OiD-VOiMNPgl24seQpn5JKZq7f85A4LNzaz8zX0YrKs&s=Lxk4ZiitEFaod88HTY0hthrdRy_TtktU53P6UDtaCoE&e= 
>>
>>
>> Let me know if you need any more details.
>>
>> Best regards,
>> Krzysztof
>>
>>
>
> But fail seen on ehci driver not dwc2.

Right, but dwc2 and ehci share common USB2 PHY on Exynos4 SoCs, although 
they use different ports of it.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
