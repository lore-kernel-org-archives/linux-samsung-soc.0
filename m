From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 0/4] drm/exynos: fimd: Add support for S3C6400/S3C6410
Date: Thu, 06 Jun 2013 13:02:45 +0900
Message-ID: <51B009E5.5030505@samsung.com>
References: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com>
 <2251148.tVTSO69sfP@flatron> <1938938.aAbuguuIAt@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24338 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750698Ab3FFEC5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jun 2013 00:02:57 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNY00F2BDWCUZH0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Jun 2013 13:02:46 +0900 (KST)
In-reply-to: <1938938.aAbuguuIAt@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com

On 06/06/2013 03:14 AM, Tomasz Figa wrote:
> On Sunday 19 of May 2013 13:26:57 Tomasz Figa wrote:
>> Hi,
>>
>> On Wednesday 01 of May 2013 21:02:25 Tomasz Figa wrote:
>>> Much of the code in Exynos DRM subsystem is generic enough to use
>>> it for older (non-Exynos) Samsung SoCs as well, after minor
>>> modifications.
>>>
>>> This series starts adding support for previous SoCs to Exynos DRM by
>>> introducing S3C64xx support to exynos_drm_fimd driver.
>>>
>>> Adding support for remaining SoCs between S3C64xx and Exynos4
>>> (S5PC100,
>>> S5P64x0 and S5PV210) should be rather straightforward, but at the
>>> moment I can test only on S3C6410, so I limited my changes only to
>>> this SoC.
>>>
>>> On Tiny6410 (Mini6410-compatible) board based on Samsung S3C6410 SoC,
>>> using my to-be-resubmitted patches for Device Tree support:
>>>
>>> Tested-by: Tomasz Figa <tomasz.figa@gmail.com>
>>>
>>> Tomasz Figa (4):
>>>    drm/exynos: fimd: Hold pointer to driver data in context struct
>>>    drm/exynos: fimd: Add support for FIMD versions without SHADOWCON
>>>    
>>>      register
>>>    
>>>    drm/exynos: fimd: Add support for FIMD variants with clock selection
>>>    drm/exynos: fimd: Add support for S3C64xx SoCs
>>>   
>>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c | 90
>>>
>>> ++++++++++++++++++++++++-------- 1 file changed, 68 insertions(+), 22
>>> deletions(-)
>> Any comments for this series?
>>
>> Best regards,
>> Tomasz
> Ping.
>
> Best regards,
> Tomasz
>
>

This series looks good to me.

Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>
