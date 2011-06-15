From: Anand Kumar N <anand.kn@samsung.com>
Subject: Re: Re: [PATCH 0/4] s3c-fb: Add support S5PV310 FIMD
Date: Wed, 15 Jun 2011 11:22:43 +0530
Message-ID: <BANLkTi=6Gp_YH96eXtJ8XJtY9MKxP65tsA@mail.gmail.com>
References: <0LMT00ESIG4US4R0@mailout2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:59005 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750869Ab1FOFwo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 01:52:44 -0400
Received: by qyg14 with SMTP id 14so35544qyg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jun 2011 22:52:43 -0700 (PDT)
In-Reply-To: <0LMT00ESIG4US4R0@mailout2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: snjw23@gmail.com
Cc: lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, s.nawrocki@samsung.com, anand.kn@samsung.com

Hi Sylwester,
Sorry for the late reply.
>
> Hi Anand,
>
> On 06/10/2011 10:15 AM, Anand Kumar N wrote:
> > This patch series is based on the latest
> > git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next
> >
> > This was originally submitted by Jonghun Han
> > http://www.spinics.net/lists/arm-kernel/msg101781.html
> > This patchset has been not picked up in the mainline due to the unavailibility
> > of cldev lookup. So it is being re-submitted rebased to 3.0.0-rc1 and tested
> > over the clkdev patches.
>
> As far as I can see there is no functional changes in these patches comparing
> to the original ones. AFAIR the idea with clkdev was to create clock to device
> mapping for each SoC variant and have driver using unified clock names across
> SoC variants. There is nothing close to that in your following patches.

This patch was send as a re-submission because ,there is no functional
modifications
from the original patch submitted.
>
> Moreover looking at the S5PC110 datasheet only, the list of possible sclk_fimd
> parent clocks is specified as "All possible clock sources". It exactly means:
> XXTI, XusbXTI, SCLK_HDMI_27M, SCLK_USBPHY_0, SCLK_USBPHY_1, SCLK_HDMIPHY,
> SCLK_M_PLL, SCLK_E_PLL, SCLK_V_PLL. So quite many, whereas you are trying
> to forcibly use in the driver SCLK_M_PLL only. As it has been pointed out
> setting FIMD clock parent should be moved away to board code/DT/bootloader,
> which allows to use the driver in unchanged form in various system
> configurations. Let the board designer to make decisions about the clock
> configurations.
>
Yes,I agree with your suggestion ,the setting of FIMD clk parent
should not be forced
in the driver.I will move this to the board specific code.

> --
> Regards,
> Sylwester
>
