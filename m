From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2 3/4] ARM: dts: exynos5250: Fold common ChromeOS parts
 into Snow
Date: Tue, 29 Jul 2014 16:39:19 +0200
Message-ID: <CABxcv=mALxA=dK0Ue_LC1Qz1HUsvf3C4h13q7FgDv+PEoKvRNw@mail.gmail.com>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>
	<1405704009-8430-4-git-send-email-afaerber@suse.de>
	<CABxcv=kP2PCcNCtM1WUXx5wGG4m-jdw-P1dw0boaSwdJpoX=jQ@mail.gmail.com>
	<CAD=FV=V-7+Jj7b8-fQL1PiQhNmhiGOPJzitGd__OUQLDteO_8g@mail.gmail.com>
	<CABxcv=nDsKSdDtVZKpcTP+=3pbeTswJRCUvvXVx98p+1Zzz0Bg@mail.gmail.com>
	<53D79AD3.8020700@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:64946 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752764AbaG2OjW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 10:39:22 -0400
Received: by mail-wg0-f44.google.com with SMTP id m15so8973397wgh.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jul 2014 07:39:21 -0700 (PDT)
In-Reply-To: <53D79AD3.8020700@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Doug Anderson <dianders@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Hello Andreas,

On Tue, Jul 29, 2014 at 3:00 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Hi Javier and Doug,
>
>
> Hm, in different context it was stated that device trees shouldn't re=
ly
> on bootloader behavior (for a /memory node on Zynq we ended up
> specifying the size cell with the real value despite U-Boot overridin=
g
> it to a lesser value).
>

Well is not strictly the same, the memory node is a hardware
description while the chosen node is one of those exceptional nodes
that don't represent a real device. Also the usage for the memory node
is marked as required in ePAR while the later is marked as optional.

> Can we instead settle on filling this node with defaults? :)
> bootargs =3D "console=3Dtty1"; would be my choice for Spring. Would t=
hat be
> applicable for Snow as well?
> Not sure how to specify that via linux,stdout-path property.
>
> I believe this would be a follow-up patch either way.
>
> Since there's at least two series out there trying to fiddle with
> -cros-common.dtsi, including one that drops the slot sub-node of the =
MMC
> and one that adds CPU power supply, it would be nice if we can get th=
e
> -cros-common parts sorted out and applied. Can you ack/review 1-2?
> Should I squash them in a v3?
>

A sensible default makes sense to me and yes it should be a follow-up
patch anyways.

> Thanks,
> Andreas
>
> --

Best regards,
Javier
