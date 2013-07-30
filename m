From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
	reg control
Date: Tue, 30 Jul 2013 09:12:43 +0530
Message-ID: <CAPdUM4O7cbBEEc4VdmcyryqFxpek6SsEcG-g-KyxwVypdwJnaw@mail.gmail.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
	<CAAQKjZMuSQhbYtOyni-RdHhXu0fv3U2Dm_2iqRLe0smSt_jjjQ@mail.gmail.com>
	<CAAQKjZOZCtLnE_OPs60NU+Z4pkHiSCqZcBOi1Dv+PC=01HKqyg@mail.gmail.com>
	<CAPdUM4Nis0uwyZf1hNDOMmdqFm0K7beVPoyAWRjMBwq0jcwwCQ@mail.gmail.com>
	<51B98908.8050403@samsung.com>
	<02c101ce6828$29ab0f20$7d012d60$%dae@samsung.com>
	<51B9C0ED.2040605@ti.com> <51BAB398.8090409@samsung.com>
	<CAPdUM4PK7K+Vw6umnehDubLD37jiWdcd4iXX2DJvHS8990LQGQ@mail.gmail.com>
	<51C04688.3090205@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1941078542=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <51C04688.3090205@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-samsung-soc@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, sw0312.kim@samsung.com, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, grant.likely@linaro.org, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1941078542==
Content-Type: multipart/alternative; boundary=089e01419fc4ce4f2204e2b266d9

--089e01419fc4ce4f2204e2b266d9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2013 at 5:07 PM, Kishon Vijay Abraham I <kishon@ti.com>wrot=
e:

> Hi,
>
> On Tuesday 18 June 2013 03:33 PM, Rahul Sharma wrote:
> > Thanks all,
> >
> > On Fri, Jun 14, 2013 at 11:39 AM, =EA=B9=80=EC=8A=B9=EC=9A=B0 <sw0312.k=
im@samsung.com> wrote:
> >> Hello Kishon,
> >>
> >> On 2013=EB=85=84 06=EC=9B=94 13=EC=9D=BC 21:54, Kishon Vijay Abraham I=
 wrote:
> >>> Hi,
> >>>
> >>> On Thursday 13 June 2013 04:51 PM, Inki Dae wrote:
> >>>>
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: Sylwester Nawrocki [mailto:s.nawrocki@samsung.com]
> >>>>> Sent: Thursday, June 13, 2013 5:56 PM
> >>>>> To: Rahul Sharma
> >>>>> Cc: Rahul Sharma; Inki Dae; linux-samsung-soc@vger.kernel.org;
> >>>>> devicetree-
> >>>>> discuss@lists.ozlabs.org; DRI mailing list; Kukjin Kim; Seung-Woo
> Kim;
> >>>>> Sean Paul; sunil joshi; Kishon Vijay Abraham I; Stephen Warren;
> >>>>> grant.likely@linaro.org
> >>>>> Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock
> with
> >>>>> pmu reg control
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> On 06/13/2013 06:26 AM, Rahul Sharma wrote:
> >>>>>> Mr. Dae,
> >>>>>>
> >>>>>> Thanks for your valuable inputs.
> >>>>>>
> >>>>>> I posted it as RFC because, I also have received comments to
> register
> >>>>>> hdmiphy as a clock controller. As we always configure it for
> specific
> >>>>>> frequency, hdmi-phy looks similar to a PLL. But it really doesn't
> >>>>>> belong to that class. Secondly prior to exynos5420, it was a i2c
> >>>>>> device. I am not sure we can register a I2C device as a clock
> >>>>>> controller. I wanted to discuss and explore this option here.
> >>>>>
> >>>>> Have you considered using the generic PHY framework for those HDMI
> >>>>> PHY devices [1] ? I guess we could add a dedicated group of ops for
> >>>>> video PHYs, similarly as is is done with struct v4l2_subdev_ops. Fo=
r
> >>>>> configuring things like the carrier/pixel clock frequency or anythi=
ng
> >>>>> what's common across the video PHYs.
> >>>>>
> >>>>> Perhaps you could have a look and see if this framework would be
> >>>>> useful for HDMI and possibly point out anything what might be
> missing ?
> >>>>>
> >>>>> I'm not sure it it really solves the issues specific to the Exynos
> >>>>> HDMI but at least with a generic PHY driver the PHY module would be
> >>>>> separate from the PHY controller, as often same HDMI DPHY can be us=
ed
> >>>>> with various types of a HDMI controller. So this would allow to not
> >>>>> duplicate the HDMI PHY drivers in the long-term perspective.
> >>>>
> >>>> Yeah, at least, it seems that we could use PHY module to control PMU
> >>>> register, HDMI_PHY_CONTROL. However, PHY module provides only
> init/on/off
> >>>> callbacks. As you may know, HDMIPHY needs i2c interfaces to control
> >>>> HDMIPHY
> >>>> clock. So with PHY module, HDMIPHY driver could enable PMU more
> >>>> generically,
> >>>> but also has to use existing i2c stuff to control HDMIPHY clock. I
> had a
> >>>> quick review to Generic PHY Framework[v6] but I didn't see that the
> PHY
> >>>> module could generically support more features such as i2c stuff.
> >>>
> >>> I don't think PHY framework needs to provide i2c interfaces to progra=
m
> >>> certain configurations. Instead in one of the callbacks (init/on/off)
> >>> PHY driver can program whatever it wants using any of the interfaces =
it
> >>> needs. IMO PHY framework should work independent of the interfaces.
> >>
> >> In exnoys hdmi case, i2c interface is not the exact issue. In exynos
> >> hdmi, hdmiphy should send i2c configuration about video clock
> >> information as the video mode information including resolution, bit pe=
r
> >> pixel, refresh rate passed from drm subsystem. So init/on/off callback=
s
> >> of phy framework are not enough for exynos hdmiphy and it should have =
a
> >> callback to set video mode.
> >>
> >> Do you have plan to add driver specific extend callback pointers to ph=
y
> >> framework?
> >>
> >> Currently, hdmi directly calls phy operations, but Rahul's another pat=
ch
> >> set, mentioned by Inki, divides hdmi and hdmiphy and hdmi and hdmiphy =
is
> >> connected with exynos hdmi own sub driver callback operations.
> >>
> >> IMHO, if phy framework can support extend callback feature, then this
> >> own sub driver callbacks can be replaced with phy framework at long te=
rm
> >> view.
> >
> > Extended callbacks are always welcome. I can also use phy device
> > private data to pass on private ops like get_pixelclk and set_pixelclk.
>
> I would recommend creating a wrapper to the existing PHY framework
> for HDMI PHY. That way, we can have other HDMI phys added
> easily. We need to figure out all the ops that might be needed by the
> HDMI PHY to be added to the wrapper.
> IMO extended callbacks can lead to abuse of the system and should be
> used only when absolutely necessary.
>
> Thanks
> Kishon
>

Thanks Kishon,

I have started working on this wrapper layer which is customized for video
phys.
As if now, adding set_dv_timing, get_dv_timing as the only additional
callbacks.
I will post the RFC patches.

regards,
Rahul Sharma.

--089e01419fc4ce4f2204e2b266d9
Content-Type: text/html; charset=EUC-KR
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Tue, Jun 18, 2013 at 5:07 PM, Kishon =
Vijay Abraham I <span dir=3D"ltr">&lt;<a href=3D"mailto:kishon@ti.com" targ=
et=3D"_blank">kishon@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
Hi,<br>
<div><div class=3D"h5"><br>
On Tuesday 18 June 2013 03:33 PM, Rahul Sharma wrote:<br>
&gt; Thanks all,<br>
&gt;<br>
&gt; On Fri, Jun 14, 2013 at 11:39 AM, =B1=E8=BD=C2=BF=EC &lt;<a href=3D"ma=
ilto:sw0312.kim@samsung.com">sw0312.kim@samsung.com</a>&gt; wrote:<br>
&gt;&gt; Hello Kishon,<br>
&gt;&gt;<br>
&gt;&gt; On 2013=B3=E2 06=BF=F9 13=C0=CF 21:54, Kishon Vijay Abraham I wrot=
e:<br>
&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Thursday 13 June 2013 04:51 PM, Inki Dae wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt;&gt; From: Sylwester Nawrocki [mailto:<a href=3D"mailto:s.n=
awrocki@samsung.com">s.nawrocki@samsung.com</a>]<br>
&gt;&gt;&gt;&gt;&gt; Sent: Thursday, June 13, 2013 5:56 PM<br>
&gt;&gt;&gt;&gt;&gt; To: Rahul Sharma<br>
&gt;&gt;&gt;&gt;&gt; Cc: Rahul Sharma; Inki Dae; <a href=3D"mailto:linux-sa=
msung-soc@vger.kernel.org">linux-samsung-soc@vger.kernel.org</a>;<br>
&gt;&gt;&gt;&gt;&gt; devicetree-<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:discuss@lists.ozlabs.org">discuss@li=
sts.ozlabs.org</a>; DRI mailing list; Kukjin Kim; Seung-Woo Kim;<br>
&gt;&gt;&gt;&gt;&gt; Sean Paul; sunil joshi; Kishon Vijay Abraham I; Stephe=
n Warren;<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:grant.likely@linaro.org">grant.likel=
y@linaro.org</a><br>
&gt;&gt;&gt;&gt;&gt; Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy =
hdmiphy clock with<br>
&gt;&gt;&gt;&gt;&gt; pmu reg control<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 06/13/2013 06:26 AM, Rahul Sharma wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; Mr. Dae,<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Thanks for your valuable inputs.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I posted it as RFC because, I also have received c=
omments to register<br>
&gt;&gt;&gt;&gt;&gt;&gt; hdmiphy as a clock controller. As we always config=
ure it for specific<br>
&gt;&gt;&gt;&gt;&gt;&gt; frequency, hdmi-phy looks similar to a PLL. But it=
 really doesn&#39;t<br>
&gt;&gt;&gt;&gt;&gt;&gt; belong to that class. Secondly prior to exynos5420=
, it was a i2c<br>
&gt;&gt;&gt;&gt;&gt;&gt; device. I am not sure we can register a I2C device=
 as a clock<br>
&gt;&gt;&gt;&gt;&gt;&gt; controller. I wanted to discuss and explore this o=
ption here.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Have you considered using the generic PHY framework fo=
r those HDMI<br>
&gt;&gt;&gt;&gt;&gt; PHY devices [1] ? I guess we could add a dedicated gro=
up of ops for<br>
&gt;&gt;&gt;&gt;&gt; video PHYs, similarly as is is done with struct v4l2_s=
ubdev_ops. For<br>
&gt;&gt;&gt;&gt;&gt; configuring things like the carrier/pixel clock freque=
ncy or anything<br>
&gt;&gt;&gt;&gt;&gt; what&#39;s common across the video PHYs.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Perhaps you could have a look and see if this framewor=
k would be<br>
&gt;&gt;&gt;&gt;&gt; useful for HDMI and possibly point out anything what m=
ight be missing ?<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I&#39;m not sure it it really solves the issues specif=
ic to the Exynos<br>
&gt;&gt;&gt;&gt;&gt; HDMI but at least with a generic PHY driver the PHY mo=
dule would be<br>
&gt;&gt;&gt;&gt;&gt; separate from the PHY controller, as often same HDMI D=
PHY can be used<br>
&gt;&gt;&gt;&gt;&gt; with various types of a HDMI controller. So this would=
 allow to not<br>
&gt;&gt;&gt;&gt;&gt; duplicate the HDMI PHY drivers in the long-term perspe=
ctive.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Yeah, at least, it seems that we could use PHY module to c=
ontrol PMU<br>
&gt;&gt;&gt;&gt; register, HDMI_PHY_CONTROL. However, PHY module provides o=
nly init/on/off<br>
&gt;&gt;&gt;&gt; callbacks. As you may know, HDMIPHY needs i2c interfaces t=
o control<br>
&gt;&gt;&gt;&gt; HDMIPHY<br>
&gt;&gt;&gt;&gt; clock. So with PHY module, HDMIPHY driver could enable PMU=
 more<br>
&gt;&gt;&gt;&gt; generically,<br>
&gt;&gt;&gt;&gt; but also has to use existing i2c stuff to control HDMIPHY =
clock. I had a<br>
&gt;&gt;&gt;&gt; quick review to Generic PHY Framework[v6] but I didn&#39;t=
 see that the PHY<br>
&gt;&gt;&gt;&gt; module could generically support more features such as i2c=
 stuff.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I don&#39;t think PHY framework needs to provide i2c interface=
s to program<br>
&gt;&gt;&gt; certain configurations. Instead in one of the callbacks (init/=
on/off)<br>
&gt;&gt;&gt; PHY driver can program whatever it wants using any of the inte=
rfaces it<br>
&gt;&gt;&gt; needs. IMO PHY framework should work independent of the interf=
aces.<br>
&gt;&gt;<br>
&gt;&gt; In exnoys hdmi case, i2c interface is not the exact issue. In exyn=
os<br>
&gt;&gt; hdmi, hdmiphy should send i2c configuration about video clock<br>
&gt;&gt; information as the video mode information including resolution, bi=
t per<br>
&gt;&gt; pixel, refresh rate passed from drm subsystem. So init/on/off call=
backs<br>
&gt;&gt; of phy framework are not enough for exynos hdmiphy and it should h=
ave a<br>
&gt;&gt; callback to set video mode.<br>
&gt;&gt;<br>
&gt;&gt; Do you have plan to add driver specific extend callback pointers t=
o phy<br>
&gt;&gt; framework?<br>
&gt;&gt;<br>
&gt;&gt; Currently, hdmi directly calls phy operations, but Rahul&#39;s ano=
ther patch<br>
&gt;&gt; set, mentioned by Inki, divides hdmi and hdmiphy and hdmi and hdmi=
phy is<br>
&gt;&gt; connected with exynos hdmi own sub driver callback operations.<br>
&gt;&gt;<br>
&gt;&gt; IMHO, if phy framework can support extend callback feature, then t=
his<br>
&gt;&gt; own sub driver callbacks can be replaced with phy framework at lon=
g term<br>
&gt;&gt; view.<br>
&gt;<br>
&gt; Extended callbacks are always welcome. I can also use phy device<br>
&gt; private data to pass on private ops like get_pixelclk and set_pixelclk=
.<br>
<br>
</div></div>I would recommend creating a wrapper to the existing PHY framew=
ork<br>
for HDMI PHY. That way, we can have other HDMI phys added<br>
easily. We need to figure out all the ops that might be needed by the<br>
HDMI PHY to be added to the wrapper.<br>
IMO extended callbacks can lead to abuse of the system and should be<br>
used only when absolutely necessary.<br>
<br>
Thanks<br>
<span class=3D"HOEnZb"><font color=3D"#888888">Kishon<br>
</font></span></blockquote></div><br><div>Thanks Kishon,</div><div><br></di=
v><div>I have started working on this wrapper layer which is customized for=
 video phys.</div><div>As if now, adding set_dv_timing, get_dv_timing as th=
e only additional callbacks.</div>
<div>I will post the RFC patches.</div><div><br></div><div>regards,</div><d=
iv>Rahul Sharma.</div><div><br></div>

--089e01419fc4ce4f2204e2b266d9--

--===============1941078542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1941078542==--
