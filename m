From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: analogix_dp: rockchip: correct the
 wrong compatible name
Date: Wed, 29 Jun 2016 11:32:52 +0800
Message-ID: <57734164.6000908@rock-chips.com>
References: <1466562678-11094-1-git-send-email-ykk@rock-chips.com>
 <1466646424-10583-1-git-send-email-ykk@rock-chips.com>
 <CAD=FV=UfbAUbDJfox4zMZSHyQ6uxhG2=n_Z=8WdCKGKvW+ehTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:58035 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752495AbcF2DdJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Jun 2016 23:33:09 -0400
In-Reply-To: <CAD=FV=UfbAUbDJfox4zMZSHyQ6uxhG2=n_Z=8WdCKGKvW+ehTQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>

Doug,

On 06/23/2016 01:17 PM, Doug Anderson wrote:
> Hi,
>
> On Wed, Jun 22, 2016 at 6:47 PM, Yakir Yang <ykk@rock-chips.com> wrote:
>> The document about rockchip platform make a mistaken in available
>> compatible name of "rk3288-edp", we should correct it to "rk3288-dp"
>> which correspond to the compatible name in driver.
>>
>> This mistaken was introduced in commit be91c36247089 ("dt-bindings:
>> add document for rockchip variant of analogix_dp").
>>
>> Reported-by: Tomasz Figa <tfiga@chromium.com>
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
>> Changes in v4: None
>> Changes in v3:
>> - Add this patch in v3
>>
>>   .../devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt       | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
Thanks ;)
>
>
