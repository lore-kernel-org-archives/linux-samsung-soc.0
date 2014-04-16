From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 4/5] regulator: tps65090: Allow setting the overcurrent
 wait time
Date: Wed, 16 Apr 2014 16:12:36 -0700
Message-ID: <CAD=FV=XxToiWvq8x2HNAnEANUWtsmu6CnP6P3Uu4X3_DT+=sqA@mail.gmail.com>
References: <1397592876-5741-1-git-send-email-dianders@chromium.org>
	<1397672724-9063-1-git-send-email-dianders@chromium.org>
	<1397672724-9063-5-git-send-email-dianders@chromium.org>
	<534EE90A.7070602@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:47481 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754586AbaDPXMo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 19:12:44 -0400
Received: by mail-vc0-f176.google.com with SMTP id lc6so11614908vcb.35
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2014 16:12:43 -0700 (PDT)
In-Reply-To: <534EE90A.7070602@infradead.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Simon Glass <sjg@chromium.org>, Michael Spang <spang@chromium.org>, Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Randy,

On Wed, Apr 16, 2014 at 1:33 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 04/16/2014 11:25 AM, Doug Anderson wrote:
>> diff --git a/drivers/regulator/tps65090-regulator.c b/drivers/regulator/tps65090-regulator.c
>> index 2e92ef6..ca13a1a 100644
>> --- a/drivers/regulator/tps65090-regulator.c
>> +++ b/drivers/regulator/tps65090-regulator.c
>> @@ -28,15 +28,57 @@
>
>> +/**
>> + * tps65090_reg_set_overcurrent_wait - Setup overcurrent wait
>> + *
>> + * This will set the overcurrent wait time based on what's in the regulator
>> + * info.
>> + *
>> + * @ri:              Overall regulator data
>> + * @rdev:    Regulator device
>> + * @return 0 if no error, non-zero if there was an error writing the register.
>
> kernel-doc notation here should be:
>
>  * Return: 0 if no error, non-zero if there was an error writing the register.

Done in v3.
