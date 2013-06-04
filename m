From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Consolidate multiple low-level UART port
 definitions
Date: Tue, 04 Jun 2013 15:13:05 +0530
Message-ID: <51ADB6A9.8030006@linaro.org>
References: <1369888827-9427-1-git-send-email-tushar.behera@linaro.org> <871u8n105e.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:43815 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751279Ab3FDJnM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jun 2013 05:43:12 -0400
Received: by mail-pd0-f179.google.com with SMTP id q11so6950069pdj.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jun 2013 02:43:12 -0700 (PDT)
In-Reply-To: <871u8n105e.fsf@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, patches@linaro.org, kgene.kim@samsung.com, olof@lixom.net

On 05/31/2013 11:50 PM, Kevin Hilman wrote:
> Tushar Behera <tushar.behera@linaro.org> writes:
> 
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
> 
> Perfectly acceptable to me (and already the case on OMAP.)
> 
>> Since CONFIG_S3C_LOWLEVEL_UART_PORT is still used by other Samsung
>> boards, the consolidation applies only for ARCH_EXYNOS.
>>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> 
> Acked-by: Kevin Hilman <khilman@linaro.org>
> 

Thanks Kevin.

I have an updated version of this patch updated for all of Samsung
platforms.[1]

[1] http://www.gossamer-threads.com/lists/linux/kernel/1723429

-- 
Tushar Behera
