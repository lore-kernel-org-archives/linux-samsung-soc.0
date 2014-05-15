From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: exynos5250-snow: add pinctrl for i2c-arbitrator
Date: Thu, 15 May 2014 22:00:25 +0200
Message-ID: <53751CD9.7080808@gmail.com>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>	<CAD=FV=XEO8if9+bW++cPiqUrsAjBHs63_aQGYcyPSmcXnwVQfQ@mail.gmail.com>	<534C6380.3040806@gmail.com> <CAD=FV=V3aXz2v6Wa8yyVn8QzJfpYyjyxabSejbvxh5n3uZdpSg@mail.gmail.com> <53751B6C.9020106@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:53337 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754941AbaEOUAi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 16:00:38 -0400
In-Reply-To: <53751B6C.9020106@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, Simon Glass <sjg@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On 15.05.2014 21:54, Kukjin Kim wrote:
> On 04/15/14 07:53, Doug Anderson wrote:
> 
> + DT ML
> 
>> Tomasz,
>>
> 
>> On Mon, Apr 14, 2014 at 3:38 PM, Tomasz Figa<tomasz.figa@gmail.com> 
>> wrote:
>>> Hi Doug,
>>>
>>>
>>> On 15.04.2014 00:30, Doug Anderson wrote:
>>>>
>>>> Sachin,
>>>>
>>>> On Mon, Apr 14, 2014 at 6:16 AM, Sachin Kamat<sachin.kamat@linaro.org>
>>>> wrote:
>>>>>
>>>>> From: Doug Anderson<dianders@chromium.org>
>>>>
>>>>
>>>> I probably wouldn't have bothered giving me authorship since this
>>>> isn't exactly a clean patch from the chromium tree (you pulled the
>>>> proper pieces yourself, did the commit message yourself, etc).  ...but
>>>> I appreciate the thought and as far as I know setting the "author" in
>>>> cases like this is a bit of a judgement call...
>>>>
>>>> The Signed-off-by is certainly correct.  ;)
>>>>
>>>>>
>>>>> Added i2c-arbitrator pinctrl node to Snow board.
>>>>>
>>>>> Signed-off-by: Doug Anderson<dianders@chromium.org>
>>>>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>>>>> ---
>>>>>    arch/arm/boot/dts/exynos5250-snow.dts |   19 +++++++++++++++++++
>>>>>    1 file changed, 19 insertions(+)
>>>>
>>>>
>>>> This matches what's in our tree and and is what people are using, so:
>>>>
>>>> Reviewed-by: Doug Anderson<dianders@chromium.org>
>>>>
>>>>
>>>>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts
>>>>> b/arch/arm/boot/dts/exynos5250-snow.dts
>>>>> index 1ce1088..32715b3 100644
>>>>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>>>>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>>>>> @@ -39,6 +39,22 @@
>>>>>                   };
>>>>>           };
>>>>>
>>>>> +       pinctrl@13400000 {
>>>>> +               arb_their_claim: arb-their-claim {
>>>>> +                       samsung,pins = "gpe0-4";
>>>>> +                       samsung,pin-function =<0>;
>>>>> +                       samsung,pin-pud =<3>;
>>>>> +                       samsung,pin-drv =<0>;
>>>>> +               };
>>>>> +
>>>>> +               arb_our_claim: arb-our-claim {
>>>>> +                       samsung,pins = "gpf0-3";
>>>>> +                       samsung,pin-function =<1>;
>>>>> +                       samsung,pin-pud =<0>;
>>>>> +                       samsung,pin-drv =<0>;
>>>>> +               };
>>>>
>>>>
>>>> It's odd to me that one of these has a pullup but not the other, but I
>>>> think that's because the arbitration lines ended up using some other
>>>> signals that were originally hooked up for other usage.  Certainly the
>>>> pullups / pulldowns match what's in our tree and also match what we
>>>> had in the original shipping 3.4 kernel.
>>>
>>>
>>> Just a wild guess, but probably the input needs a pull-up, while
>>> obviously
>>> the output doesn't. I don't have much idea about the arbitration thing
>>> happening on snow, so I can't say much about this series. (Maybe
>>> description
>>> of patch 1/4 should be saying a bit more about the meaning of this?)
>>
>> Right, of course.  I'm not sure quite what I was thinking.  I think I
>> was getting confused since these go through level converters and my
>> brain was in open drain mode.  ...but looking at this again this looks
>> reasonable.
>>
>> I think the whole discussion of arbitration was from a long time ago.
>> I think it's fairly well documented in the "i2c-arb-gpio-challenge"
>> driver.
>>
>> Basically it looks like Sachin is getting pinctrl stuff matched up
>> properly for the device tree that's upstream.
>>
> Sounds OK to me.
> 
> Tomasz, do you have any concerns still?

Nope. This series looked quite fine for me from the beginning, just
wanted to make sure I understand things happening here correctly.

Feel free to add

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

to all four patches if not too late yet.

Best regards,
Tomasz
