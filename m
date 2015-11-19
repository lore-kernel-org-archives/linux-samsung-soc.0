From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Thu, 19 Nov 2015 12:51:08 -0300
Message-ID: <564DEFEC.50802@osg.samsung.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
 <564DE209.8030004@osg.samsung.com> <564DE2DB.6050608@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:36436 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934217AbbKSPvO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2015 10:51:14 -0500
In-Reply-To: <564DE2DB.6050608@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 11/19/2015 11:55 AM, Javier Martinez Canillas wrote:
>>>
>>
>> This series causes a boot failure on at least an Exynos5800 Peach Pi
>> Chromebook (tested myself) and seems to be the cause of other Exynos
>> boards failing to boot: http://kernelci.org/boot/?exynos&fail
>>
>> [snip]
>>
>>>   drm/exynos: add pm_runtime to Mixer
>>>   drm/exynos: add pm_runtime to FIMD
>>
>> I had to revert these patches in order to get the machine in a bootable
>> state again, the sha1 hash for these patches in next-20151119 are:
>>
>> 045febd5f813 drm/exynos: add pm_runtime to FIMD

On a closer look, only reverting the FIMD patch is enough
to make at least the Exynos5800 Peach Pi to boot again.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
