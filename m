From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: DTS: correct the capability string for mmc0
Date: Wed, 25 Jun 2014 20:19:54 +0900
Message-ID: <030a01cf9067$63f3ff80$2bdbfe80$@samsung.com>
References: <1403522420-1208-1-git-send-email-ch.naveen@samsung.com>
 <034701cf8ed7$70c78330$52568990$@samsung.com>
 <CAD=FV=XJpx_otzW-dWNj1rnXMYab7vPGjo2KNirwyVKtEKat2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35841 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751755AbaFYLT5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 07:19:57 -0400
In-reply-to: <CAD=FV=XJpx_otzW-dWNj1rnXMYab7vPGjo2KNirwyVKtEKat2w@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Doug Anderson' <dianders@chromium.org>
Cc: 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Kevin Hilman' <khilman@linaro.org>, 'Olof Johansson' <olof@lixom.net>, 'Jaehoon Chung' <jh80.chung@samsung.com>, 'Seungwon Jeon' <tgih.jun@samsung.com>, 'Chris Ball' <cjb@laptop.org>

Doug Anderson wrote:
> 
> Hi,
>
Hi,

> On Mon, Jun 23, 2014 at 4:36 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Naveen Krishna Chatradhi wrote:
> >>
> >> MMC capability for HS200 is parsed in mmc/core/host.c as
> >> dts string "mmc-hs200-1_8v".
> >>
> >> This patch corrects the dts string for Exynos5420 based peach-pit
> >> and Exynos5800 based peach-pi boards.
> >>
> >> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> >> ---
> >>  arch/arm/boot/dts/exynos5420-peach-pit.dts |    2 +-
> >>  arch/arm/boot/dts/exynos5800-peach-pi.dts  |    2 +-
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> b/arch/arm/boot/dts/exynos5420-
> >> peach-pit.dts
> >> index 7649982..7dea480 100644
> >> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> >> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> >> @@ -173,7 +173,7 @@
> >>       status = "okay";
> >>       num-slots = <1>;
> >>       broken-cd;
> >> -     caps2-mmc-hs200-1_8v;
> >> +     mmc-hs200-1_8v;
> >>       supports-highspeed;
> >>       non-removable;
> >>       card-detect-delay = <200>;
> >> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> b/arch/arm/boot/dts/exynos5800-
> >> peach-pi.dts
> >> index 2c2c137..bb3ee76 100644
> >> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> >> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> >> @@ -171,7 +171,7 @@
> >>       status = "okay";
> >>       num-slots = <1>;
> >>       broken-cd;
> >> -     caps2-mmc-hs200-1_8v;
> >> +     mmc-hs200-1_8v;
> >>       supports-highspeed;
> >>       non-removable;
> >>       card-detect-delay = <200>;
> >> --
> >> 1.7.9.5
> >
> > Applied, thanks.
> 
> As an FYI: this patch (while correct) will likely cause sporadic boot
> failures until Sonny and my patches land:
> 
Thanks for your kindly information.

As I replied on other patch, I will holding on until followings land.

> * https://patchwork.kernel.org/patch/4323921/
>   mmc: dw_mmc: Make sure we don't get stuck when we get an error
> 
> * https://patchwork.kernel.org/patch/4213211/
>   mmc: dw_mmc: change to use recommended reset procedure
> 
> In the very least we got sporadic boot failures locally when we
> enabled hs200 and didn't have the "don't get stuck" patch.  I will
> also note that it would have been nice had this patch title included
> the words exynos and/or pit/pi in it.
> 
Yes, as you can see log, I always change the subject with some my rule is
similar with your suggestion when I apply into samsung tree ;-)

Thanks,
Kukjin
