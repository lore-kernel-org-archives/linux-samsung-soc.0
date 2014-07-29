From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH 0/3] drm/exynos: Allow module to be autoloaded
Date: Tue, 29 Jul 2014 13:59:51 +0200
Message-ID: <53D78CB7.6010806@suse.de>
References: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>	 <53CC82AC.9060301@samsung.com> <1405925419.7527.17.camel@dusk>	 <1406536246.15871.6.camel@dusk> <53D65B5D.1060505@samsung.com>	 <1406558722.29009.11.camel@dusk> <53D7335F.9020802@samsung.com> <1406621118.17890.11.camel@dusk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43094 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753240AbaG2L7y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 07:59:54 -0400
In-Reply-To: <1406621118.17890.11.camel@dusk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Am 29.07.2014 10:05, schrieb Sjoerd Simons:
> On Tue, 2014-07-29 at 14:38 +0900, Inki Dae wrote:
>> On 2014=EB=85=84 07=EC=9B=94 28=EC=9D=BC 23:45, Sjoerd Simons wrote:
>>> On Mon, 2014-07-28 at 23:17 +0900, Inki Dae wrote:
>>>> On 2014=EB=85=84 07=EC=9B=94 28=EC=9D=BC 17:30, Sjoerd Simons wrot=
e:
>>>> I don't see why Exynos drm driver should be auto-loaded module. I =
think
>>>> all devices covered by Exynos drm framework are not hot-plugged. M=
aybe
>>>> there is my missing point. So can you explain why Exynos drm drive=
r
>>>> should be auto-loaded module?
>>>
>>> The background for this is that I'm building a distribution-style
>>> multiplatform kernel, that is to say a kernel which can boot on a b=
ig
>>> set of different ARM boards. As such, the intention is to keep the =
core
>>> zImage as small as possible and essentially build things as far as
>>> possible as loadable modules. So in a sense, all of the hardware is
>>> "hotplugged", depending on which board the kernel is actually boote=
d on!
>>>
>>> For that use-case, exynosdrm needs to be able to build as a module
>>> (which it already can!) and it needs the required meta-data for
>>> userspace to know when it should be loaded. The latter is what my p=
atch
>>> adds.=20
>>
>> It seems that you want that module data of sub drivers are added by
>> depmod to /lib/modules/KERNEL_VERSION/modules.xxxmap because some
>> hot-plug system should use modules.xxxmap file to find the proper dr=
iver
>> to load.
>=20
> Yes. I would like the module to export its module alias information f=
or
> the subdrivers such that depmod can add it to its databases and the
> normal module autoloading mechanisms work as intended. Note that in m=
y
> case, "some hot-plug" system is really just udev, not something
> special..

+1 here.

While I haven't tested this on my Exynos devices yet since I'm still
working on -next kernels there, here's an example of such a 3.16 config=
:

http://kernel.opensuse.org/cgit/kernel-source/tree/config/armv7hl/defau=
lt

Of the platforms enabled, all drivers are configured as modules where
possible, to keep kernel size small, and dracut (or kiwi) is used to
generate an initrd that makes available the modules.

So it would certainly be good to have the DRM auto-load somehow, withou=
t
the user having to manually touch config files. In particular when I
think of the Chromebooks, where Wifi needs configuration on first boot
and no serial console is accessible.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
