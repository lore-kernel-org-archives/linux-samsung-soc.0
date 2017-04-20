From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] i2c: exynos5: use core helper to get driver data
Date: Thu, 20 Apr 2017 10:41:32 -0400
Message-ID: <92a43b1b-77c9-3acb-5f47-cfbfce01c860@osg.samsung.com>
References: <CGME20170224133606eucas1p2c3c6afb60b9e39ad501c1ddbdbfc180f@eucas1p2.samsung.com>
 <1487943360-6421-1-git-send-email-a.hajda@samsung.com>
 <ec1304b4-ddf1-e1c4-6edd-03384dbb84f2@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <ec1304b4-ddf1-e1c4-6edd-03384dbb84f2@osg.samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 03/06/2017 12:32 PM, Javier Martinez Canillas wrote:
> Hello Andrzej,
> 
> On 02/24/2017 10:36 AM, Andrzej Hajda wrote:
>> Driver core provides of_device_get_match_data which can be used
>> to get driver data instead of custom helper.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
> 
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 

I've also tested this patch on an Exynos5800 Peach Pi Chromebook:

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
