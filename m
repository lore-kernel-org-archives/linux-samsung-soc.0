From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/2] i2c: exynos5: de-duplicate error logs on clock setup
Date: Thu, 20 Apr 2017 11:28:20 -0400
Message-ID: <3304a6ff-9446-44ae-4ec5-8e4f952bc34c@osg.samsung.com>
References: <1487934962-8703-1-git-send-email-a.hajda@samsung.com>
 <CGME20170224111634eucas1p28938c94c566c0aadf6dc7766b4eb96d9@eucas1p2.samsung.com>
 <1487934962-8703-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:36619
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S970085AbdDTP21 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 11:28:27 -0400
In-Reply-To: <1487934962-8703-2-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello Andrzej,

On 02/24/2017 08:16 AM, Andrzej Hajda wrote:
> In case of clock setup error it is enough to log it once.
> Moreover patch simplifies clock setup routines.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
