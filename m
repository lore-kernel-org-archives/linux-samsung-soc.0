From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/5] clk/exynos5250: Fix HDMI clock number in documentation
Date: Fri, 21 Jun 2013 10:19:30 +0530
Message-ID: <CAPdUM4MGCf4oNGNSL0KF60ZaPLugh1GaJGzLfOyiafL1fH9e9g@mail.gmail.com>
References: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
	<1370862062-16680-2-git-send-email-rahul.sharma@samsung.com>
	<CAPdUM4M2MbpgeXNL66dnP6gzKzv0C2N_otc40KecbpT1jP2Rmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:49444 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757112Ab3FUEtc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 00:49:32 -0400
Received: by mail-wg0-f47.google.com with SMTP id l18so6046805wgh.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 21:49:31 -0700 (PDT)
In-Reply-To: <CAPdUM4M2MbpgeXNL66dnP6gzKzv0C2N_otc40KecbpT1jP2Rmg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, arun.kk@samsung.com

+Mike

On Mon, Jun 10, 2013 at 4:17 PM, Rahul Sharma <r.sh.open@gmail.com> wrote:
> This patch is already posted at
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg18331.html
> and
>
> Reviewed-by: Doug Anderson <diand...@chromium.org>
>
> On Mon, Jun 10, 2013 at 4:30 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> From: Arun Kumar K <arun.kk@samsung.com>
>>
>> This patch corrects the HDMI clock number given wrongly
>> in the documentation.
>>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>>  Documentation/devicetree/bindings/clock/exynos5250-clock.txt |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
>> index 781a627..1a05761 100644
>> --- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
>> +++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
>> @@ -154,7 +154,7 @@ clock which they consume.
>>    dsim0                        341
>>    dp                   342
>>    mixer                        343
>> -  hdmi                 345
>> +  hdmi                 344
>>
>>  Example 1: An example of a clock controller node is listed below.
>>
>> --
>> 1.7.10.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
