From: Anand Moon <linux.amoon@gmail.com>
Subject: Odroid XU4 usb 3.0 clk summary.
Date: Mon, 21 Aug 2017 01:49:39 +0530
Message-ID: <CANAwSgTq75gH2k2Mxxs5BfEckpNkOhfBk3j+KwZS3JrqgBiK3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36709 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753299AbdHTUUA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Aug 2017 16:20:00 -0400
Received: by mail-oi0-f51.google.com with SMTP id g131so137465301oic.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Aug 2017 13:20:00 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Brian Kim <brian.kim@hardkernel.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi All,

I have some issue on performance on USB 3.0 on Odroid XU4.
some inconsistency on heavy read/write issue on hdd / ssd.
with intermediated failure in hub reset, with no kernel panic.

Jul 31 00:04:52 odroid kernel: usb 4-1.1: reset SuperSpeed USB device
number 3 using xhci-hcd
Jul 31 00:04:53 odroid kernel: usb 4-1.1: reset SuperSpeed USB device
number 3 using xhci-hcd
Jul 31 00:04:55 odroid kernel: usb 4-1.1: reset SuperSpeed USB device
number 3 using xhci-hcd

So I just wonder if this could be related to usb 3.0 clk.
So the cross check check the ck_summary of HK 3.10.x and mainline 4.13.x

ck_summary HK 3.10.x         https://pastebin.com/qGGHj1t6

    mout_usbdrd300              3           3            24000000
       dout_usbdrd300           2           2            24000000
          sclk_usbdrd300        1           1            24000000
       dout_usbphy300           2           2            24000000
          sclk_usbphy300        1           1            24000000
    mout_usbdrd301              3           3            24000000
       dout_usbdrd301           2           2            24000000
          sclk_usbdrd301        1           1            24000000
       dout_usbphy301           2           2            24000000
          sclk_usbphy301        1           1            24000000

clk_summary mainline 4.13.x          https://pastebin.com/i7ij29Sm

    mout_usbd300                          1            1    24000000
       0 0
       dout_usbd300                       0            0    24000000
       0 0
          sclk_usbd300                    0            0    24000000
       0 0
       dout_usbphy300                     1            1    24000000
       0 0
          sclk_usbphy300                  4            4    24000000
       0 0
    mout_usbd301                          1            1    24000000
       0 0
       dout_usbd301                       0            0    24000000
       0 0
          sclk_usbd301                    0            0    24000000
       0 0
       dout_usbphy301                     1            1    24000000
       0 0
          sclk_usbphy301                  3            3    24000000
       0 0

So their seem to be some difference in the clk count on usb 3.0.
could this be related to the above behavior.

Form the schematic of Odroid XU4 it seem to have USB_CLK to control usb.
usb clk to but could not find any link in the exynos5420 clk code.

Odroid XU4 has USB HUB GL852G-OHG  controller.
possible datasheet of hub controller
http://minipcsale.ru/images/Minix-Neo-X8-h/GL852G.pdf

How can we control the vbus power of the usb 3.0 ports ?

XUSB30OVERCUR_U2/ETC5_0
XUSB30OVERCUR_U3/ETC5_1
XUSB30VBUSCTRL_U2/ETC5_2
XUSB30VBUSCTRL_U3/ETC5_3

I have also tried to setup vbu/vbus-boost via dts but no success.

I have also tried to enable power-domain fsys for usb device
but it's say unsupported setting.

If you could share some inputs it would be useful in debug and enhance the code.

Best Regards
-Anand
