From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH RESEND] phy: exynos-mipi-video: simplify check for coupled
 phy status
Date: Tue, 08 Nov 2016 07:27:12 +0100
Message-ID: <35688181-78f1-b1c4-5824-e878052d88eb@samsung.com>
References: <CGME20161107104844eucas1p2b5571119dff76e33d6ec038c359224f7@eucas1p2.samsung.com>
 <1478515712-650-1-git-send-email-m.szyprowski@samsung.com>
 <2d8a48d1-2ecf-ad27-1e5a-a4233612c602@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:53778 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751779AbcKHG1s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2016 01:27:48 -0500
In-reply-to: <2d8a48d1-2ecf-ad27-1e5a-a4233612c602@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>

Hi Javier,


On 2016-11-07 19:50, Javier Martinez Canillas wrote:
> On 11/07/2016 07:48 AM, Marek Szyprowski wrote:
>> There is no need to access regmap of coupled phy to check its state - such
>> information is already in the phy device itself, so use it directly. This
>> let us to avoid possible access to registers of the device in the disabled
>> power domain if the coupled phy is already disabled.
>>
> Do you think this patch needs also go to stable?

Nope, there is no such need, because the problem with potential power domain
is specific for Exynos 5433, which is not yet merged to mainline.

>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
