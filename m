From: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 6/6] hwmon: pwm-fan: Update the duty cycle inorder to
 control the pwm-fan
Date: Sun, 12 Apr 2015 20:59:08 +0530
Message-ID: <CANAwSgQ=oorXVsorpvXAjTnLx3zy5pboRBruhirqy6EN_xjEdg@mail.gmail.com>
References: <1428850452-4178-1-git-send-email-linux.amoon@gmail.com>
	<1428850452-4178-7-git-send-email-linux.amoon@gmail.com>
	<552A8A1C.9000409@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <552A8A1C.9000409-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

hi Guenter,

I am referring to #linux/drivers/pwm/pwm-samsung.c

Will update the comment.

-Anand Moon

On 12 April 2015 at 20:37, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On 04/12/2015 07:54 AM, Anand Moon wrote:
>>
>> In order to disable the PWM we need to update using following sequence.
>>
>>         pwm_config(pwm, 0, period);
>>         pwm_disable(pwm);
>>
>> pwm_config() with a zero duty cycle to make it clear the timer and update
>> the PWM registers.
>> pwm_disable will clear the TCON_AUTORELOAD(tcon_chan) and update the PWM
>> register.
>>
> There is no TCON_AUTORELOAD in this driver. Future developers will have no
> idea
> what you are talking about here. Please provide a generic comment.
>
>> Next change in state will get trigger unless a new PWM cycle happened.
>>
> That sentence is difficult to parse. Actually, I have no idea what it is
> supposed to mean.
>
>>         pwm_config(pwm, duty, period);
>>         pwm_enable(pwm);
>>
>> Through pwm_config we update the duty cycle and period and update the PWM
>> register.
>> pwm_enable will update the state to TCON_MANUALUPDATE(tcon_chan)
>> and TCON_START(tcon_chan) | TCON_AUTORELOAD(tcon_chan) and update the PWM
>> register.
>>
> This sentence does not make sense in the context of the pwm-fan driver.
>
>> Reported-by: Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>
>> Tested-by: Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>
>> Reviewed-by: Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Reviewed-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>> Signed-off-by: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   drivers/hwmon/pwm-fan.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
>> index 7c83dc4..f25c841 100644
>> --- a/drivers/hwmon/pwm-fan.c
>> +++ b/drivers/hwmon/pwm-fan.c
>> @@ -44,26 +44,24 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx,
>> unsigned long pwm)
>>         int ret = 0;
>>
>>         mutex_lock(&ctx->lock);
>> +
>
>
> Please refrain from making unnecessary whitespace changes.
>
> Thanks,
> Guenter
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
