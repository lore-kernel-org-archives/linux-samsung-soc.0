From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-s3c2410: Rework device type handling
Date: Mon, 12 Mar 2012 19:51:53 +0530
Message-ID: <CAJuYYwRHOD6KS17oVkA4-Qpv=+5Q=onZDsDe+uhaxy2b2G94nw@mail.gmail.com>
References: <1331312686-2077-1-git-send-email-k.lewandowsk@samsung.com>
	<1331312686-2077-2-git-send-email-k.lewandowsk@samsung.com>
	<CAJuYYwRDb-NvOzpzWtV8erw8UZeHjBUDUPjm-Cg0GTz6BCCV5w@mail.gmail.com>
	<4F5DF72F.4020009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F5DF72F.4020009-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 12 March 2012 18:46, Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wr=
ote:
> On 12.03.2012 06:58, Thomas Abraham wrote:
>
> Hi Thomas!
>
>> On 9 March 2012 22:34, Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> =
wrote:
>>> Reorganize driver a bit to better handle device tree-based systems:
>>>
>>> =A0- move machine type to driver's private structure instead of
>>> =A0 quering platform device variants in runtime
>>>
>>> =A0- replace s3c24xx_i2c_type enum with plain unsigned int that can
>>> =A0 hold not only device type but also hw revision-specific quirks
>>>
>>> Signed-off-by: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>> =A0drivers/i2c/busses/i2c-s3c2410.c | =A0 56 +++++++++++++---------=
---------------
>>> =A01 files changed, 20 insertions(+), 36 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/=
i2c-s3c2410.c
>>> index 737f721..5b400c6 100644
>>> --- a/drivers/i2c/busses/i2c-s3c2410.c
>>> +++ b/drivers/i2c/busses/i2c-s3c2410.c
>>> @@ -44,8 +44,12 @@
>>> =A0#include <plat/regs-iic.h>
>>> =A0#include <plat/iic.h>
>>>
>>> -/* i2c controller state */
>>> +/* type */
>>> +#define TYPE_BITS =A0 =A0 =A0 =A0 =A0 =A0 =A00x000000ff
>>> +#define TYPE_S3C2410 =A0 =A0 =A0 =A0 =A0 0x00000001
>>> +#define TYPE_S3C2440 =A0 =A0 =A0 =A0 =A0 0x00000002
>>>
>>> +/* i2c controller state */
>>> =A0enum s3c24xx_i2c_state {
>>> =A0 =A0 =A0 =A0STATE_IDLE,
>>> =A0 =A0 =A0 =A0STATE_START,
>>> @@ -54,14 +58,10 @@ enum s3c24xx_i2c_state {
>>> =A0 =A0 =A0 =A0STATE_STOP
>>> =A0};
>>>
>>> -enum s3c24xx_i2c_type {
>>> - =A0 =A0 =A0 TYPE_S3C2410,
>>> - =A0 =A0 =A0 TYPE_S3C2440,
>>> -};
>>> -
>>> =A0struct s3c24xx_i2c {
>>> =A0 =A0 =A0 =A0spinlock_t =A0 =A0 =A0 =A0 =A0 =A0 =A0lock;
>>> =A0 =A0 =A0 =A0wait_queue_head_t =A0 =A0 =A0 wait;
>>> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0type;
>>> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0suspended:1;
>>>
>>> =A0 =A0 =A0 =A0struct i2c_msg =A0 =A0 =A0 =A0 =A0*msg;
>>> @@ -88,28 +88,6 @@ struct s3c24xx_i2c {
>>> =A0#endif
>>> =A0};
>>>
>>> -/* default platform data removed, dev should always carry data. */
>>> -
>>> -/* s3c24xx_i2c_is2440()
>>> - *
>>> - * return true is this is an s3c2440
>>> -*/
>>> -
>>> -static inline int s3c24xx_i2c_is2440(struct s3c24xx_i2c *i2c)
>>> -{
>>> - =A0 =A0 =A0 struct platform_device *pdev =3D to_platform_device(i=
2c->dev);
>>> - =A0 =A0 =A0 enum s3c24xx_i2c_type type;
>>> -
>>> -#ifdef CONFIG_OF
>>> - =A0 =A0 =A0 if (i2c->dev->of_node)
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return of_device_is_compatible(i2c->d=
ev->of_node,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "sams=
ung,s3c2440-i2c");
>>> -#endif
>>> -
>>> - =A0 =A0 =A0 type =3D platform_get_device_id(pdev)->driver_data;
>>> - =A0 =A0 =A0 return type =3D=3D TYPE_S3C2440;
>>> -}
>>> -
>>> =A0/* s3c24xx_i2c_master_complete
>>> =A0*
>>> =A0* complete the message and wake up the caller, using the given r=
eturn code,
>>> @@ -676,7 +654,7 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx=
_i2c *i2c, unsigned int *got)
>>>
>>> =A0 =A0 =A0 =A0writel(iiccon, i2c->regs + S3C2410_IICCON);
>>>
>>> - =A0 =A0 =A0 if (s3c24xx_i2c_is2440(i2c)) {
>>> + =A0 =A0 =A0 if (i2c->type & TYPE_S3C2440) {
>>
>> This should be changed to
>> if (i2c->type =3D=3D TYPE_S3C2440)
>
>
> Equality check won't work here after second patch is applied
> (i2c->type might have FLAG_*s set on upper bits).
>

Right. I assumed that if a another type is added, its value will be 3.
But looks like you intend to assign 4, 8, 16 and so on for the new
types. Probably, this approach needs to documented in this file.
Otherwise, the above check would not work if ever a new type is added
without knowing this approach.

>>
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long sda_delay;
>>>
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pdata->sda_delay) {
>>> @@ -847,6 +825,8 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c =
*i2c)
>>> =A0}
>>>
>>> =A0#ifdef CONFIG_OF
>>> +static const struct of_device_id s3c24xx_i2c_match[];
>>> +
>>> =A0/* s3c24xx_i2c_parse_dt
>>> =A0*
>>> =A0* Parse the device tree node and retreive the platform data.
>>> @@ -856,11 +836,16 @@ static void
>>> =A0s3c24xx_i2c_parse_dt(struct device_node *np, struct s3c24xx_i2c =
*i2c)
>>> =A0{
>>> =A0 =A0 =A0 =A0struct s3c2410_platform_i2c *pdata =3D i2c->pdata;
>>> + =A0 =A0 =A0 const struct of_device_id *match;
>>>
>>> =A0 =A0 =A0 =A0if (!np)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>>>
>>> =A0 =A0 =A0 =A0pdata->bus_num =3D -1; /* i2c bus number is dynamica=
lly assigned */
>>> +
>>> + =A0 =A0 =A0 match =3D of_match_node(&s3c24xx_i2c_match[0], np);
>>
>> This could be
>> match =3D of_match_node(s3c24xx_i2c_match, np);
>
>
> If you (and Ben, of course) don't mind I would prefer more verbose bu=
t
> also more explicit version.
>

I am fine the explicit version.

>>> + =A0 =A0 =A0 i2c->type =3D (unsigned int)match->data;
>>> +
>>
>> This function (s3c24xx_i2c_parse_dt) is intended to retrieve the dat=
a
>> from i2c device node. It would be better to not add the determinatio=
n
>> of the i2c type inside this function.
>>
>>> =A0 =A0 =A0 =A0of_property_read_u32(np, "samsung,i2c-sda-delay", &p=
data->sda_delay);
>>> =A0 =A0 =A0 =A0of_property_read_u32(np, "samsung,i2c-slave-addr", &=
pdata->slave_addr);
>>> =A0 =A0 =A0 =A0of_property_read_u32(np, "samsung,i2c-max-bus-freq",
>>> @@ -906,9 +891,10 @@ static int s3c24xx_i2c_probe(struct platform_d=
evice *pdev)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_noclk;
>>> =A0 =A0 =A0 =A0}
>>>
>>> - =A0 =A0 =A0 if (pdata)
>>> + =A0 =A0 =A0 if (pdata) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy(i2c->pdata, pdata, sizeof(*pd=
ata));
>>> - =A0 =A0 =A0 else
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->type =3D platform_get_device_id(=
pdev)->driver_data;
>>> + =A0 =A0 =A0 } else
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c24xx_i2c_parse_dt(pdev->dev.of_no=
de, i2c);
>>
>> It would be better to move the task of retrieving the driver data to=
 a
>> separate function. An example of this listed below (copied from the
>> samsung uart driver).
>
>
> Well, I was under impression that #ifdefs inside functions were quite
> disliked by kernel devs. =A0Now I see that these are quite common in =
kernel..
> Thus, I will happily use your suggestion, thanks.
>

It would be a bad idea to use #ifdef that would deviate from the
objective of single kernel binary image. But in the example below, the
#ifdef is used solely to exclude the OF related code if the kernel
being built do not have OF support included. The check on
pdev->dev.of_node is the one that ensures that there is runtime
compatibility with both dt and non-dt. So the #ifdef does not
necessitate separate kernel to be built for dt and non-dt case.

>>
>> static inline struct s3c24xx_serial_drv_data *s3c24xx_get_driver_dat=
a(
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct platform_devi=
ce *pdev)
>> {
>> #ifdef CONFIG_OF
>> =A0 =A0 =A0 =A0 if (pdev->dev.of_node) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct of_device_id *match;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 match =3D of_match_node(s3c24xx_uart=
_dt_match, pdev->dev.of_node);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return (struct s3c24xx_serial_drv_da=
ta *)match->data;
>> =A0 =A0 =A0 =A0 }
>> #endif
>> =A0 =A0 =A0 =A0 return (struct s3c24xx_serial_drv_data *)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 platform_get_device_=
id(pdev)->driver_data;
>> }
>>
>>>
>>> =A0 =A0 =A0 =A0strlcpy(i2c->adap.name, "s3c2410-i2c", sizeof(i2c->a=
dap.name));
>>> @@ -1123,13 +1109,11 @@ MODULE_DEVICE_TABLE(platform, s3c24xx_drive=
r_ids);
>>>
>>> =A0#ifdef CONFIG_OF
>>> =A0static const struct of_device_id s3c24xx_i2c_match[] =3D {
>>> - =A0 =A0 =A0 { .compatible =3D "samsung,s3c2410-i2c" },
>>> - =A0 =A0 =A0 { .compatible =3D "samsung,s3c2440-i2c" },
>>> + =A0 =A0 =A0 { .compatible =3D "samsung,s3c2410-i2c", .data =3D (v=
oid *)TYPE_S3C2410 },
>>> + =A0 =A0 =A0 { .compatible =3D "samsung,s3c2440-i2c", .data =3D (v=
oid *)TYPE_S3C2440 },
>>> =A0 =A0 =A0 =A0{},
>>> =A0};
>>> =A0MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
>>> -#else
>>> -#define s3c24xx_i2c_match NULL
>>> =A0#endif
>>>
>>> =A0static struct platform_driver s3c24xx_i2c_driver =3D {
>>> @@ -1140,7 +1124,7 @@ static struct platform_driver s3c24xx_i2c_dri=
ver =3D {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-i2c",
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pm =A0 =A0 =3D S3C24XX_DEV_PM_OPS,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D s3c24xx_i2c_match=
,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D of_match_ptr(s3c2=
4xx_i2c_match),
>>
>> Should this change be a separate patch?
>
>
> Ok, I'll move this part to another patch.
>
> Thanks for review!
> --
> Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
