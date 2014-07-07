From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V4 00/10] drm: exynos: few patches to enhance bridge chip support
Date: Mon, 7 Jul 2014 13:46:42 -0700
Message-ID: <CAD=FV=UH=sgZKFxH35qfBb-XJGJ9ctSSdVRhTEkt6zk0f+R4mA@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
	<53B4E7D6.6000204@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f176.google.com ([209.85.128.176]:33724 "EHLO
	mail-ve0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750979AbaGGUqn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jul 2014 16:46:43 -0400
Received: by mail-ve0-f176.google.com with SMTP id us18so87680veb.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jul 2014 13:46:42 -0700 (PDT)
In-Reply-To: <53B4E7D6.6000204@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, inki.dae@samsung.com, Sean Paul <seanpaul@google.com>, Ajay kumar <ajaynumb@gmail.com>, Rob Clark <robdclark@gmail.com>, daniel.vetter@ffwll.ch, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

Hi,

On Wed, Jul 2, 2014 at 10:19 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> With these 10 patches applied on top of my dt on top of kgene's tree,
> the last U-Boot screen stays visible for ~50 seconds, then the screen
> goes blank, and I can ssh in some time later.
> If I comment out the dp-controller node again, it takes long for the
> kernel boot to graphically proceed but works okay then.
> In both cases there's a gap of ~2900 seconds visible in dmesg.

I would have imagined that this was fixed by (1d80415 clocksource:
exynos_mct: Don't reset the counter during boot and resume).

=2E..that should also fix a long delay at bootup (delay was based on ho=
w
much time you spent in U-Boot).
