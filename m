From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH V4 00/10] drm: exynos: few patches to enhance bridge chip
 support
Date: Fri, 04 Jul 2014 15:06:56 +0200
Message-ID: <53B6A6F0.1070108@suse.de>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>	<53B4E7D6.6000204@suse.de> <CAEC9eQPee1CYQa01V93pTwwNbAZ=h5wVznQ-_PGoWmxSZV3Tbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54234 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752935AbaGDNHC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 09:07:02 -0400
In-Reply-To: <CAEC9eQPee1CYQa01V93pTwwNbAZ=h5wVznQ-_PGoWmxSZV3Tbg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>, Doug Anderson <dianders@chromium.org>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, InKi Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, =?UTF-8?B?U3TDqXBoYW5lIE1hcmNoZXNpbg==?= <marcheu@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Ajay,

Am 03.07.2014 16:55, schrieb Ajay kumar:
> On Thu, Jul 3, 2014 at 10:49 AM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>> Am 11.06.2014 20:26, schrieb Ajay Kumar:
>>> This series is based on exynos-drm-next branch of Inki Dae's tree a=
t:
>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.gi=
t
>>>
>>> I have tested this after adding few DT changes for exynos5250-snow,
>>> exynos5420-peach-pit and exynos5800-peach-pi boards.
>>
>> Unfortunately this series per se does not yet fix my display issues =
on
>> the Spring Chromebook. Can you share what dt changes you made for Sn=
ow?
>>
>> Before, if the dp-controller dt node was present, I would get a dark
>> screen immediately and I could ssh into the system shortly after.
>> I worked around that by commenting the node out, which would allow m=
e to
>> graphically boot pretty much instantly.
>>
>> With these 10 patches applied on top of my dt on top of kgene's tree=
,
>> the last U-Boot screen stays visible for ~50 seconds, then the scree=
n
>> goes blank, and I can ssh in some time later.
>> If I comment out the dp-controller node again, it takes long for the
>> kernel boot to graphically proceed but works okay then.
>> In both cases there's a gap of ~2900 seconds visible in dmesg.
[...]
>> https://github.com/afaerber/linux/commits/spring-next
>> https://github.com/afaerber/u-boot/commits/spring
> You need to add bridge chip node and panel node to use my patch serie=
s.
> Also, to support that you need to enable tps65090 regulator on spring=
=2E
>=20
> I have attached a patch which adds the bridge chip node and panel nod=
e.

Wow, that's more help than I expected! Many thanks.

I'll strip down dp-controller accordingly for my v2.

Your dt changes level again with my commenting out dp-controller. So I
take it, the minute-long delay is regulator-induced somehow.

> Also, I have attached a sample config which I used to compile the ker=
nel.

I simply answered y to all your new options. :)

> Doug can help you in adding changes required for tps65090.

Hm, Doug had pointed out an issue with tps65090 in my v1, so I dropped
it: https://patchwork.kernel.org/patch/4397321/

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
