From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 01/16] ARM: dts: exynos4210: Replace legacy GPIO bank
 nodes with pinctrl bank nodes
Date: Wed, 10 Oct 2012 20:22:51 +0200
Message-ID: <96424007.y4zaCRkHIe@flatron>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
 <5075A1EF.60900@wwwdotorg.org> <20121010181253.GQ12552@atomide.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7476724617363955397=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121010181253.GQ12552@atomide.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-samsung-soc@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.

--===============7476724617363955397==
Content-Type: multipart/alternative; boundary="nextPart2330454.ke8rkMPPQu"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart2330454.ke8rkMPPQu
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dnia =C5=9Broda, 10 pa=C5=BAdziernika 2012 11:12:53 Tony Lindgren pisze=
:
> * Stephen Warren <swarren@wwwdotorg.org> [121010 09:36]:
> > On 10/10/2012 01:26 AM, Linus Walleij wrote:
> > > On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com>=
=20
wrote:
> > >> Seuqential patches from this series introduce SoC-specific data=20=

parsing
> > >> from device tree.
> > >>=20
> > >> This patch removes legacy GPIO bank nodes from exynos4210.dtsi a=
nd
> > >> replaces them with nodes and properties required for these patch=
es.
> > >=20
> > > So to be clear:
> > >> +       pinctrl-bank-types {
> > >> +               bank_off: bank-off {
> > >> +                       samsung,reg-names =3D "func", "dat", "pu=
d",
> > >> +                                               "drv", "conpdn",=

> > >> "pudpdn";
> > >> +                       samsung,reg-params =3D <0x00 4>, <0x04 1=
>,=20
<0x08
> > >> 2>,
> > >> +                                               <0x0C 2>, <0x10 =
2>,
> > >> <0x14 2>; +               };
> > >=20
> > > This is starting to look like a firmware language, I have mixed
> > > feelings about this. Shall this be read:
> > >=20
> > > "Poke 4 into 0x00, poke 1 into 0x04, poke 2 into 0x08" etc?
> > >=20
> > > We really need to discuss this, Grant has already NACK:ed
> > > such approaches once.
> >=20
> > Well, I don't think he NACK'd Tony Lindgren's generic pinctrl drive=
r,
> > which is doing this exact same thing. I did raise the same point ab=
out
> > Tony's driver when he posted it, but nobody seemed inclined to NACK=
 it
> > based on that at the time, IIRC...
>=20
> To summarize, using reg value pairs in DT makes sense if the amount
> of data is huge. Otherwise we'll be describing indidual hardware bits=

> as properties in DT, or have to have huge amounts of static data in
> the kernel.
>=20
> Where it does not make sense is if there's a sequence of reads
> and writes with test loops in between.. But that's does not look
> to be the case here.
>=20
> The reg value pairs will be readable when the DT preprocessing is
> available, and that allows the values to be orred together while
> DT properties don't. The alternative is to describe hardware register=

> bits as DT properties, which is very bloated.
>=20
> But considering all this.. Are the samsung,reg-names really needed
> by the kernel?

They are used to specify which registers are defined in reg-params prop=
erty=20
and in which order. Most of the registers are not mandatory and this is=
=20
needed to be able to specify only those that are present. At least I=20=

couldn't think of a better solution for this. Do you have some suggesti=
ons?

Best regards,
Tomasz Figa

--nextPart2330454.ke8rkMPPQu
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/=
REC-html40/strict.dtd">
<html><head><meta name=3D"qrichtext" content=3D"1" /><style type=3D"tex=
t/css">
p, li { white-space: pre-wrap; }
</style></head><body style=3D" font-family:'DejaVu Sans Mono'; font-siz=
e:9pt; font-weight:400; font-style:normal;">
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Dni=
a =C5=9Broda, 10 pa=C5=BAdziernika 2012 11:12:53 Tony Lindgren pisze:</=
p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; * Stephen Warren &lt;swarren@wwwdotorg.org&gt; [121010 09:36]:</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; On 10/10/2012 01:26 AM, Linus Walleij wrote:</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa &lt;t.figa@sam=
sung.com&gt; wrote:</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; Seuqential patches from this series introduce SoC-speci=
fic data parsing</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; from device tree.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; This patch removes legacy GPIO bank nodes from exynos42=
10.dtsi and</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; replaces them with nodes and properties required for th=
ese patches.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; So to be clear:</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; +       pinctrl-bank-types {</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; +               bank_off: bank-off {</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; +                       samsung,reg-names =3D &quot;fun=
c&quot;, &quot;dat&quot;, &quot;pud&quot;,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; +                                               &quot;d=
rv&quot;, &quot;conpdn&quot;,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; &quot;pudpdn&quot;;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; +                       samsung,reg-params =3D &lt;0x00=
 4&gt;, &lt;0x04 1&gt;, &lt;0x08</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; 2&gt;,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; +                                               &lt;0x0=
C 2&gt;, &lt;0x10 2&gt;,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt;&gt; &lt;0x14 2&gt;; +               };</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; This is starting to look like a firmware language, I have m=
ixed</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; feelings about this. Shall this be read:</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; &quot;Poke 4 into 0x00, poke 1 into 0x04, poke 2 into 0x08&=
quot; etc?</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; We really need to discuss this, Grant has already NACK:ed</=
p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; such approaches once.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Well, I don't think he NACK'd Tony Lindgren's generic pinctrl dr=
iver,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; which is doing this exact same thing. I did raise the same point=
 about</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Tony's driver when he posted it, but nobody seemed inclined to N=
ACK it</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; based on that at the time, IIRC...</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; To summarize, using reg value pairs in DT makes sense if the amount</=
p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; of data is huge. Otherwise we'll be describing indidual hardware bits=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; as properties in DT, or have to have huge amounts of static data in</=
p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; the kernel.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Where it does not make sense is if there's a sequence of reads</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; and writes with test loops in between.. But that's does not look</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; to be the case here.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; The reg value pairs will be readable when the DT preprocessing is</p>=

<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; available, and that allows the values to be orred together while</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; DT properties don't. The alternative is to describe hardware register=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; bits as DT properties, which is very bloated.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; But considering all this.. Are the samsung,reg-names really needed</p=
>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; by the kernel?</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">The=
y are used to specify which registers are defined in reg-params propert=
y and in which order. Most of the registers are not mandatory and this =
is needed to be able to specify only those that are present. At least I=
 couldn't think of a better solution for this. Do you have some suggest=
ions?</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Bes=
t regards,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Tom=
asz Figa</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p></body></html>
--nextPart2330454.ke8rkMPPQu--



--===============7476724617363955397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7476724617363955397==--
