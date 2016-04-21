From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: Enable Samsung media platform
 drivers as modules
Date: Thu, 21 Apr 2016 10:39:48 -0400
Message-ID: <5718E634.3010902@osg.samsung.com>
References: <1458779208-6144-1-git-send-email-javier@osg.samsung.com>
 <56F33C46.8060501@samsung.com> <56F4AD53.2020307@osg.samsung.com>
 <56F8B2D0.9010609@samsung.com> <56F8BD99.9050907@osg.samsung.com>
 <56F94A79.4020808@osg.samsung.com> <56F9D982.8030800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:60988 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751761AbcDUOj5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Apr 2016 10:39:57 -0400
In-Reply-To: <56F9D982.8030800@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kukjin Kim <kgene@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>

[adding Seung-Woo Kim to cc]

Hello Krzysztof,

On 03/28/2016 09:25 PM, Krzysztof Kozlowski wrote:
> On 29.03.2016 00:15, Javier Martinez Canillas wrote:
>> Tobias mentioned on IRC that the exynos4-is driver conflicts with the
>> Exynos DRM driver since both exynos_drm_fimc and exynos-fimc-is use
>> the FIMC block.
>>
>> So I think we should just discard $SUBJECT and instead add a Kconfig
>> check to not allow both drivers to be built as suggested by Tobias.
>>

I posted the Kconfig change [0] but Seung-Woo explained [1] to me that
there are several instances of the FIMC and device nodes can use the
samsung,{isp,lcd}-wb properties to choose which instance to use.

>> Like is the case for the other components (G2D, GSC, Mixer, etc).
> 
> Roger that.
>

So enabling both the V4L2 and DRM drivers is a valid configuration and
$SUBJECT should be picked after all. Sorry for the confusion.

I'll re-post the patch and also include changes for multi_v7_defconfig
in the same series.

> BR,
> Krzysztof
> 

[0]: https://lkml.org/lkml/2016/3/28/494
[1]: https://lkml.org/lkml/2016/3/29/7

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
