From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: samsung: resume race fix
Date: Mon, 7 Jan 2013 17:35:25 +0530
Message-ID: <CAHfPSqCQ9e3VR3En+hQGWVOt0RRGsmHzHTFvBF+h2-rEX5oXhQ@mail.gmail.com>
References: <1352284106-24988-1-git-send-email-ch.naveen@samsung.com> <20121107114437.0a563c7e@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121107114437.0a563c7e-R0o5gVi9kd7kN2dkZ6Wm7A@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 7 November 2012 16:14, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org> wrote:
> On Wed, 07 Nov 2012 15:58:26 +0530, Naveen Krishna Chatradhi wrote:
>> Don't unmark the device as suspended until after it's been re-setup.
>>
>> The main race would be w.r.t. an i2c driver that gets resumed at the same
>> time (asyncronously), that is allowed to do a transfer since suspended
>> is set to 0 before reinit, but really should have seen the -EIO return
>> instead.
>
> I thought that the suspend order was children first and the resume
> order was parent first?
>
> If this can really happen then I am afraid this is an issue for more
> than just i2c-s3c2410. The proposed solution is also not really
> satisfactory, as the i2c client will certainly still fail to resume
> properly (the only improvement is that now the failure is no longer
> silent.)
>
>>
>> Signed-off-by: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/i2c/busses/i2c-s3c2410.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
>> index 3e0335f..dbaf920 100644
>> --- a/drivers/i2c/busses/i2c-s3c2410.c
>> +++ b/drivers/i2c/busses/i2c-s3c2410.c
>> @@ -1134,10 +1134,10 @@ static int s3c24xx_i2c_resume(struct device *dev)
>>       struct platform_device *pdev = to_platform_device(dev);
>>       struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
>>
>> -     i2c->suspended = 0;
>>       clk_prepare_enable(i2c->clk);
>>       s3c24xx_i2c_init(i2c);
>>       clk_disable_unprepare(i2c->clk);
>> +     i2c->suspended = 0;
>>
>>       return 0;
>>  }
>
> Acked-by: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>
I don't see this patch landed any where in linux-i2c tree, Though it was acked.
Was it missed or should i be doing something for this to be merged ??
>
> (Not perfect but still better than before.)
>
> --
> Jean Delvare



-- 
Shine bright,
(: Nav :)
