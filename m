From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Wed, 4 Nov 2015 00:38:15 +0900
Message-ID: <CAAQKjZOUBE5Grz=pPtwx9oF19-yoRX-UFtv9C+GxQgNy_sSRag@mail.gmail.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
 <5638B57E.9070702@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0088016115=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5638B57E.9070702@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0088016115==
Content-Type: multipart/alternative; boundary=001a114f147ea71c930523a4aec2

--001a114f147ea71c930523a4aec2
Content-Type: text/plain; charset=UTF-8

2015-11-03 22:24 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> Hi Inki,
>
> On 11/03/2015 11:47 AM, Inki Dae wrote:
>> This patch series adds pm runtime support for Exynos drm.
>>
>> Originally, this patch was posted by Gustavo but there was no any
>> answer about some comments. So I rebased this patch series on top of
>> exynos-drm-next, removed unnecessary patches and modified wrong macro.
>
> I have sent comment to original patchset[1], but for some strange reasons
> it went only to mailing lists.
> My concerns were as follows:
> - exynos_drm has already pm_runtime support via exynos_drm_drv pm ops,
>   why should we add per component support?

For this, I think I already mentioned enough,
        http://www.spinics.net/lists/linux-samsung-soc/msg47695.html

In brief, exynos_drm_drv doesn't control each power domain of each kms
device. It means that we cannot power off fully without pm runtime
interface of each kms device - just they can only control their clock not
power domain. So question. How we could control power domain of each kms
device without runtime pm interface?

> - component suspend sequence is non deterministic, but in case of
>   video pipelines, specification often requires fixed order,

Can your show me an example? I think component suspend and resume are
invoked by only drm dpms interface, and the dpms interface has a fixed
order - when dpms goes to off, encoder first, and when dpms goes to on,
crtc first.

My only concern is that runtime pm interface of each kms driver is called
within pm sleep context of Exynos drm driver. So I will look into this no
problem.

> - the patchset adds implicit dependency on PM_SLEEP.
>
>
> Current solution should work correctly and it was OK last time I have
tested it.
> I am not sure about atomic requirements, are there special ones?

Not related to atomic feature.

>
> There are other issues with current solution, rather easy to solve:
> - it assumes that exynos-drm device will be suspended first - it should
be true,
>  as it is created at the end and suspend order is reverse to creation
order, but
>  I am not sure if we can rely on it - some solution is to add pm
callbacks to
>  all components, and from those callbacks call one centralized pm routine,

You mean pm callbacks are pm sleep interface? And you mean let's add sleep
pm interface to each kms driver?  If so, I'm not agree with you because
sleep pm should be controlled by only drm top like single driver does.

> - suspend/resume callbacks theoretically can be called during component
>   master initialization/deinitailization it could be racy,

I'm not sure what you mean but component master
initialization/deinitailization mean bind and unbind? If so, bind/unbind
interfaces of all components will never call pm relevant interfaces but the
the pm relevant interfaces are called by only dpms interface.

> - exynos_drm_sys_suspend/resume calls exynos_drm_suspend/resume
>   for historical reasons, these function can be merged together.

Also can you show me more detail?

Thanks,
Inki Dae

>
> [1]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/48395
>
> Regards
> Andrzej
>
>>
>> Changelog v2:
>> - Remove patch 5 and 6.
>>   . commit callback are already removed so isn't required anymore.
>> - Remove patch 8 which makes dp clock enabled directly from FIMD.
>>   . Really not mendatory for FIMD uses DP, and it could be different
>>     according to Board.
>> - Modified CONFIG_PM_SLEEP to CONFIG_PM.
>>   . In case of runtime pm, CONFIG_PM macro should be used instead of
>>     CONFIG_PM_SLEEP.
>>
>> Gustavo Padovan (7):
>>   drm/exynos: do not start enabling DP at bind() phase
>>   drm/exynos: add pm_runtime to DP
>>   drm/exynos: add pm_runtime to HDMI
>>   drm/exynos: add pm_runtime to Mixer
>>   drm/exynos: add pm_runtime to FIMD
>>   drm/exynos: add pm_runtime to DECON 5433
>>   drm/exynos: add pm_runtime to DECON 7
>>
>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  54 ++++++---
>>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 125 +++++++++----------
>>  drivers/gpu/drm/exynos/exynos_dp_core.c       | 165
+++++++++++++++++++-------
>>  drivers/gpu/drm/exynos/exynos_dp_core.h       |   1 +
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  91 ++++++--------
>>  drivers/gpu/drm/exynos/exynos_hdmi.c          |  56 ++++++---
>>  drivers/gpu/drm/exynos/exynos_mixer.c         | 125 ++++++++++---------
>>  7 files changed, 352 insertions(+), 265 deletions(-)
>>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

--001a114f147ea71c930523a4aec2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>=C2=A0</div><div>2015-11-03 22:24 GMT+09:00 Andr=
zej Hajda &lt;<a href=3D"mailto:a.hajda@samsung.com" target=3D"_blank">a.ha=
jda@samsung.com</a>&gt;:</div><div>&gt; Hi Inki,</div><div>&gt;</div><div>&=
gt; On 11/03/2015 11:47 AM, Inki Dae wrote:</div><div>&gt;&gt; This patch s=
eries adds pm runtime support for Exynos drm.</div><div>&gt;&gt;</div><div>=
&gt;&gt; Originally, this patch was posted by Gustavo but there was no any<=
/div><div>&gt;&gt; answer about some comments. So I rebased this patch seri=
es on top of</div><div>&gt;&gt; exynos-drm-next, removed unnecessary patche=
s and modified wrong macro.</div><div>&gt;</div><div>&gt; I have sent comme=
nt to original patchset[1], but for some strange reasons</div><div>&gt; it =
went only to mailing lists.</div><div>&gt; My concerns were as follows:</di=
v><div>&gt; - exynos_drm has already pm_runtime support via exynos_drm_drv =
pm ops,</div><div>&gt; =C2=A0 why should we add per component support?</div=
><div>=C2=A0</div><div>For this, I think I already mentioned enough,</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.spinics.net/lists/lin=
ux-samsung-soc/msg47695.html" target=3D"_blank">http://www.spinics.net/list=
s/linux-samsung-soc/msg47695.html</a><br></div><div></div><br></div>In brie=
f, exynos_drm_drv doesn&#39;t control each power domain of each kms device.=
 It means that we cannot power off fully without pm runtime interface of ea=
ch kms device - just they can only control their clock not power domain. So=
 question. How we could control power domain of each kms device without run=
time pm interface?<br><div><div><div><div><div><br><div>&gt; - component su=
spend sequence is non deterministic, but in case of</div><div>&gt; =C2=A0 v=
ideo pipelines, specification often requires fixed order,<br><br></div><div=
>Can your show me an example? I think component suspend and resume are invo=
ked by only drm dpms interface, and the dpms interface has a fixed order - =
when dpms goes to off, encoder first, and when dpms goes to on, crtc first.=
<br><br></div><div>My only concern is that runtime pm interface of each kms=
 driver is called within pm sleep context of Exynos drm driver. So I will l=
ook into this no problem.<br></div><div><br></div><div>&gt; - the patchset =
adds implicit dependency on PM_SLEEP.</div><div>&gt;</div><div>&gt;</div><d=
iv>&gt; Current solution should work correctly and it was OK last time I ha=
ve tested it.</div><div>&gt; I am not sure about atomic requirements, are t=
here special ones?<br><br></div><div>Not related to atomic feature.<br></di=
v><div><br></div><div>&gt;</div><div>&gt; There are other issues with curre=
nt solution, rather easy to solve:</div><div>&gt; - it assumes that exynos-=
drm device will be suspended first - it should be true,</div><div>&gt; =C2=
=A0as it is created at the end and suspend order is reverse to creation ord=
er, but</div><div>&gt; =C2=A0I am not sure if we can rely on it - some solu=
tion is to add pm callbacks to</div><div>&gt; =C2=A0all components, and fro=
m those callbacks call one centralized pm routine,<br><br></div><div>You me=
an pm callbacks are pm sleep interface? And you mean let&#39;s add sleep pm=
 interface to each kms driver?=C2=A0 If so, I&#39;m not agree with you beca=
use sleep pm should be controlled by only drm top like single driver does.<=
br></div><div><br></div><div>&gt; - suspend/resume callbacks theoretically =
can be called during component</div><div>&gt; =C2=A0 master initialization/=
deinitailization it could be racy,<br><br></div><div>I&#39;m not sure what =
you mean but component master initialization/deinitailization mean bind and=
 unbind? If so, bind/unbind interfaces of all components will never call pm=
 relevant interfaces but the the pm relevant interfaces are called by only =
dpms interface.<br></div><div><br></div><div>&gt; - exynos_drm_sys_suspend/=
resume calls exynos_drm_suspend/resume</div><div>&gt; =C2=A0 for historical=
 reasons, these function can be merged together.<br><br></div><div>Also can=
 you show me more detail?<br><br></div><div>Thanks,<br></div><div>Inki Dae<=
br></div><div><br></div><div>&gt;</div><div>&gt; [1]: <a href=3D"http://per=
malink.gmane.org/gmane.linux.kernel.samsung-soc/48395" target=3D"_blank">ht=
tp://permalink.gmane.org/gmane.linux.kernel.samsung-soc/48395</a></div><div=
>&gt;</div><div>&gt; Regards</div><div>&gt; Andrzej</div><div>&gt;</div><di=
v>&gt;&gt;</div><div>&gt;&gt; Changelog v2:</div><div>&gt;&gt; - Remove pat=
ch 5 and 6.</div><div>&gt;&gt; =C2=A0 . commit callback are already removed=
 so isn&#39;t required anymore.</div><div>&gt;&gt; - Remove patch 8 which m=
akes dp clock enabled directly from FIMD.</div><div>&gt;&gt; =C2=A0 . Reall=
y not mendatory for FIMD uses DP, and it could be different</div><div>&gt;&=
gt; =C2=A0 =C2=A0 according to Board.</div><div>&gt;&gt; - Modified CONFIG_=
PM_SLEEP to CONFIG_PM.</div><div>&gt;&gt; =C2=A0 . In case of runtime pm, C=
ONFIG_PM macro should be used instead of</div><div>&gt;&gt; =C2=A0 =C2=A0 C=
ONFIG_PM_SLEEP.</div><div>&gt;&gt;</div><div>&gt;&gt; Gustavo Padovan (7):<=
/div><div>&gt;&gt; =C2=A0 drm/exynos: do not start enabling DP at bind() ph=
ase</div><div>&gt;&gt; =C2=A0 drm/exynos: add pm_runtime to DP</div><div>&g=
t;&gt; =C2=A0 drm/exynos: add pm_runtime to HDMI</div><div>&gt;&gt; =C2=A0 =
drm/exynos: add pm_runtime to Mixer</div><div>&gt;&gt; =C2=A0 drm/exynos: a=
dd pm_runtime to FIMD</div><div>&gt;&gt; =C2=A0 drm/exynos: add pm_runtime =
to DECON 5433</div><div>&gt;&gt; =C2=A0 drm/exynos: add pm_runtime to DECON=
 7</div><div>&gt;&gt;</div><div>&gt;&gt; =C2=A0drivers/gpu/drm/exynos/exyno=
s5433_drm_decon.c | =C2=A054 ++++++---</div><div>&gt;&gt; =C2=A0drivers/gpu=
/drm/exynos/exynos7_drm_decon.c =C2=A0 =C2=A0| 125 +++++++++----------</div=
><div>&gt;&gt; =C2=A0drivers/gpu/drm/exynos/exynos_dp_core.c =C2=A0 =C2=A0 =
=C2=A0 | 165 +++++++++++++++++++-------</div><div>&gt;&gt; =C2=A0drivers/gp=
u/drm/exynos/exynos_dp_core.h =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +</div><div>&=
gt;&gt; =C2=A0drivers/gpu/drm/exynos/exynos_drm_fimd.c =C2=A0 =C2=A0 =C2=A0=
| =C2=A091 ++++++--------</div><div>&gt;&gt; =C2=A0drivers/gpu/drm/exynos/e=
xynos_hdmi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A056 ++++++---</div><d=
iv>&gt;&gt; =C2=A0drivers/gpu/drm/exynos/exynos_mixer.c =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 125 ++++++++++---------</div><div>&gt;&gt; =C2=A07 files chang=
ed, 352 insertions(+), 265 deletions(-)</div><div>&gt;&gt;</div><div>&gt;</=
div><div>&gt; _______________________________________________</div><div>&gt=
; dri-devel mailing list</div><div>&gt; <a href=3D"mailto:dri-devel@lists.f=
reedesktop.org" target=3D"_blank">dri-devel@lists.freedesktop.org</a></div>=
<div>&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-deve=
l" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-deve=
l</a></div><div>=C2=A0</div><div>=C2=A0</div>
</div></div></div></div></div></div>

--001a114f147ea71c930523a4aec2--

--===============0088016115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0088016115==--
