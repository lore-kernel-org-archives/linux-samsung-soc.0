From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v2 2/3] ARM: SAMSUNG: Consolidate uncompress subroutine
Date: Thu, 13 Jun 2013 11:34:06 +0530
Message-ID: <51B960D6.7080901@linaro.org>
References: <1370319552-17694-1-git-send-email-tushar.behera@linaro.org> <1370319552-17694-3-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:56337 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750959Ab3FMGEM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 02:04:12 -0400
Received: by mail-pd0-f181.google.com with SMTP id 14so8228938pdj.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 23:04:11 -0700 (PDT)
In-Reply-To: <1370319552-17694-3-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: arnd@arndb.de, olof@lixom.net, patches@linaro.org

On 06/04/2013 09:49 AM, Tushar Behera wrote:
> For mach-exynos, uart_base is a pointer and the value is calculated
> in the machine folder. For other machines, uart_base is defined as
> a macro in platform directory. For symmetry, the uart_base macro
> definition is removed and the uart_base calculation is moved to
> specific machine folders.
> 
> This would help us consolidating uncompress subroutine for s5p64x0.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> Changes for v2:
> * Remove ifdef's while calculating uart_base value.
> 

Kukjin,

Would you please queue this up for 3.11?

Thanks.

-- 
Tushar Behera
