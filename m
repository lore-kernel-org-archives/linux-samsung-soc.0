From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 4/4] ARM: dts: refactor Odroid DTS file and add support for
 Odroid X2 and U2/U3
Date: Tue, 24 Jun 2014 13:47:53 +0200
Message-ID: <53A96569.6020705@samsung.com>
References: <1402997133-13827-1-git-send-email-m.szyprowski@samsung.com>
 <1402997133-13827-5-git-send-email-m.szyprowski@samsung.com>
 <CAD8Lp46oYP6wiT_Ehor6O-LZ8Z+vgJLh0fKivKKCdzVG+SGNgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:11216 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466AbaFXLr4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 07:47:56 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7O000IB8RFF810@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Jun 2014 12:47:39 +0100 (BST)
In-reply-to: <CAD8Lp46oYP6wiT_Ehor6O-LZ8Z+vgJLh0fKivKKCdzVG+SGNgQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>

Hello,

On 2014-06-19 14:43, Daniel Drake wrote:
> On Tue, Jun 17, 2014 at 10:25 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> This patch moves some parts of exynos4412-odroidx.dts to common
>> exynos4412-odroid-common.dtsi file and adds support for Odroid X2 and
>> U2/U3 boards. X2 is same as X, but it has faster SoC module (1.7GHz
>> instead of 1.4GHz), while U2/U3 differs from X2 by different way of
>> routing signals to host USB hub. It also lacks some hw modules not yet
>> supported by those dts files (i.e. LCD & touch panel).
> Thanks for this! It is working on ODROID-U2: at least eMMC/SD, LED, serial.
>
> Just 2 minor questions from reviewing:
>
> Odroid-X DTS used to have serial ports at 13820000 and 13830000, this
> patch removes them, but leaves 2.

Right. I've forgot the UART port change. Now I've checked it again and
schematics reveals that Odroid X/X2 and U2/U3 has UART1 available on UART
connector. On the other hand U2/U3 have UART0 RX/TX lines on GPIO connector,
while X/X2 has UART3 lines on the LCD/GPIO connector.

> I can understand the idea of removing entries for ports that are not
> available on the board, but I've never seen an ODROID with 2 serial
> ports - should we bring this down to just the 1 enabled serial port
> that is accessible?

That would be best solution, but this way the tty driver name will change
from ttySAC1 to ttySAC0 for UART1 port. Until uart driver gets fixed, I
would keep all 4 uart defined on X/X2 and define only uart 0 and 1 on
U2/U3. I will fix this in the next version of Odroid patches.

> Odroid-X DTS used to enable EHCI port 2, but with this refactoring, no
> longer does. Intentional?

This was a bug in the initial patch adding usb support. X and X2 uses only
HSCI0 port (ehci port 1).

Thanks for your review!

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
