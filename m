From: =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio.lopez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] platform/chrome: Support reading/writing the vboot
 context
Date: Tue, 15 Sep 2015 17:24:50 -0300
Message-ID: <55F87E92.8000609@collabora.co.uk>
References: <1442234049-18637-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1442234049-18637-3-git-send-email-emilio.lopez@collabora.co.uk>
 <CABxcv=m23sfK=jOCswirQRB1SbP70VnomKp6hhwFhRLHiabq4w@mail.gmail.com>
 <55F86E74.9010907@collabora.co.uk>
 <CABxcv=mnCNQPtVBU4tPOWD237_-RojoW+RVLTj+F=3PHbUHfQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABxcv=mnCNQPtVBU4tPOWD237_-RojoW+RVLTj+F=3PHbUHfQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Krzysztof_Koz=c5=82owski?= <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Javier,

On 15/09/15 16:43, Javier Martinez Canillas wrote:
> Hello Emilio,
>
> On Tue, Sep 15, 2015 at 9:16 PM, Emilio L=C3=B3pez
> <emilio.lopez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
>
> [snip]
>
>>>>
>>>>    obj-$(CONFIG_CHROMEOS_LAPTOP)  +=3D chromeos_laptop.o
>>>>    obj-$(CONFIG_CHROMEOS_PSTORE)  +=3D chromeos_pstore.o
>>>> -cros_ec_devs-objs               :=3D cros_ec_dev.o cros_ec_sysfs.=
o
>>>> cros_ec_lightbar.o
>>>> +cros_ec_devs-objs               :=3D cros_ec_dev.o
>>>> +cros_ec_devs-objs               +=3D cros_ec_lightbar.o
>>>> +cros_ec_devs-objs               +=3D cros_ec_sysfs.o
>>>> +cros_ec_devs-objs               +=3D cros_ec_vbc.o
>>>
>>>
>>> Why are you changing the Makefile? AFAIK +=3D is usually used when =
the
>>> compilation is conditional based on a Kconfig symbol but since thes=
e
>>> are build unconditionally, I'll just keep it as foo :=3D bar baz
>>
>>
>> As far as I'm aware, +=3D is append[0]. It's used for stuff like
>> obj-$(CONFIG_CHROMEOS_LAPTOP)  +=3D chromeos_laptop.o
>> because the left part will resolve to "obj-y" or similar, and you wa=
nt to
>> add to it, not replace it. I only changed the Makefile here because =
the line
>> was growing too long, and I thought it looked neater this way; it sh=
ouldn't
>> cause any functional change apart from the intended one.
>>
>> [0] https://www.gnu.org/software/make/manual/html_node/Appending.htm=
l
>>
>
> Yes, I know how Kbuild works. What I tried to say is that you usually
> append based on a Kconfig symbol. In fact even you are mentioning suc=
h
> an example.
> So appending unconditionally like you are doing makes the Makefile
> harder to read IMHO. If the line grows to long you can use a backlash
> (\) char to split the line.

I guess it just boils down to personal preference; I don't feel that=20
strongly about it, I'll change it in v3

(...)
>>>> +       struct device *dev =3D container_of(kobj, struct device, k=
obj);
>>>> +       struct cros_ec_dev *ec =3D container_of(dev, struct cros_e=
c_dev,
>>>> +                                             class_dev);
>>>> +       struct cros_ec_device *ecdev =3D ec->ec_dev;
>>>> +       struct ec_params_vbnvcontext *params;
>>>> +       struct cros_ec_command *msg;
>>>> +       int err;
>>>> +       const size_t para_sz =3D sizeof(struct ec_params_vbnvconte=
xt);
>>>> +       const size_t resp_sz =3D sizeof(struct ec_response_vbnvcon=
text);
>>>> +       const size_t payload =3D max(para_sz, resp_sz);
>>>> +
>>>> +       msg =3D kmalloc(sizeof(*msg) + payload, GFP_KERNEL);
>>>> +       if (!msg)
>>>> +               return -ENOMEM;
>>>> +
>>>> +       params =3D (struct ec_params_vbnvcontext *)msg->data;
>>>> +       params->op =3D EC_VBNV_CONTEXT_OP_READ;
>>>> +
>>>> +       msg->version =3D EC_VER_VBNV_CONTEXT;
>>>> +       msg->command =3D EC_CMD_VBNV_CONTEXT;
>>>> +       msg->outsize =3D sizeof(params->op);
>>>
>>>
>>> Shouldn't this be para_sz ? Since you are sending to the EC the who=
le
>>> struct ec_params_vbnvcontext and not only the op field.
>>>
>>> Or if the EC only expects to get the u32 op field, then I think you=
r
>>> max payload calculation is not correct.
>>
>>
>> The params struct is the same for both read and write ops, so it has=
 the op
>
> That's not true, struct ec_response_vbnvcontext has only the block
> field while struct ec_param_vbnvcontext has both the op and block
> fields.

The former is a response struct, not a params struct.

>> flag and a buffer for the write op. During the read op I believe the=
re's no
>> need to send this potentially-garbage-filled buffer to the EC, so ou=
tsize is
>> set accordingly here.
>
> Yes, I agree with you but then as I mentioned I think your payload
> calculation is wrong since you want instead max(sizeof(struct
> ec_response_vbnvcontext), sizeof(param->op)). Otherwise you are
> allocating 4 bytes more than needed.

Yeah, I can see that. If I do that though, max(...) would be less than=20
the size of the full params struct, and casting data to it could lead t=
o=20
subtle bugs in the future. I can change it and add a comment mentioning=
=20
this, deal?

(...)

> with the needed changes, feel free to add my:
>
> Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Ok, thanks!

Emilio
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
