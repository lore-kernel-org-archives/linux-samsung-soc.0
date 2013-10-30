From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/2] ARM: s3c64xx: cpuidle: convert to platform driver
Date: Wed, 30 Oct 2013 14:43:51 -0700
Message-ID: <52717D97.8090905@linaro.org>
References: <1382685074-16502-1-git-send-email-daniel.lezcano@linaro.org> <6431720.IUjkN7MGOG@thinkpad> <526AC2DF.2020904@linaro.org> <1953577.TBW5ixuUM5@thinkpad> <526AEF6B.2000404@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:56447 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751885Ab3J3Vnx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Oct 2013 17:43:53 -0400
Received: by mail-ob0-f180.google.com with SMTP id wo20so2103141obc.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2013 14:43:52 -0700 (PDT)
In-Reply-To: <526AEF6B.2000404@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 10/25/2013 03:23 PM, Daniel Lezcano wrote:

[ ... ]

>>> Won't it be worth to add a new WFI_SLEEP state to the cpuidle drive=
r ?
>>
>> I don't think so. How a suspend-to-RAM specific thing like WFI_SLEEP
>> could
>> be relevant to a cpuidle driver? (Unless there are some plans to
>> consolidate STR with cpuidle that I haven't heard about...)
>
> I finally found a documentation for the s3c6410x and the description =
of
> the different modes. Indeed, the sleep mode is not adequate for a
> cpuidle state. What about the 'stop' and 'deep stop' state ?

Hi Thomas,

just a reminder about the question above, so I can go ahead: fix what=20
you pointed out or remove the driver directly.

You mentionned in the previous email the STOP is not usful because it=20
can be controlled by manually outside of the cpuidle driver. But I see=20
in the documentation, the stop states power gates the cpu and deep-stop=
=20
stops the regulator.

If these states have to been added later, still it worth to remove the=20
driver ?

Thanks!
   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
