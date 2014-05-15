From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 4/4] ARM: dts: exynos5250-snow: add ptn3460 node
Date: Fri, 16 May 2014 05:10:56 +0900
Message-ID: <53751F50.8040402@samsung.com>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>	<1397481367-12652-4-git-send-email-sachin.kamat@linaro.org>	<CAOesGMh3bpJtphTFz_3ZZXBPTi_RFXv24tKyTPWa=rHq3xkP8Q@mail.gmail.com>	<CAEC9eQPrSiYt4b1LAWcRYBcozBSOmbs3zUO-zitFWsBm7py9ig@mail.gmail.com>	<537517AF.7080805@samsung.com> <CAD=FV=VvhBTCPMTN2bhhDNBnodpCkWoEnU483RTOGv8PdJ+VsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:53545 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752025AbaEOULD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 16:11:03 -0400
Received: by mail-pa0-f53.google.com with SMTP id kp14so1496627pab.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 13:11:02 -0700 (PDT)
In-Reply-To: <CAD=FV=VvhBTCPMTN2bhhDNBnodpCkWoEnU483RTOGv8PdJ+VsA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, Olof Johansson <olof@lixom.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>, sunil joshi <joshi@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

On 05/16/14 04:50, Doug Anderson wrote:
> Kukjin,
>
Hi Doug,

> On Thu, May 15, 2014 at 12:38 PM, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>> On 04/30/14 22:03, Ajay kumar wrote:
>>>
>>> Hi,
>>>
>> Hi,
>>
>>> On Tue, Apr 15, 2014 at 4:24 AM, Olof Johansson<olof@lixom.net>   wrote:
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
>>> Its better to ignore this patch as of now, since discussion is still going
>>> on, at http://www.spinics.net/lists/dri-devel/msg58474.html
>>> I guess we will have few more DT bindings. Once it is finalized,
>>> I shall resend this again.
>>>
>> This means this whole series?
>
> I think you can land everything except the last patch.
>
OK.

> The tps65090 charger portion of the MFD will fail to probe (assuming
> it is configured) since we're still waiting for a review on
> <https://patchwork.kernel.org/patch/4042741/>.  ...but it doesn't hurt
> to take the device tree part.
>
Good. Thanks for your confirmation.

Will apply 1 to 3 with Tomasz Figa's reviewed tag.

- Kukjin
