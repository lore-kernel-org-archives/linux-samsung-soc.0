From: Kevin Hilman <khilman@kernel.org>
Subject: Re: exynos boot falures in linux-next
Date: Mon, 17 Nov 2014 19:49:09 -0800
Message-ID: <7hfvdhyxqi.fsf@deeprootsystems.com>
References: <E1XqKYI-0000pQ-4b@ip-10-35-177-41.ec2.internal>
	<7hoas54y7k.fsf@deeprootsystems.com>
	<7hlhn9zcse.fsf@deeprootsystems.com>
	<546A83D6.9060504@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:57461 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751213AbaKRDtM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 22:49:12 -0500
Received: by mail-pa0-f44.google.com with SMTP id et14so8891468pad.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2014 19:49:11 -0800 (PST)
In-Reply-To: <546A83D6.9060504@collabora.co.uk> (Javier Martinez Canillas's
	message of "Tue, 18 Nov 2014 00:25:10 +0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:

> Hello Kevin,
>
> On 11/17/2014 11:24 PM, Kevin Hilman wrote:
>> 
>> As might have been expected, reverting the change that enables the
>> DRM/display options in exynos_defconfig fixes the problem.
>> 
>> Kevin
>>
>
> I'm sorry for causing a boot failure but when I first posted that patch,
> the Exynos DRM driver was working correctly (at least on the Exynos boards
> I've access to) 

Yeah, I tested it at the time as well, so I know it was working.

> so it seems the regression was introduced while the patch
> was posted but not yet picked.
>
> I'm not sure what is the correct step in this case but I'm OK with
> reverting the patch until the Exynos DRM driver bug is fixed.

I didn't have time to dig, but I'd rather someone track down the DRM
problem and fix that, since it was known to be working. I'm guessing
it's something simple that can be fixed before the merge window opens.

Kevin
