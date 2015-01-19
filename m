From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 01/29] drm/exynos/fimd: only finish pageflip if START ==
 START_S
Date: Mon, 19 Jan 2015 16:35:07 +0000
Message-ID: <CAPj87rPgZ6RvjP2H6VZL-FMCLzBWm2QSByR+7duF7mU2jid8rQ@mail.gmail.com>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
 <1418911135-5207-2-git-send-email-gustavo@padovan.org>
 <54A2B13F.1030908@samsung.com> <20150112211327.GF2001@joana>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0135256930=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150112211327.GF2001@joana>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0135256930==
Content-Type: multipart/alternative; boundary=001a11c223a2bcd3af050d03e749

--001a11c223a2bcd3af050d03e749
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 12 January 2015 at 21:13, Gustavo Padovan <gustavo@padovan.org> wrote:

> 2014-12-30 Inki Dae <inki.dae@samsung.com>:
> > On 2014=EB=85=84 12=EC=9B=94 18=EC=9D=BC 22:58, Gustavo Padovan wrote:
> > > +    * This works around a race between a page_flip request and the
> latency
> > > +    * between vblank interrupt and this irq_handler:
> > > +    *   =3D> FIMD vblank: BUF_START_S[0] :=3D BUF_START[0], and asse=
rts
> irq
> > > +    *   | =3D> fimd_win_commit(0) writes new BUF_START[0]
> > > +    *   |    exynos_drm_crtc_try_do_flip() marks exynos_fb as prepar=
ed
> > > +    *   =3D> fimd_irq_handler()
> > > +    *       exynos_drm_crtc_finish_pageflip() sees prepared exynos_f=
b,
> > > +    *           and unmaps "old" fb
> > > +    *   =3D=3D> but, since BUF_START_S[0] still points to that "old"=
 fb...
> > > +    *   =3D=3D> FIMD iommu fault
> > > +    */
> > > +   start =3D readl(ctx->regs + VIDWx_BUF_START(0, 0));
> > > +   start_s =3D readl(ctx->regs + VIDWx_BUF_START_S(0, 0));
> > > +   if (start =3D=3D start_s)
> > >             exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
> > And what if 'start_s' has a value different from one of 'start'? Is it
> > ok to skip finish_pageflip request this time? Shouldn't it ensure to
> > wait for that until 'start_s' has a value same as one of 'start'?
>
> I think it is okay to skip finish_pageflip, but we could return directly
> if they are different, so we keep the wait_vsync_queue running until the
> next
> irq happens or it timeouts. How does this look to you?
>

Right, you'd need to keep the vblank IRQ alive until start =3D=3D start_s.

As an aside, there is currently some refcounting code (e.g. in the DPMS off
and/or framebuffer final-unref paths if I remember correctly) which assumes
that waiting one vblank is enough to be able to unpin resources. Obviously,
as this patch shows, this is not actually true. This patch doesn't make
this any better or worse; just something to bear in mind. (I have WIP code
which fixes this.)

Cheers,
Daniel

--001a11c223a2bcd3af050d03e749
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On 12 January 2015 at 21:13, Gustavo Padovan <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:gustavo@padovan.org" target=3D"_blank">gustavo@padovan.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">2014-12-30 Inki Dae &l=
t;<a href=3D"mailto:inki.dae@samsung.com">inki.dae@samsung.com</a>&gt;:<div=
><div class=3D"h5">
&gt; On 2014=EB=85=84 12=EC=9B=94 18=EC=9D=BC 22:58, Gustavo Padovan wrote:=
<br>&gt; &gt; +=C2=A0 =C2=A0 * This works around a race between a page_flip=
 request and the latency<br>
&gt; &gt; +=C2=A0 =C2=A0 * between vblank interrupt and this irq_handler:<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 =C2=A0=3D&gt; FIMD vblank: BUF_START_S[0] =
:=3D BUF_START[0], and asserts irq<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 =C2=A0| =3D&gt; fimd_win_commit(0) writes =
new BUF_START[0]<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 =C2=A0|=C2=A0 =C2=A0 exynos_drm_crtc_try_d=
o_flip() marks exynos_fb as prepared<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 =C2=A0=3D&gt; fimd_irq_handler()<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0exynos_drm_crtc_finish=
_pageflip() sees prepared exynos_fb,<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and unma=
ps &quot;old&quot; fb<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 =C2=A0=3D=3D&gt; but, since BUF_START_S[0]=
 still points to that &quot;old&quot; fb...<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 =C2=A0=3D=3D&gt; FIMD iommu fault<br>
&gt; &gt; +=C2=A0 =C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0start =3D readl(ctx-&gt;regs + VIDWx_BUF_START(0, 0=
));<br>
&gt; &gt; +=C2=A0 =C2=A0start_s =3D readl(ctx-&gt;regs + VIDWx_BUF_START_S(=
0, 0));<br>
&gt; &gt; +=C2=A0 =C2=A0if (start =3D=3D start_s)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exynos_drm_crtc_fi=
nish_pageflip(ctx-&gt;drm_dev, ctx-&gt;pipe);<br>
&gt;<span style=3D"color:rgb(34,34,34)">=C2=A0And what if &#39;start_s&#39;=
 has a value different from one of &#39;start&#39;? Is it</span><br></div><=
/div><span class=3D"">
&gt; ok to skip finish_pageflip request this time? Shouldn&#39;t it ensure =
to<br>
&gt; wait for that until &#39;start_s&#39; has a value same as one of &#39;=
start&#39;?<br>
<br>
</span>I think it is okay to skip finish_pageflip, but we could return dire=
ctly<br>
if they are different, so we keep the wait_vsync_queue running until the ne=
xt<br>
irq happens or it timeouts. How does this look to you?<br></blockquote><div=
><br></div><div>Right, you&#39;d need to keep the vblank IRQ alive until st=
art =3D=3D start_s.</div><div><br></div><div>As an aside, there is currentl=
y some refcounting code (e.g. in the DPMS off and/or framebuffer final-unre=
f paths if I remember correctly) which assumes that waiting one vblank is e=
nough to be able to unpin resources. Obviously, as this patch shows, this i=
s not actually true. This patch doesn&#39;t make this any better or worse; =
just something to bear in mind. (I have WIP code which fixes this.)</div><d=
iv><br></div><div>Cheers,</div><div>Daniel</div></div></div></div>

--001a11c223a2bcd3af050d03e749--

--===============0135256930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0135256930==--
