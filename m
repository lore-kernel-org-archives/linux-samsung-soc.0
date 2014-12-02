From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource: exynos_mct: fix exynos4_mct_write
Date: Tue, 02 Dec 2014 16:21:17 +0100
Message-ID: <547DD8ED.6050403@linaro.org>
References: <1413941828-5547-1-git-send-email-tjakobi@math.uni-bielefeld.de> <025001d00c22$77a6b5e0$66f421a0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:50761 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752533AbaLBPVV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Dec 2014 10:21:21 -0500
Received: by mail-wi0-f169.google.com with SMTP id r20so30416231wiv.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Dec 2014 07:21:20 -0800 (PST)
In-Reply-To: <025001d00c22$77a6b5e0$66f421a0$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, 'Tobias Jakobi' <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com
Cc: dianders@chromium.org

On 11/29/2014 11:18 PM, Kukjin Kim wrote:
> Tobias Jakobi wrote:
>>
>> EXYNOS4_MCT_L_MASK is defined as 0xffffff00, so applying this bitmas=
k
>> produces a number outside the range 0x00 to 0xff, which always resul=
ts
>> in execution of the default switch statement.
>>
>> Obviously this is wrong and git history shows that the bitmask inver=
sion
>> was incorrectly set during a refactoring of the MCT code.
>>
>> Fix this by putting the inversion at the correct position again.
>>
>> Reported-by: GP Orcullo <kinsamanka@gmail.com>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>
> + Daniel, Thomas,
>
> adding Doug's review tag from previous his reply.
>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
>
> And
>
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>
> Daniel,
>
> Since this is obvious fix, can you please pick into your tree?
> If any problem, please kindly let me know.

Hi Kukjin,

the patch is my tree for a 3.18 fix.

Added the stable@ also in the Cc list.

Thanks
  -- Daniel

>> ---
>>   drivers/clocksource/exynos_mct.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/=
exynos_mct.c
>> index 9403061..83564c9 100644
>> --- a/drivers/clocksource/exynos_mct.c
>> +++ b/drivers/clocksource/exynos_mct.c
>> @@ -97,8 +97,8 @@ static void exynos4_mct_write(unsigned int value, =
unsigned long offset)
>>   	writel_relaxed(value, reg_base + offset);
>>
>>   	if (likely(offset >=3D EXYNOS4_MCT_L_BASE(0))) {
>> -		stat_addr =3D (offset & ~EXYNOS4_MCT_L_MASK) + MCT_L_WSTAT_OFFSET=
;
>> -		switch (offset & EXYNOS4_MCT_L_MASK) {
>> +		stat_addr =3D (offset & EXYNOS4_MCT_L_MASK) + MCT_L_WSTAT_OFFSET;
>> +		switch (offset & ~EXYNOS4_MCT_L_MASK) {
>>   		case MCT_L_TCON_OFFSET:
>>   			mask =3D 1 << 3;		/* L_TCON write status */
>>   			break;
>> --
>> 2.0.4
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
