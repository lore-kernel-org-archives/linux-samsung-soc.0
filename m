From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: Add hs-i2c nodes to exynos5420
Date: Tue, 10 Dec 2013 06:25:24 +0900
Message-ID: <52A63544.2060909@samsung.com>
References: <1385982702-18335-1-git-send-email-sachin.kamat@linaro.org> <4767310.mAz1U2YlJK@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:53546 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751261Ab3LIVZa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 16:25:30 -0500
Received: by mail-pb0-f52.google.com with SMTP id uo5so6205873pbc.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 13:25:30 -0800 (PST)
In-Reply-To: <4767310.mAz1U2YlJK@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 12/05/13 20:36, Tomasz Figa wrote:
> Hi Sachin,
>
> On Monday 02 of December 2013 16:41:42 Sachin Kamat wrote:
>> Added high speed I2C nodes to Exynos5420 DT file.
>>
>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>> ---
>> Changes since v1:
>> Changed the node name to i2c as suggested by Tomasz Figa.
>> ---
>>   arch/arm/boot/dts/exynos5420.dtsi |   98 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>
> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
>
Looks good to me, applied.

Thanks,
Kukjin
