From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v3 4/5] clk/exynos5420: add hdmi mux to change parents in
 hdmi driver
Date: Tue, 27 Aug 2013 10:14:01 +0530
Message-ID: <CAPdUM4MUvzyAjyFwuYyBY6C-nn_VHttwf=ebAZLgc4VTNgS05A@mail.gmail.com>
References: <1377508383-15185-1-git-send-email-rahul.sharma@samsung.com>
	<1377508383-15185-5-git-send-email-rahul.sharma@samsung.com>
	<1919681.jqCQjHmyQW@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:50084 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752572Ab3H0EoD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 00:44:03 -0400
Received: by mail-we0-f174.google.com with SMTP id q54so3501743wes.33
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2013 21:44:01 -0700 (PDT)
In-Reply-To: <1919681.jqCQjHmyQW@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, sunil joshi <joshi@samsung.com>

On 27 August 2013 05:16, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Rahul,
>
> On Monday 26 of August 2013 14:43:02 Rahul Sharma wrote:
>> hdmi driver needs to change the parent of hdmi clock
>> to pixel clock or hdmiphy clock, based on the stability
>> of hdmiphy. This patch is exposing the mux for changing
>> the parent.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>>  Documentation/devicetree/bindings/clock/exynos5420-clock.txt |    5
>> +++++ drivers/clk/samsung/clk-exynos5420.c                         |
>> 5 ++++- 2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
>> b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt index
>> 5758a69..6f16aa8 100644
>> --- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
>> +++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
>> @@ -182,6 +182,11 @@ clock which they consume.
>>    g3d                        501
>>    smmu_mixer         502
>>
>> +  Mux                        ID
>> +  ----------------------------
>> +
>> +  mout_hdmi          1024
>
> Is there a need for such big hole between smm_mixer and this clock? I
> believe that based on the documentation, the total amount of clocks that
> can be defined may be approximated and some extra margin added, so you
> don't waste so much of numbering space and memory used for lookup array.
>

Total number of Gates are coming upto the enum value 540. I can leave gap
of 64 in between for first mux. Similarly, total muxes in system are 118.
Optimum gab would be between 128~150. What you say about these
values?

regards,
Rahul Sharma.

> Best regards,
> Tomasz
>
