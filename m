From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: exynos5250-snow: add pinctrl for i2c-arbitrator
Date: Tue, 15 Apr 2014 00:38:56 +0200
Message-ID: <534C6380.3040806@gmail.com>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org> <CAD=FV=XEO8if9+bW++cPiqUrsAjBHs63_aQGYcyPSmcXnwVQfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41]:45104 "EHLO
	mail-ee0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754881AbaDNWjB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 18:39:01 -0400
Received: by mail-ee0-f41.google.com with SMTP id t10so7159158eei.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Apr 2014 15:38:59 -0700 (PDT)
In-Reply-To: <CAD=FV=XEO8if9+bW++cPiqUrsAjBHs63_aQGYcyPSmcXnwVQfQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Sachin Kamat <sachin.kamat@linaro.org>, Olof Johansson <olof@lixom.net>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, Simon Glass <sjg@chromium.org>

Hi Doug,

On 15.04.2014 00:30, Doug Anderson wrote:
> Sachin,
>
> On Mon, Apr 14, 2014 at 6:16 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> From: Doug Anderson <dianders@chromium.org>
>
> I probably wouldn't have bothered giving me authorship since this
> isn't exactly a clean patch from the chromium tree (you pulled the
> proper pieces yourself, did the commit message yourself, etc).  ...but
> I appreciate the thought and as far as I know setting the "author" in
> cases like this is a bit of a judgement call...
>
> The Signed-off-by is certainly correct.  ;)
>
>>
>> Added i2c-arbitrator pinctrl node to Snow board.
>>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>   arch/arm/boot/dts/exynos5250-snow.dts |   19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>
> This matches what's in our tree and and is what people are using, so:
>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
>
>
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
>> index 1ce1088..32715b3 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -39,6 +39,22 @@
>>                  };
>>          };
>>
>> +       pinctrl@13400000 {
>> +               arb_their_claim: arb-their-claim {
>> +                       samsung,pins = "gpe0-4";
>> +                       samsung,pin-function = <0>;
>> +                       samsung,pin-pud = <3>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>> +
>> +               arb_our_claim: arb-our-claim {
>> +                       samsung,pins = "gpf0-3";
>> +                       samsung,pin-function = <1>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>
> It's odd to me that one of these has a pullup but not the other, but I
> think that's because the arbitration lines ended up using some other
> signals that were originally hooked up for other usage.  Certainly the
> pullups / pulldowns match what's in our tree and also match what we
> had in the original shipping 3.4 kernel.

Just a wild guess, but probably the input needs a pull-up, while 
obviously the output doesn't. I don't have much idea about the 
arbitration thing happening on snow, so I can't say much about this 
series. (Maybe description of patch 1/4 should be saying a bit more 
about the meaning of this?)

Best regards,
Tomasz
