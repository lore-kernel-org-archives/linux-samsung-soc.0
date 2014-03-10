From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v4 1/5] clk/samsung: add support for multiple clock providers
Date: Mon, 10 Mar 2014 07:44:09 +0530
Message-ID: <CAPdUM4PfZvpuS+bhxxGZjJGH+7tqfTqp=6WsDj8WfPJnYcyrSw@mail.gmail.com>
References: <1393931558-23502-1-git-send-email-rahul.sharma@samsung.com>
	<1393931558-23502-2-git-send-email-rahul.sharma@samsung.com>
	<531D037B.2080708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:46154 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752186AbaCJCOK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Mar 2014 22:14:10 -0400
In-Reply-To: <531D037B.2080708@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>

On 10 March 2014 05:42, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Rahul,
>
>
> On 04.03.2014 12:12, Rahul Sharma wrote:
>>
>> Samsung CCF helper functions do not provide support to
>> register multiple Clock Providers for a given SoC. Due to
>> this limitation SoC platforms are not able to use these
>> helpers for registering multiple clock providers and are
>> forced to bypass this layer.
>>
>> This layer is modified accordingly to enable the support.
>>
>> Clock file for exynos4, exynos5250, exynos5420, exynos5440
>> and S3c64xx are also modified as per changed helper functions.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos4.c    |   47 +++++++-------
>>   drivers/clk/samsung/clk-exynos5250.c |   25 +++++---
>>   drivers/clk/samsung/clk-exynos5420.c |   24 ++++---
>>   drivers/clk/samsung/clk-exynos5440.c |   18 +++---
>>   drivers/clk/samsung/clk-pll.c        |   14 +++--
>>   drivers/clk/samsung/clk-s3c64xx.c    |   44 +++++++------
>>   drivers/clk/samsung/clk.c            |  115
>> +++++++++++++++++++---------------
>>   drivers/clk/samsung/clk.h            |   72 ++++++++++++++-------
>>   8 files changed, 210 insertions(+), 149 deletions(-)
>
>
> This patch looks good. However in the meantime two series adding s3c2412 and
> s3c2416 clock drivers have been merged through Kgene's tree and this patch
> should be rebased on top of this. I have pulled those drivers to my tree as
> well, to samsung-next branch.
>

Sure. I will add similar changes for these 2 SoCs and repost v5.

Regards,
Rahul Sharma

> Best regards,
> Tomasz
