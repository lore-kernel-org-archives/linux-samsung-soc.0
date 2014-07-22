From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH v6 05/14] drm/exynos: dsi: add TE interrupt handler to
 support LCD I80 interface
Date: Tue, 22 Jul 2014 17:31:57 +0530
Message-ID: <53CE52B5.7000000@gmail.com>
References: <53CE3C45.9010509@samsung.com> <1406026184-29185-1-git-send-email-yj44.cho@samsung.com> <53CE43B3.2080203@gmail.com> <53CE469A.3090701@samsung.com> <53CE47AA.4000200@gmail.com> <53CE50D6.1000209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:57100 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751755AbaGVMDS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jul 2014 08:03:18 -0400
In-Reply-To: <53CE50D6.1000209@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

On 07/22/2014 05:23 PM, YoungJun Cho wrote:
> Hi Varka,
>
> On 07/22/2014 08:14 PM, Varka Bhadram wrote:
>> On 07/22/2014 04:40 PM, YoungJun Cho wrote:
>>> Hi Varka,
>>>
>>> This irq handler should be registered in attach() and unregistered in
>>> detach().
>>>
>>> The devm_* APIs are released(freed) in remove(), right?
>>>
>>> Logically the panel could be attached and detached several times after
>>> dsi is probed and not removed.
>>> So I don't use devm_* APIs.
>>
>> You meant to say that in-case of GPIOs also you are following the same
>> thing ..?
>>
>> Means requesting the GPIOs and Releasing several times ..?
>>
>
> Yes, this TE gpio is came from panel.
> So it should be refresh whenever a (new) panel is attached.
>
In this case it would be fine. Thanks for the clarity.

-- 
Regards,
Varka Bhadram.
