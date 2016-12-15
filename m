From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: Warnings on boot since: usb: dwc3: use bus->sysdev for DMA
 configuration
Date: Thu, 15 Dec 2016 19:54:58 +0200
Message-ID: <20161215175458.GB6520@kozik-lap>
References: <a99add8f-9c38-a3e7-0c8e-972137d411bc@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f194.google.com ([209.85.210.194]:34770 "EHLO
        mail-wj0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753947AbcLORzI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Dec 2016 12:55:08 -0500
Received: by mail-wj0-f194.google.com with SMTP id xy5so10994558wjc.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Dec 2016 09:55:07 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <a99add8f-9c38-a3e7-0c8e-972137d411bc@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, krzk@kernel.org

On Thu, Dec 15, 2016 at 10:19:37AM +0100, Markus Reichl wrote:
> Hi,
> 
> since commit d64ff406e51e4f359afedbf2468a10440d6d8cef
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Thu Nov 17 17:13:47 2016 +0530
> usb: dwc3: use bus->sysdev for DMA configuration
> 
> I get the following warning on boot with Odroid XU3 and XU4:
> 
> 
> [    2.637677] ------------[ cut here ]------------
> [    2.637703] WARNING: CPU: 2 PID: 112 at drivers/usb/host/xhci-plat.c:159 xhci_plat_probe+0x198/0x41c

Indeed, I see it too. Looks like parent should be selected with
linux,sysdev_is_parent? Anyway the linux,sysdev_is_parent lacks
documentation.

Best regards,
Krzysztof
