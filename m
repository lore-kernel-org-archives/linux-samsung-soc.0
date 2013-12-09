From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add missing frequency property to exynos5250
Date: Tue, 10 Dec 2013 06:32:47 +0900
Message-ID: <52A636FF.9010608@samsung.com>
References: <1385724892-20518-1-git-send-email-sachin.kamat@linaro.org> <7860838.7Z1cWJA9lN@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:33128 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761557Ab3LIVcw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 16:32:52 -0500
Received: by mail-pd0-f169.google.com with SMTP id v10so5961946pde.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 13:32:51 -0800 (PST)
In-Reply-To: <7860838.7Z1cWJA9lN@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 11/30/13 02:29, Tomasz Figa wrote:
> On Friday 29 of November 2013 17:04:52 Sachin Kamat wrote:
>> Added missing clock frequency property to CPU node to avoid
>> boot time warnings.
>>
>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>> ---
>>   arch/arm/boot/dts/exynos5250.dtsi |    2 ++
>>   1 file changed, 2 insertions(+)
>
> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
>
Thanks, applied.
Kukjin
