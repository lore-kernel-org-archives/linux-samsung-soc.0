From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V2] watchdog: s3c2410_wdt: remove the global variables
Date: Tue, 23 Jul 2013 08:28:18 +0530
Message-ID: <CAK9yfHwMZXV_F5=xmcbQfhFmDXsRxu_9a8n7C92gncyiPSJNrA@mail.gmail.com>
References: <1374473649-20050-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:60394 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754673Ab3GWC6T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 22:58:19 -0400
Received: by mail-oa0-f53.google.com with SMTP id k14so9883063oag.40
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2013 19:58:19 -0700 (PDT)
In-Reply-To: <1374473649-20050-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, jg1.han@samsung.com

Hi Leela,

On 22 July 2013 11:44, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
> This patch removes the global variables in the driver file and
> group them into a structure.
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  Note: This patch is rebased on kgene's for-next branch and tested on SMDK5420.
>
>  Changes since V1:
>         - changed the patch subject.
>         - indentation correction in s3c2410_watchdog structure.
>
>  drivers/watchdog/s3c2410_wdt.c |  204 +++++++++++++++++++++++-----------------
>  1 file changed, 119 insertions(+), 85 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 6a22cf5..de679d0 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -84,13 +84,20 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, "
>                         "0 to reboot (default 0)");
>  MODULE_PARM_DESC(debug, "Watchdog debug, set to >1 for debug (default 0)");
>
> -static struct device    *wdt_dev;      /* platform device attached to */
> -static struct resource *wdt_mem;
> -static struct resource *wdt_irq;
> -static struct clk      *wdt_clock;
> -static void __iomem    *wdt_base;
> -static unsigned int     wdt_count;
> -static DEFINE_SPINLOCK(wdt_lock);
> +struct s3c2410_watchdog {
> +       struct device           *dev;   /* platform device attached to */

Since you would anyway be respinning this patch to address comments
from Tomasz, please remove the above comment too.

-- 
With warm regards,
Sachin
