From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 2/2] ARM: EXYNOS: Make sure that the Exynos5420 MDMA0
 clock is enabled during suspend
Date: Fri, 27 Mar 2015 16:15:23 +0100
Message-ID: <5515740B.7090200@collabora.co.uk>
References: <1427466097-7287-1-git-send-email-javier.martinez@collabora.co.uk>	<1427466097-7287-3-git-send-email-javier.martinez@collabora.co.uk> <CAJKOXPcak1RrvpjQNhVpd+oQODMNvbNhV0TmzO6VNsjcdqxfvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPcak1RrvpjQNhVpd+oQODMNvbNhV0TmzO6VNsjcdqxfvw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Steve Capper <steve.capper@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

Thanks a lot for your feedback.

On 03/27/2015 03:38 PM, Krzysztof Kozlowski wrote:
> 2015-03-27 15:21 GMT+01:00 Javier Martinez Canillas
> <javier.martinez@collabora.co.uk>:
>> Commit ae43b3289186 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power
>> Management support v12") added pm support for the pl330 dma driver but
>> it makes the clock for the Exynos5420 MDMA0 DMA controller to be gated
>> during suspend and this clock needs to remain enabled in order to make
>> the system resume from a system suspend state.
>>
>> To make sure that the clock is enabled during suspend, enable it prior
>> to entering a suspend state and disable it once the system has resumed.
>>
>> Thanks to Abhilash Kesavan for figuring out that this was the issue.
>>
>> Fixes: ae43b32 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
> Hmmm... isn't a real problem elsewhere - like some clock hierarchy is
> wrong or incomplete? This rather looks like workaround for the
> problem.
>

That's a very good question, that's why I sent it as an RFC. I didn't find
anything relevant in the manual but I could certainly be missing something.

>>
>> @@ -516,6 +528,9 @@ static void exynos5420_pm_resume(void)
>>  {
>>         unsigned long tmp;
>>
>> +       if (!IS_ERR_OR_NULL(clk))
>> +               clk_disable_unprepare(clk);
>> +
> 
> Missing clk_put()
>

Yes, Sylwester already pointed it out. Sorry for missing that.
 
> Best regards,
> Krzysztof
> 

Best regards,
Javier
