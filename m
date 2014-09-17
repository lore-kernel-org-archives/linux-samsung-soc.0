From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH RESEND] ARM: DTS: correct the capability string for mmc0
Date: Wed, 17 Sep 2014 21:09:28 +0900
Message-ID: <01ce01cfd270$3b3d31b0$b1b79510$@kernel.org>
References: <1410857409-24767-1-git-send-email-gautam.vivek@samsung.com>
 <CAD=FV=U4rPsfGkTcSY3OYHPgCFOccaHTjG1qC6WAekOEV09Q7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32608 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754653AbaIQMJb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 08:09:31 -0400
In-reply-to: <CAD=FV=U4rPsfGkTcSY3OYHPgCFOccaHTjG1qC6WAekOEV09Q7A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Doug Anderson' <dianders@chromium.org>, 'Vivek Gautam' <gautam.vivek@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 'Jaehoon Chung' <jh80.chung@samsung.com>, 'Seungwon Jeon' <tgih.jun@samsung.com>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Kevin Hilman' <khilman@linaro.org>, 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>

Doug Anderson wrote:
> 
> Vivek,
> 
Hi,

> On Tue, Sep 16, 2014 at 1:50 AM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
> > From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> >
> > MMC capability for HS200 is parsed in mmc/core/host.c as
> > dts string "mmc-hs200-1_8v".
> >
> > This patch corrects the dts string for Exynos5420 based peach-pit
> > and Exynos5800 based peach-pi boards.
> >
> > Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>

In this case, Vivek's sign is required here.

> > ---
> >
> > Hi Kukjin,
> >
> > As commented by Doug earlier for this patch, the two patches required
> >   -- mmc: dw_mmc: Make sure we don't get stuck when we get an error
> >   -- mmc: dw_mmc: change to use recommended reset procedure
> > are now merged in upstream.
> > So you can go ahead and pick this change.
> >
> >  arch/arm/boot/dts/exynos5420-peach-pit.dts |    2 +-
> >  arch/arm/boot/dts/exynos5800-peach-pi.dts  |    2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>

Thanks, I will take this patch once Vivek replies his sign on this patch.

- Kukjin
