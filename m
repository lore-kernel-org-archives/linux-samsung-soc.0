From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] ARM: dts: Add G2D DT nodes to Exynos4 machines
Date: Tue, 12 Feb 2013 23:17:10 +0530
Message-ID: <CAK9yfHzb5+vaA2+4WOmzzsVEvuftTVN=M11K0nzfQmMNF01yLw@mail.gmail.com>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6545391479824743142=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360151477-26460-1-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============6545391479824743142==
Content-Type: multipart/alternative; boundary=e89a8ff1ce247580e704d58a9d4a

--e89a8ff1ce247580e704d58a9d4a
Content-Type: text/plain; charset=ISO-8859-1

Ping...

On Wednesday, 6 February 2013, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patch series is based on for-next branch of Kukjin Kim's tree
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>
> Patches added on top of MFC DT series which has been accepted by Kukjin.
> http://www.spinics.net/lists/linux-samsung-soc/msg15419.html
>
> Sachin Kamat (7):
>   ARM: dts: Add G2D node to exynos4210.dtsi
>   ARM: dts: Add G2D node to SMDKV310
>   ARM: dts: Add G2D node to exynos4210-origen
>   ARM: dts: Add G2D node to exynos4x12.dtsi
>   ARM: dts: Add G2D node to SMDK4412
>   ARM: dts: Add G2D node to exynos4412-origen
>   ARM: dts: Add Samsung G2D DT bindings documentation
>
>  .../devicetree/bindings/gpu/samsung-g2d.txt        |   30
++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210-origen.dts            |    4 ++
>  arch/arm/boot/dts/exynos4210-smdkv310.dts          |    4 ++
>  arch/arm/boot/dts/exynos4210.dtsi                  |    8 +++++
>  arch/arm/boot/dts/exynos4412-origen.dts            |    4 ++
>  arch/arm/boot/dts/exynos4412-smdk4412.dts          |    4 ++
>  arch/arm/boot/dts/exynos4x12.dtsi                  |    7 ++++
>  7 files changed, 61 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.txt
>
> --
> 1.7.4.1
>
>

-- 
With warm regards,
Sachin

--e89a8ff1ce247580e704d58a9d4a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br>Ping...<br><br>On Wednesday, 6 February 2013, Sachin Kamat &lt;<a href=
=3D"mailto:sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<=
br>&gt; This patch series is based on for-next branch of Kukjin Kim&#39;s t=
ree<br>
&gt; git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/kgene/=
linux-samsung.git">git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-sams=
ung.git</a><br>&gt;<br>&gt; Patches added on top of MFC DT series which has=
 been accepted by Kukjin.<br>
&gt; <a href=3D"http://www.spinics.net/lists/linux-samsung-soc/msg15419.htm=
l">http://www.spinics.net/lists/linux-samsung-soc/msg15419.html</a><br>&gt;=
<br>&gt; Sachin Kamat (7):<br>&gt; =A0 ARM: dts: Add G2D node to exynos4210=
.dtsi<br>
&gt; =A0 ARM: dts: Add G2D node to SMDKV310<br>&gt; =A0 ARM: dts: Add G2D n=
ode to exynos4210-origen<br>&gt; =A0 ARM: dts: Add G2D node to exynos4x12.d=
tsi<br>&gt; =A0 ARM: dts: Add G2D node to SMDK4412<br>&gt; =A0 ARM: dts: Ad=
d G2D node to exynos4412-origen<br>
&gt; =A0 ARM: dts: Add Samsung G2D DT bindings documentation<br>&gt;<br>&gt=
; =A0.../devicetree/bindings/gpu/samsung-g2d.txt =A0 =A0 =A0 =A0| =A0 30 ++=
++++++++++++++++++<br>&gt; =A0arch/arm/boot/dts/exynos4210-origen.dts =A0 =
=A0 =A0 =A0 =A0 =A0| =A0 =A04 ++<br>
&gt; =A0arch/arm/boot/dts/exynos4210-smdkv310.dts =A0 =A0 =A0 =A0 =A0| =A0 =
=A04 ++<br>&gt; =A0arch/arm/boot/dts/exynos4210.dtsi =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 =A08 +++++<br>&gt; =A0arch/arm/boot/dts/exynos4412-ori=
gen.dts =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++<br>&gt; =A0arch/arm/boot/dts/e=
xynos4412-smdk4412.dts =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++<br>
&gt; =A0arch/arm/boot/dts/exynos4x12.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A07 ++++<br>&gt; =A07 files changed, 61 insertions(+), 0 deletion=
s(-)<br>&gt; =A0create mode 100644 Documentation/devicetree/bindings/gpu/sa=
msung-g2d.txt<br>&gt;<br>
&gt; --<br>&gt; 1.7.4.1<br>&gt;<br>&gt;<br><br>-- <br><div>With warm regard=
s,</div>
<div>Sachin</div><br>

--e89a8ff1ce247580e704d58a9d4a--

--===============6545391479824743142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6545391479824743142==--
