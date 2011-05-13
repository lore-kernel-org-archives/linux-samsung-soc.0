From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] ARM: S5PV210: Fix possible null pointer dereference.
Date: Fri, 13 May 2011 15:43:54 +0400
Message-ID: <4DCD197A.9020900@ru.mvista.com>
References: <1305270186-7722-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:33723 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754389Ab1EMLph (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 May 2011 07:45:37 -0400
Received: by eyx24 with SMTP id 24so677200eyx.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 May 2011 04:45:36 -0700 (PDT)
In-Reply-To: <1305270186-7722-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jonghwan Choi <jhbird.choi@samsung.com>, ben-linux@fluff.org

Hello.

On 13-05-2011 11:03, Kukjin Kim wrote:

> From: Jonghwan Choi<jhbird.choi@samsung.com>

> Signed-off-by: Jonghwan Choi<jhbird.choi@samsung.com>
> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> ---
>   arch/arm/mach-s5pv210/cpufreq.c |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)

> diff --git a/arch/arm/mach-s5pv210/cpufreq.c b/arch/arm/mach-s5pv210/cpufreq.c
> index 22046e2..58340ee 100644
> --- a/arch/arm/mach-s5pv210/cpufreq.c
> +++ b/arch/arm/mach-s5pv210/cpufreq.c
> @@ -105,8 +105,10 @@ static void s5pv210_set_refresh(enum s5pv210_dmc_port ch, unsigned long freq)
>   		reg = (S5P_VA_DMC0 + 0x30);
>   	else if (ch == DMC1)
>   		reg = (S5P_VA_DMC1 + 0x30);
> -	else
> +	else {
>   		printk(KERN_ERR "Cannot find DMC port\n");
> +		return;
> +	}

    According to CodingStyle, other branches should now have {} too.

WBR, Sergei
