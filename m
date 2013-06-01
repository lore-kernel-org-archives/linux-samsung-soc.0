From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/3] ARM: SAMSUNG: Consolidate uncompress subroutine
Date: Fri, 31 May 2013 21:00:46 -0700
Message-ID: <20130601040046.GB3868@quad.lixom.net>
References: <1370000944-19786-1-git-send-email-tushar.behera@linaro.org>
 <1370000944-19786-3-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:64452 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759Ab3FAEAp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 1 Jun 2013 00:00:45 -0400
Received: by mail-pb0-f43.google.com with SMTP id ma3so3199898pbc.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 May 2013 21:00:44 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1370000944-19786-3-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, kgene.kim@samsung.com, patches@linaro.org

On Fri, May 31, 2013 at 05:19:03PM +0530, Tushar Behera wrote:
> For mach-exynos, uart_base is a pointer and the value is calculated
> in the machine folder. For other machines, uart_base is defined as
> a macro in platform directory. For symmetry, the uart_base macro
> definition is removed and the uart_base calculation is moved to
> specific machine folders.
> 
> This would help us consolidating uncompress subroutine for s5p64x0.

Sorry, reading these in order and didn't go through all of them.

Same comment here, you can use config_enabled() and return early instead of
adding ifdefs.


-Olof
