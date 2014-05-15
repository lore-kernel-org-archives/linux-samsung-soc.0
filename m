From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: exynos5250-snow: add ptn3460 node
Date: Fri, 16 May 2014 01:45:32 +0530
Message-ID: <CAEC9eQPfiwyWkzUdk9F92yx1Sz8XHw8CEUCX47fo9fedFO9C0w@mail.gmail.com>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
	<1397481367-12652-4-git-send-email-sachin.kamat@linaro.org>
	<CAOesGMh3bpJtphTFz_3ZZXBPTi_RFXv24tKyTPWa=rHq3xkP8Q@mail.gmail.com>
	<CAEC9eQPrSiYt4b1LAWcRYBcozBSOmbs3zUO-zitFWsBm7py9ig@mail.gmail.com>
	<537517AF.7080805@samsung.com>
	<CAD=FV=VvhBTCPMTN2bhhDNBnodpCkWoEnU483RTOGv8PdJ+VsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f178.google.com ([209.85.128.178]:62316 "EHLO
	mail-ve0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754758AbaEOUPd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 16:15:33 -0400
Received: by mail-ve0-f178.google.com with SMTP id sa20so1972873veb.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 13:15:32 -0700 (PDT)
In-Reply-To: <CAD=FV=VvhBTCPMTN2bhhDNBnodpCkWoEnU483RTOGv8PdJ+VsA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>, sunil joshi <joshi@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

On 5/16/14, Doug Anderson <dianders@chromium.org> wrote:
> Kukjin,
>
> On Thu, May 15, 2014 at 12:38 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> On 04/30/14 22:03, Ajay kumar wrote:
>>>
>>> Hi,
>>>
>> Hi,
>>
>>> On Tue, Apr 15, 2014 at 4:24 AM, Olof Johansson<olof@lixom.net>  wrote:
>>>>
>>>> Hi Sachin,
>>>>
>>>> On Mon, Apr 14, 2014 at 6:16 AM, Sachin Kamat<sachin.kamat@linaro.org>
>>>> wrote:
>>>>>
>>>>> From: Doug Anderson<dianders@chromium.org>
>>>>>
>>>>> Added nodes for ptn3460 driver to Snow board.
>>>>>
>>>>> Signed-off-by: Doug Anderson<dianders@chromium.org>
>>>>> Signed-off-by: Ajay Kumar<ajaykumar.rs@samsung.com>
>>>>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>>>>
>>>>
>>>> I'm curious, how are you testing this code on the upstream kernel
>>>> before you post the patches?
>>>>
>>>> Especially since Doug was referring to some of these containing parts
>>>> that is needed for drivers that are not yet upstreamed.
>>>
>>>
>>> Its better to ignore this patch as of now, since discussion is still
>>> going
>>> on, at http://www.spinics.net/lists/dri-devel/msg58474.html
>>> I guess we will have few more DT bindings. Once it is finalized,
>>> I shall resend this again.
>>>
>> This means this whole series?
>
> I think you can land everything except the last patch.
I think you can take this ptn3460 DT patch also.
Because, ptn3460 driver is already present in Inki's tree. Its true
that the driver may need some changes, the discussions are still going
on, and if we need to add a new DT binding, I will send that change as
a seperate patch sometime down the line.
As of now, this can go in (but I am sure we won't get the display
until we keep FET1 and FET6 "always on" for snow)

Ajay

> The tps65090 charger portion of the MFD will fail to probe (assuming
> it is configured) since we're still waiting for a review on
> <https://patchwork.kernel.org/patch/4042741/>.  ...but it doesn't hurt
> to take the device tree part.
>
> -Doug
>
