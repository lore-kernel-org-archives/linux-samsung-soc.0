From: Thomas Pietrowski <thopiekar@gmail.com>
Subject: Re: Feedback on hardware support for Odroid U3
Date: Sat, 10 Oct 2015 10:46:01 +0200
Message-ID: <CAE-5t2uJSotJsO8g0zNvnK2DhMEjXzURMtKh1siyJRGXA1=+=Q@mail.gmail.com>
References: <CAE-5t2tKeYTjS_1qiQ4oAZS1g5yheA2G1g0CMHRaHdY3Z84NBw@mail.gmail.com>
	<557BC91C.10007@gmail.com>
	<16487700.5L20qaootX@home>
	<557BFEAA.1090802@gmail.com>
	<CAE-5t2sRjsD=NFdfOdtu6t1o=tb4TGKnhxPa5+rEXaWXm3P6nw@mail.gmail.com>
	<CAJKOXPfta+QXsLp1fPhNhMuFNEARZVjcFCtWtqRRG1gg=oFBsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:36486 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751240AbbJJIqC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Oct 2015 04:46:02 -0400
Received: by ykba192 with SMTP id a192so94855227ykb.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Oct 2015 01:46:01 -0700 (PDT)
In-Reply-To: <CAJKOXPfta+QXsLp1fPhNhMuFNEARZVjcFCtWtqRRG1gg=oFBsw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Thanks! The patch for fan support is obviously on a good way to be appl=
ied.

However, I just took now 4.2.3 from linux-stable and ran into the same
problem of this conversation: https://lkml.org/lkml/2015/2/17/434

Is there a way I can help getting this debugged? I could apply this
patch and test it if you like. Just asking because someone is maybe
working on a better fix :)

Here a more detailed output of this problem: http://pastebin.com/ity4cE=
AS

Regards

2015-08-06 1:31 GMT+02:00 Krzysztof Koz=C5=82owski <k.kozlowski.k@gmail=
=2Ecom>:
> 2015-08-05 22:07 GMT+09:00 Thomas Pietrowski <thopiekar@gmail.com>:
>> Sorry for the long delay. Got now linux-stable 4.2.0-rc5 running her=
e,
>> but I still miss the fan support.
>> Searched the web again for the patch and found this on LKML:
>> https://lkml.org/lkml/2014/12/18/138
>>
>> Then looked at the "arm-soc" repository but found this patch nowhere=
=2E
>> Are you planing to add this in future releases?
>
> Me? No, I am not planning to work on this. Also I don't have an Odroi=
d
> U3 with a fan.
>
> I think you should ask the author of the patchset.
>
> Best regards,
> Krzysztof
