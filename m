From: Kyuho Choi <chlrbgh0@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Add support for ORIGEN4QUAD board
Date: Tue, 20 Nov 2012 14:04:04 +0900
Message-ID: <CAP2JTQ+KW0agS_4gNvfFJRoA7-sogb4=8Pu5MvDMfYxyus-o_Q@mail.gmail.com>
References: <1353345846-31355-1-git-send-email-kh.choi@insignal.co.kr>
 <0b6801cdc6d8$e98c1600$bca44200$@org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4076470103184565164=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0b6801cdc6d8$e98c1600$bca44200$@org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Kyuho Choi <kh.choi@insignal.co.kr>, linux-samsung-soc@vger.kernel.org, "jhkim@insignal.co.kr" <jhkim@insignal.co.kr>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============4076470103184565164==
Content-Type: multipart/alternative; boundary=e89a8f3ba029f03b7d04cee62a5b

--e89a8f3ba029f03b7d04cee62a5b
Content-Type: text/plain; charset=UTF-8

2012/11/20 Kukjin Kim <kgene@kernel.org>

> chlrbgh0@gmail.com wrote:
> >
> > From: Kyuho Choi <kh.choi@insignal.co.kr>
> >
> > This patch add support for Insignal ORIGEN4QUAD board.
> > ORIGEN4QUAD board based on Samsung Exynos4412 SoC.
> >
> > Signed-off-by: Kyuho Choi <kh.choi@insignal.co.kr>
> > ---
> >  arch/arm/mach-exynos/Kconfig       |    1 +
> >  arch/arm/mach-exynos/mach-origen.c |   74
> +++++++++++++++++++++++++++-----
> > ---
> >  2 files changed, 58 insertions(+), 17 deletions(-)
> >
> Hmm...at this moment, I don't want to update non-DT stuff for exynos,
> because I have a plan to move on supporting only DT for all of exynos next
> time.
>
> Please submit DT patches for the ORIGEN4QUAD board.
>
> Thanks.
>
Okay. I'll prepare and submit DT patches for ORIGEN4QUAD board. :)

>
> K-Gene <kgene@kernel.org>
>
>

--e89a8f3ba029f03b7d04cee62a5b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><div class=3D"gmail_quote">2012/11/20 Kukjin=
 Kim <span dir=3D"ltr">&lt;<a href=3D"mailto:kgene@kernel.org" target=3D"_b=
lank">kgene@kernel.org</a>&gt;</span><br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D"im"><a href=3D"mailto:chlrbgh0@gmail.com">chlrbgh0@gmail.com<=
/a> wrote:<br>
&gt;<br>
&gt; From: Kyuho Choi &lt;<a href=3D"mailto:kh.choi@insignal.co.kr">kh.choi=
@insignal.co.kr</a>&gt;<br>
&gt;<br>
&gt; This patch add support for Insignal ORIGEN4QUAD board.<br>
&gt; ORIGEN4QUAD board based on Samsung Exynos4412 SoC.<br>
&gt;<br>
&gt; Signed-off-by: Kyuho Choi &lt;<a href=3D"mailto:kh.choi@insignal.co.kr=
">kh.choi@insignal.co.kr</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0arch/arm/mach-exynos/Kconfig =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A01 +<br>
&gt; =C2=A0arch/arm/mach-exynos/mach-origen.c | =C2=A0 74<br>
+++++++++++++++++++++++++++-----<br>
&gt; ---<br>
&gt; =C2=A02 files changed, 58 insertions(+), 17 deletions(-)<br>
&gt;<br>
</div>Hmm...at this moment, I don&#39;t want to update non-DT stuff for exy=
nos,<br>
because I have a plan to move on supporting only DT for all of exynos next<=
br>
time.<br>
<br>
Please submit DT patches for the ORIGEN4QUAD board.<br>
<br>
Thanks.<br></blockquote><div>Okay. I&#39;ll prepare and submit DT patches f=
or ORIGEN4QUAD board. :)</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
K-Gene &lt;<a href=3D"mailto:kgene@kernel.org">kgene@kernel.org</a>&gt;<br>
<br>
</blockquote></div><br></div>

--e89a8f3ba029f03b7d04cee62a5b--


--===============4076470103184565164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4076470103184565164==--
