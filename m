From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2 1/7] ARM: dts: Move display-timimg information inside
 FIMD DT node for exynos5250
Date: Mon, 5 Aug 2013 15:59:12 +0530
Message-ID: <CAK9yfHw7zZLy3WaJHJ-3aJuG+4GL0YtsV+RXuXTUtXsj-TNw2w@mail.gmail.com>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
	<1375183178-8201-2-git-send-email-vikas.sajjan@linaro.org>
	<171932162.BeOHtLbZec@amdc1227>
	<CAGm_ybhipssiOXvh-kw3KpHJ-rC21t7OnV3H32LWKrmE-1aqNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:46288 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938Ab3HEK3N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Aug 2013 06:29:13 -0400
Received: by mail-oa0-f41.google.com with SMTP id j6so5838926oag.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Aug 2013 03:29:12 -0700 (PDT)
In-Reply-To: <CAGm_ybhipssiOXvh-kw3KpHJ-rC21t7OnV3H32LWKrmE-1aqNw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <sajjan.linux@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, InKi Dae <inki.dae@samsung.com>, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org, grant.likely@secretlab.ca, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

On 5 August 2013 15:34, Vikas Sajjan <sajjan.linux@gmail.com> wrote:
> Hi All,
>
> On Thu, Aug 1, 2013 at 8:19 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> Hi Vikas,
>>
>> On Tuesday 30 of July 2013 16:49:32 Vikas Sajjan wrote:
>>> As the display-timing information is parsed by FIMD driver, it makes
>>> sense to move the display-timimg DT node inside FIMD DT node for
>>> exynos5250
>>>
>>> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
>>> ---
>>>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   29
>>> ++++++++++++++++------------- 1 file changed, 16 insertions(+), 13
>>> deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>>> b/arch/arm/boot/dts/exynos5250-smdk5250.dts index 49f18c2..d176dbb
>>> 100644
>>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>>> @@ -262,19 +262,22 @@
>>>               pinctrl-0 = <&dp_hpd>;
>>>       };
>>>
>>> -     display-timings {
>>> -             native-mode = <&timing0>;
>>> -             timing0: timing@0 {
>>> -                     /* 1280x800 */
>>> -                     clock-frequency = <50000>;
>>> -                     hactive = <1280>;
>>> -                     vactive = <800>;
>>> -                     hfront-porch = <4>;
>>> -                     hback-porch = <4>;
>>> -                     hsync-len = <4>;
>>> -                     vback-porch = <4>;
>>> -                     vfront-porch = <4>;
>>> -                     vsync-len = <4>;
>>> +     fimd@14400000 {
>>> +             status = "okay";
>>> +             display-timings {
>>> +                     native-mode = <&timing0>;
>>> +                     timing0: timing@0 {
>>> +                             /* 1280x800 */
>>> +                             clock-frequency = <50000>;
>>> +                             hactive = <1280>;
>>> +                             vactive = <800>;
>>> +                             hfront-porch = <4>;
>>> +                             hback-porch = <4>;
>>> +                             hsync-len = <4>;
>>> +                             vback-porch = <4>;
>>> +                             vfront-porch = <4>;
>>> +                             vsync-len = <4>;
>>> +                     };
>>>               };
>>>       };
>>
>> Looks good to me, but I would like some other people from the device tree
>> mailing list to comment on node naming: Do we want to conform to the
>> recommendation of ePAPR about node naming, which states that node names
>> should be generic, not platform specific or we are free to ignore it?
>>
>
> Any more comments on this series.

One trivial typo in patch subject and commit message:
s/timimg/timing



-- 
With warm regards,
Sachin
