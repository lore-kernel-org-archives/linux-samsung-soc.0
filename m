From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: exynos4210-origen: Add fixed voltage regulator to simple bus
Date: Thu, 26 Sep 2013 10:20:56 +0200
Message-ID: <6424447.2ZxYnXayW4@flatron>
References: <1374834657-29088-1-git-send-email-sachin.kamat@linaro.org> <CAK9yfHy_3aun5D5FitGPdABjfo_pBhNvTq9vLL00bwhWDU97oA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f169.google.com ([209.85.215.169]:55775 "EHLO
	mail-ea0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751058Ab3IZIVA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 04:21:00 -0400
Received: by mail-ea0-f169.google.com with SMTP id k11so351937eaj.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2013 01:20:59 -0700 (PDT)
In-Reply-To: <CAK9yfHy_3aun5D5FitGPdABjfo_pBhNvTq9vLL00bwhWDU97oA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, Kukjin Kim <kgene@kernel.org>

Hi Sachin,

I must have missed this patch so better later than never ;).
Please see my comments inline.

On Thursday 26 of September 2013 10:32:01 Sachin Kamat wrote:
> > +       regulators {
> > +               compatible = "simple-bus";
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               mmc_reg: voltage-regulator {

For consistency and correctness, since this is a bus, even if not 
physical, it is worth to add reg property and unit-address to subnodes. 
Since this bus is not physical, the reg property would not be anything 
more than purely an index.

Also for consistency I'd use "regulator" as node name here, as this is 
what is used most commonly across all the dts files in arch/arm/boot/dts.

So you could have then (in case of more than one regulator)

	regulators {
		compatible = "simple-bus";
		#address-cells = <1>;
		#size-cells = <0>;

		mmc_reg: regulator@0 {
			/* ... */
			reg = <0>;
		};

		xxx_reg: regulator@1 {
			/* ... */
			reg = <1>;
		};

		/* ... */
	};

Best regards,
Tomasz
