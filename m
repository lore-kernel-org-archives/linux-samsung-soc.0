From: Kevin Hilman <khilman@kernel.org>
Subject: Re: exynos boot falures in linux-next
Date: Wed, 19 Nov 2014 09:01:21 -0800
Message-ID: <CAMAWPa8D-oRp2yC=n+Rgw_wtwV4+Go0OQi62y3iGRYxi0sow+g@mail.gmail.com>
References: <E1XqKYI-0000pQ-4b@ip-10-35-177-41.ec2.internal>
	<7hoas54y7k.fsf@deeprootsystems.com>
	<7hlhn9zcse.fsf@deeprootsystems.com>
	<546A83D6.9060504@collabora.co.uk>
	<7hfvdhyxqi.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:56612 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754439AbaKSRBZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 12:01:25 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 6AAC82021A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2014 17:01:24 +0000 (UTC)
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com [209.85.212.177])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B112F201FB
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2014 17:01:22 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so2594079wiw.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2014 09:01:21 -0800 (PST)
In-Reply-To: <7hfvdhyxqi.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel-build-reports@lists.linaro.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

On Mon, Nov 17, 2014 at 7:49 PM, Kevin Hilman <khilman@kernel.org> wrote:
> Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:
>
>> Hello Kevin,
>>
>> On 11/17/2014 11:24 PM, Kevin Hilman wrote:
>>>
>>> As might have been expected, reverting the change that enables the
>>> DRM/display options in exynos_defconfig fixes the problem.
>>>
>>> Kevin
>>>
>>
>> I'm sorry for causing a boot failure but when I first posted that patch,
>> the Exynos DRM driver was working correctly (at least on the Exynos boards
>> I've access to)
>
> Yeah, I tested it at the time as well, so I know it was working.
>
>> so it seems the regression was introduced while the patch
>> was posted but not yet picked.
>>
>> I'm not sure what is the correct step in this case but I'm OK with
>> reverting the patch until the Exynos DRM driver bug is fixed.
>
> I didn't have time to dig, but I'd rather someone track down the DRM
> problem and fix that, since it was known to be working. I'm guessing
> it's something simple that can be fixed before the merge window opens.

OK, so this DRM problem is turning out to be non-trivial, so I think
the defconfig patch should be reverted until the DRM issue is sorted
out.

Otherwise, we risk having boot failures in linux-next which may be
hiding other problems.

Kevin
