From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: remove num-slots from exynos platforms
Date: Wed, 5 Jul 2017 18:39:57 +0200
Message-ID: <20170705163957.GA2233@kozik-book>
References: <1499160322-73008-1-git-send-email-shawn.lin@rock-chips.com>
 <20170705045126.GA2360@kozik-book>
 <f42e6cc1-bac4-6ab7-70a7-323d4734837d@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34626 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751850AbdGEQkH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 12:40:07 -0400
Received: by mail-pf0-f194.google.com with SMTP id c24so22044915pfe.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2017 09:40:07 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <f42e6cc1-bac4-6ab7-70a7-323d4734837d@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jaehoon Chung <jh80.chung@samsung.com>

On Wed, Jul 05, 2017 at 03:02:26PM +0800, Shawn Lin wrote:
> Hi Krzystof,
> 
> On 2017/7/5 12:51, Krzysztof Kozlowski wrote:
> >On Tue, Jul 04, 2017 at 05:25:22PM +0800, Shawn Lin wrote:
> >>dwmmc driver deprecated num-slots and plan to get rid
> >>of it finally. Just move a step to cleanup it from DT.
> >>
> >>Cc: Jaehoon Chung <jh80.chung@samsung.com>
> >>Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> >
> >I do not see this property deprecated here (yesterday's next):
> >Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt
> >Something is not merged yet?
> 
> The patch for dwmmc was queued for v4.13 already but the changes for Doc
> was missing somehow. Will fix this later. Thanks for catching this.
> 
> >
> >Also in separate patch, please update example here:
> >Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> 
> Ok.
> 
> BTW, will you pick this up now or you want me to resend
> these two patches appending a new patch for exynos-dw-mshc.txt?

Thanks for explanation. I will pick up both (ARM and ARM64) after
current merge window. No need to resend, from my point of view. I just
wanted to be sure that this is really deprecated.

Best regards,
Krzysztof
