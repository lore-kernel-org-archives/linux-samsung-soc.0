From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 0/3] Fix power domains handling on exynos542x
Date: Tue, 10 Mar 2015 10:48:54 +0100
Message-ID: <54FEBE06.3000007@collabora.co.uk>
References: <1423139739-19881-1-git-send-email-a.hajda@samsung.com> <54D381F4.2080701@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43430 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751272AbbCJJtA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Mar 2015 05:49:00 -0400
In-Reply-To: <54D381F4.2080701@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Liquid.Acid@gmx.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

Hello Kukjin,

On 02/05/2015 03:45 PM, Javier Martinez Canillas wrote:
> Hello Andrzej,
> 
> Thanks a lot for finally finding what was causing the HDMI issue.
> 
> On 02/05/2015 01:35 PM, Andrzej Hajda wrote:
>> Hi,
>> 
>> Exynos chipsets since 542x have asynchronous bridges connecting different IPs.
>> These bridges should be operational during power domain switching, ie associated
>> clocks cannot be gated.
>> This patchset adds binding to provide such clocks per power domain and adds code
>> which enables them during domain on/off operation.
>> 
>> This patchset fixes power domain issues with disp1 domain and HDMI (some of them)
>> on Odroid XU3:
>> - disp1 power domain can be turned off,
>> - no more "imprecise external abort" faults.
>> 
>> The patchset is based on '[PATCH v5 0/9] Enable HDMI support on Exynos platforms' [1].
>> 
> 
> It also depends on '[PATCH 0/2] Add HDMI support for Exynos5420 platform' [2].
> 
>> It was successfully tested on OdroidXU3.
>> 
>> [1]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/42743
> 
> Your patches looks good to me so please feel free to add:
> 
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
> I also tested on an Exynos5420 Peach Pit Chromebook and both the "Power
> domain power-domain disable failed" message and the system crash are gone.
> 
> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
> Best regards,
> Javier
> 
> [2]: https://lkml.org/lkml/2015/1/20/235
> 

Any comments about this series? It fixes system hangs on Exynos
5420/5422/5800 boards and has been in the list for a while.

Please keep in mind that a v2 of patch 3/3 was posted [0].

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/2/6/138
