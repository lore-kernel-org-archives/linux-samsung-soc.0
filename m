From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: add dts files for xyref5260 board
Date: Wed, 09 Apr 2014 12:52:02 +0200
Message-ID: <53452652.7040304@samsung.com>
References: <1396519224-18712-1-git-send-email-rahul.sharma@samsung.com>
 <1396519224-18712-4-git-send-email-rahul.sharma@samsung.com>
 <CAK9yfHwWh9sFivsg-P9wT6DXM2J3nYuHqzgfwuo_Go7S-vriVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:17052 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932482AbaDIKwK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 06:52:10 -0400
In-reply-to: <CAK9yfHwWh9sFivsg-P9wT6DXM2J3nYuHqzgfwuo_Go7S-vriVA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>

On 07.04.2014 10:40, Sachin Kamat wrote:
> On 3 April 2014 15:30, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> The patch adds the dts files for xyref5260 board which
>> is based on Exynos5260 Evt0 sample.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>
>> +/ {
>> +       model = "SAMSUNG XYREF5260 EVT0 board based on EXYNOS5260";
>> +       compatible = "samsung,xyref5260", "samsung,exynos5260";
>
> "samsung,exynos5260" is OK here for future compatibility (if soc
> specific quirk is required).
> Please also add "samsung,exynos5" to compatible list.
>

Right. SoC family compatible string should be added between board and 
SoC model strings.

Best regards,
Tomasz
