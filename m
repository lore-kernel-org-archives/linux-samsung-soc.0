From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM: S5PV210: Add audio support to Goni and Aquila board
Date: Thu, 30 Sep 2010 16:06:00 +0900
Message-ID: <AANLkTi=ibP77PvqzJCaQC++=WRkfgNYHfsRiCM38+4hc@mail.gmail.com>
References: <4C8D8233.2060602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:53894 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754446Ab0I3HGC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Sep 2010 03:06:02 -0400
Received: by bwz11 with SMTP id 11so1154948bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2010 00:06:00 -0700 (PDT)
In-Reply-To: <4C8D8233.2060602@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Myungjoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Ben Dooks <ben-linux@fluff.org>

On Mon, Sep 13, 2010 at 10:45 AM, Chanwoo Choi <cw00.choi@samsung.com> =
wrote:
> This patch the I2C board information for the WM8994 used in the Goni/=
Aquila
> as audio codec and adds the I2C/I2S platform drivers. Additionlly, to
> control power consumption have registerd the voltage consumer of WM89=
94
> to the regulator framework.
>
> Additionally, I explain the constraints of the regulator of WM8994 co=
dec.
> All these consumer supply of WM8994 codec connected the regulator(VCC=
_1.8V)
> on a circuit diagram. "VCC_1.8V" regulator is always enabled, because=
 it is
> used to many devices on Goni/Aquila board. This is required especiall=
y
> when there are many devices physically attached to "VCC_1.8V" and som=
e of
> they did not "register" as consumers to "VCC_1.8V". "VCC_1.8V" might =
be
> turned off by those who are registered while "unregistered" are still=
 active.
>
> Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by : Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =C2=A0arch/arm/mach-s5pv210/mach-aquila.c | =C2=A0170 +++++++++++++++=
++++++++++++++++++++
> =C2=A0arch/arm/mach-s5pv210/mach-goni.c =C2=A0 | =C2=A0157 ++++++++++=
++++++++++++++++++++++

The contents seem ok (at least the audio related).

But it would have been better if you had broken the patch into three
   a) Regulator support adding  (90% of the code and should have been
CC'd to Mark and Liam as well)
   b) I2C related.
   c) Audio related

Preferably further divided for each machine.
