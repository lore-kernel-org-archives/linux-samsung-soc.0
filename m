From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH 0/4] s3c-fb: Add support S5PV310 FIMD
Date: Sat, 11 Jun 2011 14:19:44 +0200
Message-ID: <4DF35D60.5090502@gmail.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:54885 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754852Ab1FKMTu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 Jun 2011 08:19:50 -0400
Received: by eyx24 with SMTP id 24so1168056eyx.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jun 2011 05:19:49 -0700 (PDT)
In-Reply-To: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Kumar N <anand.kn@samsung.com>
Cc: lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi Anand,

On 06/10/2011 10:15 AM, Anand Kumar N wrote:
> This patch series is based on the latest
> git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next
> 
> This was originally submitted by Jonghun Han<jonghun.han@samsung.com>
> http://www.spinics.net/lists/arm-kernel/msg101781.html
> This patchset has been not picked up in the mainline due to the unavailibility
> of cldev lookup. So it is being re-submitted rebased to 3.0.0-rc1 and tested
> over the clkdev patches.

As far as I can see there is no functional changes in these patches comparing
to the original ones. AFAIR the idea with clkdev was to create clock to device
mapping for each SoC variant and have driver using unified clock names across
SoC variants. There is nothing close to that in your following patches.

Moreover looking at the S5PC110 datasheet only, the list of possible sclk_fimd
parent clocks is specified as "All possible clock sources". It exactly means:
XXTI, XusbXTI, SCLK_HDMI_27M, SCLK_USBPHY_0, SCLK_USBPHY_1, SCLK_HDMIPHY,
SCLK_M_PLL, SCLK_E_PLL, SCLK_V_PLL. So quite many, whereas you are trying 
to forcibly use in the driver SCLK_M_PLL only. As it has been pointed out
setting FIMD clock parent should be moved away to board code/DT/bootloader,
which allows to use the driver in unchanged form in various system
configurations. Let the board designer to make decisions about the clock
configurations. 

--
Regards,
Sylwester
