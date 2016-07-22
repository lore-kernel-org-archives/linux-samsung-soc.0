From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v1 1/2] drm/panel: simple-panel: add the delay timing for
 Sharp LQ123P1JX31
Date: Fri, 22 Jul 2016 09:00:34 +0800
Message-ID: <57917032.5020101@rock-chips.com>
References: <1469106874-4912-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vbLVrJj9So7tJeDtnDnq_+W=ZunPNwRRidfQKmjaj=byUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOw6vbLVrJj9So7tJeDtnDnq_+W=ZunPNwRRidfQKmjaj=byUw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Sean,

On 07/21/2016 10:30 PM, Sean Paul wrote:
> On Thu, Jul 21, 2016 at 9:14 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>> According to page 16 of Sharp LQ123P1JX31 datasheet, we need to add the
>> missing delay timing. Panel prepare time should be t1 (0.5ms~10ms) plus
>> t3 (0ms~100ms), and panel enable time should equal to t7 (0ms~50ms), and
>> panel unprepare time should be t11 (1ms~50ms) plus t12 (500ms~).
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>

Thanks  :-D

- Yakir

>> ---
>>   drivers/gpu/drm/panel/panel-simple.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>> index 85143d1..f178998 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -1384,6 +1384,11 @@ static const struct panel_desc sharp_lq123p1jx31 = {
>>                  .width = 259,
>>                  .height = 173,
>>          },
>> +       .delay = {
>> +               .prepare = 110,
>> +               .enable = 50,
>> +               .unprepare = 550,
>> +       },
>>   };
>>
>>   static const struct drm_display_mode shelly_sca07010_bfn_lnn_mode = {
>> --
>> 1.9.1
>>
>>
>
>
