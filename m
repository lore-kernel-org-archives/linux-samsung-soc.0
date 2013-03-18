From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] ARM: dts: add interrupt-names property to get interrupt
 resource by name
Date: Mon, 18 Mar 2013 17:27:35 -0500
Message-ID: <514794D7.3060903@gmail.com>
References: <1363173980-11428-1-git-send-email-vikas.sajjan@linaro.org> <51408FB9.90808@gmail.com> <514100D9.1000603@gmail.com> <514737D4.8080601@gmail.com> <514758C3.7070601@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:43521 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932075Ab3CRW1j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 18:27:39 -0400
Received: by mail-oa0-f49.google.com with SMTP id j6so6142416oag.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Mar 2013 15:27:38 -0700 (PDT)
In-Reply-To: <514758C3.7070601@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org, l.krishna@samsung.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org, Grant Likely <grant.likely@secretlab.ca>

On 03/18/2013 01:11 PM, Stephen Warren wrote:
> On 03/18/2013 09:50 AM, Rob Herring wrote:
>> On 03/13/2013 05:42 PM, Sylwester Nawrocki wrote:
>>> Rob,
>>>
>>> On 03/13/2013 03:39 PM, Rob Herring wrote:
>>>> I fail to see what the hack is. The order of interrupt properties must
>>>> be defined by the binding. interrupt-names is auxiliary data and must
>>>> not be required by an OS.
> 
> Is that true for all foo-names properties, or only for interrupt-names?
> I was under the impression that foo-names was specifically invented so
> that the order of the entries didn't matter, and instead they could be
> requested by name.

I think it depends on the specific name the property is tied too. For
interrupt and reg properties which have a long history and convention,
the order should be defined. IIRC, this was Grant's position too. For
new bindings, perhaps we can be more lenient.

Rob
