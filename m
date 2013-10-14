From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: remove IRQF_DISABLED
Date: Mon, 14 Oct 2013 09:33:20 +0900
Message-ID: <000801cec874$fbc92cb0$f35b8610$%han@samsung.com>
References: <1381548966-5210-1-git-send-email-michael.opdenacker@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18546 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755365Ab3JNAd2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Oct 2013 20:33:28 -0400
In-reply-to: <1381548966-5210-1-git-send-email-michael.opdenacker@free-electrons.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Michael Opdenacker' <michael.opdenacker@free-electrons.com>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Saturday, October 12, 2013 12:36 PM, Michael Opdenacker wrote:
> 
> This patch proposes to remove the use of the IRQF_DISABLED flag
> 
> It's a NOOP since 2.6.35 and it will be removed one day.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  arch/arm/mach-s3c24xx/dma.c         | 2 +-
>  arch/arm/mach-s3c24xx/simtec-usb.c  | 3 +--
>  arch/arm/mach-s3c64xx/mach-smartq.c | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
