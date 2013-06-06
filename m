From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v2 1/3] ARM: EXYNOS: uncompress - print debug messages
 if DEBUG_LL is defined
Date: Thu, 06 Jun 2013 14:37:01 +0530
Message-ID: <51B05135.3020006@linaro.org>
References: <1370319552-17694-1-git-send-email-tushar.behera@linaro.org> <1370319552-17694-2-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:55034 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754804Ab3FFJHI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jun 2013 05:07:08 -0400
Received: by mail-pd0-f181.google.com with SMTP id 14so442124pdj.40
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jun 2013 02:07:07 -0700 (PDT)
In-Reply-To: <1370319552-17694-2-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: arnd@arndb.de, kgene.kim@samsung.com, olof@lixom.net, patches@linaro.org

On 06/04/2013 09:49 AM, Tushar Behera wrote:
> Printing low-level debug messages make an assumption that the specified
> UART port has been preconfigured by the bootloader. Incorrectly
> specified UART port results in system getting stalled while printing the
> message "Uncompressing Linux... done, booting the kernel"
> This UART port number is specified through S3C_LOWLEVEL_UART_PORT. Since
> the UART port might different for different board, it is not possible to
> specify it correctly for every board that use a common defconfig file.
> 
> Calling this print subroutine only when DEBUG_LL fixes the problem. By
> disabling DEBUG_LL in default config file, we would be able to boot
> multiple boards with different default UART ports.
> 
> With this current approach, we miss the print "Uncompressing Linux...
> done, booting the kernel." when DEBUG_LL is not defined.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> Change for v2:
> * Instead of checking value of uart_base, now check if DEBUG_LL
> is enabled. This removes the ifdef's from mach/uncompress.h
> 
> 
>  arch/arm/plat-samsung/include/plat/uncompress.h |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

If there are no concerns, would it be possible to queue this patch [1/3]
for 3.10?

The other two patches can wait for 3.11.

-- 
Tushar Behera
