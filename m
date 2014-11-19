From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Wed, 19 Nov 2014 17:44:14 +0100
Message-ID: <546CC8DE.3050208@suse.de>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com> <CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com> <546C646C.4060303@collabora.co.uk> <20141119105527.GA5396@luxor.wired.org> <546C7D15.10605@collabora.co.uk> <20141119162224.GB5396@luxor.wired.org> <546CC546.5090900@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33311 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752950AbaKSQoS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 11:44:18 -0500
In-Reply-To: <546CC546.5090900@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Paolo Pisati <p.pisati@gmail.com>, Ajay kumar <ajaynumb@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Sean Paul <seanpaul@google.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, gustavo Padovan <gustavo.padovan@collabora.co.uk>

Am 19.11.2014 um 17:28 schrieb Javier Martinez Canillas:
> On 11/19/2014 05:22 PM, Paolo Pisati wrote:
>> On Wed, Nov 19, 2014 at 12:20:53PM +0100, Javier Martinez Canillas w=
rote:
>>>
>>> If someone else is interested, I've pushed a branch [0] with 3.18-r=
c5 + all
>>> the needed patches.
>>>
>>> Ajay, feel free to add to your series:
>>>
>>> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.u=
k>
>>>
>>> Best regards,
>>> Javier
>>>
>>> [0]: git://git.collabora.co.uk/git/user/javier/linux.git wip/exynos=
/dp-integ
>>
>> doesn't peach pi require the same dts modification as peach pit/snow=
?
>>
>=20
> No, because the Peach Pit and Snow have an eDP to LVDS bridge chip bu=
t the
> Peach Pi does not have a bridge. Ajay's series is to add DRM bridge s=
upport
> to Exynos Display Port driver and so is only relevant to Snow and Pit=
=2E

=2E.. and to Spring.

So, what's the timing here - is this series headed for 3.20 now or 3.19=
?

Regards,
Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 21284 AG N=FCrn=
berg
