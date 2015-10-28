From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 2/5] mfd: sec: Add support for S2MPS15 PMIC
Date: Wed, 28 Oct 2015 10:28:05 +0900
Message-ID: <563024A5.1050705@samsung.com>
References: <1445863883-5187-1-git-send-email-alim.akhtar@samsung.com>
 <1445863883-5187-3-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1445863883-5187-3-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, lee.jones@linaro.org, broonie@kernel.org
Cc: mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 26.10.2015 21:51, Alim Akhtar wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
> 
> Add support for S2MPS15 PMIC which is similar to S2MPS11 PMIC. The S2MPS15
> PMIC supports 27 LDO regulators, 10 buck regulators, RTC, three 32.768KHz
> clock outputs and battery charger. This patch adds initial support for
> LDO and buck regulators of S2MPS15 device.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> [Alim: Added s2mps15_devs like rtc and clk and related changes]
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mfd/sec-core.c              |   31 +++++++
>  drivers/mfd/sec-irq.c               |    8 ++
>  include/linux/mfd/samsung/core.h    |    1 +
>  include/linux/mfd/samsung/s2mps15.h |  158 +++++++++++++++++++++++++++++++++++
>  4 files changed, 198 insertions(+)
>  create mode 100644 include/linux/mfd/samsung/s2mps15.h
> 
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 2626fc0b5b8c..db3d4d4ff805 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -29,6 +29,7 @@
>  #include <linux/mfd/samsung/s2mps11.h>
>  #include <linux/mfd/samsung/s2mps13.h>
>  #include <linux/mfd/samsung/s2mps14.h>
> +#include <linux/mfd/samsung/s2mps15.h>
>  #include <linux/mfd/samsung/s2mpu02.h>
>  #include <linux/mfd/samsung/s5m8763.h>
>  #include <linux/mfd/samsung/s5m8767.h>
> @@ -96,6 +97,17 @@ static const struct mfd_cell s2mps14_devs[] = {
>  	}
>  };
>  
> +static const struct mfd_cell s2mps15_devs[] = {
> +	{
> +		.name = "s2mps15-pmic",
> +	}, {
> +		.name = "s2mps15-rtc",
> +	}, {
> +		.name = "s2mps15-clk",
> +		.of_compatible = "samsung,s2mps15-clk",
> +	},

I have different questions here. RTC and CLK module look the same as
S2MPS14. Then you should existing compatibles and names.

I'll ask in details about this in separate emails for patch 4 and 5.
Until questions are resolved, these looks wrong.

Best regards,
Krzysztof

