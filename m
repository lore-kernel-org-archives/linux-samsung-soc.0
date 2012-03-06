From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/3] video: s3c-fb: remove 'default_win' element from
 platform data
Date: Tue, 6 Mar 2012 15:40:48 +0530
Message-ID: <CAJuYYwQfUcii39uUh+KPPySvs8zKhYUJ1fG0CVqoNZkKF+8-UQ@mail.gmail.com>
References: <1330789808-8253-1-git-send-email-thomas.abraham@linaro.org>
	<1330789808-8253-3-git-send-email-thomas.abraham@linaro.org>
	<002801ccfb80$aac11cf0$004356d0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:44084 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758813Ab2CFKKv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Mar 2012 05:10:51 -0500
Received: by vbbff1 with SMTP id ff1so4294552vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Mar 2012 02:10:50 -0800 (PST)
In-Reply-To: <002801ccfb80$aac11cf0$004356d0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-fbdev@vger.kernel.org, FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, patches@linaro.org

On 6 March 2012 15:35, Jingoo Han <jg1.han@samsung.com> wrote:

>> -----Original Message-----
>> From: Thomas Abraham [mailto:thomas.abraham@linaro.org]
>> Sent: Sunday, March 04, 2012 12:50 AM
>> To: linux-fbdev@vger.kernel.org
>> Cc: FlorianSchandinat@gmx.de; linux-samsung-soc@vger.kernel.org; kge=
ne.kim@samsung.com;
>> jg1.han@samsung.com; ben-linux@fluff.org; patches@linaro.org
>> Subject: [PATCH 2/3] video: s3c-fb: remove 'default_win' element fro=
m platform data
>>
>> The decision to enable or disable the data output to the lcd panel f=
rom
>> the controller need not be based on the value of 'default_win' eleme=
nt
>> in the platform data. Instead, the data output to the panel is enabl=
ed
>> if any of the windows are active, else data output is disabled.
>>
>> Cc: Ben Dooks <ben-linux@fluff.org>
>> Cc: Jingoo Han <jg1.han@samsung.com>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0arch/arm/plat-samsung/include/plat/fb.h | =A0 =A02 --
>> =A0drivers/video/s3c-fb.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 2=
4 ++++--------------------
>> =A02 files changed, 4 insertions(+), 22 deletions(-)
>>
>> diff --git a/arch/arm/plat-samsung/include/plat/fb.h b/arch/arm/plat=
-samsung/include/plat/fb.h
>> index 39d6bd7..536002f 100644
>> --- a/arch/arm/plat-samsung/include/plat/fb.h
>> +++ b/arch/arm/plat-samsung/include/plat/fb.h
>> @@ -62,8 +62,6 @@ struct s3c_fb_platdata {
>> =A0 =A0 =A0 struct s3c_fb_pd_win =A0 =A0*win[S3C_FB_MAX_WIN];
>> =A0 =A0 =A0 struct fb_videomode =A0 =A0 *vtiming;
>>
>> - =A0 =A0 u32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default_win=
;
>> -
>> =A0 =A0 =A0 u32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0vidcon0;
>> =A0 =A0 =A0 u32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0vidcon1;
>> =A0};
>> diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
>> index 8e05d4d..8baba31 100644
>> --- a/drivers/video/s3c-fb.c
>> +++ b/drivers/video/s3c-fb.c
>> @@ -531,7 +531,7 @@ static int s3c_fb_set_par(struct fb_info *info)
>> =A0 =A0 =A0 /* disable the window whilst we update it */
>> =A0 =A0 =A0 writel(0, regs + WINCON(win_no));
>>
>> - =A0 =A0 if (win_no =3D=3D sfb->pdata->default_win)
>> + =A0 =A0 if (!sfb->output_on)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_fb_enable(sfb, 1);
>>
>> =A0 =A0 =A0 /* write the buffer address */
>> @@ -792,7 +792,7 @@ static int s3c_fb_blank(int blank_mode, struct f=
b_info *info)
>> =A0 =A0 =A0 struct s3c_fb_win *win =3D info->par;
>> =A0 =A0 =A0 struct s3c_fb *sfb =3D win->parent;
>> =A0 =A0 =A0 unsigned int index =3D win->index;
>> - =A0 =A0 u32 wincon;
>> + =A0 =A0 u32 wincon, output_on =3D sfb->output_on;
>
> Can you add new line as below? It's more readable.
> + =A0 =A0 =A0 u32 output_on =3D sfb->output_on;
> Sorry for nitpicking.

Ok. I will add a new line as you have suggested.

>
>>
>> =A0 =A0 =A0 dev_dbg(sfb->dev, "blank mode %d\n", blank_mode);
>>
>> @@ -838,27 +838,11 @@ static int s3c_fb_blank(int blank_mode, struct=
 fb_info *info)
>> =A0 =A0 =A0 =A0* it is highly likely that we also do not need to out=
put
>> =A0 =A0 =A0 =A0* anything.
>> =A0 =A0 =A0 =A0*/
>> -
>> - =A0 =A0 /* We could do something like the following code, but the =
current
>> - =A0 =A0 =A0* system of using framebuffer events means that we cann=
ot make
>> - =A0 =A0 =A0* the distinction between just window 0 being inactive =
and all
>> - =A0 =A0 =A0* the windows being down.
>> - =A0 =A0 =A0*
>> - =A0 =A0 =A0* s3c_fb_enable(sfb, sfb->enabled ? 1 : 0);
>> - =A0 =A0 */
>> -
>> - =A0 =A0 /* we're stuck with this until we can do something about o=
verriding
>> - =A0 =A0 =A0* the power control using the blanking event for a sing=
le fb.
>> - =A0 =A0 =A0*/
>> - =A0 =A0 if (index =3D=3D sfb->pdata->default_win) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 shadow_protect_win(win, 1);
>> - =A0 =A0 =A0 =A0 =A0 =A0 s3c_fb_enable(sfb, blank_mode !=3D FB_BLAN=
K_POWERDOWN ? 1 : 0);
>> - =A0 =A0 =A0 =A0 =A0 =A0 shadow_protect_win(win, 0);
>> - =A0 =A0 }
>> + =A0 =A0 s3c_fb_enable(sfb, sfb->enabled ? 1 : 0);
>
> However, shadow_protect_win() is necessary as belows.
> Because shadow registers such as VIDCON0 should be protectd
> whenever the registers are updated. The s3c_fb_enable() updates
> VIDCON0.
> + =A0 =A0 =A0 shadow_protect_win(win, 1);
> + =A0 =A0 =A0 s3c_fb_enable(sfb, sfb->enabled ? 1 : 0);
> + =A0 =A0 =A0 shadow_protect_win(win, 0);

Right. Thanks for the correction. I will submit updated patch series so=
on.

Regards,
Thomas.
