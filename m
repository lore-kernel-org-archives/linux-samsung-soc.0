From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: Google snow chromebook hard freeze with 4.14
Date: Tue, 21 Nov 2017 08:56:21 +0100
Message-ID: <ba26b180-a635-8dcf-236f-651bff13e3a7@samsung.com>
References: <CGME20171120151128epcas5p24380fda5dbb1e73d647c8c77bb98a8dd@epcas5p2.samsung.com>
        <CANLc0-YnQ93F2RouL4NxVhQ=2KYqGj60BA7_ttVZhGhvas6L3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37925 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751175AbdKUH4Z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Nov 2017 02:56:25 -0500
In-reply-to: <CANLc0-YnQ93F2RouL4NxVhQ=2KYqGj60BA7_ttVZhGhvas6L3Q@mail.gmail.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Misha Komarovskiy <zombah@gmail.com>, linux-samsung-soc@vger.kernel.org

Hi Misha,

On 2017-11-20 16:11, Misha Komarovskiy wrote:
> Hello,
> After upgrade to kernel version 4.14 i receive hard freeze 4 of 5
> boots on snow with error Unhandled fault: asynchronous external abort
> (0x211) at 0x00000000 , here is full serial output of kernel log with
> fault trace [1].
> With kernel 4.13 device boots fine.
>
> [1] - http://paste.opensuse.org/96574215

Thanks for the report. It looks that recent changes in DRM core revealed
a bug in Analogix DP driver.

This patch: https://patchwork.kernel.org/patch/10067709/ fixes this issue.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
