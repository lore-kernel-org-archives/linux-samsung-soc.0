From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos4210-origen: Add fixed voltage
 regulator to simple bus
Date: Fri, 27 Sep 2013 12:20:25 +0530
Message-ID: <CAK9yfHyHR9=sgXcLvd9SdGSgrXFA+eAKMZG6YX+fqyvyRzm7UA@mail.gmail.com>
References: <1374834657-29088-1-git-send-email-sachin.kamat@linaro.org>
	<CAK9yfHy_3aun5D5FitGPdABjfo_pBhNvTq9vLL00bwhWDU97oA@mail.gmail.com>
	<6424447.2ZxYnXayW4@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:53963 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751144Ab3I0GuZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 02:50:25 -0400
Received: by mail-oa0-f45.google.com with SMTP id o17so1776493oag.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2013 23:50:25 -0700 (PDT)
In-Reply-To: <6424447.2ZxYnXayW4@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, Kukjin Kim <kgene@kernel.org>

Hi Tomasz,

On 26 September 2013 13:50, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Sachin,
>
> I must have missed this patch so better later than never ;).

Since you are quite prompt at reviewing I thought you did not have any
comments :)

> Please see my comments inline.
>
> On Thursday 26 of September 2013 10:32:01 Sachin Kamat wrote:
>> > +       regulators {
>> > +               compatible = "simple-bus";
>> > +               #address-cells = <1>;
>> > +               #size-cells = <0>;
>> > +
>> > +               mmc_reg: voltage-regulator {
>
> For consistency and correctness, since this is a bus, even if not
> physical, it is worth to add reg property and unit-address to subnodes.
> Since this bus is not physical, the reg property would not be anything
> more than purely an index.
>
> Also for consistency I'd use "regulator" as node name here, as this is
> what is used most commonly across all the dts files in arch/arm/boot/dts.

Sounds good. Will update accordingly. While at it will also update the
Arndale dts
file to reflect your suggestions for a similar node there.

Thank you for your review and feedback.
-- 
With warm regards,
Sachin
