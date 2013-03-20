From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH] ARM: dts: add interrupt-names property to get interrupt
 resource by name
Date: Wed, 20 Mar 2013 08:52:07 +0530
Message-ID: <CAGm_ybhxMZeJrhHuCgLXdYVS_nmjmGzY3hTssbQzsHDKjuw7Fw@mail.gmail.com>
References: <1363173980-11428-1-git-send-email-vikas.sajjan@linaro.org>
	<51408FB9.90808@gmail.com>
	<514100D9.1000603@gmail.com>
	<514737D4.8080601@gmail.com>
	<5148DB3C.8080402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:65336 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752093Ab3CTDWJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Mar 2013 23:22:09 -0400
Received: by mail-wg0-f52.google.com with SMTP id 15so952471wgd.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Mar 2013 20:22:08 -0700 (PDT)
In-Reply-To: <5148DB3C.8080402@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Rob Herring <robherring2@gmail.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, l.krishna@samsung.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, inki.dae@samsung.com, linaro-kernel@lists.linaro.org

HI,

On Wed, Mar 20, 2013 at 3:10 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> On 03/18/2013 04:50 PM, Rob Herring wrote:
>>
>> On 03/13/2013 05:42 PM, Sylwester Nawrocki wrote:
>>>
>>> On 03/13/2013 03:39 PM, Rob Herring wrote:
>>>>
>>>> I fail to see what the hack is. The order of interrupt properties must
>>>> be defined by the binding. interrupt-names is auxiliary data and must
>>>> not be required by an OS.
>>>
>>>
>>> It is clear that the order of the interrupts must be defined by the
>>> bindings. But how useful<resource>-names properties are when we
>>> cannot define them as required ? If an OS cannot rely on them then
>>> it must use some other, reliable, method to identify the resources,
>>> e.g. by hard coding the indexes. If we have to do it then why even
>>> bother with the<resource>-names properties ? I can see interrupt-names
>>> property specified as required in at least 2 bindings' documentation
>>> and all bindings having reg-names property define it as required.
>>> Are they wrong them ?
>>
>>
>> You can require the name for a binding definition, but that does not
>> remove the requirement that the order and index of interrupts also be
>> defined by the binding. Then it is up to the OS to use names or
>> hard-coded indexes. Hard-coded indexes are not a hack. This is how FDT
>> and OF are defined to work.
>
>
> OK, that makes it all crystal clear for me, thanks.
>
>
>> I'm still not clear how changing the order of the interrupts removes a
>> hack.
>
>
> Originally the binding in question was not specifying the interrupt
> order at all. And the drivers required order of the interrupt resources
> different than in what they were normally defined in the SoC interrupt
> combiner. So I suggested to use the interrupt-names property to make it
> all more explicit and less error prone. I once had to fix the order of
> the FIMD interrupts in the device tree to make the display work, since
> I used a patch where the interrupts were listed in the IRQ combiner order,
> and not the order expected by the driver.
>
> I wasn't really clear then whether the order of interrupts needs to be
> still fixed by the binding when the interrupt-names property was used.
>
> That said I don't think there was previously any hack there. Just an
> undocumented expected order of the interrupts in DT, different than the
> normal order in the IRQ combiner. So it is really hard to agree with
> what's written in the $subject patch description as it is now.
>

Yes, there was NO hack as such earlier, just the documentation was not clear.
But IMO, as suggested by Sylwester using  "interrupt-names" property
makes it more explicit and less error prone.

Regarding this patch, it will be abandoned, Leela will post a single
patch by squash this patch and
https://patchwork.kernel.org/patch/2184981/

> Thanks,
> Sylwester
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
