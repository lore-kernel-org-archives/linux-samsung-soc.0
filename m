From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 09/10] drm/rockchip: analogix_dp: update the comments
 about why need to hardcode VOP output mode
Date: Wed, 29 Jun 2016 14:42:09 +0800
Message-ID: <57736DC1.1090703@rock-chips.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
 <1465904797-1117-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vb+z8JpFd--ZUy7CnURoJmgRnV7Yma1k-QUhbs+xNGuvjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.134]:53253 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328AbcF2GmR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 02:42:17 -0400
In-Reply-To: <CAOw6vb+z8JpFd--ZUy7CnURoJmgRnV7Yma1k-QUhbs+xNGuvjQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>, Douglas Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tomasz Figa <tomasz.figa@chromium.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>

Sean,

On 06/23/2016 10:22 PM, Sean Paul wrote:
> On Tue, Jun 14, 2016 at 7:46 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>> The hardware IC designed that VOP must output the RGB10 video format to
>> eDP contoller, and if eDP panel only support RGB8, then eDP contoller
>> should cut down the video data, not via VOP contoller, that's why we need
>> to hardcode the VOP output mode to RGA10 here.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> Acked-by: Mark Yao <mark.yao@rock-chips.com>
>> Reviewed-by: Tomasz Figa <tomasz.figa@chromium.com>
>> ---
>> Changes in v3:
>> - Add the reviewed flag from Tomasz.
>>      [https://chromium-review.googlesource.com/#/c/346853/12]
>> - Add the acked flag from Mark.
>>
>> Changes in v2:
>> - new patch in v2
>>
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 16 +++++-----------
>>   1 file changed, 5 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index 95a6f60..2ceb3f9 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -173,17 +173,11 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
>>          int ret;
>>
>>          /*
>> -        * FIXME(Yakir): driver should configure the CRTC output video
>> -        * mode with the display information which indicated the monitor
>> -        * support colorimetry.
>> -        *
>> -        * But don't know why the CRTC driver seems could only output the
>> -        * RGBaaa rightly. For example, if connect the "innolux,n116bge"
>> -        * eDP screen, EDID would indicated that screen only accepted the
>> -        * 6bpc mode. But if I configure CRTC to RGB666 output, then eDP
>> -        * screen would show a blue picture (RGB888 show a green picture).
>> -        * But if I configure CTRC to RGBaaa, and eDP driver still keep
>> -        * RGB666 input video mode, then screen would works prefect.
>> +        * The hardware IC designed that VOP must output the RGB10 video
>> +        * format to eDP contoller, and if eDP panel only support RGB8,
>> +        * then eDP contoller should cut down the video data, not via VOP
>> +        * contoller, that's why we need to hardcode the VOP output mode
>> +        * to RGA10 here.
> s/contoller/controller/
>

Done,

>>           */
>>
>>          ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
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
