From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] ARM: dts: add interrupt-names property to get interrupt
 resource by name
Date: Tue, 19 Mar 2013 22:40:12 +0100
Message-ID: <5148DB3C.8080402@gmail.com>
References: <1363173980-11428-1-git-send-email-vikas.sajjan@linaro.org> <51408FB9.90808@gmail.com> <514100D9.1000603@gmail.com> <514737D4.8080601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f175.google.com ([209.85.215.175]:56167 "EHLO
	mail-ea0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933741Ab3CSVkR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Mar 2013 17:40:17 -0400
Received: by mail-ea0-f175.google.com with SMTP id o10so463776eaj.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Mar 2013 14:40:16 -0700 (PDT)
In-Reply-To: <514737D4.8080601@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, l.krishna@samsung.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, inki.dae@samsung.com, linaro-kernel@lists.linaro.org

On 03/18/2013 04:50 PM, Rob Herring wrote:
> On 03/13/2013 05:42 PM, Sylwester Nawrocki wrote:
>> On 03/13/2013 03:39 PM, Rob Herring wrote:
>>> I fail to see what the hack is. The order of interrupt properties must
>>> be defined by the binding. interrupt-names is auxiliary data and must
>>> not be required by an OS.
>>
>> It is clear that the order of the interrupts must be defined by the
>> bindings. But how useful<resource>-names properties are when we
>> cannot define them as required ? If an OS cannot rely on them then
>> it must use some other, reliable, method to identify the resources,
>> e.g. by hard coding the indexes. If we have to do it then why even
>> bother with the<resource>-names properties ? I can see interrupt-names
>> property specified as required in at least 2 bindings' documentation
>> and all bindings having reg-names property define it as required.
>> Are they wrong them ?
>
> You can require the name for a binding definition, but that does not
> remove the requirement that the order and index of interrupts also be
> defined by the binding. Then it is up to the OS to use names or
> hard-coded indexes. Hard-coded indexes are not a hack. This is how FDT
> and OF are defined to work.

OK, that makes it all crystal clear for me, thanks.

> I'm still not clear how changing the order of the interrupts removes a hack.

Originally the binding in question was not specifying the interrupt
order at all. And the drivers required order of the interrupt resources
different than in what they were normally defined in the SoC interrupt
combiner. So I suggested to use the interrupt-names property to make it
all more explicit and less error prone. I once had to fix the order of
the FIMD interrupts in the device tree to make the display work, since
I used a patch where the interrupts were listed in the IRQ combiner order,
and not the order expected by the driver.

I wasn't really clear then whether the order of interrupts needs to be
still fixed by the binding when the interrupt-names property was used.

That said I don't think there was previously any hack there. Just an
undocumented expected order of the interrupts in DT, different than the
normal order in the IRQ combiner. So it is really hard to agree with
what's written in the $subject patch description as it is now.

Thanks,
Sylwester
