From: Simon Glass <sjg@chromium.org>
Subject: Re: [RFC] i2c: Providing hooks for i2c multimaster bus arbitration.
Date: Tue, 5 Feb 2013 22:00:04 -0800
Message-ID: <CAPnjgZ1DG2Txh41r8PsfqfZMaUem5ScTijMP+==3ATFK0Q1=Dw@mail.gmail.com>
References: <1359968595-21291-1-git-send-email-yuvaraj.cd@samsung.com>
	<CAD=FV=VQywwQ3YAFb=1qFmd3UEW39Xu=ok6fdjhvBXdwOQOa1Q@mail.gmail.com>
	<CAKuRcOKx4VLcmhwi8VWHKNOizgiVsE5f0v-CGmK5+bH=BjJAPg@mail.gmail.com>
	<CAKuRcOK1B-iNACQntZ2LsTTXaKULwZvOWDVCQF_vz8ym_JeG2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:43605 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752019Ab3BFGAF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 01:00:05 -0500
Received: by mail-ob0-f172.google.com with SMTP id tb18so1091911obb.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Feb 2013 22:00:04 -0800 (PST)
In-Reply-To: <CAKuRcOK1B-iNACQntZ2LsTTXaKULwZvOWDVCQF_vz8ym_JeG2g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar <yuvaraj.cd@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Wolfram Sang <w.sang@pengutronix.de>, Grant Grundler <grundler@chromium.org>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, naveen krishna <ch.naveen@samsung.com>, Grant Likely <grant.likely@secretlab.ca>

Hi,

On Tue, Feb 5, 2013 at 9:33 PM, Yuvaraj Kumar <yuvaraj.cd@gmail.com> wrote:
> On Wed, Feb 6, 2013 at 10:58 AM, Yuvaraj Kumar <yuvaraj.cd@gmail.com> wrote:
>> On Wed, Feb 6, 2013 at 5:48 AM, Doug Anderson <dianders@chromium.org> wrote:
>>> Yavaraj,
>>>
>>> On Mon, Feb 4, 2013 at 1:03 AM, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
>>> wrote:
>>>>
>>>> This RFC patch is w.r.t multimaster bus arbitration which is already
>>>> being discussing in the mainline.
>>>> This patch provides hooks for the i2c multimaster bus arbitration
>>>> and to have the arbitration parameters.
>>>
>>>
>>> I may have missed something in all the threads, but my recollection was that
>>> the request was that this should be implemented without touching the i2c
>>> core code.  Your patch modifies the i2c core code.
>
>    Different i2c devices will directly talk to i2c core using i2c_transfer().
>     If we put this out of the i2c core,the i2c devices like tpsxxxx and etc
>     should be registered through the bridge/mux .
>
>>>
>>> My impression was that the best solution was to use the infrastructure in
>>> place for i2c multiplexing.  ...but in your case you would only multiplex
>>> one thing.  This was suggested by Grant Likely and seems the cleanest...
>>
>      I agree that Grants idea was the cleanest but we may end up in change in
>       i2c device probe to register through mux/bridge.(for the
> device's connected on that
>      particular bus which requires arbitration).

Does the device tree not handle that case automatically? How are
muxes/bridges done in that case? It's not problem to adjust the device
tree file accordingly if Grant's approach is the cleanest method.

Regards,
Simon

>>
>>>
>>> -Doug
