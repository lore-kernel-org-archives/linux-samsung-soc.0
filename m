From: Misha Komarovskiy <zombah@gmail.com>
Subject: Re: [PATCH] drm/bridge: analogix dp: Fix runtime PM state in
 get_modes() callback
Date: Tue, 5 Dec 2017 17:24:52 +0300
Message-ID: <CANLc0-avSUYwhJALTXULBhL5U9dD0_1Dymbr35Ogm8Y-Sb1Kpg@mail.gmail.com>
References: <CGME20171121074940eucas1p17779b35232466785d43c56382dad01b7@eucas1p1.samsung.com>
 <20171121074936.22520-1-m.szyprowski@samsung.com> <5ae5ce53-d15d-c18e-ec47-4a579e039e3a@codeaurora.org>
 <CANLc0-bR00kRu6M6BNu5zv4zmT8S=TjhfPOhWDbyKwkEre9UJg@mail.gmail.com> <580cfc6f-863e-d977-b1f7-4c96df0ba6ff@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:39990 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751255AbdLEOZP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 09:25:15 -0500
In-Reply-To: <580cfc6f-863e-d977-b1f7-4c96df0ba6ff@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Archit Taneja <architt@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Yakir Yang <ykk@rock-chips.com>, Sean Paul <seanpaul@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <a.hajda@samsung.com>, stable@vger.kernel.org, hjc@rock-chips.com

Hello Marek,

On Tue, Dec 5, 2017 at 5:12 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hi Misha,
>
> On 2017-12-05 15:06, Misha Komarovskiy wrote:
>>
>> On Mon, Nov 27, 2017 at 6:40 AM, Archit Taneja <architt@codeaurora.org>
>> wrote:
>>>
>>> On 11/21/2017 01:19 PM, Marek Szyprowski wrote:
>>>>
>>>> get_modes() callback might be called asynchronously from the DRM core
>>>> and
>>>> it is not synchronized with bridge_enable(), which sets proper runtime
>>>> PM
>>>> state of the main DP device. Fix this by calling pm_runtime_get_sync()
>>>> before calling drm_get_edid(), which in turn calls drm_dp_i2c_xfer() and
>>>> analogix_dp_transfer() to ensure that main DP device is runtime active
>>>> when doing any access to its registers.
>>>
>>> Looks good to me. Would be nice to get an ack from rockchip too. Will
>>> queue
>>> it
>>> to drm-misc-fixes (so that it's merged for 4.15-rc2) if no one has any
>>> objections.
>>
>> After this patch accepted to 4.15-rc2 any chances to have it also in
>> 4.14 stable?
>>
>> I tested it manualy and it fixes boot freeze on snow with 4.14.
>> If required,
>> Tested-by: Misha Komarovskiy <zombah@gmail.com>
>
>
> The patch is tagged cc: stable, so it should automatically get into v4.14.y
> series once it finally lands in v4.15-rcX series.
>

I see. Thank you for clarification.
Sorry for the noise 8)

>> ...
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>



-- 
Best Regards,
Misha Komarovskiy
zombahatgmaildotcom
