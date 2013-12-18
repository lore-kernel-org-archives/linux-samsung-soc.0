From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: dts: Add PMIC support to arndale-octa
Date: Wed, 18 Dec 2013 10:37:50 +0530
Message-ID: <CAK9yfHzQeXQtPXXZ5tU1PFmXbf7XCkC-+tOA4usV8E5STkpVsw@mail.gmail.com>
References: <1386656958-28292-1-git-send-email-sachin.kamat@linaro.org>
	<20131210185416.GH11468@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:35570 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750835Ab3LRFHu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 00:07:50 -0500
Received: by mail-oa0-f54.google.com with SMTP id h16so7822894oag.27
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2013 21:07:50 -0800 (PST)
In-Reply-To: <20131210185416.GH11468@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Mark,

Sorry for the late reply as I was sick and still recovering.

On 11 December 2013 00:24, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Dec 10, 2013 at 11:59:18AM +0530, Sachin Kamat wrote:
>
>> Added PMIC node to Arndale-Octa board.
>
> Is there a bootloader posted for this anywhere yet?

One version available here from Insignal:
git://git.insignal.co.kr/insignal/arndale_octa-jb_mr1.1/u-boot


>
>> +                     regulators {
>> +                             ldo1_reg: LDO1 {
>> +                                     regulator-name = "vdd_ldo1";
>
> So, there is a label on the schematic for PVDD_LDO1 but it's not
> entirely obvious why that's there as throughout the rest of the
> schematic it's got the rather more constructive name PVDD_ALIVE_1V0.
> We should really be using the more readable versions of the names
> in the DT since the whole point in overriding the driver default
> names is to make it easier to associate the kernel diagnostics with
> the schematic, what the DT is doing here serves no purpose.
>
> The same comment applies to all the LDO supplies.

I will update with the appropriate labels.

>
>> +                             buck2_reg: BUCK2 {
>> +                                     regulator-name = "vdd_arm";
>> +                                     regulator-min-microvolt = <800000>;
>> +                                     regulator-max-microvolt = <1500000>;
>> +                                     regulator-always-on;
>> +                                     regulator-boot-on;
>> +                             };
>
> Why are you specifying boot-on?  It doesn't seem terribly plausible that
> the cores won't be powered on boot, or that we can't tell what the state
> is by reading the registers.
>
> Same for all the DCDCs.

Yes. Right. Will remove them.

>
>> +                             buck7_reg: BUCK7 {
>> +                                     regulator-name = "vdd_1.0v_ldo";
>> +                                     regulator-min-microvolt = <800000>;
>> +                                     regulator-max-microvolt = <1500000>;
>> +                                     regulator-always-on;
>> +                                     regulator-boot-on;
>> +                             };
>
> This doesn't correspond to the schematic which says that BUCK7 is
> supplying VIN_LLDO_1V4 (the input for some of the LDOs).  The voltage
> range specified there doesn't seem terribly sensible either, are you
> sure you haven't just got the underlying voltage range for the DCDC?
> I can't see why you'd want to raise the voltage over 1.4V (that's rather
> defeating the point) and while it'd be nice to have the core be able to
> vary supply to track the headroom needed by the LDOs none of the LDOs
> were configured with variable voltage so even if we implemented that
> it'd never be used.

That was definitely a mistake. It should be 1.4V Will fix it.

>
> Similar issues apply to the other bucks being used to drop the battery
> voltage for LDO supplies.

Will check and update others appropriately. Thanks for your review and
pointing out the errors.

-- 
With warm regards,
Sachin
