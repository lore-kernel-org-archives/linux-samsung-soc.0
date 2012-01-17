From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] video: s3c-fb: Add device tree support
Date: Tue, 17 Jan 2012 10:44:26 +0530
Message-ID: <CAJuYYwSt7KM0_DiChsDmy9aD9s6Q48FqcM6gD1otXBYfk67m+g@mail.gmail.com>
References: <1326139307-25112-1-git-send-email-thomas.abraham@linaro.org>
	<4F109C04.5090600@gmail.com>
	<4F10A267.2020608@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:46238 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751324Ab2AQFO1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jan 2012 00:14:27 -0500
In-Reply-To: <4F10A267.2020608@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-fbdev@vger.kernel.org, FlorianSchandinat@gmx.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jg1.han@samsung.com, patches@linaro.org

Hi Sylwester,

On 14 January 2012 03:00, Sylwester Nawrocki <snjw23@gmail.com> wrote:
> On 01/13/2012 10:03 PM, Sylwester Nawrocki wrote:
>> On 01/09/2012 09:01 PM, Thomas Abraham wrote:
>>>
>>> + =A0 =A0for (idx =3D 0; idx< =A0 nr_gpios; idx++) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0gpio =3D of_get_gpio(dev->of_node, idx);
>>> + =A0 =A0 =A0 =A0 =A0 =A0if (!gpio_is_valid(gpio)) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "invalid gpio=
[%d]: %d\n", idx, gpio);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
>>> + =A0 =A0 =A0 =A0 =A0 =A0}
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0if (!request)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0ret =3D gpio_request(gpio, "fimd");
>>
>> Is it how it normally is supposed to be done, i.e. configuring a gpi=
o
>> _before_ it has been requested ? of_get_gpio() indirectly touches th=
e
>> gpio controller and gpio_request() doesn't seem to serve its purpose
>> in this case, i.e. if there is situation like:
>>
>> driver A =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0driver B
>>
>> of_get_gpio(nodeA, gpioA);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0o=
f_get_gpio(nodeB, gpioA);
>> gpio_request(gpioA);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0g=
pio_request(gpioB);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 s/B/A
>>
>> driver B will end up with configuration of gpioA from nodeA, not fro=
m
>> nodeB.
>
> ugh, I put it wrong, it should instead read:
>
> "driver A will end up with configuration of gpioA from nodeB, not fro=
m
> nodeA."
>
>> As there are few drivers doing that I must be missing something,
>> not sure what..
>> I realize the GPIO number needs to be known in order for a GPIO to b=
e
>> requested. Shouldn't of_get_gpio() be extended to allow locking gpio
>> controller's module and marking a GPIO as requested in advance ?
>>
>>> + =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "gpio [%d] re=
quest failed\n", gpio);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto gpio_free;
>>> + =A0 =A0 =A0 =A0 =A0 =A0}
>>> + =A0 =A0 =A0 =A0 =A0 =A0sfb->gpios[idx] =3D gpio;
>>> + =A0 =A0}
>>> + =A0 =A0return 0;
>>> +
>>> +gpio_free:
>>> + =A0 =A0while (--idx>=3D 0)
>>> + =A0 =A0 =A0 =A0 =A0 =A0gpio_free(sfb->gpios[idx]);
>>> + =A0 =A0return ret;
>>> +}
>>> +
>>> +static void s3c_fb_dt_free_gpios(struct s3c_fb *sfb)
>>> +{
>>> + =A0 =A0unsigned int idx, nr_gpio;
>>> +
>>> + =A0 =A0nr_gpio =3D sfb->pdata->win[0]->max_bpp + 4;
>>> + =A0 =A0for (idx =3D 0; idx< =A0 nr_gpio; idx++)
>>> + =A0 =A0 =A0 =A0 =A0 =A0gpio_free(sfb->gpios[idx]);
>>> +}
>

Yes, I agree that there is a problem here. DT bindings for
pinmux/pinconfig would solve this. But the sequence of of_get_gpio()
and gpio_request() in the above code will stay even when using the dt
bindings for pinmux/pinconfig. There will be only incremental changes
required to adapt to dt bindings for pinmux/pinconfig.

Thanks,
Thomas.
