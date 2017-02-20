From: Zain Wang <wzz@rock-chips.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Don't return -EBUSY when
 msg->size is 0 in aux transaction
Date: Mon, 20 Feb 2017 12:04:25 +0800
Message-ID: <5c1ced2c-f182-ae3c-0edf-eb2ea5042720@rock-chips.com>
References: <1486978066-5351-1-git-send-email-wzz@rock-chips.com>
 <CAAFQd5AaCQNP7M4a58Y03y2uY5vQeRfhm5jkyUgJcyQp9SYB4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAFQd5AaCQNP7M4a58Y03y2uY5vQeRfhm5jkyUgJcyQp9SYB4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tfiga@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

在 2017/2/20 10:40, Tomasz Figa 写道:
> Hi Zain,
>
> On Mon, Feb 13, 2017 at 6:27 PM, zain wang <wzz@rock-chips.com> wrote:
>> The analogix_dp_transfer() will return -EBUSY if num_transferred is zero.
>> But sometimes we will send a bare address packet to start the transaction,
>> like drm_dp_i2c_xfer() show:
>>          ......
>>          /* Send a bare address packet to start the transaction.
>>           * Zero sized messages specify an address only (bare
>>           * address) transaction.
>>           */
>>          msg.buffer = NULL;
>>          msg.size = 0;
>>          err = drm_dp_i2c_do_msg(aux, &msg);
>>          ......
>>
>> In this case, the msg->size is zero, so the num_transferred will be zero too.
>> We can't return -EBUSY here, let's we return num_transferred if num_transferred
>> equals msg->size.
>>
> Please see my question inline.
>
>> Signed-off-by: zain wang <wzz@rock-chips.com>
>> ---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> index 303083a..5384aca 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> @@ -1162,5 +1162,5 @@ ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
>>                   (msg->request & ~DP_AUX_I2C_MOT) == DP_AUX_NATIVE_READ)
>>                  msg->reply = DP_AUX_NATIVE_REPLY_ACK;
>>
>> -       return num_transferred > 0 ? num_transferred : -EBUSY;
>> +       return (num_transferred == msg->size) ? num_transferred : -EBUSY;
> I might be missing something but, looking at the code, I don't see any
> possibility of num_transferred ever being different than msg->size. To
> be honest, it doesn't seem to even make any sense keeping the local
> variable there, because msg->size can be simply always returned, as
> errors are handled by jumping to aux_error label.
Yeah, I agree with you.
The better way to fix this issue is to revert the changes 
https://patchwork.kernel.org/patch/9411711/
(returning num_transferred directly may be better here)

Maybe we can revert the changes above with some new comment.
@Sean, How do you think about Tomasz's comment?

Thanks
Zain
>
> Best regards,
> Tomasz
>
>
>
