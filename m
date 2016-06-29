From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 03/10] drm/bridge: analogix_dp: correct the register
 bit define error in ANALOGIX_DP_PLL_REG_1
Date: Wed, 29 Jun 2016 15:11:38 +0800
Message-ID: <577374AA.6080807@rock-chips.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
 <1465904772-848-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vbLFYiE0vdvyznJD=rm5tV2BZazM83shQpC9ThhrEM=XHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:38785 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756AbcF2HLr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 03:11:47 -0400
In-Reply-To: <CAOw6vbLFYiE0vdvyznJD=rm5tV2BZazM83shQpC9ThhrEM=XHA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>, Douglas Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tomasz Figa <tomasz.figa@chromium.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>

Sean,

On 06/23/2016 10:33 PM, Sean Paul wrote:
> On Tue, Jun 14, 2016 at 7:46 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>> There're an register define error in ANALOGIX_DP_PLL_REG_1 which introduced
>> by commit bcec20fd5ad6 ("drm: bridge: analogix/dp: add some rk3288 special
>> registers setting").
>>
>> The PHY PLL input clock source is selected by ANALOGIX_DP_PLL_REG_1
>> BIT 0, not BIT 1.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> Reviewed-by: Tomasz Figa <tomasz.figa@chromium.com>
>> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>

Thanks

>> ---
>> Changes in v3:
>> - Add reviewed flag from Tomasz.
>>      [https://chromium-review.googlesource.com/#/c/346315/15]
>> - Add tested flag from Javier
>>
>> Changes in v2: None
>>
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
>> index 337912b..88d56ad 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
>> @@ -163,8 +163,8 @@
>>   #define HSYNC_POLARITY_CFG                     (0x1 << 0)
>>
>>   /* ANALOGIX_DP_PLL_REG_1 */
>> -#define REF_CLK_24M                            (0x1 << 1)
>> -#define REF_CLK_27M                            (0x0 << 1)
>> +#define REF_CLK_24M                            (0x1 << 0)
>> +#define REF_CLK_27M                            (0x0 << 0)
>>
>>   /* ANALOGIX_DP_LANE_MAP */
>>   #define LANE3_MAP_LOGIC_LANE_0                 (0x0 << 6)
>> --
>> 1.9.1
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
