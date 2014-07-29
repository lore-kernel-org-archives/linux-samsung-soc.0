From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/4] ARM: dts: exynos5250: max77686 is Snow only
Date: Tue, 29 Jul 2014 09:15:29 -0700
Message-ID: <CAD=FV=Xnb12GM-miAbA-6fmAbBCRiW2ejs=Veep+TQakv3MgZQ@mail.gmail.com>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>
	<1405704009-8430-2-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f180.google.com ([209.85.220.180]:45911 "EHLO
	mail-vc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750959AbaG2QPa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 12:15:30 -0400
Received: by mail-vc0-f180.google.com with SMTP id ij19so13821426vcb.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jul 2014 09:15:30 -0700 (PDT)
In-Reply-To: <1405704009-8430-2-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Andreas,

On Fri, Jul 18, 2014 at 10:20 AM, Andreas F=C3=A4rber <afaerber@suse.de=
> wrote:
> Move it from exynos5250-cros-common.dtsi to exynos5250-snow.dts.
> Spring does not need it, it uses an s5m8767 instead.
>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v2: New (Doug Anderson)
>
>  arch/arm/boot/dts/exynos5250-cros-common.dtsi | 151 ----------------=
---------
>  arch/arm/boot/dts/exynos5250-snow.dts         | 155 ++++++++++++++++=
++++++++++
>  2 files changed, 155 insertions(+), 151 deletions(-)

Personally I would have squashed patches 1-3, but I don't have a
problem with it being broken up and it does mean that the mondo patch
is smaller, so...

Reviewed-by: Doug Anderson <dianders@chromium.org>

Kukjin could apply this now if he wanted to avoid future conflicts.

-Doug
