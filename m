From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4.1 1/2] drm/rockchip: analogix_dp: introduce the pclk
 for grf
Date: Wed, 29 Jun 2016 11:35:15 +0800
Message-ID: <577341F3.5000803@rock-chips.com>
References: <1466562678-11094-1-git-send-email-ykk@rock-chips.com>
 <1466647087-22207-1-git-send-email-ykk@rock-chips.com>
 <CAD=FV=X-2hu4j13tFh1tog60aEbOaBekCk+QVvDSp0tmr5HE1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:45712 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752548AbcF2Df1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Jun 2016 23:35:27 -0400
In-Reply-To: <CAD=FV=X-2hu4j13tFh1tog60aEbOaBekCk+QVvDSp0tmr5HE1g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>

Doug,

On 06/23/2016 01:16 PM, Doug Anderson wrote:
> Yakir,
>
> On Wed, Jun 22, 2016 at 6:58 PM, Yakir Yang <ykk@rock-chips.com> wrote:
>> For RK3399's GRF module, if we want to operate the graphic related grf
>> registers, we need to enable the pclk_vio_grf which supply power for VIO
>> GRF IOs, so it's better to introduce an optional grf clock in driver.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>> Hi all,
>>
>> This is an external patch for analogix_dp misc cleanup thread [0]
>> [0]: https://patchwork.kernel.org/patch/9175613/
>>
>> BR,
>> - Yakir
>>
>> Changes in v4.1:
>> - Fix compiled error, sorry.
>>    "dp->cgfclk"  -->  'dp->grfclk'
>>
>> Changes in v4:
>> - Check the the error code properly, 'EPROBE_DEFER' should be returned,
>>    'ENOENT' should assign a NULL point to grfclk, other errors should be
>>    regarded as failed. (Tomasz, Doug, reviewed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/351821/20/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c@249]
>> - Add the document about optional 'grf' clock (Tomasz, Doug, reviewed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/351821/]
>>
>> Changes in v3:
>> - Add this patch in v3
>>
>>   .../display/rockchip/analogix_dp-rockchip.txt      |  6 ++++++
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 23 +++++++++++++++++++---
>>   2 files changed, 26 insertions(+), 3 deletions(-)
> I probably would have split into two patches so the bindings was its
> own patch, but I don't think it's strictly required.
>
> In any case, this seems good to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
This is not big change, so collect them into one patch should be more 
cleaner, thanks for your reviewed ;)
>
