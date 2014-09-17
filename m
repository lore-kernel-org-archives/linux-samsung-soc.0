From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH RESEND] ARM: DTS: correct the capability string for mmc0
Date: Wed, 17 Sep 2014 17:49:49 +0530
Message-ID: <CAFp+6iFCe_dagT55U=PLQYFkZEAC=UAwu4WEBngbBE+DPh1DGg@mail.gmail.com>
References: <1410857409-24767-1-git-send-email-gautam.vivek@samsung.com>
	<CAD=FV=U4rPsfGkTcSY3OYHPgCFOccaHTjG1qC6WAekOEV09Q7A@mail.gmail.com>
	<01ce01cfd270$3b3d31b0$b1b79510$@kernel.org>
	<CAFp+6iE07b=juik2Ms4WEzzBw0FxPnAgbxtdqVGBBYZQ7fk5zA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f53.google.com ([209.85.192.53]:38929 "EHLO
	mail-qg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754639AbaIQMTu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 08:19:50 -0400
In-Reply-To: <CAFp+6iE07b=juik2Ms4WEzzBw0FxPnAgbxtdqVGBBYZQ7fk5zA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>

On Wed, Sep 17, 2014 at 5:43 PM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
> Hi Kukjin,
>
>
> On Wed, Sep 17, 2014 at 5:39 PM, Kukjin Kim <kgene@kernel.org> wrote:
>> Doug Anderson wrote:
>>>
>>> Vivek,
>>>
>> Hi,
>>
>>> On Tue, Sep 16, 2014 at 1:50 AM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
>>> > From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>>> >
>>> > MMC capability for HS200 is parsed in mmc/core/host.c as
>>> > dts string "mmc-hs200-1_8v".
>>> >
>>> > This patch corrects the dts string for Exynos5420 based peach-pit
>>> > and Exynos5800 based peach-pi boards.
>>> >
>>> > Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>>
>> In this case, Vivek's sign is required here.
>
> Ok, i will resend it with my Signed-off.
>
>>
>>> > ---
>>> >
>>> > Hi Kukjin,
>>> >
>>> > As commented by Doug earlier for this patch, the two patches required
>>> >   -- mmc: dw_mmc: Make sure we don't get stuck when we get an error
>>> >   -- mmc: dw_mmc: change to use recommended reset procedure
>>> > are now merged in upstream.
>>> > So you can go ahead and pick this change.
>>> >
>>> >  arch/arm/boot/dts/exynos5420-peach-pit.dts |    2 +-
>>> >  arch/arm/boot/dts/exynos5800-peach-pi.dts  |    2 +-
>>> >  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>>
>> Thanks, I will take this patch once Vivek replies his sign on this patch.

As suggested, giving  my signed-off here:
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>




-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
