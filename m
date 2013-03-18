From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] ARM: dts: add interrupt-names property to get interrupt
 resource by name
Date: Mon, 18 Mar 2013 10:50:44 -0500
Message-ID: <514737D4.8080601@gmail.com>
References: <1363173980-11428-1-git-send-email-vikas.sajjan@linaro.org> <51408FB9.90808@gmail.com> <514100D9.1000603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:62219 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752797Ab3CRPur (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 11:50:47 -0400
Received: by mail-ob0-f182.google.com with SMTP id va7so5401065obc.41
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Mar 2013 08:50:46 -0700 (PDT)
In-Reply-To: <514100D9.1000603@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, l.krishna@samsung.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, inki.dae@samsung.com, linaro-kernel@lists.linaro.org

On 03/13/2013 05:42 PM, Sylwester Nawrocki wrote:
> Rob,
> 
> On 03/13/2013 03:39 PM, Rob Herring wrote:
>> I fail to see what the hack is. The order of interrupt properties must
>> be defined by the binding. interrupt-names is auxiliary data and must
>> not be required by an OS.
> 
> It is clear that the order of the interrupts must be defined by the
> bindings. But how useful <resource>-names properties are when we
> cannot define them as required ? If an OS cannot rely on them then
> it must use some other, reliable, method to identify the resources,
> e.g. by hard coding the indexes. If we have to do it then why even
> bother with the <resource>-names properties ? I can see interrupt-names
> property specified as required in at least 2 bindings' documentation
> and all bindings having reg-names property define it as required.
> Are they wrong them ?

You can require the name for a binding definition, but that does not
remove the requirement that the order and index of interrupts also be
defined by the binding. Then it is up to the OS to use names or
hard-coded indexes. Hard-coded indexes are not a hack. This is how FDT
and OF are defined to work.

I'm still not clear how changing the order of the interrupts removes a hack.

Rob
