From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/61] ARM: plat-samsung: simplify getting .drvdata
Date: Sat, 21 Apr 2018 19:05:14 +0200
Message-ID: <20180421170514.qmklysbjrnkatns5@kozik-lap>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-2-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180419140641.27926-2-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Apr 19, 2018 at 04:05:31PM +0200, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  arch/arm/plat-samsung/adc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
