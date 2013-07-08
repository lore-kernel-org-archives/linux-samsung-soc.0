From: Inki Dae <inki.dae@samsung.com>
Subject: Re: exynos-drm-next todo work.
Date: Mon, 8 Jul 2013 09:02:03 +0900
Message-ID: <CAAQKjZNV4F+v0O3NsiW7vXDpcm0SqNhUD1dXznZR8Y1GLkE_Tw@mail.gmail.com>
References: <007401ce6bed$bc802920$35807b60$%dae@samsung.com>
	<CAPdUM4M4fyiKUES-BW4BKBL_0nfPjNY5Fk_H7i2FUWyxhSv_nA@mail.gmail.com>
	<007e01ce6ca8$35c23a70$a146af50$%dae@samsung.com>
	<20130705181241.GH27646@sirena.org.uk>
	<CAF6AEGu_MV_898Vvg0NZOZ+uGH5q0cATzj8eoD7TFNv=istZdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1081264178=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAF6AEGu_MV_898Vvg0NZOZ+uGH5q0cATzj8eoD7TFNv=istZdw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Rob Clark <robdclark@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1081264178==
Content-Type: multipart/alternative; boundary=001a11c34414249f9404e0f4c140

--001a11c34414249f9404e0f4c140
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: quoted-printable

2013=B3=E2 7=BF=F9 8=C0=CF =BF=F9=BF=E4=C0=CF=BF=A1 Rob Clark<robdclark@gma=
il.com>=B4=D4=C0=CC =C0=DB=BC=BA:
> On Fri, Jul 5, 2013 at 2:12 PM, Mark Brown <broonie@kernel.org> wrote:
>> On Wed, Jun 19, 2013 at 01:48:15PM +0900, Inki Dae wrote:
>>
>>> > Related to HDMI sound support in Alsa, I have posted a working RFC
>>> > "exynos-hdmi to CDF complaint display driver". It registers a separat=
e
>>> > sound card by registering hdmi audio codec dai and cpu-dai, as you
>>> > mentioned. But there is a problem with this approach that I2S being
the
>>> > single cpu dai for HDMI and Speaker sound card, only one card can
>>> > support playback at a time.
>>
>>> > I would like to work on this to provide a more refined solution.
>>
>>> Thanks. However, I think it's not good to use the CDF framework to
interface
>>> between ALSA SoC DAI driver and DRM HDMI driver. The purpose of the CDF
>>> framework is to provide common interfaces to display bus drivers to
Linux
>>> framebuffer and DRM KMS based display controller drivers as long as I
know.
>>> So my opinion is to implement ALSA Soc DAI driver-it seems like
possible to
>>> use as is-based on a new common framework that the other can also use
it.
>>
>> You guys really want to be discussing this on the ALSA list and CCing
>> the ASoC maintainers...  I do note that OMAP and SH both have HDMI
>> support in mainline, whatever they're doing seems like a good place to
>> start.
>
> I don't know about SH, but at least OMAP (and I've seen same on MSM
> non-upstream driver, and I guess it is the same elsewhere), there end
> up being some calls from audio driver to functions exported by the
> display driver.  I guess there is probably some better way to do it
> compared to how the existing drivers work.
>

Agree with you. we had looked into omap driver that audio driver calls
callbacks of dss driver. For this, it seems possible to use common
framework between audio and hdmi driver like PHY framework does.

exynos audio---+             +--exynos hdmi
omap audio ----+--common fw--+--omap dss
other audio----+             +--other hdmi

Thanks,
Inki Dae


> BR,
> -R
>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--001a11c34414249f9404e0f4c140
Content-Type: text/html; charset=EUC-KR
Content-Transfer-Encoding: quoted-printable

<br><br>2013=B3=E2 7=BF=F9 8=C0=CF =BF=F9=BF=E4=C0=CF=BF=A1 Rob Clark&lt;<a=
 href=3D"mailto:robdclark@gmail.com">robdclark@gmail.com</a>&gt;=B4=D4=C0=
=CC =C0=DB=BC=BA:<br>&gt; On Fri, Jul 5, 2013 at 2:12 PM, Mark Brown &lt;<a=
 href=3D"mailto:broonie@kernel.org">broonie@kernel.org</a>&gt; wrote:<br>
&gt;&gt; On Wed, Jun 19, 2013 at 01:48:15PM +0900, Inki Dae wrote:<br>&gt;&=
gt;<br>&gt;&gt;&gt; &gt; Related to HDMI sound support in Alsa, I have post=
ed a working RFC<br>&gt;&gt;&gt; &gt; &quot;exynos-hdmi to CDF complaint di=
splay driver&quot;. It registers a separate<br>
&gt;&gt;&gt; &gt; sound card by registering hdmi audio codec dai and cpu-da=
i, as you<br>&gt;&gt;&gt; &gt; mentioned. But there is a problem with this =
approach that I2S being the<br>&gt;&gt;&gt; &gt; single cpu dai for HDMI an=
d Speaker sound card, only one card can<br>
&gt;&gt;&gt; &gt; support playback at a time.<br>&gt;&gt;<br>&gt;&gt;&gt; &=
gt; I would like to work on this to provide a more refined solution.<br>&gt=
;&gt;<br>&gt;&gt;&gt; Thanks. However, I think it&#39;s not good to use the=
 CDF framework to interface<br>
&gt;&gt;&gt; between ALSA SoC DAI driver and DRM HDMI driver. The purpose o=
f the CDF<br>&gt;&gt;&gt; framework is to provide common interfaces to disp=
lay bus drivers to Linux<br>&gt;&gt;&gt; framebuffer and DRM KMS based disp=
lay controller drivers as long as I know.<br>
&gt;&gt;&gt; So my opinion is to implement ALSA Soc DAI driver-it seems lik=
e possible to<br>&gt;&gt;&gt; use as is-based on a new common framework tha=
t the other can also use it.<br>&gt;&gt;<br>&gt;&gt; You guys really want t=
o be discussing this on the ALSA list and CCing<br>
&gt;&gt; the ASoC maintainers... &nbsp;I do note that OMAP and SH both have=
 HDMI<br>&gt;&gt; support in mainline, whatever they&#39;re doing seems lik=
e a good place to<br>&gt;&gt; start.<br>&gt;<br>&gt; I don&#39;t know about=
 SH, but at least OMAP (and I&#39;ve seen same on MSM<br>
&gt; non-upstream driver, and I guess it is the same elsewhere), there end<=
br>&gt; up being some calls from audio driver to functions exported by the<=
br>&gt; display driver. &nbsp;I guess there is probably some better way to =
do it<br>
&gt; compared to how the existing drivers work.<br>&gt;<br><br>Agree with y=
ou. we had looked into omap driver that audio driver calls callbacks of dss=
 driver. For this, it seems possible to use common framework between audio =
and hdmi driver like PHY framework does.<br>
<br>exynos audio---+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; +--exynos hd=
mi<br>omap audio ----+--common fw--+--omap dss<br>other audio----+ &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; +--other hdmi<br><br>Thanks,<br>Inki Dae<=
br><br><br>&gt; BR,<br>&gt; -R<br>&gt;<br>&gt;&gt; ________________________=
_______________________<br>
&gt;&gt; dri-devel mailing list<br>&gt;&gt; <a href=3D"mailto:dri-devel@lis=
ts.freedesktop.org">dri-devel@lists.freedesktop.org</a><br>&gt;&gt; <a href=
=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel">http://lists.f=
reedesktop.org/mailman/listinfo/dri-devel</a><br>
&gt;&gt;<br>&gt; _______________________________________________<br>&gt; dr=
i-devel mailing list<br>&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.=
org">dri-devel@lists.freedesktop.org</a><br>&gt; <a href=3D"http://lists.fr=
eedesktop.org/mailman/listinfo/dri-devel">http://lists.freedesktop.org/mail=
man/listinfo/dri-devel</a><br>
&gt;

--001a11c34414249f9404e0f4c140--

--===============1081264178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1081264178==--
