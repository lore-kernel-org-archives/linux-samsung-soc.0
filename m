From: Prasanna Kumar <prasannapadubidri@gmail.com>
Subject: Re: [PATCH 0/2] ARM: Exynos5 : Add Power domain device tree support
 for MFC and GSC
Date: Tue, 15 Jan 2013 16:17:46 +0530
Message-ID: <CAPmaG0vQHJbp5tkHTPxEM3Oy1GASbN4asN-x+gtxb77jwpOK0g@mail.gmail.com>
References: <1357733733-18769-1-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0794260887254655583=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1357733733-18769-1-git-send-email-prasanna.ps@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

--===============0794260887254655583==
Content-Type: multipart/alternative; boundary=20cf3071ce3ef9cf9f04d3517df7

--20cf3071ce3ef9cf9f04d3517df7
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

Any comments for this patch set ?

On Wed, Jan 9, 2013 at 5:45 PM, Prasanna Kumar <prasanna.ps@samsung.com>wrote:

> Hello all,
>
> This patch set adds device tree support for power domains (Gscaler and
> MFC) of exynos5
>
> Prasanna Kumar (2):
>   arm: exynos5: Enable PM generic domain support in Kconfig
>   ARM: dts: exynos5: Set up power domain for  MFC and G-scaler
>
>  arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++++++++++
>  arch/arm/mach-exynos/Kconfig      |    1 +
>  2 files changed, 16 insertions(+), 0 deletions(-)
>
> --
> 1.7.5.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
Thanks
Prasanna Kumar

--20cf3071ce3ef9cf9f04d3517df7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,<div><br></div><div>Any comments for this patch set ?<br><br><div=
 class=3D"gmail_quote">On Wed, Jan 9, 2013 at 5:45 PM, Prasanna Kumar <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:prasanna.ps@samsung.com" target=3D"_blan=
k">prasanna.ps@samsung.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hello all,<br>
<br>
This patch set adds device tree support for power domains (Gscaler and<br>
MFC) of exynos5<br>
<br>
Prasanna Kumar (2):<br>
=A0 arm: exynos5: Enable PM generic domain support in Kconfig<br>
=A0 ARM: dts: exynos5: Set up power domain for =A0MFC and G-scaler<br>
<br>
=A0arch/arm/boot/dts/exynos5250.dtsi | =A0 15 +++++++++++++++<br>
=A0arch/arm/mach-exynos/Kconfig =A0 =A0 =A0| =A0 =A01 +<br>
=A02 files changed, 16 insertions(+), 0 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.5.4<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Thanks<br>Prasanna Kumar
</div>

--20cf3071ce3ef9cf9f04d3517df7--


--===============0794260887254655583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0794260887254655583==--
