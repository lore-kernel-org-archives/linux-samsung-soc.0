From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Update defconfig for Arndale and Origen board
Date: Wed, 29 May 2013 09:07:09 +0900
Message-ID: <17ec01ce5c00$76384e40$62a8eac0$%kim@samsung.com>
References: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org>
 <CAOesGMjirb0h4kZ1hB9=1JnDV+azTEG=_6RR9v000xbMsvuv2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10651 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932080Ab3E2AHL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 May 2013 20:07:11 -0400
In-reply-to: <CAOesGMjirb0h4kZ1hB9=1JnDV+azTEG=_6RR9v000xbMsvuv2Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Tushar Behera' <tushar.behera@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Doug Anderson' <dianders@chromium.org>, 'Patch Tracking' <patches@linaro.org>

Olof Johansson wrote:
> 
> Hi,
> 
> On Thu, May 9, 2013 at 11:49 PM, Tushar Behera <tushar.behera@linaro.org>
> wrote:
> > It updates following drivers for EXYNOS based DT platform.
> >
> > * S5M8767 driver
> > * MAX8997 driver
> > * MMC SDHCI driver
> >
> > Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> 
> I didn't see any movement from Kukjin on this, so I have (tentatively)
> applied this together with my base defconfig update to the fixes
> branch of arm-soc. I'll take it out in case he protests, but it's very
> useful since the simplefb driver has landed in 3.10-rc3.
> 
I'm fine on this, so please go ahead with my ack if you want,

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks for your gentle reminder :-)

- Kukjin
