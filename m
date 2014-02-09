From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: samsung: pll: bugfix about segmentation fault
Date: Sun, 09 Feb 2014 17:26:35 +0100
Message-ID: <52F7AC3B.10503@gmail.com>
References: <1391950279-10252-1-git-send-email-taikyung.yu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:54685 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751919AbaBIQ0q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Feb 2014 11:26:46 -0500
Received: by mail-ee0-f42.google.com with SMTP id b15so2481002eek.29
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Feb 2014 08:26:44 -0800 (PST)
In-Reply-To: <1391950279-10252-1-git-send-email-taikyung.yu@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: taikyung yu <taikyung.yu@gmail.com>, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org

Hi,

On 09.02.2014 13:51, taikyung yu wrote:
> init has pll initialization information. but it is local variable.
> so it is just valid in samsung_clk_register_pll2550x() function.
>
> Signed-off-by: taikyung yu <taikyung.yu@gmail.com>
> ---
>   drivers/clk/samsung/clk-pll.c |   61 +++++++++++++++++++++++++----------------
>   1 file changed, 37 insertions(+), 24 deletions(-)

As far as I can see all the data from clk_init_data struct are copied by 
clk_register(), so I'm not sure if there is any reason why current code 
could be wrong.

Have you actually observed any issues without this patch?

Best regards,
Tomasz
