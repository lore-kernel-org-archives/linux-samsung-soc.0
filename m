From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/2] i2c: exynos5: simplify clock frequency handling
Date: Thu, 20 Apr 2017 10:54:22 -0400
Message-ID: <dfdf345c-9f5c-d084-fee2-ce6de5615987@osg.samsung.com>
References: <CGME20170224111634eucas1p22340b3b86a835e90ce981a9d9d4dc64a@eucas1p2.samsung.com>
 <1487934962-8703-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:36512
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S970136AbdDTOya (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 10:54:30 -0400
In-Reply-To: <1487934962-8703-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello Andrzej,

On 02/24/2017 08:16 AM, Andrzej Hajda wrote:
> There is no need to keep separate settings for high and fast speed clock.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 45 +++++++++++-----------------------------
>  1 file changed, 12 insertions(+), 33 deletions(-)
> 

Patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

I've also tested it on an Exynos5800 Peach Pi Chromebook and the
I2C devices are working properly after this change:

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
