From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Fri, 2 Jan 2015 13:10:14 +0000
Message-ID: <CAPj87rN4HZzDt5JBLyTRmKZs7XcOG=0ha7ZQf9hmjPAFgTyhYQ@mail.gmail.com>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com>
 <548ABAB6.6010200@collabora.co.uk> <3197445.qizQc0zeRb@avalon>
 <54914D7D.9060108@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0243660068=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54914D7D.9060108@collabora.co.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0243660068==
Content-Type: multipart/alternative; boundary=047d7bb03946b1973e050bab0f8d

--047d7bb03946b1973e050bab0f8d
Content-Type: text/plain; charset=UTF-8

Hi Ajay,

On 17 December 2014 at 09:31, Javier Martinez Canillas <
javier.martinez@collabora.co.uk> wrote:

> On 12/16/2014 12:37 AM, Laurent Pinchart wrote:
> >> You asked Ajay to change his series to use the video port and enpoints
> DT
> >> bindings instead of phandles, could you please review his latest
> version?
> >>
> >> I guess is now too late for 3.19 since we are in the middle of the merge
> >> window but it would be great if this series can at least made it to
> 3.20.
> >
> > I don't have time to review the series in details right now, but I'm
> happy
> > with the DT bindings, and have no big issue with the rest of the
> patches. I
> > don't really like the of_drm_find_bridge() concept introduced in 03/14
> but I
> > won't nack it given lack of time to implement an alternative proposal.
> It's an
> > internal API, it can always be reworked later anyway.
>
> Thanks a lot for taking the time to look at the DT bindings, then I guess
> that the series are finally ready to be merged?
>
> Ajay's series don't apply cleanly anymore because it has been a while since
> he posted it but he can rebase on top of 3.19-rc1 once it is released and
> re-resend.
>

Do you have any plans to rebase this so it's ready for merging?

Thierry, Daniel, Dave - whose tree would this be best to merge through?

Cheers,
Daniel

--047d7bb03946b1973e050bab0f8d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ajay,<div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On 17 December 2014 at 09:31, Javier Martinez Canillas <span dir=3D=
"ltr">&lt;<a href=3D"mailto:javier.martinez@collabora.co.uk" target=3D"_bla=
nk">javier.martinez@collabora.co.uk</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On 12/16/2014 12:37 AM, Laurent Pinchart wrote:<br><span c=
lass=3D"">&gt;&gt; You asked Ajay to change his series to use the video por=
t and enpoints DT<br>
&gt;&gt; bindings instead of phandles, could you please review his latest v=
ersion?<br>
&gt;&gt;<br>
&gt;&gt; I guess is now too late for 3.19 since we are in the middle of the=
 merge<br>
&gt;&gt; window but it would be great if this series can at least made it t=
o 3.20.<br>
&gt;<br>
&gt; I don&#39;t have time to review the series in details right now, but I=
&#39;m happy<br>
&gt; with the DT bindings, and have no big issue with the rest of the patch=
es. I<br>
&gt; don&#39;t really like the of_drm_find_bridge() concept introduced in 0=
3/14 but I<br>
&gt; won&#39;t nack it given lack of time to implement an alternative propo=
sal. It&#39;s an<br>
&gt; internal API, it can always be reworked later anyway.<br>
<br>
</span>Thanks a lot for taking the time to look at the DT bindings, then I =
guess<br>
that the series are finally ready to be merged?<br>
<br>
Ajay&#39;s series don&#39;t apply cleanly anymore because it has been a whi=
le since<br>
he posted it but he can rebase on top of 3.19-rc1 once it is released and<b=
r>
re-resend.<br></blockquote><div><br></div><div>Do you have any plans to reb=
ase this so it&#39;s ready for merging?</div><div><br></div><div>Thierry, D=
aniel, Dave - whose tree would this be best to merge through?</div><div><br=
></div><div>Cheers,</div><div>Daniel=C2=A0</div></div></div></div>

--047d7bb03946b1973e050bab0f8d--

--===============0243660068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0243660068==--
