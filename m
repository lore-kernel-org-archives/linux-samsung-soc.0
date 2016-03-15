From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 8/8] drivers/pinctrl: clean up samsung modular vs.
 non-modular distinctions
Date: Tue, 15 Mar 2016 11:10:20 +0100
Message-ID: <56E7DF8C.4030005@samsung.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
 <1456778924-20730-9-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:25928 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932247AbcCOKKi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2016 06:10:38 -0400
In-reply-to: <1456778924-20730-9-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org

On 02/29/2016 09:48 PM, Paul Gortmaker wrote:
> Fixups here tend to be more all over the map vs. some of the other
> repeated/systematic ones we've seen elsewhere.
> 
> We remove module.h from code that isn't doing anything modular at
> all;  if they have __init sections, then replace it with init.h
> 
> A couple drivers have module_exit() code that is essentially orphaned,
> and so we remove that.
> 
> There are no module_init replacements, so we have no concerns wrt.
> initcall ordering changes as per some of the other cleanups.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
> 
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c     |  1 -
>  drivers/pinctrl/samsung/pinctrl-exynos5440.c | 15 +++------------
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c    |  2 +-
>  drivers/pinctrl/samsung/pinctrl-s3c64xx.c    |  2 +-
>  drivers/pinctrl/samsung/pinctrl-samsung.c    | 12 +-----------
>  5 files changed, 6 insertions(+), 26 deletions(-)

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

--
Thanks,
Sylwester
