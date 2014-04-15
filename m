From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 4/4] regulator: s5m8767: Use same binding for external
 control as in s2mps11
Date: Tue, 15 Apr 2014 14:02:02 +0530
Message-ID: <CAK9yfHwUwjMEXisi5Jf+nAkS7CLnAUt-REkekns9JrRTAGQ=WQ@mail.gmail.com>
References: <1397462949-22379-1-git-send-email-k.kozlowski@samsung.com>
	<1397462949-22379-5-git-send-email-k.kozlowski@samsung.com>
	<20140414211106.GC12304@sirena.org.uk>
	<CAK9yfHwL4o7-7Q03dw9JdD1UDsP_v2=we1kadRXaGAuaN1de_g@mail.gmail.com>
	<1397549539.29169.2.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:55393 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185AbaDOIcE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 04:32:04 -0400
Received: by mail-ob0-f177.google.com with SMTP id vb8so2009263obc.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2014 01:32:02 -0700 (PDT)
In-Reply-To: <1397549539.29169.2.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>

On 15 April 2014 13:42, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> On wto, 2014-04-15 at 13:26 +0530, Sachin Kamat wrote:
>> On 15 April 2014 02:41, Mark Brown <broonie@kernel.org> wrote:
>> > On Mon, Apr 14, 2014 at 10:09:09AM +0200, Krzysztof Kozlowski wrote:
>> >
>> >> -     - s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
>> >> +     - samsung,ext-control-gpios: (optional) GPIO specifier for one
>> >>               GPIO controlling this regulator (enable/disable); This is
>> >>               valid only for buck9.
>> >
>> > This is an incompatible change.  It's OK to deprecate the old property
>> > but it's bad form to just remove it.
>>
>> I agree with Mark. Also, there is no need to make it generic.
>
> I thought it would be good to make it consistent and to reduce the
> number of bindings with same meaning on similar drivers.

How about making the other one use "s5m8767,pmic-ext-control-gpios"
compatible instead of introducing a new one?

-- 
With warm regards,
Sachin
