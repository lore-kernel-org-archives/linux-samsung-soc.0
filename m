From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: PWM on Hardkernel ODROID-XU board
Date: Tue, 05 Aug 2014 22:58:56 +0200
Message-ID: <53E14590.5090704@gmail.com>
References: <D0070FDB.10331%daniel.gachet@hefr.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:34464 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753603AbaHEU7B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Aug 2014 16:59:01 -0400
Received: by mail-wg0-f42.google.com with SMTP id l18so1605182wgh.25
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Aug 2014 13:59:00 -0700 (PDT)
In-Reply-To: <D0070FDB.10331%daniel.gachet@hefr.ch>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gachet Daniel <Daniel.Gachet@hefr.ch>
Cc: Tomasz Figa <t.figa@samsung.com>, Tarek Dakhran <t.dakhran@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Humberto Silva Naves <hsnaves@gmail.com>, Mauro Ribeiro <mdrjr0@gmail.com>

Hi Daniel,

On 05.08.2014 22:48, Gachet Daniel wrote:
> Hi Thomasz,
>=20
> I=E2=80=99m currently trying to use the Hardkernel ODROID-XU board un=
der Linux version 3.14 (hard kernel sources =E2=80=9Codroid-3.14.y-lina=
ro=E2=80=9D.
> I=E2=80=99m almost happy with that version, but I still have a proble=
m by migrating the =E2=80=9Codroidxu_fan.c=E2=80=9D module from the 3.4=
 version.
> I can register to the samsung pwm module (pam_request).
>=20
> Could you tell me what are the right entry for the flattened device t=
ree for this board ?

Unfortunately I don't know too much about this board or hardkernel
sources. I mostly work with mainline kernel.

In general, you probably need a node for the PWM block of the SoC and a
node for the PWM fan, but I don't have any details for you at the momen=
t.

I'd say you should have posted this to linux-samsung-soc mailing list
for bigger chance of getting more information. For your convenience, I'=
m
adding them and several people that might be able to give some input on
this.

By the way, you might be interested in pwm-fan driver recently merged
for Linux 3.17: https://lkml.org/lkml/2014/7/16/426 .

Best regards,
Tomasz
