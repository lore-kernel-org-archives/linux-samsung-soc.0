From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] usb: dwc2: Force 8bit UTMI width for Samsung Exynos
 SoCs
Date: Tue, 7 May 2019 11:17:31 +0200
Message-ID: <eefff244-f311-e59e-d914-9a18b5a21620@samsung.com>
References: <20190503204958.GA12532@kozik-lap>
        <CGME20190506130052eucas1p25afd4e15648e9efc6fd011e46081fbea@eucas1p2.samsung.com>
        <20190506130046.20898-1-m.szyprowski@samsung.com>
        <39c7b687-449e-5e89-4c70-527d4e779fd9@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <39c7b687-449e-5e89-4c70-527d4e779fd9@fivetechno.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jules Maselbas <jmaselbas@kalray.eu>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Markus,

On 2019-05-07 10:12, Markus Reichl wrote:
> Hi Marek,
>
> your patch did not help on stable v5.1
>
> [    3.255963] samsung-usb2-phy 125b0000.exynos-usbphy: 125b0000.exynos-usbphy supply vbus not found, using dummy regulator
> [    4.044547] usbcore: registered new interface driver smsc95xx
> [    4.112261] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.01
> [    4.120363] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    4.127560] usb usb1: Product: EHCI Host Controller
> [    4.132415] usb usb1: Manufacturer: Linux 5.1.0-00005-geb4efae48eb5 ehci_hcd
> [    4.139446] usb usb1: SerialNumber: 12580000.ehci
> [    4.183056] usb3503 0-0008: switched to HUB mode
> [    4.183121] usb3503 0-0008: usb3503_probe: probed in hub mode
> [    4.488344] usb 1-2: new high-speed USB device number 2 using exynos-ehci
> [    4.675605] usb 1-2: New USB device found, idVendor=0424, idProduct=3503, bcdDevice=a1.a0
> [    4.678166] usb 1-2: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    4.686140] usb 1-2: skipping disabled interface 0
>
> root@odroid-x2:~# lsusb
> Bus 001 Device 002: ID 0424:3503 Standard Microsystems Corp.
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

This patch fixes the issue introduced by "usb: dwc2: gadget: Replace 
phyif with phy_utmi_width" commit, which is queued only to linux-next so 
far. Stable v5.1 doesn't include it, so the fix doesn't change anything 
on v5.1.

I've checked and OdroidU3 works fine with v5.1 release, but X2 fails to 
detect USB devices. I will investigate this in a few minutes...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
