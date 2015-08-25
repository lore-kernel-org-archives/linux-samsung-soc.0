From: Tyler Baker <tyler.baker@linaro.org>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable DWC2 USB driver and USB
 ethernet gadget
Date: Tue, 25 Aug 2015 14:00:15 -0700
Message-ID: <CANMBJr4gwDg8iNcKmVKXqeKBkDhh36BFxeSnCSe0ny4E+LqmFg@mail.gmail.com>
References: <1439889333-11990-1-git-send-email-m.szyprowski@samsung.com>
	<55D2FC8D.2020007@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:36140 "EHLO
	mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752588AbbHYVAQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 17:00:16 -0400
Received: by iodv127 with SMTP id v127so202469401iod.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2015 14:00:15 -0700 (PDT)
In-Reply-To: <55D2FC8D.2020007@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Kevin Hilman <khilman@linaro.org>

Hi Marek/Krzysztof,

On 18 August 2015 at 02:36, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> On 18.08.2015 18:15, Marek Szyprowski wrote:
>> DWC2 (s3c-hsotg) hardware module is available on many Exynos based boards,
>> so enable DWC2 driver as well as the most common USB Ethernet gadget.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

The kernelci.org bot recently reported a handful of exynos boot
failures in next-20150825[1] only when using exynos_defconfig. I went
ahead and bisected[2] the failure and found this patch was the
offender. Looking a bit closer, the kernelci.org boot tests typically
pass ip=dhcp or ip=<ipaddr> as a kernel argument so that networking is
setup by the kernel. These boot failures are due to the kernel network
initialization timing out. Previously, in next-20150821[3] all the
exynos platforms failing in next-20150825 initialized their network
interfaces successfully, so this seems like a regression. Please have
a closer look at the boot logs[4][5] for comparison. Kevin pointed out
that  "asix 3-3.2.4:1.0 eth0: register 'asix' at
usb-12110000.usb-3.2.4, ASIX AX88772 USB 2.0 Ethernet" is missing from
the failed boot logs. Anyways, as a summary it looks like this change
broke networking support on the arndale, arndale-octa, odroid xu3, and
odroid x2.

Cheers,

Tyler
[1] http://kernelci.org/boot/?next-20150825&exynos_defconfig&fail
[2] http://hastebin.com/otafedoxig.vala
[3] http://kernelci.org/boot/?next-20150821&exynos_defconfig
[4] http://storage.kernelci.org/next/next-20150825/arm-exynos_defconfig/lab-khilman/boot-exynos5250-arndale.html
[5] http://storage.kernelci.org/next/next-20150821/arm-exynos_defconfig/lab-khilman/boot-exynos5250-arndale.html
