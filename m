From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] irqchip: exynos: Remove hardcoded irqbase
Date: Thu, 17 Oct 2013 19:55:24 +0200
Message-ID: <1392351.iKvAGkUsrS@flatron>
References: <1382007881-1161-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:53883 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932113Ab3JQRz2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 13:55:28 -0400
Received: by mail-ee0-f54.google.com with SMTP id e53so1286552eek.41
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2013 10:55:27 -0700 (PDT)
In-Reply-To: <1382007881-1161-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, tglx@linutronix.de, kgene.kim@samsung.com

Hi Sachin,

On Thursday 17 of October 2013 16:34:41 Sachin Kamat wrote:
> Now that Exynos platforms are DT only, hard-coded irqbase is not
> necessary.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/irqchip/exynos-combiner.c |    9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

A patch like this has been already submitted by Chander Kashyap and it was 
supposed to be already applied by Kukjin:

http://thread.gmane.org/gmane.linux.kernel.samsung-soc/23312/focus=23442

I'm not sure why it is not yet in Samsung tree, so I pinged original 
thread.

Best regards,
Tomasz
