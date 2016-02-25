From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: s3c24xx: avoid warning for inb/outb
Date: Fri, 26 Feb 2016 08:46:55 +0900
Message-ID: <56CF926F.5040507@samsung.com>
References: <1456437900-853667-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25632 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752171AbcBYXrD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Feb 2016 18:47:03 -0500
In-reply-to: <1456437900-853667-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 26.02.2016 07:04, Arnd Bergmann wrote:
> s3c24xx implements its own inb/outb macros, but the implementation
> prints warnings when the port number argument is not a 32-bit scalar:
> 
> drivers/scsi/pas16.c: In function 'NCR5380_pwrite':
> arch/arm/mach-s3c24xx/include/mach/io.h:193:68: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>  #define __ioaddrc(port) ((__PORT_PCIO(port) ? PCIO_BASE + (port) : (void __iomem *)(port)))
> 
> This slightly modifies the definition of the __ioaddrc macro to avoid
> the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-s3c24xx/include/mach/io.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks, applied.

Krzysztof
