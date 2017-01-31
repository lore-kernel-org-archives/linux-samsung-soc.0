From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Tue, 31 Jan 2017 12:01:22 +0200
Message-ID: <CAJKOXPeCF3+YXk-GHmewn6fi0rcPbQ_GoPOeFRP2KYN=6KLLxw@mail.gmail.com>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com> <588FD3C3.7080508@samsung.com>
 <CAJKOXPfB0yuQY2bdTEYegU+eakBw32X80ALJkxB2sUX8xFjy+g@mail.gmail.com> <58905A2B.9090101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750809AbdAaKB3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Jan 2017 05:01:29 -0500
In-Reply-To: <58905A2B.9090101@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>, thierry.reding@gmail.com, robh@kernel.org, airlied@linux.ie, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Donghwa Lee <dh09.lee@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

On Tue, Jan 31, 2017 at 11:34 AM, Inki Dae <inki.dae@samsung.com> wrote:
>
>
> 2017년 01월 31일 18:22에 Krzysztof Kozlowski 이(가) 쓴 글:
>> On Tue, Jan 31, 2017 at 2:01 AM, Inki Dae <inki.dae@samsung.com> wrote:
>>>
>>>
>>> 2017년 01월 24일 10:50에 Hoegeun Kwon 이(가) 쓴 글:
>>>> Dear Thierry,
>>>>
>>>> Could you please review this patch?
>>>
>>> Thierry, I think this patch has been reviewed enough but no comment from you. Seems you are busy. I will pick up this.
>>>
>>
>> Comments from v8 were not resolved and I think we are waiting for v9:
>> https://lkml.org/lkml/2017/1/11/178
>>
>> If that is not correct then please clarify.
>
> Seems you pointed to change te-gpios bindings to optional. right?
>
> I thought Rob left ack so it's no problem.
> https://lkml.org/lkml/2017/1/13/626

Yes, change them to optional. I think it is a problem (regardless of
Rob's ack) because you are merging a driver requiring a property which
soon you want to remove. If you merge it (like this) removal of
te-gpios property will be breakage of ABI. This is not a serious
problem but knowing such plan of te-gpios removal upfront, it would be
wrong to commit such driver.

Best regards,
Krzysztof
