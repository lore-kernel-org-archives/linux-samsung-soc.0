From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: ARM64: EXYNOS: Extend entry for ARM64 DTS
Date: Thu, 11 Jun 2015 17:09:05 -0700
Message-ID: <CAMAWPa_R6pKHBz8fZ+FhEXcvDxwGFC9oS=N8tNnJdJkKFFePSw@mail.gmail.com>
References: <1433584939-3520-1-git-send-email-k.kozlowski@samsung.com>
	<CAMAWPa-3RhXgCjXcdQkPn3W1SJ++iAkfaBdp_p4Se9Ykg1A1mw@mail.gmail.com>
	<557A1B31.1090201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:39341 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751834AbbFLAJK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 20:09:10 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 1E87420662
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2015 00:09:08 +0000 (UTC)
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com [209.85.212.173])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 001C620658
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2015 00:09:06 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so3051872wiw.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2015 17:09:05 -0700 (PDT)
In-Reply-To: <557A1B31.1090201@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

On Thu, Jun 11, 2015 at 4:35 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> W dniu 12.06.2015 o 06:48, Kevin Hilman pisze:
>> Hi Krzysztof,
>>
>> On Sat, Jun 6, 2015 at 3:02 AM, Krzysztof Kozlowski
>> <k.kozlowski@samsung.com> wrote:
>>> Extend the Exynos entry to ARM64 device tree sources.
>>>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will.deacon@arm.com>
>>> Cc: Russell King <linux@arm.linux.org.uk>
>>> Cc: Kukjin Kim <kgene@kernel.org>
>>> Cc: Kevin Hilman <khilman@kernel.org>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Olof Johansson <olof@lixom.net>
>>> Cc: linux-samsung-soc@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>>
>> Applied to arm-soc's next/soc branch.
>>
>> Note I found this by chance.  It almost fell through the cracks
>> because arm@kernel.org (for arm-soc maintainers) wasn't on the to/cc
>> list.
>
> Thanks. I was not aware of this email/list address. It isn't mentioned
> in MAINTAINERS.

Yes, that's kind of by design as it's not meant for general patch
review/discussion.

> So I suspect that any stuff intended to go directly to
> arm-soc maintainers (not through vendor SoC tree) should be sent there?

Yes, this list is specifically for subarch/platform maintainers (which
now includes you :) to send stuff that would like to be applied to the
arm-soc tree.

Thanks,

Kevin
