From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH] rtc: rtc-s3c: use clk_prepare_enable and clk_disable_unprepare
Date: Wed, 10 Apr 2013 17:09:57 +0530
Message-ID: <CAFp+6iFX2swhTSnKzCsCEqFj4bJ5y0eYSEMeAV6J3bgc=Er3OQ@mail.gmail.com>
References: <1365517660-9322-1-git-send-email-gautam.vivek@samsung.com>
	<516535E4.5060308@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f53.google.com ([209.85.214.53]:47503 "EHLO
	mail-bk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964879Ab3DJLj6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 07:39:58 -0400
In-Reply-To: <516535E4.5060308@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Vivek Gautam <gautam.vivek@samsung.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, kgene.kim@samsung.com, thomas.ab@samsung.com, dianders@chromium.org, Thomas Abraham <thomas.abraham@linaro.org>

On Wed, Apr 10, 2013 at 3:20 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 04/09/2013 04:27 PM, Vivek Gautam wrote:
>> From: Thomas Abraham <thomas.abraham@linaro.org>
>>
>> Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
>> calls as required by common clock framework.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
>
> Thanks Vivek.

your welcome  :-)

>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>



-- 
Thanks & Regards
Vivek
