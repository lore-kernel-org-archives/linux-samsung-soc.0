From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos5420/5250: add ADC device tree node
Date: Fri, 23 Aug 2013 00:59:16 +0200
Message-ID: <3452152.3bF3FnkbLl@flatron>
References: <1375349321-18646-1-git-send-email-ch.naveen@samsung.com> <1377166691-5118-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f49.google.com ([209.85.214.49]:62444 "EHLO
	mail-bk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754309Ab3HVW7W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 18:59:22 -0400
Received: by mail-bk0-f49.google.com with SMTP id r7so908860bkg.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2013 15:59:21 -0700 (PDT)
In-Reply-To: <1377166691-5118-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, naveenkrishna.ch@gmail.com

Hi Naveen,

On Thursday 22 of August 2013 15:48:11 Naveen Krishna Chatradhi wrote:
> Add ADC device tree node for exynos5420 and exynos5250
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |   11 +++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi |   11 +++++++++++
>  2 files changed, 22 insertions(+)

This patch looks good to me, but please resend it with all the recipients 
present in MAINTAINERS file for the directories from which files it 
changes, especially the devicetree@vger.kernel.org mailing list.

Best regards,
Tomasz
