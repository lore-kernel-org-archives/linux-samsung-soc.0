From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] exynos-drm-next
Date: Tue, 18 Apr 2017 09:11:22 +0200
Message-ID: <CAJKOXPdQ8rzTjbikwVeEz-Cf-dWR+pxD5gqE_nPbuLX6qP_1zw@mail.gmail.com>
References: <CGME20170418020509epcas5p2e54f307dee164846dabf0470c5f134eb@epcas5p2.samsung.com>
 <1492481109-2863-1-git-send-email-inki.dae@samsung.com> <20170418022141.6ee35oy77g4nbrpl@gangnam.samsung>
 <58F57A3A.2000900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:51956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751898AbdDRHL1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 03:11:27 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
        by mail.kernel.org (Postfix) with ESMTP id BE98720218
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Apr 2017 07:11:25 +0000 (UTC)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com [209.85.223.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0C6F20122
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Apr 2017 07:11:23 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id k87so155940316ioi.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Apr 2017 00:11:23 -0700 (PDT)
In-Reply-To: <58F57A3A.2000900@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

On Tue, Apr 18, 2017 at 4:30 AM, Inki Dae <inki.dae@samsung.com> wrote:
>
>
> 2017년 04월 18일 11:21에 Andi Shyti 이(가) 쓴 글:
>> Hi Inki,
>>
>>> Andi Shyti (2):
>>>       arm64: dts: exynos: Enable ir-spi in the TM2 and TM2E boards
>>>       arm64: dts: exynos: Add stmfts touchscreen node for TM2 and TM2E
>>
>> weren't these patches taken already by Krzysztof? They are
>> already in -next
>
> I know a merge tag would make one not to be merged if other is already merged.

Yes, it is expected. They come from merging my branch as we requested.
The commits are exactly the same as in my tree (same SHA) so
everything will end up fine.

The only thing here we missed here is merging the Hoegeun's patches
for arm. But well... it happens.

Best regards,
Krzysztof
