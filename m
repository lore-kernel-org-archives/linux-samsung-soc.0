From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [RFC 0/4] ARM: dts: exynos: Prepare Spring
Date: Wed, 25 Jun 2014 01:18:36 +0200
Message-ID: <53AA074C.3090904@suse.de>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54827 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751805AbaFXXSj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 19:18:39 -0400
In-Reply-To: <1403486483-4063-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>

Am 23.06.2014 03:21, schrieb Andreas F=C3=A4rber:
> The display goes dark unfortunately (drm bridge series not yet tested=
),
> but I am able to log in via ssh over USB ethernet adapter okay.

Tracked this down to the dp-controller@145B0000 node: The pinctrl seems
irrelevant, only commenting out the whole node helps keep the display.
That is, hdmi and fimd nodes don't interfere.

Adding a pwm backlight node like on snow did not help. If it's supposed
to work from GNOME's display brightness slider, it doesn't seem to work=
=2E
The 3.8 tree had no backlight node at all.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
