From: Misha Komarovskiy <zombah@gmail.com>
Subject: Re: Google snow chromebook hard freeze with 4.14
Date: Tue, 21 Nov 2017 11:26:56 +0300
Message-ID: <CANLc0-a0DPWL6ZjOg_oYbs5hCB9DofMZoG2801REccyfco-Mrw@mail.gmail.com>
References: <CGME20171120151128epcas5p24380fda5dbb1e73d647c8c77bb98a8dd@epcas5p2.samsung.com>
 <CANLc0-YnQ93F2RouL4NxVhQ=2KYqGj60BA7_ttVZhGhvas6L3Q@mail.gmail.com> <ba26b180-a635-8dcf-236f-651bff13e3a7@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:45616 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751226AbdKUI1S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Nov 2017 03:27:18 -0500
Received: by mail-lf0-f50.google.com with SMTP id f131so5070825lff.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Nov 2017 00:27:17 -0800 (PST)
In-Reply-To: <ba26b180-a635-8dcf-236f-651bff13e3a7@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hello Marek,

On Tue, Nov 21, 2017 at 10:56 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hi Misha,
>
> On 2017-11-20 16:11, Misha Komarovskiy wrote:
>>
>> Hello,
>> After upgrade to kernel version 4.14 i receive hard freeze 4 of 5
>> boots on snow with error Unhandled fault: asynchronous external abort
>> (0x211) at 0x00000000 , here is full serial output of kernel log with
>> fault trace [1].
>> With kernel 4.13 device boots fine.
>>
>> [1] - http://paste.opensuse.org/96574215
>
>
> Thanks for the report. It looks that recent changes in DRM core revealed
> a bug in Analogix DP driver.
>
> This patch: https://patchwork.kernel.org/patch/10067709/ fixes this issue.

Thank you very much!

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
