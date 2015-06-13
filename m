From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: Re: Feedback on hardware support for Odroid U3
Date: Sat, 13 Jun 2015 15:09:32 +0900
Message-ID: <557BC91C.10007@gmail.com>
References: <CAE-5t2tKeYTjS_1qiQ4oAZS1g5yheA2G1g0CMHRaHdY3Z84NBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:33400 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750753AbbFMGJg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Jun 2015 02:09:36 -0400
Received: by pdjn11 with SMTP id n11so36658626pdj.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2015 23:09:36 -0700 (PDT)
In-Reply-To: <CAE-5t2tKeYTjS_1qiQ4oAZS1g5yheA2G1g0CMHRaHdY3Z84NBw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Pietrowski <thopiekar@gmail.com>, linux-samsung-soc@vger.kernel.org

W dniu 12.06.2015 o 22:53, Thomas Pietrowski pisze:
> Hello again,
>=20
> first after fixing my booting problems I now get different warnings a=
fter boot.
> - config: http://pastebin.com/MHUu51pF
> - log: http://pastebin.com/9YMgMmFL
> - repo: arm-soc
> I read the last days that you are still working on the clk drivers, s=
o
> as these warnings appear to be related to that you might be intereste=
d
> on them.

You mean the warnings on clocks (starting from runtime PM and FIMC)? I
hit them also on Trats2. Just need to find a person (or time) who will
fix it...

> Additionally my CPU fan it running at full RPM all the time. I checke=
d
> the temperature just to be sure and it says it's 20=C2=B0C. Is this p=
roblem
> known or can I help debugging it?

After quick look at DTS, I think that on Exynos4412 Odroid family there
is no fan defined. No fan so cooling is done only through CPU
frequencies. The fan probably works on default setting from bootloader
or default register values.

The stock Odroid U3 has only passive cooler.

Probably support for fan could be added... If you would like to take
care of it, go for it! :)

Best regards,
Krzysztof
