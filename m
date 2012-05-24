From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/6] ARM: Exynos5: Add spi clock support
Date: Thu, 24 May 2012 14:34:31 +0530
Message-ID: <CAJuYYwRThKda0E7ruDbW=X5_6RVran6NA+rBRdRNG1A=-Uny3Q@mail.gmail.com>
References: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
	<1337334392-6441-3-git-send-email-thomas.abraham@linaro.org>
	<006b01cd397f$09784840$1c68d8c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:44797 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754471Ab2EXJEc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 05:04:32 -0400
Received: by wibhj8 with SMTP id hj8so5538318wib.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 May 2012 02:04:31 -0700 (PDT)
In-Reply-To: <006b01cd397f$09784840$1c68d8c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, jaswinder.singh@linaro.org, Kyoungil Kim <ki0351.kim@samsung.com>

On 24 May 2012 13:00, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Thomas Abraham wrote:
>>
>> Add support for clock instances for each spi controller.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>
>> ---
>>
>> +static struct clksrc_clk exynos5_clk_mdout_spi0 = {
>
> See the previous comments and below url.
>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2012-February/083153.h
> tml

Exynos5 is only device tree based now. And there are changes in the
platform data also now.

Thanks,
Thomas.

>
> [...]
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
