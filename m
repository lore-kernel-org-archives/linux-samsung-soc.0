From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Consolidate multiple low-level UART port
 definitions
Date: Fri, 31 May 2013 08:28:16 +0530
Message-ID: <51A811C8.9090509@linaro.org>
References: <1369888827-9427-1-git-send-email-tushar.behera@linaro.org> <CAOesGMgt=zvPM7WoHn4VcUkw28j7+HDUvU2n3hNojx7Nr5PqJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:51531 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751741Ab3EaC6W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 May 2013 22:58:22 -0400
Received: by mail-pb0-f53.google.com with SMTP id un4so1444886pbc.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 May 2013 19:58:21 -0700 (PDT)
In-Reply-To: <CAOesGMgt=zvPM7WoHn4VcUkw28j7+HDUvU2n3hNojx7Nr5PqJQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Patch Tracking <patches@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>

On 05/31/2013 02:41 AM, Olof Johansson wrote:
> Hi,
> 
> On Wed, May 29, 2013 at 9:40 PM, Tushar Behera <tushar.behera@linaro.org> wrote:
>> There are two definitions for low-level UART ports for Exynos platform.
>> CONFIG_S3C_LOWLEVEL_UART_PORT is used for printing "Uncompressing
>> Linux... done, booting the kernel." and CONFIG_S3C_UART for other
>> low-level messages.
>>
>> The assumption for both the uart ports is that they are pre-configured
>> in the bootloader. Since they are essentially the same always, it
>> would be good to consolidate them to use only one macro, in this case
>> 'DEBUG_S3C_UART' would be a better option.
>>
>> 'DEBUG_S3C_UART' is defined only if DEBUG_LL is enabled. We can safely
>> disable this option when DEBUG_LL is not defined and we can boot various
>> boards with different UART port settings. Only drawback of this
>> approach is that when DEBUG_LL is not defined, we would be missing the
>> print "Uncompressing Linux... done, booting the kernel."
>>
>> Since CONFIG_S3C_LOWLEVEL_UART_PORT is still used by other Samsung
>> boards, the consolidation applies only for ARCH_EXYNOS.
>>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> 
> This looks reasonable, but you have to convert the other samsung
> platforms too -- it's not ok to ignore them.
> 

Sure thing. I will update those platforms in a subsequent patchset.

> 
> -Olof
> 


-- 
Tushar Behera
