From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RESEND PATCH 4/8] mfd: cros_ec: Use a zero-length array for
 command data
Date: Tue, 05 May 2015 17:57:18 +0200
Message-ID: <5548E85E.6040103@collabora.co.uk>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk> <1428336906-14906-5-git-send-email-javier.martinez@collabora.co.uk> <CAMHSBOWR2iDgnZ8WSKZW0LyL9zAXnWuU0x_avh_3gM02vMqReQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMHSBOWR2iDgnZ8WSKZW0LyL9zAXnWuU0x_avh_3gM02vMqReQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gwendal Grignou <gwendal@chromium.org>
Cc: Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Gwendal,

On 04/24/2015 10:29 PM, Gwendal Grignou wrote:
> On Mon, Apr 6, 2015 at 9:15 AM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:

[snip]

>>
>> @@ -110,17 +115,25 @@ static ssize_t ec_device_read(struct file *filp, char __user *buffer,
>>  static long ec_device_ioctl_xcmd(struct cros_ec_device *ec, void __user *arg)
>>  {
>>         long ret;
>> -       struct cros_ec_command s_cmd = { };
>> +       int len;
>> +       struct cros_ec_command *u_cmd = arg;
>> +       struct cros_ec_command *s_cmd;
>> +
>> +       len = max(u_cmd->outsize, u_cmd->insize);
> It does not work, u_cmd is not accessible yet. You should do:
> struct cros_ec_command u_cmd;
> if (copy_from_user(&u_cmd, arg, sizeof(u_cmd)))
>   return -EFAULT;
> len = max(u_cmd.outsize, u_cmd.insize);
> 
>

Right, I'll change that.
 
>> +
>> +       s_cmd = kzalloc(sizeof(*s_cmd) + len, GFP_KERNEL);
>> +       if (!s_cmd)
>> +               return -ENOMEM;
>>
>> -       if (copy_from_user(&s_cmd, arg, sizeof(s_cmd)))
>> +       if (copy_from_user(s_cmd, arg, sizeof(*s_cmd) + len))
> sizeof(*s_cmd) + u_cmd.outsize is good enough.

Ok.

>>                 return -EFAULT;
>>
>> -       ret = cros_ec_cmd_xfer(ec, &s_cmd);
>> +       ret = cros_ec_cmd_xfer(ec, s_cmd);
>>         /* Only copy data to userland if data was received. */
>>         if (ret < 0)
>>                 return ret;
>>
>> -       if (copy_to_user(arg, &s_cmd, sizeof(s_cmd)))
>> +       if (copy_to_user(arg, s_cmd, sizeof(*s_cmd) + len))
> sizeof(*s_cmd) + min(ret, u_cmd.insize) is safer

Sure.

>>                 return -EFAULT;
>>
>>         return 0;
> I missed this one earlier. Tools expect the number of byte read, so it should be
> return ret;
> 

Ok, I'll change that as well.

Thanks a lot for your feedback!

Best regards,
Javier
