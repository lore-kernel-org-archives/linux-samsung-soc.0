From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 0/2] Clock changes for supporting CPUFreq on Exynos5250
Date: Wed, 29 May 2013 15:42:03 -0700
Message-ID: <20130529224203.6058.75266@quantum>
References: <1368770153-29041-1-git-send-email-tushar.behera@linaro.org>
 <51A442E4.90307@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:39353 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966519Ab3E2WmI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 May 2013 18:42:08 -0400
Received: by mail-pb0-f49.google.com with SMTP id rp8so9787622pbb.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 May 2013 15:42:08 -0700 (PDT)
In-Reply-To: <51A442E4.90307@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, patches@linaro.org

Quoting Tushar Behera (2013-05-27 22:38:44)
> On 05/17/2013 11:25 AM, Tushar Behera wrote:
> > With the use of common clock framework, CPUFreq driver on EXYNOS5250 now
> > requires a few changes in clocks.
> > 
> > Tested on Exynos5250 based Arndale board.
> > The patches are based on v3.10-rc1.
> > 
> > Tushar Behera (2):
> >   clk: exynos5250: Update cpufreq related clocks for EXYNOS5250
> >   clk: exynos5250: Add sclk_mpll to the parent list of mout_cpu clock
> > 
> >  drivers/clk/samsung/clk-exynos5250.c |    8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> 
> Any comments on this series?
> 

I've taken both patches into clk-next.

Regards,
Mike

> -- 
> Tushar Behera
