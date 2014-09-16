From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCHv3 4/5] rtc: s3c: Add support for RTC of Exynos3250 SoC
Date: Tue, 16 Sep 2014 15:48:02 +0200
Message-ID: <CABxcv=ku9fjFfzyXZEnCGpTrWQ0pN+5mLWay90jXBhkFeWb7sg@mail.gmail.com>
References: <1409216559-22402-1-git-send-email-cw00.choi@samsung.com>
	<1409216559-22402-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409216559-22402-5-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, akpm@linux-foundation.org, Kyungmin Park <kyungmin.park@samsung.com>, rtc-linux@googlegroups.com, Linux Kernel <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Chanwoo,

On Thu, Aug 28, 2014 at 11:02 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> This patch add support for RTC of Exynos3250 SoC. The Exynos3250 needs source
> clock(32.768KHz) for RTC block. If source clock of RTC is registerd on clock
> list of common clk framework, Exynos RTC drvier have to control this clock.
>
> Clock list for s3c-rtc device:
> - rtc : CLK_RTC of CLK_GATE_IP_PERIR is gate clock for RTC.
> - rtc_src : XrtcXTI is 32.768.kHz source clock for RTC.

Is this RTC source clock needed for all Exynos SoCs?

> @@ -480,11 +530,19 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>
>         info->rtc_clk = devm_clk_get(&pdev->dev, "rtc");
>         if (IS_ERR(info->rtc_clk)) {
> -               dev_err(&pdev->dev, "failed to find rtc clock source\n");
> +               dev_err(&pdev->dev, "failed to find rtc clock\n");
>                 return PTR_ERR(info->rtc_clk);
>         }
>         clk_prepare_enable(info->rtc_clk);
>
> +       info->rtc_src_clk = devm_clk_get(&pdev->dev, "rtc_src");
> +       if (IS_ERR(info->rtc_src_clk)) {
> +               dev_err(&pdev->dev, "failed to find rtc source clock\n");
> +               return PTR_ERR(info->rtc_src_clk);

On an Exynos5420 Peach Pit machine I'm having the following error and
the driver fails to probe:

[    2.095700] s3c-rtc: probe of 101e0000.rtc failed with error -2

Reverting this patch fixes the issue and the s3c RTC works again on
this machine.

Best regards,
Javier
