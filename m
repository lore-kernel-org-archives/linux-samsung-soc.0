From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] drm/exynos: Avoid NULL pointer dereference in resume
 if bind failed
Date: Wed, 30 Sep 2015 14:15:22 +0100
Message-ID: <20150930131522.GK5432@ck-lbox>
References: <1443370306-15429-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <560BC6ED.3090205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:55895 "EHLO
	mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932558AbbI3Ni0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 09:38:26 -0400
Content-Disposition: inline
In-Reply-To: <560BC6ED.3090205@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: jingoohan1@gmail.com, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, airlied@linux.ie, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, kgene@kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, Sep 30, 2015 at 08:26:37PM +0900, Inki Dae wrote:
> Hi,
>=20
> On 2015=EB=85=84 09=EC=9B=94 28=EC=9D=BC 01:11, Charles Keepax wrote:
> > If binding failed calling exynos_dp_enable in exynos_dp_resume will
> > result in several NULL pointer dereferences. It is much better to
> > simply skip suspend/resume handling if bind has failed, do so by
> > checking if a drm_dev exists.
>=20
> Thanks for your patch. However, the pm interfaces of KMS drivers aren=
't
> required because these are controlled by top of Exynos drm driver and
> connector dpms. So I posted a patch that it removes pm interfaces of =
dp
> driver.

No problems at all, as long as my Arndale starts resuming without
a NULL pointer I am happy :-)

Had a quick test of your patch it appears to fix my issue as well
so totally fine with that.

Thanks,
Charles
