From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clk: s3c64xx: Hookup SPI clocks correctly
Date: Wed, 25 Jun 2014 13:29:01 +0200
Message-ID: <53AAB27D.3030409@samsung.com>
References: <1403085143-3257-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1403085143-3257-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, mturquette@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Charles,

On 18.06.2014 11:52, Charles Keepax wrote:
> In the move to this clock driver the hookups for the SPI clocks were
> dropped, which causes my system Cragganmore (s3c6410 based) to be unable
> to locate any spibus clocks. This patch adds them back in.
> 
> When taking the clock from the epll clock (SCLK) the rates on the SPI
> bus are incorrect, this needs further debugging but the hookup here
> should be correct and the problem should be else where.
> 
> The USBCLK case has been dropped because this requires the USB PHY to be
> enabled.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/clk/samsung/clk-s3c64xx.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Thanks for fixing this. Will apply to my fixes branch.

Best regards,
Tomasz
