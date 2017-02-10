From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: Odroid XU4: fix USB3.0 ports
Date: Fri, 10 Feb 2017 15:34:39 +0200
Message-ID: <20170210133439.qfiuggbuoi7hq6el@kozik-lap>
References: <20170124134809.23315-1-richard.genoud@gmail.com>
 <CANAwSgRAT0-XETx=yVRgM4GfukFLLEw-hqHjYGEWs0tqAx8g2g@mail.gmail.com>
 <CGME20170125075556epcas1p4b916a6d6acda28f8fc1959a1227520fa@epcas1p4.samsung.com>
 <CAJKOXPesCuYsK23466=6W9PPX7DtztdymZLBfNz0Dmjzwp4qBA@mail.gmail.com>
 <ef6c0d33-73d6-805e-aeab-86190e8b0aa0@samsung.com>
 <CAJKOXPd+CnmVG282NEVCFqS_3YEURCWx41udyQKpL21keGJOWg@mail.gmail.com>
 <4dca1d8e-f955-7791-90c0-4e73a273fe62@gmail.com>
 <CACQ1gAj5ebug28CJ2xiYWKohMhNbGr=tmy6mS-57CFq=K-bqyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACQ1gAj5ebug28CJ2xiYWKohMhNbGr=tmy6mS-57CFq=K-bqyQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Felipe Balbi <balbi@kernel.org>, Huang Rui <ray.huang@amd.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kukjin Kim <kgene@kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Feb 09, 2017 at 11:26:48AM +0100, Richard Genoud wrote:
> I did some tests with XU3 and XU4, playing with USB2 and USB3 quirks
> (snps,dis_u{2,3}_susphy_quirk)
> 
> kernel for the tests: next-20170206
> DTBs: exynos5422-odroidxu3-lite.dtb exynos5422-odroidxu4.dtb
> 
> USB devices used for the tests: kingston USB3 key, Akasa sata/USB3
> +SSD standard USB2 key
> once recognized, a dd if=/dev/sda bs=1M count=100 of=/dev/null is done.
> 
> 
> The results are:
> - On XU4:
>   - adding snps,dis_u2_susphy_quirk doesn't change anything:
>     inserting an USB2 or USB3 device gives the error message:
>     xhci-hcd xhci-hcd.2.auto: Port resume took longer than 20000 msec,
> port status = 0xc400fe3
>   - with snps,dis_u3_susphy_quirk, USB2 and USB3 devices are recognized
> 
> - On XU3:
>   - Without changing XU3 dts, USB2 devices are recognized.
>   - With or without the snps,dis_u3_susphy_quirk, USB3 devices are not
> recognized/not working properly
>   (never seen or disconnected, unable to enumerate, etc.)
>   However, adding an external powered USB3 hub in between works. (with
> or without the snps,dis_u3_susphy_quirk)
>   Anyway, this problem doesn't seems to be related to the other since
>   addind the quirks doesn't change anything.

>From this description I am missing where are you inserting the USB
devices.

Both boards have totally different USB port configuration. On XU3 the
hub is on USB 2.0 port. On XU4 the opposite - the hub is on USB 3.0
port.

Best regards,
Krzysztof

> - On XU3 USB3 device port (dr_mode = "peripheral"):
>   - acting as an ethernet gadget only works with the snps,dis_u3_susphy_quirk.
>     It works well as USB2 or USB3 (tested with ethernet gadget+iperf)
> 
> So, at the end, it does seem usefull to add the
> snps,dis_u3_susphy_quirk at the exynos5420.dtsi level.
> Adding the snps,dis_u2_susphy_quirk doesn't seems to change anything
> for XU3/XU4 board,
> so I don't know if it is necessary or not.
