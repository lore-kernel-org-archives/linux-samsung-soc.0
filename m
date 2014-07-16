From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/3] serial: samsung: get fifosize from DT and clean up
Date: Wed, 16 Jul 2014 14:02:41 +0200
Message-ID: <53C669E1.90800@samsung.com>
References: <1405337838-30335-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56591 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932770AbaGPMDw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 08:03:52 -0400
In-reply-to: <1405337838-30335-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, ben-linux@fluff.org, cpgs@samsung.com

Hi Naveen,

On 14.07.2014 13:37, Naveen Krishna Chatradhi wrote:
> This patch set does the following
> 1: Get fifosize from DT node. But, not mandating it.
> 2. Corrects the case and default order in a switch
> 3. Defines a variable to simply the code.
> 
> Console messages on Exynos5420 based peach pit and pi works fine.
> 
> Naveen Krishna Chatradhi (3):
>   serial: samsung: get fifosize via device tree
>   serial: samsung: correct the case and default order in switch
>   serial: samsung: improve code clarity by defining a variable
> 
>  .../devicetree/bindings/serial/samsung_uart.txt    |    4 ++++
>  drivers/tty/serial/samsung.c                       |   19 +++++++++++++------
>  2 files changed, 17 insertions(+), 6 deletions(-)
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
