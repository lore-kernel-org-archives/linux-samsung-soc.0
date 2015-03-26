From: Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH] drm: Exynos: Respect framebuffer pitch for FIMD/Mixer
Date: Thu, 26 Mar 2015 14:48:27 +0000
Message-ID: <1427381307.28393.10@mail.collabora.com>
References: <1426598698-31095-1-git-send-email-daniels@collabora.com>
 <CABxcv==Z0ccmR-3Hasnkmg14m3hBJEwha=6c6288jQPUhyQt-g@mail.gmail.com>
 <5514187E.60405@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0122348765=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5514187E.60405@samsung.com>
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
Cc: Javier Martinez Canillas <javier@dowhile0.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0122348765==
Content-Type: multipart/alternative; boundary="=-5W8LOMhruZ2/AsQ1k8Ds"

--=-5W8LOMhruZ2/AsQ1k8Ds
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Inki,

On Thu, 26 Mar, 2015 at 2:32 PM, Inki Dae <inki.dae@samsung.com> wrote:
> Applied.

Thanks very much.

> Could you use right prefix of the subject like below when you post=20
> patch?
>=20
> 'drm/exynos: ...', not 'drm: Exynos: ...'
>=20
> Your email will be filtered from my mailbox if you don't use the right
> prefix so I couldn't check and take care of your patch.

Ah, I didn't realise this. Maybe it could be good to not filter if the=20
patch is also directly addressed/CCed to you, rather than a list?=20
Gustavo Padovan is following this convention and I also will in future,=20
but I guess it might lead to some patches being dropped from casual=20
contributors if they don't know this.

Cheers,
Daniel

>=20
> Thanks,
> Inki Dae
>=20
> On 2015=EB=85=84 03=EC=9B=94 24=EC=9D=BC 17:57, Javier Martinez Canillas =
wrote:
>>  Hello Inki,
>>=20
>>  On Tue, Mar 17, 2015 at 2:24 PM, Daniel Stone=20
>> <daniels@collabora.com> wrote:
>>>  When performing a modeset, use the framebuffer pitch value to set=20
>>> FIMD
>>>  IMG_SIZE and Mixer SPAN registers. These are both defined as pitch=20
>>> - the
>>>  distance between contiguous lines (bytes for FIMD, pixels for=20
>>> mixer).
>>>=20
>>>  Fixes display on Snow (1366x768).
>>>=20
>>>  Signed-off-by: Daniel Stone <daniels@collabora.com>
>>>  Tested-by: Javier Martinez Canillas=20
>>> <javier.martinez@collabora.co.uk>
>>=20
>>  Any comments on this patch? It would be great to pick this sooner
>>  rather than later since it fixes (at least) display output on Snow=20
>> and
>>  HDMI output on Peach Pit/Pi.
>>=20
>>  Best regards,
>>  Javier
>>=20
>=20
>=20
=

--=-5W8LOMhruZ2/AsQ1k8Ds
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Inki,<br><br>On Thu, 26 Mar, 2015 at 2:32 PM, Inki Dae &lt;inki.dae@sams=
ung.com&gt; wrote:<br>
<blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: pr=
e-wrap;">Applied.</div></blockquote><div><br></div><div>Thanks very much.</=
div><br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-s=
pace: pre-wrap;">Could you use right prefix of the subject like below when =
you post patch?

'drm/exynos: ...', not 'drm: Exynos: ...'

Your email will be filtered from my mailbox if you don't use the right
prefix so I couldn't check and take care of your patch.</div></blockquote><=
div><br></div><div>Ah, I didn't realise this. Maybe it could be good to not=
 filter if the patch is also directly addressed/CCed to you, rather than a =
list? Gustavo Padovan is following this convention and I also will in futur=
e, but I guess it might lead to some patches being dropped from casual cont=
ributors if they don't know this.</div><div><br></div><div>Cheers,</div><di=
v>Daniel</div><br><blockquote type=3D"cite"><div class=3D"plaintext" style=
=3D"white-space: pre-wrap;">
Thanks,
Inki Dae

On 2015=EB=85=84 03=EC=9B=94 24=EC=9D=BC 17:57, Javier Martinez Canillas wr=
ote:
<blockquote> Hello Inki,
=20
 On Tue, Mar 17, 2015 at 2:24 PM, Daniel Stone &lt;<a href=3D"mailto:daniel=
s@collabora.com">daniels@collabora.com</a>&gt; wrote:
<blockquote> When performing a modeset, use the framebuffer pitch value to =
set FIMD
 IMG_SIZE and Mixer SPAN registers. These are both defined as pitch - the
 distance between contiguous lines (bytes for FIMD, pixels for mixer).

 Fixes display on Snow (1366x768).

 Signed-off-by: Daniel Stone &lt;<a href=3D"mailto:daniels@collabora.com">d=
aniels@collabora.com</a>&gt;
 Tested-by: Javier Martinez Canillas &lt;<a href=3D"mailto:javier.martinez@=
collabora.co.uk">javier.martinez@collabora.co.uk</a>&gt;
</blockquote>=20
 Any comments on this patch? It would be great to pick this sooner
 rather than later since it fixes (at least) display output on Snow and
 HDMI output on Peach Pit/Pi.
=20
 Best regards,
 Javier
=20
</blockquote>

</div></blockquote>=

--=-5W8LOMhruZ2/AsQ1k8Ds--


--===============0122348765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0122348765==--
