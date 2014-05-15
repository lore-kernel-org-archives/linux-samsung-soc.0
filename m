From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 4/4] ARM: dts: exynos5250-snow: add ptn3460 node
Date: Thu, 15 May 2014 12:50:47 -0700
Message-ID: <CAD=FV=VvhBTCPMTN2bhhDNBnodpCkWoEnU483RTOGv8PdJ+VsA@mail.gmail.com>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
	<1397481367-12652-4-git-send-email-sachin.kamat@linaro.org>
	<CAOesGMh3bpJtphTFz_3ZZXBPTi_RFXv24tKyTPWa=rHq3xkP8Q@mail.gmail.com>
	<CAEC9eQPrSiYt4b1LAWcRYBcozBSOmbs3zUO-zitFWsBm7py9ig@mail.gmail.com>
	<537517AF.7080805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f178.google.com ([209.85.128.178]:47697 "EHLO
	mail-ve0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755051AbaEOTus (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 15:50:48 -0400
Received: by mail-ve0-f178.google.com with SMTP id sa20so1933484veb.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 12:50:47 -0700 (PDT)
In-Reply-To: <537517AF.7080805@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Olof Johansson <olof@lixom.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>, sunil joshi <joshi@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

Kukjin,

On Thu, May 15, 2014 at 12:38 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 04/30/14 22:03, Ajay kumar wrote:
>>
>> Hi,
>>
> Hi,
>
>> On Tue, Apr 15, 2014 at 4:24 AM, Olof Johansson<olof@lixom.net>  wrote:
>>>
>>> Hi Sachin,
>>>
>>> On Mon, Apr 14, 2014 at 6:16 AM, Sachin Kamat<sachin.kamat@linaro.org>
>>> wrote:
>>>>
>>>> From: Doug Anderson<dianders@chromium.org>
>>>>
>>>> Added nodes for ptn3460 driver to Snow board.
>>>>
>>>> Signed-off-by: Doug Anderson<dianders@chromium.org>
>>>> Signed-off-by: Ajay Kumar<ajaykumar.rs@samsung.com>
>>>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>>>
>>>
>>> I'm curious, how are you testing this code on the upstream kernel
>>> before you post the patches?
>>>
>>> Especially since Doug was referring to some of these containing parts
>>> that is needed for drivers that are not yet upstreamed.
>>
>>
>> Its better to ignore this patch as of now, since discussion is still going
>> on, at http://www.spinics.net/lists/dri-devel/msg58474.html
>> I guess we will have few more DT bindings. Once it is finalized,
>> I shall resend this again.
>>
> This means this whole series?

I think you can land everything except the last patch.

The tps65090 charger portion of the MFD will fail to probe (assuming
it is configured) since we're still waiting for a review on
<https://patchwork.kernel.org/patch/4042741/>.  ...but it doesn't hurt
to take the device tree part.

-Doug
