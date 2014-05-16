From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v4 2/8] clk: samsung: change scope of samsung clock lock to
 global
Date: Fri, 16 May 2014 14:30:55 +0200
Message-ID: <537604FF.2010106@samsung.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
 <1400029876-5830-3-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36318 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756235AbaEPMbE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 08:31:04 -0400
In-reply-to: <1400029876-5830-3-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, shawn.guo@linaro.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, heiko@sntech.de, thomas.ab@samsung.com

Hi Thomas,

On 14.05.2014 03:11, Thomas Abraham wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
> 
> Access to samsung clock lock is required to support newer samsung specific
> clock types. So change the scope of the samsung clock lock to global. And
> prefix 'samsung_clk_' to the existing name of the lock to prevent name space
> pollution.
> 
> Cc: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  drivers/clk/samsung/clk.c |   13 ++++++++-----
>  drivers/clk/samsung/clk.h |    2 ++
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 91bec3e..c86c28c 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -14,7 +14,7 @@
>  #include <linux/syscore_ops.h>
>  #include "clk.h"
>  
> -static DEFINE_SPINLOCK(lock);
> +DEFINE_SPINLOCK(samsung_clk_lock);

I'm afraid this series needs to be rebased on top of samsung-clk-next
branch of Samsung clock tree:

git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git

You can find there patches adding Samsung clock context struct, which
should be passed to Samsung clock helper functions and which replaces
the global variables above.

So changes introduced by this patch will be no longer necessary, as you
will be able to just pass the context struct to registration function of
your clock type.

Best regards,
Tomasz
