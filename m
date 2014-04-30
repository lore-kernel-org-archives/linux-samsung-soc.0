From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: exynos5250-snow: add ptn3460 node
Date: Wed, 30 Apr 2014 18:33:02 +0530
Message-ID: <CAEC9eQPrSiYt4b1LAWcRYBcozBSOmbs3zUO-zitFWsBm7py9ig@mail.gmail.com>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
	<1397481367-12652-4-git-send-email-sachin.kamat@linaro.org>
	<CAOesGMh3bpJtphTFz_3ZZXBPTi_RFXv24tKyTPWa=rHq3xkP8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f171.google.com ([209.85.128.171]:39784 "EHLO
	mail-ve0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758761AbaD3NDE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 09:03:04 -0400
Received: by mail-ve0-f171.google.com with SMTP id jy13so2065506veb.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2014 06:03:03 -0700 (PDT)
In-Reply-To: <CAOesGMh3bpJtphTFz_3ZZXBPTi_RFXv24tKyTPWa=rHq3xkP8Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, sunil joshi <joshi@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

Hi,

On Tue, Apr 15, 2014 at 4:24 AM, Olof Johansson <olof@lixom.net> wrote:
> Hi Sachin,
>
> On Mon, Apr 14, 2014 at 6:16 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> From: Doug Anderson <dianders@chromium.org>
>>
>> Added nodes for ptn3460 driver to Snow board.
>>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>
> I'm curious, how are you testing this code on the upstream kernel
> before you post the patches?
>
> Especially since Doug was referring to some of these containing parts
> that is needed for drivers that are not yet upstreamed.

Its better to ignore this patch as of now, since discussion is still going
on, at http://www.spinics.net/lists/dri-devel/msg58474.html
I guess we will have few more DT bindings. Once it is finalized,
I shall resend this again.

Regards,
Ajay Kumar
