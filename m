From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 0/2] MAX77843-extcon: add proper OTG and Dock
 (OTG+MHL) support
Date: Tue, 24 Oct 2017 09:49:33 +0900
Message-ID: <59EE8E1D.2020703@samsung.com>
References: <CGME20171018095630eucas1p1dd88e65e6519a22c6d685ae77f2c41f5@eucas1p1.samsung.com>
        <20171018095622.23738-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20171018095622.23738-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 2017년 10월 18일 18:56, Marek Szyprowski wrote:
> Hi!
> 
> This patchset enables proper detection and support for the following
> micro USB accessories: standard OTG cable (passive) and so called
> SmartDock (a Dock with OTG and MHL features).
> 
> Tested on Exynos5433 TM2 board.
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> Changelog:
> v2:
> - fixed typo in subject (max88743 to max77843)
> - added Chanwoo acks
> 
> v1:
> - initial version
> 
> Marek Szyprowski (2):
>   extcon: max88743: Add OTG power control to the MUIC driver
>   extcon: max88743: Add support for SmartDock accessory
> 
>  drivers/extcon/extcon-max77843.c     | 93 ++++++++++++++++++++++++++++++------
>  include/linux/mfd/max77843-private.h |  5 ++
>  2 files changed, 84 insertions(+), 14 deletions(-)
> 

Applied them. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
