From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH V4 2/2] video: drm: exynos: Add device tree support
Date: Thu, 06 Sep 2012 13:05:31 +0200
Message-ID: <5048837B.6020903@samsung.com>
References: <1346859555-13527-1-git-send-email-l.krishna@samsung.com>
 <1346859555-13527-3-git-send-email-l.krishna@samsung.com>
 <CAH9JG2X_3iUTiGWv2cxjiX-s_VUtptVbzxhAJTub70W_2Dxecg@mail.gmail.com>
 <CAAQKjZNmizjZ-=JN9_AysPMPHTOh7eydfE_OCYE6-v0JAJMydw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42070 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753369Ab2IFLFf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 07:05:35 -0400
Received: from eusync1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9X00AV0DHWK460@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Sep 2012 12:05:56 +0100 (BST)
Received: from [106.116.147.32] by eusync1.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0M9X001CSDH8ZN00@eusync1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Sep 2012 12:05:33 +0100 (BST)
In-reply-to: <CAAQKjZNmizjZ-=JN9_AysPMPHTOh7eydfE_OCYE6-v0JAJMydw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: InKi Dae <inki.dae@samsung.com>
Cc: Kyungmin Park <kmpark@infradead.org>, Leela Krishna Amudala <l.krishna@samsung.com>, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

Hi,

On 09/06/2012 09:21 AM, InKi Dae wrote:
>>> +Required properties:
>>> + - compatible: Should be "samsung,exynos5-fimd" or "samsung,exynos4-fb" for
>> Doesn't better to use single word? fimd or fb?. I think 'fb' is used
>> for framebuffer historically.
>> but now it's used both fb and drm, so fimd is neutral and architecture
>> specific.
>>
>> To do this, Modify arch-exynos first and update it at each drivers it properly.
>>
>> Thank you,
>> Kyungmin Park
>>
> 
> I agree with Kyungmin but I'd like to use as is. the reason we used
> 'exynos4-fb' as device name, is for that it uses fimd driver's
> platform device commonly and gets fimd clock. so I think that dts file
> should be defined with hardware specific name but not driver name such
> as 'exynos4-fb'. but with this, we can't get fimd clock with device's
> name because 'exynos4-fb' is used as device name of fimd clock. so to
> use 'exynos4-fimd', we should modify the device name of fimd clock
> from 'exynos4-fb'  to 'exynos4-fimd' and also ids definitions of
> s3c-fb and drm fimd driver. so my conclusion is that it merges this

I think it's good moment to put those things in order, i.e. use uniform 
'compatible' names: "samsung,exynos4-fimd", "samsung,exynos5-fimd". 
Platform device names are separate issue, but could perhaps be unified 
at this time as well.

> patch set as is and then let's modify related things later.
> any opinions, welcome~ anytime.
> 
> Thanks.
> Inki Dae

--

Regards,
Sylwester
