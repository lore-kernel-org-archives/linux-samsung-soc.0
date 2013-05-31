From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Consolidate multiple low-level UART port definitions
Date: Fri, 31 May 2013 11:20:45 -0700
Message-ID: <871u8n105e.fsf@linaro.org>
References: <1369888827-9427-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:34186 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753627Ab3EaSUt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 May 2013 14:20:49 -0400
Received: by mail-pd0-f178.google.com with SMTP id w11so2599912pde.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 May 2013 11:20:49 -0700 (PDT)
In-Reply-To: <1369888827-9427-1-git-send-email-tushar.behera@linaro.org>
	(Tushar Behera's message of "Thu, 30 May 2013 10:10:27 +0530")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, patches@linaro.org, kgene.kim@samsung.com, olof@lixom.net

Tushar Behera <tushar.behera@linaro.org> writes:

> There are two definitions for low-level UART ports for Exynos platform.
> CONFIG_S3C_LOWLEVEL_UART_PORT is used for printing "Uncompressing
> Linux... done, booting the kernel." and CONFIG_S3C_UART for other
> low-level messages.
>
> The assumption for both the uart ports is that they are pre-configured
> in the bootloader. Since they are essentially the same always, it
> would be good to consolidate them to use only one macro, in this case
> 'DEBUG_S3C_UART' would be a better option.
>
> 'DEBUG_S3C_UART' is defined only if DEBUG_LL is enabled. We can safely
> disable this option when DEBUG_LL is not defined and we can boot various
> boards with different UART port settings. Only drawback of this
> approach is that when DEBUG_LL is not defined, we would be missing the
> print "Uncompressing Linux... done, booting the kernel."

Perfectly acceptable to me (and already the case on OMAP.)

> Since CONFIG_S3C_LOWLEVEL_UART_PORT is still used by other Samsung
> boards, the consolidation applies only for ARCH_EXYNOS.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>

Acked-by: Kevin Hilman <khilman@linaro.org>
