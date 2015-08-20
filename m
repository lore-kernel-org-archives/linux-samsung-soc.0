From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 12/14] drm: bridge/analogix_dp: expand the delay time
 for hpd detect
Date: Thu, 20 Aug 2015 03:02:27 -0500
Message-ID: <55D58993.4060502@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com> <1439995929-18719-1-git-send-email-ykk@rock-chips.com> <A474A3AB-86A8-4967-B90F-31920A5E7BA3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.140]:35482 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750981AbbHTICu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 04:02:50 -0400
In-Reply-To: <A474A3AB-86A8-4967-B90F-31920A5E7BA3@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jingoohan1@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, "joe@perches.com" <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "djkurtz@google.com" <djkurtz@google.com>, "dianders@google.com" <dianders@google.com>, "seanpaul@google.com" <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, "ajaynumb@gmail.com" <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel

Hi Jingoo,

On 08/20/2015 01:11 AM, Jingoo Han wrote:
> On 2015. 8. 19., at PM 11:52, Yakir Yang <ykk@rock-chips.com> wrote:
>> Some edp screen with no hpd signal would need some delay time
>> to ensure that screen would be ready for work, so we can expand
>> the delay time in hpd detect function, it works prefectly on my
>> rk3288 sdk board.
> Then, this delay has a dependency on the "rk3288 sdk" board.
> Also, if the delay time is expanded, the booting time of some Exybos boards will be increased unnecessarily. :-(
>
> So, please add new DT property such as 'hpd-delay' that can be added to board DT files.
>
> If there is not that DT property in DT files, the default value '10' will written to a variable such as 'unsigned int hpd_delay'.
> If there is the DT property in DT files, the delay value will written to the variable when parsing DT values
> and will be used in analogix_dp_detect_hpd().
>
> What I want to say is that there should not be harmful effect on the existing Exynos boards, due to unrelated reasons.

Yeah, you are right, I made an mistake here.

And I want to put this delay to "need-force-hpd" code, cause
this property is for the no-hpd-signal eDP screen.

But strangely, with my this series, I don't need the expand delay
any more, I am not sure which change improved this, I guess
those delay time should come from drm core ?

Whatever seems we don't need this delay for now, and if I can
find the exact reason and realize I still need this delay, I prefer
to add those delay in "need-force-hpd" code.

Thanks,
- Yakir
> Best regards,
> Jingoo Han
>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>> Changes in v3: None
>> Changes in v2: None
>>
>> drivers/gpu/drm/bridge/analogix_dp_core.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix_dp_core.c
>> index 99870f7..75dd44a 100644
>> --- a/drivers/gpu/drm/bridge/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix_dp_core.c
>> @@ -68,7 +68,7 @@ static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
>>             return 0;
>>
>>         timeout_loop++;
>> -        usleep_range(10, 11);
>> +        usleep_range(100, 110);
>>     }
>>
>>     /*
>> -- 
>> 1.9.1
>>
>>
>
>
