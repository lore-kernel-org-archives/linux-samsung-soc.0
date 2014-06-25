From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: refactor Odroid DTS file and add support
 for Odroid X2 and U2/U3
Date: Thu, 26 Jun 2014 00:15:40 +0200
Message-ID: <53AB4A0C.7010200@gmail.com>
References: <1402997133-13827-1-git-send-email-m.szyprowski@samsung.com> <1402997133-13827-5-git-send-email-m.szyprowski@samsung.com> <CAD8Lp46oYP6wiT_Ehor6O-LZ8Z+vgJLh0fKivKKCdzVG+SGNgQ@mail.gmail.com> <53A96569.6020705@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:60662 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755730AbaFYWQC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 18:16:02 -0400
Received: by mail-we0-f172.google.com with SMTP id u57so2656806wes.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2014 15:16:00 -0700 (PDT)
In-Reply-To: <53A96569.6020705@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Daniel Drake <drake@endlessm.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>

Hi Marek, Daniel,

On 24.06.2014 13:47, Marek Szyprowski wrote:
> Hello,
> 
> On 2014-06-19 14:43, Daniel Drake wrote:
>> On Tue, Jun 17, 2014 at 10:25 AM, Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> This patch moves some parts of exynos4412-odroidx.dts to common
>>> exynos4412-odroid-common.dtsi file and adds support for Odroid X2 and
>>> U2/U3 boards. X2 is same as X, but it has faster SoC module (1.7GHz
>>> instead of 1.4GHz), while U2/U3 differs from X2 by different way of
>>> routing signals to host USB hub. It also lacks some hw modules not yet
>>> supported by those dts files (i.e. LCD & touch panel).
>> Thanks for this! It is working on ODROID-U2: at least eMMC/SD, LED,
>> serial.
>>
>> Just 2 minor questions from reviewing:
>>
>> Odroid-X DTS used to have serial ports at 13820000 and 13830000, this
>> patch removes them, but leaves 2.
> 
> Right. I've forgot the UART port change. Now I've checked it again and
> schematics reveals that Odroid X/X2 and U2/U3 has UART1 available on UART
> connector. On the other hand U2/U3 have UART0 RX/TX lines on GPIO
> connector,
> while X/X2 has UART3 lines on the LCD/GPIO connector.
> 
>> I can understand the idea of removing entries for ports that are not
>> available on the board, but I've never seen an ODROID with 2 serial
>> ports - should we bring this down to just the 1 enabled serial port
>> that is accessible?
> 
> That would be best solution, but this way the tty driver name will change
> from ttySAC1 to ttySAC0 for UART1 port. Until uart driver gets fixed, I
> would keep all 4 uart defined on X/X2 and define only uart 0 and 1 on
> U2/U3. I will fix this in the next version of Odroid patches.

I managed to code port ID look-up from DT aliases today. I'll try to
polish the patches a bit more and send them to ML tomorrow. With this,
the problem should be fixed.

Best regards,
Tomasz
