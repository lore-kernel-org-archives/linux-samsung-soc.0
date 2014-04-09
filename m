From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v6 2/3] ARM: dts: add dts files for exynos5260 SoC
Date: Wed, 9 Apr 2014 16:10:45 +0530
Message-ID: <CAK9yfHw+CncWpZ3NEtV7dGhx4LS7Wymw3TAweOXKCU9HShcXsg@mail.gmail.com>
References: <1396502277-19588-1-git-send-email-rahul.sharma@samsung.com>
	<1396502277-19588-3-git-send-email-rahul.sharma@samsung.com>
	<CAK9yfHzBH9rTjJXPMM_OZhnVgpSY1Pj1Ne7Jy-v6zbp8g91zkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:35146 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784AbaDIKkp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 06:40:45 -0400
Received: by mail-oa0-f52.google.com with SMTP id l6so2499326oag.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2014 03:40:45 -0700 (PDT)
In-Reply-To: <CAK9yfHzBH9rTjJXPMM_OZhnVgpSY1Pj1Ne7Jy-v6zbp8g91zkA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Arun Kumar K <arun.kk@samsung.com>

On 7 April 2014 14:14, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> On 3 April 2014 10:47, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> The patch adds the dts files for exynos5260.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>> ---
> <snip>
>
>> +/ {
>> +       compatible = "samsung,exynos5260";
>
> Add "samsung,exynos5260" to the above list.

Sorry for the typo. Should have been "samsung,exynos5" as mentioned by Tomasz.

-- 
With warm regards,
Sachin
