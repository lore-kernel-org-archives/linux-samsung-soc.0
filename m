From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 1/4] ARM: dts: exynos4: add port sub-nodes to exynos usb
 host modules
Date: Thu, 19 Jun 2014 12:44:13 +0100
Message-ID: <CAD8Lp46jHt53-Ckyrx76LiL-j_hHEW9tqqYQEWrDD5NCVKoSFQ@mail.gmail.com>
References: <1402997133-13827-1-git-send-email-m.szyprowski@samsung.com>
	<1402997133-13827-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:63041 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757383AbaFSLoO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 07:44:14 -0400
Received: by mail-wi0-f180.google.com with SMTP id hi2so2690056wib.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jun 2014 04:44:13 -0700 (PDT)
In-Reply-To: <1402997133-13827-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>

On Tue, Jun 17, 2014 at 10:25 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> This patch adds port sub-nodes to exynos4 ehci and ohci modules, which
> are required by recently merged new exynos4 usb2 phy support.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

I checked this against the DT binding documentation for the
samsung,exynos4210-ohci and samsung,exynos4210-ehci nodes, and also
the usb2 phy binding docs. Looks fine.

Also tested on ODROID-U2, seems to be working:

ehci-exynos: EHCI EXYNOS driver
exynos-ehci 12580000.ehci: EHCI Host Controller
exynos-ehci 12580000.ehci: new USB bus registered, assigned bus number 1
exynos-ehci 12580000.ehci: irq 102, io mem 0x12580000
exynos-ehci 12580000.ehci: USB 2.0 started, EHCI 1.00
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-exynos: OHCI EXYNOS driver

...and the onboard USB (EHCI) ethernet adapter works. Nice.

The only thing I don't quite understand is the relationship between
EHCI and OHCI controllers, one being at 12580000 and the other at
1259000; the SoC docs (which I have not studied in detail) don't make
this very clear to me - no registers listed at base address 12590000?
Anyway,

Reviewed-by: Daniel Drake <drake@endlessm.com>
