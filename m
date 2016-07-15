From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable bus frequency scaling with
 DEVFREQ/DEVFREQ-Event
Date: Fri, 15 Jul 2016 07:43:30 -0400
Message-ID: <06e7eb98-fc61-df71-d387-6fa105957bb9@osg.samsung.com>
References: <1468546426-4482-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468546426-4482-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, linux@armlinux.org.uk, kgene@kernel.org, k.kozlowski@samsung.com
Cc: linux.amoon@gmail.com, treding@nvidia.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Chanwoo,

On 07/14/2016 09:33 PM, Chanwoo Choi wrote:
> This patch enables the bus frequency scaling driver with DEVFREQ and
> DEVFREQ-Event framework. This patches already was merged for Odroid-U3/XU3
> ,Trats2 and Rinato/Monk boards.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---

The patch makes sense to me. Should we do the same for multi_v7_defconfig?

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
