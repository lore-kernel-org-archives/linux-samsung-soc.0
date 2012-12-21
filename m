From: jonghwan Choi <jhbird.choi@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: EXYNOS5: save CLK_TOP_SRC3 register before
 powergating
Date: Fri, 21 Dec 2012 10:37:07 +0900
Message-ID: <CAGZ6kuOmd_0o71ZZa_p52NR2Fn-vgA+WOWZpx+DUwHZcHTC41g@mail.gmail.com>
References: <CAPmaG0uqkRcoUBR8Gjv_+BSJ3hwxUCz0G-YKNQX=qvx83i6QOQ@mail.gmail.com>
 <1356006378-17441-4-git-send-email-prasanna.ps@samsung.com>
 <21192551.mmsSZImfn7@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5209401622745490288=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <21192551.mmsSZImfn7@flatron>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tomasz.figa@gmail.com
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org, Prasanna Kumar <prasanna.ps@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============5209401622745490288==
Content-Type: multipart/alternative; boundary=f46d044304dca970f704d152e2da

--f46d044304dca970f704d152e2da
Content-Type: text/plain; charset=ISO-8859-1

Hi~

This code should be changed.

I insert  this code (save/restore clock source register - CLK_SRC_TOP3)
temporary.

But we removed this code. And we use another  method to fix it.

I think this is not right way.

Thanks.



On Fri, Dec 21, 2012 at 6:06 AM, <tomasz.figa@gmail.com> wrote:

> Hi Prasanna,
>
> On Thursday 20 of December 2012 17:56:18 Prasanna Kumar wrote:
> > This patch adds a software workaround to the hardware
> > problem found in exynos5 while powergating.
> >
> > It is observed that CLK_TOP_SRC3 register gets modified if
> > the G-Scaler/MFC devices are power gated. The clock for G-Scaler gets
> > set to XXTI which results in the device running very slow .
> > A big drop in performance is noticed whilerunning the video.
> > This issue also occurs while powergating MFC.
> >
> > The value of clock source register is restored once the powergating
> > operation is completed.
>
> Is the problem really related to power gating at all? From what you
> described in comment in the code, it seems like it's a problem with
> suspend/resume, not power gating, so it should be rather saved on suspend
> and restored on resume. Please recheck clock save/restore part of power
> management code.
>
> Altering clock configuration registers from power domain code looks really
> ugly...
>
> Best regards,
> Tomasz Figa
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--f46d044304dca970f704d152e2da
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>Hi~<br></p>
<p>This code should be changed.</p>
<p>I insert =A0this code (save/restore clock source register - CLK_SRC_TOP3=
) temporary.</p>
<p>But we removed this code. And we use another =A0method to fix it.<br></p=
>
<p>I think this is not right way.<br></p>
<p>Thanks.</p>
<p>=A0<br><br></p>
<div class=3D"gmail_quote">On Fri, Dec 21, 2012 at 6:06 AM,  <span dir=3D"l=
tr">&lt;<a href=3D"mailto:tomasz.figa@gmail.com" target=3D"_blank">tomasz.f=
iga@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

Hi Prasanna,<br>
<div><br>
On Thursday 20 of December 2012 17:56:18 Prasanna Kumar wrote:<br>
&gt; This patch adds a software workaround to the hardware<br>
&gt; problem found in exynos5 while powergating.<br>
&gt;<br>
&gt; It is observed that CLK_TOP_SRC3 register gets modified if<br>
&gt; the G-Scaler/MFC devices are power gated. The clock for G-Scaler gets<=
br>
&gt; set to XXTI which results in the device running very slow .<br>
&gt; A big drop in performance is noticed whilerunning the video.<br>
&gt; This issue also occurs while powergating MFC.<br>
&gt;<br>
&gt; The value of clock source register is restored once the powergating<br=
>
&gt; operation is completed.<br>
<br>
</div>Is the problem really related to power gating at all? From what you<b=
r>
described in comment in the code, it seems like it&#39;s a problem with<br>
suspend/resume, not power gating, so it should be rather saved on suspend<b=
r>
and restored on resume. Please recheck clock save/restore part of power<br>
management code.<br>
<br>
Altering clock configuration registers from power domain code looks really<=
br>
ugly...<br>
<br>
Best regards,<br>
Tomasz Figa<br>
<div><div><br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org" targe=
t=3D"_blank">majordomo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</div></div></blockquote></div><br>

--f46d044304dca970f704d152e2da--


--===============5209401622745490288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5209401622745490288==--
