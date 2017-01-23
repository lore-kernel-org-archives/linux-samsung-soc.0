From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] drm/bridge: analogix dp: Fix runtime PM state on driver
 bind
Date: Mon, 23 Jan 2017 14:28:11 -0300
Message-ID: <79ce3bb1-3049-fc1c-64a9-2d4ef18981a0@osg.samsung.com>
References: <CGME20161230095831eucas1p2c315f7ca20a49e1a7ad421cc68b1101a@eucas1p2.samsung.com>
 <1483091866-1088-1-git-send-email-m.szyprowski@samsung.com>
 <CAOw6vbJLwm8nx5w6oF4LreLYPi8Mqi5f-W9CrAx8B_7DW6xf-w@mail.gmail.com>
 <5552ad97-2043-8690-dcc9-fd7d4701c947@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:59590
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750756AbdAWR2W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 12:28:22 -0500
In-Reply-To: <5552ad97-2043-8690-dcc9-fd7d4701c947@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Yakir Yang <ykk@rock-chips.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>

Hello Archit,

On 01/09/2017 06:47 AM, Archit Taneja wrote:
> 
> 
> On 01/05/2017 01:01 PM, Sean Paul wrote:
>> On Fri, Dec 30, 2016 at 4:57 AM, Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> Analogix_dp_bind() can be called from component framework, which doesn't
>>> guarantee proper runtime PM state of the device during bind operation,
>>> so ensure that device is runtime active before doing any register access.
>>> This ensures that the power domain, to which DP module belongs, is turned
>>> on. While at it, also fix the unbalanced call to phy_power_on() in
>>> analogix_dp_bind() function.
> 
> Pushed to drm-misc-fixes.
>

Do you know when this fix will land in mainline? The regression is still
present in v4.10-rc5:

https://storage.kernelci.org/mainline/v4.10-rc5/arm-exynos_defconfig/lab-collabora/boot-exynos5250-snow.html
 
> Thanks,
> Archit
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
