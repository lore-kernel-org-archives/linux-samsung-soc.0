From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/4] drm/exynos: fimd: Add support for S3C6400/S3C6410
Date: Mon, 10 Jun 2013 21:18:32 +0900
Message-ID: <CAAQKjZNeFK6kqM2zmZnsRsBdCLDbgn6yFba_xJ1ehqrRi0RUkA@mail.gmail.com>
References: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com>
	<2251148.tVTSO69sfP@flatron> <1938938.aAbuguuIAt@flatron>
	<51B009E5.5030505@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1929816038=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <51B009E5.5030505@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, DRI mailing list <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1929816038==
Content-Type: multipart/alternative; boundary=047d7b3432b6732f2304decbc7c4

--047d7b3432b6732f2304decbc7c4
Content-Type: text/plain; charset=ISO-8859-1

Applied.

Thanks,
Inki Dae


2013/6/6 Joonyoung Shim <jy0922.shim@samsung.com>

> On 06/06/2013 03:14 AM, Tomasz Figa wrote:
>
>> On Sunday 19 of May 2013 13:26:57 Tomasz Figa wrote:
>>
>>> Hi,
>>>
>>> On Wednesday 01 of May 2013 21:02:25 Tomasz Figa wrote:
>>>
>>>> Much of the code in Exynos DRM subsystem is generic enough to use
>>>> it for older (non-Exynos) Samsung SoCs as well, after minor
>>>> modifications.
>>>>
>>>> This series starts adding support for previous SoCs to Exynos DRM by
>>>> introducing S3C64xx support to exynos_drm_fimd driver.
>>>>
>>>> Adding support for remaining SoCs between S3C64xx and Exynos4
>>>> (S5PC100,
>>>> S5P64x0 and S5PV210) should be rather straightforward, but at the
>>>> moment I can test only on S3C6410, so I limited my changes only to
>>>> this SoC.
>>>>
>>>> On Tiny6410 (Mini6410-compatible) board based on Samsung S3C6410 SoC,
>>>> using my to-be-resubmitted patches for Device Tree support:
>>>>
>>>> Tested-by: Tomasz Figa <tomasz.figa@gmail.com>
>>>>
>>>> Tomasz Figa (4):
>>>>    drm/exynos: fimd: Hold pointer to driver data in context struct
>>>>    drm/exynos: fimd: Add support for FIMD versions without SHADOWCON
>>>>         register
>>>>       drm/exynos: fimd: Add support for FIMD variants with clock
>>>> selection
>>>>    drm/exynos: fimd: Add support for S3C64xx SoCs
>>>>     drivers/gpu/drm/exynos/exynos_**drm_fimd.c | 90
>>>>
>>>> ++++++++++++++++++++++++------**-- 1 file changed, 68 insertions(+), 22
>>>> deletions(-)
>>>>
>>> Any comments for this series?
>>>
>>> Best regards,
>>> Tomasz
>>>
>> Ping.
>>
>> Best regards,
>> Tomasz
>>
>>
>>
> This series looks good to me.
>
> Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/**majordomo-info.html<http://vger.kernel.org/majordomo-info.html>
>

--047d7b3432b6732f2304decbc7c4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Applied.<br><br></div>Thanks,<br>Inki Dae<br></div><d=
iv class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2013/6/6 Joonyo=
ung Shim <span dir=3D"ltr">&lt;<a href=3D"mailto:jy0922.shim@samsung.com" t=
arget=3D"_blank">jy0922.shim@samsung.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 0=
6/06/2013 03:14 AM, Tomasz Figa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Sunday 19 of May 2013 13:26:57 Tomasz Figa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi,<br>
<br>
On Wednesday 01 of May 2013 21:02:25 Tomasz Figa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Much of the code in Exynos DRM subsystem is generic enough to use<br>
it for older (non-Exynos) Samsung SoCs as well, after minor<br>
modifications.<br>
<br>
This series starts adding support for previous SoCs to Exynos DRM by<br>
introducing S3C64xx support to exynos_drm_fimd driver.<br>
<br>
Adding support for remaining SoCs between S3C64xx and Exynos4<br>
(S5PC100,<br>
S5P64x0 and S5PV210) should be rather straightforward, but at the<br>
moment I can test only on S3C6410, so I limited my changes only to<br>
this SoC.<br>
<br>
On Tiny6410 (Mini6410-compatible) board based on Samsung S3C6410 SoC,<br>
using my to-be-resubmitted patches for Device Tree support:<br>
<br>
Tested-by: Tomasz Figa &lt;<a href=3D"mailto:tomasz.figa@gmail.com" target=
=3D"_blank">tomasz.figa@gmail.com</a>&gt;<br>
<br>
Tomasz Figa (4):<br>
=A0 =A0drm/exynos: fimd: Hold pointer to driver data in context struct<br>
=A0 =A0drm/exynos: fimd: Add support for FIMD versions without SHADOWCON<br=
>
=A0 =A0 =A0 =A0 register<br>
=A0 =A0 =A0 drm/exynos: fimd: Add support for FIMD variants with clock sele=
ction<br>
=A0 =A0drm/exynos: fimd: Add support for S3C64xx SoCs<br>
=A0 =A0 drivers/gpu/drm/exynos/exynos_<u></u>drm_fimd.c | 90<br>
<br>
++++++++++++++++++++++++------<u></u>-- 1 file changed, 68 insertions(+), 2=
2<br>
deletions(-)<br>
</blockquote>
Any comments for this series?<br>
<br>
Best regards,<br>
Tomasz<br>
</blockquote>
Ping.<br>
<br>
Best regards,<br>
Tomasz<br>
<br>
<br>
</blockquote>
<br></div></div>
This series looks good to me.<br>
<br>
Acked-by: Joonyoung Shim &lt;<a href=3D"mailto:jy0922.shim@samsung.com" tar=
get=3D"_blank">jy0922.shim@samsung.com</a>&gt;<div class=3D"HOEnZb"><div cl=
ass=3D"h5"><br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org" targe=
t=3D"_blank">majordomo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/<u></u>majordomo-info.html</=
a><br>
</div></div></blockquote></div><br></div>

--047d7b3432b6732f2304decbc7c4--

--===============1929816038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1929816038==--
