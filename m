From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v4 2/2] regulator: add device tree support for max8997
Date: Wed, 18 Apr 2012 13:46:58 +0530
Message-ID: <CAJuYYwSg-VkWe=0PFNj2snX4+_fN7Lc1-YU1xdUvTM9uJvha7A@mail.gmail.com>
References: <1332582590-16382-1-git-send-email-thomas.abraham@linaro.org>
	<1332582590-16382-3-git-send-email-thomas.abraham@linaro.org>
	<4F734460.4060605@samsung.com>
	<CAJuYYwRsHynt6pBHUgk72Z-UjHj3DM=s4pV4dzbb2hTAZOUSAw@mail.gmail.com>
	<20120417183829.GW6652@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:43668 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751558Ab2DRIQ7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Apr 2012 04:16:59 -0400
Received: by vbbff1 with SMTP id ff1so4786813vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Apr 2012 01:16:59 -0700 (PDT)
In-Reply-To: <20120417183829.GW6652@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Karol Lewandowski <k.lewandowsk@samsung.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org, Rajendra Nayak <rnayak@ti.com>

Hi Mark,

On 18 April 2012 00:08, Mark Brown <broonie@opensource.wolfsonmicro.com=
> wrote:
> On Wed, Apr 18, 2012 at 12:05:59AM +0530, Thomas Abraham wrote:
>> On 28 March 2012 22:33, Karol Lewandowski <k.lewandowsk@samsung.com>=
 wrote:
>
>> >> + =A0 =A0For BUCK's:
>
> No 's here, BTW.

Ok.

>
>> > =A0- EN32KHz_AP
>> > =A0- EN32KHz_CP
>> > =A0- ENVICHG
>> > =A0- ESAFEOUT1
>> > =A0- ESAFEOUT2
>> > =A0- CHARGER
>> > =A0- CHARGER_CV
>> > =A0- CHARGER_TOPOFF
>
>> > I wonder if these should be mentioned in documentation too.
>
>> Yes, I missed the above regulators in the documentation. I have
>> included them now and will resubmit this patch.
>
> Please omit the clocks; these are obviously a bodge due to the inabil=
ity
> to support clocks off-SoC so we shouldn't be enshrining them in the
> device tree bindings.

Thanks for the suggestion. I have removed EN32KHz_AP and EN32KHz_CP
from the list. The rest are either voltage (fixed) or current
regulators.

Regards,
Thomas.
