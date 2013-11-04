From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: remove unused SAMSUNG_GPIOLIB_4BIT Kconfig
 parameter
Date: Mon, 04 Nov 2013 18:56:57 +0900
Message-ID: <000001ced944$33386320$99a92960$%han@samsung.com>
References: <1383558685-5343-1-git-send-email-michael.opdenacker@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65175 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750718Ab3KDJ47 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Nov 2013 04:56:59 -0500
In-reply-to: <1383558685-5343-1-git-send-email-michael.opdenacker@free-electrons.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Michael Opdenacker' <michael.opdenacker@free-electrons.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Monday, November 04, 2013 6:51 PM, Michael Opdenacker wrote:
> 
> This removes the SAMSUNG_GPIOLIB_4BIT Kconfig parameter,
> which was no longer used anywhere in the source code
> and Makefiles.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>

It looks good.
Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  arch/arm/Kconfig              | 1 -
>  arch/arm/plat-samsung/Kconfig | 8 --------
>  2 files changed, 9 deletions(-)
