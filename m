From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: exynos4: add port sub-nodes to exynos usb
 host modules
Date: Thu, 19 Jun 2014 15:12:39 +0200
Message-ID: <53A2E1C7.3080805@gmail.com>
References: <1402997133-13827-1-git-send-email-m.szyprowski@samsung.com>	<1402997133-13827-2-git-send-email-m.szyprowski@samsung.com> <CAD8Lp46jHt53-Ckyrx76LiL-j_hHEW9tqqYQEWrDD5NCVKoSFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:38495 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752664AbaFSNNB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 09:13:01 -0400
Received: by mail-wi0-f170.google.com with SMTP id cc10so10077067wib.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jun 2014 06:13:00 -0700 (PDT)
In-Reply-To: <CAD8Lp46jHt53-Ckyrx76LiL-j_hHEW9tqqYQEWrDD5NCVKoSFQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>

On 19.06.2014 13:44, Daniel Drake wrote:
> On Tue, Jun 17, 2014 at 10:25 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> This patch adds port sub-nodes to exynos4 ehci and ohci modules, which
>> are required by recently merged new exynos4 usb2 phy support.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> I checked this against the DT binding documentation for the
> samsung,exynos4210-ohci and samsung,exynos4210-ehci nodes, and also
> the usb2 phy binding docs. Looks fine.
> 
> Also tested on ODROID-U2, seems to be working:

Thanks for testing.

> 
> ehci-exynos: EHCI EXYNOS driver
> exynos-ehci 12580000.ehci: EHCI Host Controller
> exynos-ehci 12580000.ehci: new USB bus registered, assigned bus number 1
> exynos-ehci 12580000.ehci: irq 102, io mem 0x12580000
> exynos-ehci 12580000.ehci: USB 2.0 started, EHCI 1.00
> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> ohci-exynos: OHCI EXYNOS driver
> 
> ...and the onboard USB (EHCI) ethernet adapter works. Nice.
> 
> The only thing I don't quite understand is the relationship between
> EHCI and OHCI controllers, one being at 12580000 and the other at
> 1259000; the SoC docs (which I have not studied in detail) don't make
> this very clear to me - no registers listed at base address 12590000?
> Anyway,

Well, that's exactly the same relationship as on PCs, where you have
both EHCI and UHCI/OHCI and depending on what kind of device you connect
the proper controller will pick it up.

AFAIK the base address is good, but I believe it was already tested anyway.

Best regards,
Tomasz
