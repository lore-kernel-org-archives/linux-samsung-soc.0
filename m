From: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-s3c2410: Rework device type handling
Date: Mon, 12 Mar 2012 14:16:31 +0100
Message-ID: <4F5DF72F.4020009@samsung.com>
References: <1331312686-2077-1-git-send-email-k.lewandowsk@samsung.com>
 <1331312686-2077-2-git-send-email-k.lewandowsk@samsung.com>
 <CAJuYYwRDb-NvOzpzWtV8erw8UZeHjBUDUPjm-Cg0GTz6BCCV5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAJuYYwRDb-NvOzpzWtV8erw8UZeHjBUDUPjm-Cg0GTz6BCCV5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 12.03.2012 06:58, Thomas Abraham wrote:

Hi Thomas!

> On 9 March 2012 22:34, Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Reorganize driver a bit to better handle device tree-based systems:
>>
>>  - move machine type to driver's private structure instead of
>>   quering platform device variants in runtime
>>
>>  - replace s3c24xx_i2c_type enum with plain unsigned int that can
>>   hold not only device type but also hw revision-specific quirks
>>
>> Signed-off-by: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/i2c/busses/i2c-s3c2410.c |   56 +++++++++++++------------------------
>>  1 files changed, 20 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
>> index 737f721..5b400c6 100644
>> --- a/drivers/i2c/busses/i2c-s3c2410.c
>> +++ b/drivers/i2c/busses/i2c-s3c2410.c
>> @@ -44,8 +44,12 @@
>>  #include <plat/regs-iic.h>
>>  #include <plat/iic.h>
>>
>> -/* i2c controller state */
>> +/* type */
>> +#define TYPE_BITS              0x000000ff
>> +#define TYPE_S3C2410           0x00000001
>> +#define TYPE_S3C2440           0x00000002
>>
>> +/* i2c controller state */
>>  enum s3c24xx_i2c_state {
>>        STATE_IDLE,
>>        STATE_START,
>> @@ -54,14 +58,10 @@ enum s3c24xx_i2c_state {
>>        STATE_STOP
>>  };
>>
>> -enum s3c24xx_i2c_type {
>> -       TYPE_S3C2410,
>> -       TYPE_S3C2440,
>> -};
>> -
>>  struct s3c24xx_i2c {
>>        spinlock_t              lock;
>>        wait_queue_head_t       wait;
>> +       unsigned int            type;
>>        unsigned int            suspended:1;
>>
>>        struct i2c_msg          *msg;
>> @@ -88,28 +88,6 @@ struct s3c24xx_i2c {
>>  #endif
>>  };
>>
>> -/* default platform data removed, dev should always carry data. */
>> -
>> -/* s3c24xx_i2c_is2440()
>> - *
>> - * return true is this is an s3c2440
>> -*/
>> -
>> -static inline int s3c24xx_i2c_is2440(struct s3c24xx_i2c *i2c)
>> -{
>> -       struct platform_device *pdev = to_platform_device(i2c->dev);
>> -       enum s3c24xx_i2c_type type;
>> -
>> -#ifdef CONFIG_OF
>> -       if (i2c->dev->of_node)
>> -               return of_device_is_compatible(i2c->dev->of_node,
>> -                               "samsung,s3c2440-i2c");
>> -#endif
>> -
>> -       type = platform_get_device_id(pdev)->driver_data;
>> -       return type == TYPE_S3C2440;
>> -}
>> -
>>  /* s3c24xx_i2c_master_complete
>>  *
>>  * complete the message and wake up the caller, using the given return code,
>> @@ -676,7 +654,7 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
>>
>>        writel(iiccon, i2c->regs + S3C2410_IICCON);
>>
>> -       if (s3c24xx_i2c_is2440(i2c)) {
>> +       if (i2c->type & TYPE_S3C2440) {
> 
> This should be changed to
> if (i2c->type == TYPE_S3C2440)


Equality check won't work here after second patch is applied
(i2c->type might have FLAG_*s set on upper bits).

> 
>>                unsigned long sda_delay;
>>
>>                if (pdata->sda_delay) {
>> @@ -847,6 +825,8 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c *i2c)
>>  }
>>
>>  #ifdef CONFIG_OF
>> +static const struct of_device_id s3c24xx_i2c_match[];
>> +
>>  /* s3c24xx_i2c_parse_dt
>>  *
>>  * Parse the device tree node and retreive the platform data.
>> @@ -856,11 +836,16 @@ static void
>>  s3c24xx_i2c_parse_dt(struct device_node *np, struct s3c24xx_i2c *i2c)
>>  {
>>        struct s3c2410_platform_i2c *pdata = i2c->pdata;
>> +       const struct of_device_id *match;
>>
>>        if (!np)
>>                return;
>>
>>        pdata->bus_num = -1; /* i2c bus number is dynamically assigned */
>> +
>> +       match = of_match_node(&s3c24xx_i2c_match[0], np);
> 
> This could be
> match = of_match_node(s3c24xx_i2c_match, np);


If you (and Ben, of course) don't mind I would prefer more verbose but
also more explicit version.

>> +       i2c->type = (unsigned int)match->data;
>> +
> 
> This function (s3c24xx_i2c_parse_dt) is intended to retrieve the data
> from i2c device node. It would be better to not add the determination
> of the i2c type inside this function.
> 
>>        of_property_read_u32(np, "samsung,i2c-sda-delay", &pdata->sda_delay);
>>        of_property_read_u32(np, "samsung,i2c-slave-addr", &pdata->slave_addr);
>>        of_property_read_u32(np, "samsung,i2c-max-bus-freq",
>> @@ -906,9 +891,10 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>>                goto err_noclk;
>>        }
>>
>> -       if (pdata)
>> +       if (pdata) {
>>                memcpy(i2c->pdata, pdata, sizeof(*pdata));
>> -       else
>> +               i2c->type = platform_get_device_id(pdev)->driver_data;
>> +       } else
>>                s3c24xx_i2c_parse_dt(pdev->dev.of_node, i2c);
> 
> It would be better to move the task of retrieving the driver data to a
> separate function. An example of this listed below (copied from the
> samsung uart driver).


Well, I was under impression that #ifdefs inside functions were quite
disliked by kernel devs.  Now I see that these are quite common in kernel..
Thus, I will happily use your suggestion, thanks.

> 
> static inline struct s3c24xx_serial_drv_data *s3c24xx_get_driver_data(
>                         struct platform_device *pdev)
> {
> #ifdef CONFIG_OF
>         if (pdev->dev.of_node) {
>                 const struct of_device_id *match;
>                 match = of_match_node(s3c24xx_uart_dt_match, pdev->dev.of_node);
>                 return (struct s3c24xx_serial_drv_data *)match->data;
>         }
> #endif
>         return (struct s3c24xx_serial_drv_data *)
>                         platform_get_device_id(pdev)->driver_data;
> }
> 
>>
>>        strlcpy(i2c->adap.name, "s3c2410-i2c", sizeof(i2c->adap.name));
>> @@ -1123,13 +1109,11 @@ MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
>>
>>  #ifdef CONFIG_OF
>>  static const struct of_device_id s3c24xx_i2c_match[] = {
>> -       { .compatible = "samsung,s3c2410-i2c" },
>> -       { .compatible = "samsung,s3c2440-i2c" },
>> +       { .compatible = "samsung,s3c2410-i2c", .data = (void *)TYPE_S3C2410 },
>> +       { .compatible = "samsung,s3c2440-i2c", .data = (void *)TYPE_S3C2440 },
>>        {},
>>  };
>>  MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
>> -#else
>> -#define s3c24xx_i2c_match NULL
>>  #endif
>>
>>  static struct platform_driver s3c24xx_i2c_driver = {
>> @@ -1140,7 +1124,7 @@ static struct platform_driver s3c24xx_i2c_driver = {
>>                .owner  = THIS_MODULE,
>>                .name   = "s3c-i2c",
>>                .pm     = S3C24XX_DEV_PM_OPS,
>> -               .of_match_table = s3c24xx_i2c_match,
>> +               .of_match_table = of_match_ptr(s3c24xx_i2c_match),
> 
> Should this change be a separate patch?


Ok, I'll move this part to another patch.

Thanks for review!
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
