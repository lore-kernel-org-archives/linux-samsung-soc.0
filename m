From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: exynos boot falures in linux-next
Date: Wed, 19 Nov 2014 18:06:55 +0100
Message-ID: <546CCE2F.8030108@collabora.co.uk>
References: <E1XqKYI-0000pQ-4b@ip-10-35-177-41.ec2.internal>	<7hoas54y7k.fsf@deeprootsystems.com>	<7hlhn9zcse.fsf@deeprootsystems.com>	<546A83D6.9060504@collabora.co.uk>	<7hfvdhyxqi.fsf@deeprootsystems.com> <CAMAWPa8D-oRp2yC=n+Rgw_wtwV4+Go0OQi62y3iGRYxi0sow+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:60014 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753980AbaKSRHC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 12:07:02 -0500
In-Reply-To: <CAMAWPa8D-oRp2yC=n+Rgw_wtwV4+Go0OQi62y3iGRYxi0sow+g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel-build-reports@lists.linaro.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

Hello Kevin,

On 11/19/2014 06:01 PM, Kevin Hilman wrote:
>>>
>>> I'm not sure what is the correct step in this case but I'm OK with
>>> reverting the patch until the Exynos DRM driver bug is fixed.
>>
>> I didn't have time to dig, but I'd rather someone track down the DRM
>> problem and fix that, since it was known to be working. I'm guessing
>> it's something simple that can be fixed before the merge window opens.
> 
> OK, so this DRM problem is turning out to be non-trivial, so I think
> the defconfig patch should be reverted until the DRM issue is sorted
> out.
> 
> Otherwise, we risk having boot failures in linux-next which may be
> hiding other problems.
> 
> Kevin
> 

Agreed with the config revert, so many issues with Exynos DRM in linux-next :(

Best regards,
Javier
