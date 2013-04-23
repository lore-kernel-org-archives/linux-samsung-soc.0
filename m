From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v5 5/6] ARM: dts: Add basic dts include files for Samsung
 S3C64xx SoCs
Date: Tue, 23 Apr 2013 23:29:32 +0900
Message-ID: <51769ACC.4070706@samsung.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>	<1366060483-20342-6-git-send-email-tomasz.figa@gmail.com>	<516D4D76.2010409@gmail.com>	<1829212.6niSeTsyIU@amdc1227> <CAL_JsqL_i-5SDCsGZCrsxMehLVMGoLO1s_V3R-H6Oa5ff16dEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f41.google.com ([209.85.210.41]:61936 "EHLO
	mail-da0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755938Ab3DWO3j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 10:29:39 -0400
Received: by mail-da0-f41.google.com with SMTP id p8so369318dan.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2013 07:29:38 -0700 (PDT)
In-Reply-To: <CAL_JsqL_i-5SDCsGZCrsxMehLVMGoLO1s_V3R-H6Oa5ff16dEQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, "Mark Brown (broonie@opensource.wolfsonmicro.com)" <broonie@opensource.wolfsonmicro.com>, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>

On 04/18/13 02:46, Rob Herring wrote:

>>>> +   vic0: interrupt-controller@71200000 {
>>>
>>> These nodes should be off a "simple-bus" node.
>>
>> Hmm, is there any reason behind it?
>>
>> I thought simple bus was just a convenient helper to represent hierarchical
>> bus structures if one has a need to do so.
>
> No. The DT should reflect the bus structure of the chip. How
> accurately it is done is up to you and the information available, but
> you have to have a bus of some sort.
>
> There's obvious examples that don't follow this, but I'd like to not have more.
>
Tomasz, can you address comments?

Thanks.

- Kukjin
