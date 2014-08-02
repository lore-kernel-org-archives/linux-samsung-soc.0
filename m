From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v6 04/10] ARM: dts: Clean up exynos5250-snow
Date: Fri, 1 Aug 2014 21:54:46 -0700
Message-ID: <CAD=FV=WB_JP_jAp5bC-cBtJs8U0AmrxPGj_J2d6uJkn=LEjEPA@mail.gmail.com>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de>
	<1406940750-15880-5-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f179.google.com ([209.85.220.179]:45774 "EHLO
	mail-vc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850AbaHBEyr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 00:54:47 -0400
Received: by mail-vc0-f179.google.com with SMTP id hq11so8003837vcb.24
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Aug 2014 21:54:46 -0700 (PDT)
In-Reply-To: <1406940750-15880-5-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>

Andreas,

On Fri, Aug 1, 2014 at 5:52 PM, Andreas F=C3=A4rber <afaerber@suse.de> =
wrote:
> Use the new style of referencing inherited nodes and use symbolic nam=
es.
> Reorder one pinctrl node in GPIO order.
>
> Goal is the alignment of all exynos5250 based device trees for compar=
ison.
>
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v5 -> v6:
>  * Split off label additions (Doug Anderson)
>  * Fixed alphabetical order of sd3_* nodes (Doug Anderson)
>
>  v4 -> v5:
>  * Introduced labels to consistently use new referencing style (Tomas=
z Figa)
>  * Use IRQ_TYPE_* constants
>  * Use some more GPIO_ACTIVE_*
>
>  v3 -> v4: Unchanged
>
>  v3: New (Doug Anderson)
>
>  arch/arm/boot/dts/exynos5250-snow.dts | 291 +++++++++++++++++-------=
----------
>  1 file changed, 145 insertions(+), 146 deletions(-)

I'm happy now.  :)  Thank you for putting up with me...

Reviewed-by: Doug Anderson <dianders@chromium.org>
