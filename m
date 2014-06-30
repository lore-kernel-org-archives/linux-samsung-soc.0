From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clk: s3c64xx: Hookup SPI clocks correctly
Date: Mon, 30 Jun 2014 15:49:09 +0200
Message-ID: <53B16AD5.6000805@samsung.com>
References: <1403085143-3257-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:53807 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753390AbaF3Ntl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:49:41 -0400
In-reply-to: <1403085143-3257-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, mturquette@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

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

Applied as a fix for 3.16.

Best regards,
Tomasz
