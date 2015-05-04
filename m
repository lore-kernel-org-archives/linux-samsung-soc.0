From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH] drm/exynos: Fix build breakage on !DRM_EXYNOS_FIMD
Date: Mon, 04 May 2015 21:43:25 +0900
Message-ID: <5547696D.8000300@gmail.com>
References: <1430539706-2945-1-git-send-email-k.kozlowski.k@gmail.com> <55472339.8040408@samsung.com> <CAPj87rM-utcjuWD+ZB7_m01X3qUsNnwJmabCYZAAQUkAdRabaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:33085 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752616AbbEDMnc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 08:43:32 -0400
In-Reply-To: <CAPj87rM-utcjuWD+ZB7_m01X3qUsNnwJmabCYZAAQUkAdRabaQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Stone <daniel@fooishbar.org>
Cc: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

2015-05-04 20:34 GMT+09:00 Daniel Stone <daniel@fooishbar.org>:
> Hi,
>
> On 4 May 2015 at 08:43, Inki Dae <inki.dae@samsung.com> wrote:
>> On 2015=EB=85=84 05=EC=9B=94 02=EC=9D=BC 13:08, Krzysztof Kozlowski =
wrote:
>>> Selecting CONFIG_FB_S3C disables CONFIG_DRM_EXYNOS_FIMD leading to =
build
>>> error:
>>
>> No, eDP has no any dependency of FIMD but DECON. Just add dependency
>> code like below,
>>
>>  config DRM_EXYNOS7_DECON
>>         bool "Exynos DRM DECON"
>> -       depends on DRM_EXYNOS
>> +       depends on DRM_EXYNOS && !FB_S3C

Actually my commit message was not detailed enough. The FB_S3C here
won't solve the issue because you may:
1, disable FIMD and FB_S3C,
2, enabke DECON and DP,
and it won't compile.

Currently the FIMD must be enabled if DRM_EXYNOS_DP is enabled.

>
> But it does clearly and explicitly call fimd_dp_clock_enable from
> exynos_dp_powero{n,ff}. So the dependency you're proposing seems
> backwards: it's not an expression of the requirements of the current
> code (that FIMD DP code be available, i.e. CONFIG_DRM_EXYNOS_FIMD is
> selected), but an indirect expression of another dependency
> (CONFIG_FB_S3C disables CONFIG_DRM_EXYNOS_FIMD, so disable
> CONFIG_FB_S3C).
>
> Additionally, as the call comes from exynos_dp_core.c, which is built
> by CONFIG_DRM_EXYNOS_DP (an explicitly user-selectable option), why
> shouldn't the dependency be there? Ah, because the dependency on DP i=
s
> for (DECON || FIMD), but as DECON doesn't provide
> fimd_dp_clock_enable(), it doesn't seem like it would compile if you
> selected DECON and not FIMD.
>
> So, for me, the cleanest solution would be config DRM_EXYNOS_DP gains
> a hard dependency on DRM_EXYNOS_FIMD, at least until it can be fixed
> to compile without FIMD.

Right, you correctly pointed current dependencies. Still it looks littl=
e
hacky because EXYNOS_DP may work with FIMD or DECON. It does not really
need FIMD. Using ifdefs in headers is not uncommon - many core
subsystems do this that way to provide stubs.

Probably the cleanest way would be to provide by FIMD and DECON a commo=
n
interface for DP for such operation, something like:
struct exynos_drm_crtc {
	struct drm_crtc                 base;
	...
	void (*clock_enable)(struct exynos_drm_crtc *crtc, bool enable)
);

which, if non-NULL, will be called by exynos_dp_core.c:
static void exynos_dp_poweron(struct exynos_dp_device *dp)
{
	...
	if (crtc->clock_enable)
		crtc->clock_enable(crtc, true);
}

What do you think?

Best regards,
Krzysztof
