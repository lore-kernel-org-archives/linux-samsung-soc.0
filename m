From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v2 2/2] drm/exynos: remove unused 'activated' field from
 =?UTF-8?Q?exynos=5Fdrm=5Fplane?=
Date: Fri, 17 Apr 2015 10:04:15 +0200
Message-ID: <456f092fcd8f60331518a44fe898b0eb@math.uni-bielefeld.de>
References: <1429127692-5772-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1429127692-5772-3-git-send-email-tjakobi@math.uni-bielefeld.de>
 <5530A896.2020208@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59457 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752647AbbDQIET (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Apr 2015 04:04:19 -0400
In-Reply-To: <5530A896.2020208@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hello Joonyoung,

On 2015-04-17 08:30, Joonyoung Shim wrote:
> Hi Tobias,
> 
> On 04/16/2015 04:54 AM, Tobias Jakobi wrote:
>> No component of Exynos DRM uses this field. Perhaps it was
>> once meant to provide more fine-grained information in
>> addition to the status stored in the 'enabled' field.
>> 
>> Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h | 2 --
>>  1 file changed, 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h 
>> b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> index 6a849cf..4c14a89 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> @@ -77,7 +77,6 @@ extern void exynos4412_qos(u8 tm, u8 ac);
>>   * @color_key: color key on or off.
>>   * @local_path: in case of lcd type, local path mode on or off.
>>   * @transparency: transparency on or off.
>> - * @activated: activated or not.
>>   * @enabled: enabled or not.
>>   * @resume: to resume or not.
>>   *
>> @@ -112,7 +111,6 @@ struct exynos_drm_plane {
>>  	bool color_key:1;
>>  	bool local_path:1;
>>  	bool transparency:1;
>> -	bool activated:1;
>>  	bool enabled:1;
>>  	bool resume:1;
>>  };
>> 
> 
> The following fields also are unused in exynos drm driver,
> - default win, color_key, local_path, transparency
Yeah, looks like it. I just stumbled upon 'activated' because I was 
wondering what the difference between 'enabled' and 'activated' was. 
Grepping than revealed that nothing was using that field. I didn't check 
any other fields.

Also I just noticed that due to how git formats the patches, this one 
doesn't apply to any of Inki's branches (due to the 'extern void 
exynos4412_qos(u8 tm, u8 ac);' line).

Should I respin this, and if yes, should I also drop the other fields 
mentioned? Question is more directed to Gustavo, since he's cleaning 
'exynos_drm_plane' anyway.


> Inki, how about remove unused fields?
> 
> Thanks.


With best wishes,
Tobias
