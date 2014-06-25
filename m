From: YoungJun Cho <yj44.cho@gmail.com>
Subject: Re: [PATCH 0/3] drm/exynos: add framework to control DISP1BLK setting
Date: Thu, 26 Jun 2014 08:54:28 +0900
Message-ID: <CAOt82ecshdX9ALWYWT4u8QcF+NqJTEfUb6pka0D-9-btHJGM1Q@mail.gmail.com>
References: <1403705752-24469-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2133300781=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1403705752-24469-1-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, vikas.sajjan@samsung.com, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

--===============2133300781==
Content-Type: multipart/alternative; boundary=047d7b3a81e8f6b7e804fcb1cba0

--047d7b3a81e8f6b7e804fcb1cba0
Content-Type: text/plain; charset=UTF-8

Hi Ajay,

I'm sorry for say that the patchset for exynos drm supporting I80 i/f
includes yours.

The patchset is still in reviewing and I'm preparing v5.

Please check this:
http://www.spinics.net/lists/dri-devel/msg60943.html

Thank you.
Best regards YJ

On Jun 25, 2014 11:19 PM, "Ajay Kumar" <ajaykumar.rs@samsung.com> wrote:
>
> This series is based on exynos-drm-next branch of Inki Dae's tree at:
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>
> Exynos SOC have a DISP1BLK register where we can select
> the path for FIMD output. We can redirect the video data
> directly to DP/MIPI interface, or we can pass it via
> image enhancement chips.
>
> Since we don't use any image enhancement chips in exynos-drm,
> we need to set FIMD BYPASS in DISP1BLK.
>
> This patchset is tested for basic display + DPMS + S2R on snow and
peach_pit.
>
> Ajay Kumar (3):
>   [PATCH 1/3] drm/exynos: Control DISP1BLK system register in FIMD
>   [PATCH 2/3] ARM: dts: exynos5420: Add sysreg phandle to FIMD node
>   [PATCH 3/3] ARM: dts: exynos5250: Add sysreg phandle to FIMD node
>
>  .../devicetree/bindings/video/samsung-fimd.txt     |    2 ++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    1 +
>  arch/arm/boot/dts/exynos5420.dtsi                  |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   19
+++++++++++++++++++
>  include/video/samsung_fimd.h                       |    5 +++++
>  5 files changed, 28 insertions(+)
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe
linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--047d7b3a81e8f6b7e804fcb1cba0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Ajay,</p>
<p dir=3D"ltr">I&#39;m sorry for say that the patchset for exynos drm suppo=
rting I80 i/f includes yours.</p>
<p dir=3D"ltr">The patchset is still in reviewing and I&#39;m preparing v5.=
</p>
<p dir=3D"ltr">Please check this:<br>
<a href=3D"http://www.spinics.net/lists/dri-devel/msg60943.html">http://www=
.spinics.net/lists/dri-devel/msg60943.html</a></p>
<p dir=3D"ltr">Thank you.<br>
Best regards YJ</p>
<p dir=3D"ltr">On Jun 25, 2014 11:19 PM, &quot;Ajay Kumar&quot; &lt;<a href=
=3D"mailto:ajaykumar.rs@samsung.com">ajaykumar.rs@samsung.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; This series is based on exynos-drm-next branch of Inki Dae&#39;s tree =
at:<br>
&gt; git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/daeink=
i/drm-exynos.git">git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exyno=
s.git</a><br>
&gt;<br>
&gt; Exynos SOC have a DISP1BLK register where we can select<br>
&gt; the path for FIMD output. We can redirect the video data<br>
&gt; directly to DP/MIPI interface, or we can pass it via<br>
&gt; image enhancement chips.<br>
&gt;<br>
&gt; Since we don&#39;t use any image enhancement chips in exynos-drm,<br>
&gt; we need to set FIMD BYPASS in DISP1BLK.<br>
&gt;<br>
&gt; This patchset is tested for basic display + DPMS + S2R on snow and pea=
ch_pit.<br>
&gt;<br>
&gt; Ajay Kumar (3):<br>
&gt; =C2=A0 [PATCH 1/3] drm/exynos: Control DISP1BLK system register in FIM=
D<br>
&gt; =C2=A0 [PATCH 2/3] ARM: dts: exynos5420: Add sysreg phandle to FIMD no=
de<br>
&gt; =C2=A0 [PATCH 3/3] ARM: dts: exynos5250: Add sysreg phandle to FIMD no=
de<br>
&gt;<br>
&gt; =C2=A0.../devicetree/bindings/video/samsung-fimd.txt =C2=A0 =C2=A0 | =
=C2=A0 =C2=A02 ++<br>
&gt; =C2=A0arch/arm/boot/dts/exynos5250.dtsi =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +<br>
&gt; =C2=A0arch/arm/boot/dts/exynos5420.dtsi =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_drm_fimd.c =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 19 +++++++++++++++++++<br>
&gt; =C2=A0include/video/samsung_fimd.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A05 +++++<br>
&gt; =C2=A05 files changed, 28 insertions(+)<br>
&gt;<br>
&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
&gt; --<br>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe linux-s=
amsung-soc&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">=
majordomo@vger.kernel.org</a><br>
&gt; More majordomo info at =C2=A0<a href=3D"http://vger.kernel.org/majordo=
mo-info.html">http://vger.kernel.org/majordomo-info.html</a><br>
</p>

--047d7b3a81e8f6b7e804fcb1cba0--

--===============2133300781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2133300781==--
