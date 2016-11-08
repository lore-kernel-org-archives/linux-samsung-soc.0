From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH RESEND] phy: exynos-mipi-video: simplify check for coupled
 phy status
Date: Tue, 8 Nov 2016 08:33:14 -0300
Message-ID: <b361452b-7d32-27e6-1027-5503707be885@osg.samsung.com>
References: <CGME20161107104844eucas1p2b5571119dff76e33d6ec038c359224f7@eucas1p2.samsung.com>
 <1478515712-650-1-git-send-email-m.szyprowski@samsung.com>
 <2d8a48d1-2ecf-ad27-1e5a-a4233612c602@osg.samsung.com>
 <35688181-78f1-b1c4-5824-e878052d88eb@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:35568
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752196AbcKHLdv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2016 06:33:51 -0500
In-Reply-To: <35688181-78f1-b1c4-5824-e878052d88eb@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>

Hello Marek,

On 11/08/2016 03:27 AM, Marek Szyprowski wrote:
> Hi Javier,
> 
> 
> On 2016-11-07 19:50, Javier Martinez Canillas wrote:
>> On 11/07/2016 07:48 AM, Marek Szyprowski wrote:
>>> There is no need to access regmap of coupled phy to check its state - such
>>> information is already in the phy device itself, so use it directly. This
>>> let us to avoid possible access to registers of the device in the disabled
>>> power domain if the coupled phy is already disabled.
>>>
>> Do you think this patch needs also go to stable?
> 
> Nope, there is no such need, because the problem with potential power domain
> is specific for Exynos 5433, which is not yet merged to mainline.
>

Thanks for the clarification. It wasn't clear for me from the commit
message where did you face this issue.
 
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>> ---
>> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> Best regards

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
