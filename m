From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 06/13] tests/exynos: add fimg2d event test
Date: Fri, 30 Oct 2015 18:49:36 +0000
Message-ID: <CACvgo53ac-eqcCF29wFa43cGnx4=OuryBZm-y-vg27R6k_NzrA@mail.gmail.com>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1442937302-8211-7-git-send-email-tjakobi@math.uni-bielefeld.de>
	<20151030155043.35acb278@hwh-ubuntu>
	<5633519F.60607@math.uni-bielefeld.de>
	<CACvgo52ax76mKOsYX6p9UEw8n2m-7OjmMYEbiFw8G1E7hOTp3g@mail.gmail.com>
	<5633546C.5090601@math.uni-bielefeld.de>
	<CACvgo52xNr9yCxV+dAGhxHBtHuPv=fgzhAzKHvsCFY7Eh4AXJg@mail.gmail.com>
	<56337E7E.7040405@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:34361 "EHLO
	mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758864AbbJ3Sth (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 14:49:37 -0400
Received: by iody8 with SMTP id y8so88979278iod.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2015 11:49:37 -0700 (PDT)
In-Reply-To: <56337E7E.7040405@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Hyungwon Hwang <human.hwang@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>

On 30 October 2015 at 14:28, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:

> OK, I see what you mean. However this shouldn't happen as long as the
> user properly zero initializes the event context structures, right?
>
It pains me to say it but in this day and age, not everyone zero
initializes their structs (be that via C99 initailizers, memset or
just {}).

> OK, going to do this then. In any case, can the user assume that the
> event structures only "grow", in the sense that new fields are added to it?
>
That is correct. Note that this approach is also used elsewhere - the
DRI driver <> loader model, also the drm ioctls structs are extended
in a similar way (minus the actual version field).

With the current knowledge in hand, perhaps we could have done things
differently... But that's another story :-)

Regards,
Emil
