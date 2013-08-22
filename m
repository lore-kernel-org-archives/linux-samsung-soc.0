From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] arm: dts: fix NTC thermistor device nodes for cros5250
Date: Fri, 23 Aug 2013 01:00:43 +0200
Message-ID: <2011021.bJnpdqp6MA@flatron>
References: <1377172114-8312-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f41.google.com ([209.85.214.41]:34181 "EHLO
	mail-bk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753998Ab3HVXAu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 19:00:50 -0400
Received: by mail-bk0-f41.google.com with SMTP id na10so950874bkb.28
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2013 16:00:49 -0700 (PDT)
In-Reply-To: <1377172114-8312-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, kgene.kim@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, naveenkrishna.ch@gmail.com

Hi Naveen,

On Thursday 22 of August 2013 17:18:34 Naveen Krishna Chatradhi wrote:
> This patch fixes NTC devices nodes connected to ADC channel 3, 4, 5 and
> 6 on exynos5250 based snow device.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  arch/arm/boot/dts/cros5250-common.dtsi |   33
> ++++++++++++++++++++++++++++++++ 1 file changed, 33 insertions(+)

This patch does not look like fixing anything. Instead it adds board 
specific data to adc node to cros5250 common dtsi file.

Also please resend this patch with all the recipients added according to 
MAINTAINERS file.

Best regards,
Tomasz
