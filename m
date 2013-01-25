From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 1/2] usb: ehci-s5p/ohci-exynos: Fix compatible strings
 for the device
Date: Fri, 25 Jan 2013 11:01:32 +0900
Message-ID: <00c501cdfa9f$e61a9be0$b24fd3a0$%han@samsung.com>
References: <1359035130-22667-1-git-send-email-gautam.vivek@samsung.com>
 <1359035130-22667-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53507 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754914Ab3AYCBe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jan 2013 21:01:34 -0500
In-reply-to: <1359035130-22667-2-git-send-email-gautam.vivek@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, stern@rowland.harvard.edu, kgene.kim@samsung.com, thomas.abraham@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, sylvester.nawrocki@gmail.com, dianders@chromium.org, cpgs@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, January 24, 2013 10:45 PM, Vivek Gautam wrote
> 
> Using specific chip in compatible strings. Newer SOCs can claim
> device by using older string in the compatible list.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> Reviewed-by: Doug Anderson <dianders@chromium.org>

Acked-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/usb/host/ehci-s5p.c    |    2 +-
>  drivers/usb/host/ohci-exynos.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
