From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 0/3] drm/exynos: Allow module to be autoloaded
Date: Tue, 29 Jul 2014 14:43:51 +0100
Message-ID: <CAPj87rPcXYDAnAWmuzwuuT0t_FoTptU0Bh7Z9dn4NcKqC-6jLg@mail.gmail.com>
References: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>
 <53CC82AC.9060301@samsung.com> <1405925419.7527.17.camel@dusk>
 <1406536246.15871.6.camel@dusk> <53D65B5D.1060505@samsung.com>
 <1406558722.29009.11.camel@dusk> <53D7335F.9020802@samsung.com>
 <1406621118.17890.11.camel@dusk> <53D78CB7.6010806@suse.de>
 <53D793BF.8070603@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1715545385=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53D793BF.8070603@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1715545385==
Content-Type: multipart/alternative; boundary=089e010d8628e1cd1404ff553a00

--089e010d8628e1cd1404ff553a00
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Inki,

On 29 July 2014 13:29, Inki Dae <inki.dae@samsung.com> wrote:

> On 2014=EB=85=84 07=EC=9B=94 29=EC=9D=BC 20:59, Andreas F=C3=A4rber wrote=
:
> > Am 29.07.2014 10:05, schrieb Sjoerd Simons:
> >> Yes. I would like the module to export its module alias information fo=
r
> >> the subdrivers such that depmod can add it to its databases and the
> >> normal module autoloading mechanisms work as intended. Note that in my
> >> case, "some hot-plug" system is really just udev, not something
> >> special..
> >
> > +1 here.
> >
> > While I haven't tested this on my Exynos devices yet since I'm still
> > working on -next kernels there, here's an example of such a 3.16 config=
:
> >
> >
> http://kernel.opensuse.org/cgit/kernel-source/tree/config/armv7hl/default
> >
> > Of the platforms enabled, all drivers are configured as modules where
> > possible, to keep kernel size small, and dracut (or kiwi) is used to
> > generate an initrd that makes available the modules.
> >
> > So it would certainly be good to have the DRM auto-load somehow, withou=
t
> > the user having to manually touch config files. In particular when I
> > think of the Chromebooks, where Wifi needs configuration on first boot
> > and no serial console is accessible.
>
> Got it. will merge them. However, I'm not sure that Exynos drm should
> have hot-plug feature such as PCI base devices: all devices covered by
> Exynos drm framework cannot attached and detached to and from machine.
>

Thanks for merging these. Just wanted to reiterate that it is not about
hotplug at all: it is about delayed/conditional loading. There is no
expectation that these will be used in a hotplug manner, it is just about
being able to load them in the initrd without having to have explicit cases
for every single driver and device in userspace (which would make it much
harder to change the driver later).

Cheers,
Daniel

--089e010d8628e1cd1404ff553a00
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Inki,<div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On 29 July 2014 13:29, Inki Dae <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:inki.dae@samsung.com" target=3D"_blank">inki.dae@samsung.com</a>&gt;</=
span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 2014=EB=85=84 07=EC=9B=94 29=EC=9D=BC 20:=
59, Andreas F=C3=A4rber wrote:<br>
&gt; Am 29.07.2014 10:05, schrieb Sjoerd Simons:<br>
<div class=3D"">&gt;&gt; Yes. I would like the module to export its module =
alias information for<br></div>
&gt;&gt; the subdrivers such that depmod can add it to its databases and th=
e<br>
&gt;&gt; normal module autoloading mechanisms work as intended. Note that i=
n my<br>
&gt;&gt; case, &quot;some hot-plug&quot; system is really just udev, not so=
mething<br>
&gt;&gt; special..<br>
&gt;<br>
&gt; +1 here.<br>
&gt;<br>
&gt; While I haven&#39;t tested this on my Exynos devices yet since I&#39;m=
 still<br>
&gt; working on -next kernels there, here&#39;s an example of such a 3.16 c=
onfig:<br>
&gt;<br>
&gt; <a href=3D"http://kernel.opensuse.org/cgit/kernel-source/tree/config/a=
rmv7hl/default" target=3D"_blank">http://kernel.opensuse.org/cgit/kernel-so=
urce/tree/config/armv7hl/default</a><br>
&gt;<br>
&gt; Of the platforms enabled, all drivers are configured as modules where<=
br>
&gt; possible, to keep kernel size small, and dracut (or kiwi) is used to<b=
r>
&gt; generate an initrd that makes available the modules.<br>
&gt;<br>
&gt; So it would certainly be good to have the DRM auto-load somehow, witho=
ut<br>
&gt; the user having to manually touch config files. In particular when I<b=
r>
&gt; think of the Chromebooks, where Wifi needs configuration on first boot=
<br>
&gt; and no serial console is accessible.<br>
<br>
Got it. will merge them. However, I&#39;m not sure that Exynos drm should<b=
r>
have hot-plug feature such as PCI base devices: all devices covered by<br>
Exynos drm framework cannot attached and detached to and from machine.<br><=
/blockquote><div><br></div><div>Thanks for merging these. Just wanted to re=
iterate that it is not about hotplug at all: it is about delayed/conditiona=
l loading. There is no expectation that these will be used in a hotplug man=
ner, it is just about being able to load them in the initrd without having =
to have explicit cases for every single driver and device in userspace (whi=
ch would make it much harder to change the driver later).</div>
<div><br></div><div>Cheers,</div><div>Daniel=C2=A0</div></div></div></div>

--089e010d8628e1cd1404ff553a00--

--===============1715545385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1715545385==--
