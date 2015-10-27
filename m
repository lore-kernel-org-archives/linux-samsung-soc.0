From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [rtc-linux] [PATCH v3 5/5] drivers/rtc/rtc-s5m.c: add support
 for S2MPS15 RTC
Date: Tue, 27 Oct 2015 23:59:34 +0100
Message-ID: <20151027225934.GL22331@piout.net>
References: <1445863883-5187-1-git-send-email-alim.akhtar@samsung.com>
 <1445863883-5187-6-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1445863883-5187-6-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: lee.jones@linaro.org, broonie@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 26/10/2015 at 18:21:22 +0530, Alim Akhtar wrote :
> RTC found in s2mps15 is almost same as one found in s2mps14.
> This patch add required changes to enable s2mps15 rtc timer.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

One really small nitpick below else you can add my
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

> ---
>  drivers/rtc/rtc-s5m.c |   14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> @@ -317,7 +319,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	u8 data[info->regs->regs_count];
>  	int ret;
>  
> -	if (info->device_type == S2MPS14X || info->device_type == S2MPS13X) {
> +	if (info->device_type == S2MPS14X || info->device_type == S2MPS15X ||
> +						info->device_type == S2MPS13X) {

This line is not properly aligned.

>  		ret = regmap_update_bits(info->regmap,
>  				info->regs->rtc_udr_update,
>  				S2MPS_RTC_RUDR_MASK, S2MPS_RTC_RUDR_MASK);

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
