From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V2 RESEND] arm: dts: Exynos5: Use pmu_system_controller
 phandle for dp phy
Date: Tue, 02 Dec 2014 17:39:58 +0900
Message-ID: <000501d00e0b$8e0e8610$aa2b9230$%han@samsung.com>
References: <1416807683-2257-1-git-send-email-gautam.vivek@samsung.com>
 <CABxcv=mmJp2c=ZC8=0+TW0-x3g7RnELTAFY24KJRjUgf+QrDcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19602 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891AbaLBIim (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Dec 2014 03:38:42 -0500
In-reply-to: <CABxcv=mmJp2c=ZC8=0+TW0-x3g7RnELTAFY24KJRjUgf+QrDcQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier@dowhile0.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Vivek Gautam' <gautam.vivek@samsung.com>
Cc: 'Linux Kernel' <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, 'Thierry Reding' <thierry.reding@gmail.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, December 02, 2014 5:17 PM, Javier Martinez Canillas wrote:
> 
> Hello Kukjin,
> 
> On Mon, Nov 24, 2014 at 6:41 AM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
> > DP PHY now require pmu-system-controller to handle PMU register
> > to control PHY's power isolation. Adding the same to dp-phy
> > node.
> >
> > Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> > Reviewed-by: Jingoo Han <jg1.han@samsung.com>
> > Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> > Cc: Kukjin Kim <kgene@kernel.org>
> 
> Any opinions about $subject?
> 
> This patch is -rc material since is needed after commit a5ec598 ("phy:
> exynos-dp-video: Use syscon
> support to control pmu register") which landed in 3.18. That means
> that display for Exynos is currently broken in 3.18.
> 
> I think it's too late for the 3.18 -rc cycle but at least it would be
> great to have this merged for 3.19 and backport to stable kernels to
> have display working again.

I agree with this suggestion.

> 
> Thierry had concerns that this change breaks DT backward compability
> but actually it was already been broken by a5ec598 which changed the
> DT binding for the phy-exynos-dp-video driver so we should either
> apply this patch now or revert a5ec598.

I think that very few people might use old properties for Exynos DP.
Actually, DT backward compatibility will not be the considerable problem
in my opinion.

But, in order to keep the DT backward compatibility, we should revert
a5ec598, and send another patch for keeping the DT backward compatibility.

Best regards,
Jingoo Han

> 
> Thanks a lot and best regards,
> Javier
