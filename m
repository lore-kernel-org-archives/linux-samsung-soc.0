From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] clk: exynos5420: Restore GATE_BUS_TOP on suspend
Date: Wed, 08 Apr 2015 11:17:29 +0200
Message-ID: <5524F229.1060802@collabora.co.uk>
References: <1428471252-15872-1-git-send-email-javier.martinez@collabora.co.uk> <5524EFA8.6000800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:54904 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751510AbbDHJRh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Apr 2015 05:17:37 -0400
In-Reply-To: <5524EFA8.6000800@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Sylwester,

On 04/08/2015 11:06 AM, Sylwester Nawrocki wrote:
>> 
>> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
>> index 07d666cc6a29..bea4a173eef5 100644
>> --- a/drivers/clk/samsung/clk-exynos5420.c
>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>> @@ -271,6 +271,7 @@ static const struct samsung_clk_reg_dump exynos5420_set_clksrc[] = {
>>  	{ .offset = SRC_MASK_PERIC0,		.value = 0x11111110, },
>>  	{ .offset = SRC_MASK_PERIC1,		.value = 0x11111100, },
>>  	{ .offset = SRC_MASK_ISP,		.value = 0x11111000, },
>> +	{ .offset = GATE_BUS_TOP,		.value = 0xffffffff, },
>>  	{ .offset = GATE_BUS_DISP1,		.value = 0xffffffff, },
>>  	{ .offset = GATE_IP_PERIC,		.value = 0xffffffff, },
>>  };
> 
> I'm going to tag this patch for inclusion in the stable tree and send
> it to Mike or Stephen with other clk/samsung fixes after v4.1-rc1 is
> released.
> 
> Mike/Stephen, if you're willing to take this patch earlier here is my:
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 

Great, thanks a lot for your help!

Best regards,
Javier
