From: Inki Dae <inki.dae@samsung.com>
Subject: RE: exynos-drm-next todo work.
Date: Wed, 19 Jun 2013 13:48:15 +0900
Message-ID: <007e01ce6ca8$35c23a70$a146af50$%dae@samsung.com>
References: <007401ce6bed$bc802920$35807b60$%dae@samsung.com>
 <CAPdUM4M4fyiKUES-BW4BKBL_0nfPjNY5Fk_H7i2FUWyxhSv_nA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19039 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753027Ab3FSEsT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 00:48:19 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOM00JBYIOHQAK0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 13:48:17 +0900 (KST)
In-reply-to: <CAPdUM4M4fyiKUES-BW4BKBL_0nfPjNY5Fk_H7i2FUWyxhSv_nA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <r.sh.open@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, 'DRI mailing list' <dri-devel@lists.freedesktop.org>



> -----Original Message-----
> From: Rahul Sharma [mailto:r.sh.open@gmail.com]
> Sent: Tuesday, June 18, 2013 6:46 PM
> To: Inki Dae
> Cc: linux-samsung-soc@vger.kernel.org; DRI mailing list
> Subject: Re: exynos-drm-next todo work.
> 
> Hi Mr. Dae,
> 
> Related to HDMI sound support in Alsa, I have posted a working RFC
> "exynos-hdmi to CDF complaint display driver". It registers a separate
> sound card by registering hdmi audio codec dai and cpu-dai, as you
> mentioned. But there is a problem with this approach that I2S being the
> single cpu dai for HDMI and Speaker sound card, only one card can
> support playback at a time.
> 
> I would like to work on this to provide a more refined solution.
> 

Thanks. However, I think it's not good to use the CDF framework to interface
between ALSA SoC DAI driver and DRM HDMI driver. The purpose of the CDF
framework is to provide common interfaces to display bus drivers to Linux
framebuffer and DRM KMS based display controller drivers as long as I know.
So my opinion is to implement ALSA Soc DAI driver-it seems like possible to
use as is-based on a new common framework that the other can also use it.

Thanks,
Inki Dae

> regards,
> Rahul Sharma.
> 
> On Tue, Jun 18, 2013 at 12:03 PM, Inki Dae <inki.dae@samsung.com> wrote:
> > Hi all,
> >
> > I'd like to discuss Exynos DRM TODO work.
> >
> > There are features we have to solve and implement. The purpose of this
> email
> > is to share what we have to do so that other guys can be involved
> without
> > duplicated work.
> >
> > 1. gscaler based on KMS interfaces - exynos5250 and later use the
> gscaler
> > device instead of VP device. And now exynos drm driver has gscaler
> module as
> > a sub module of IPP framework. However, this gscaler module is very
> specific
> > to IPP framework so it's not easy to reuse this module. So maybe we need
> so
> > many works for it.
> >
> > Video play back path using post process (AS IS):
> >         MFC--------IPP--------KMS---------FIMD or HDMI
> >
> > Ideal video play back path using post process (TO BE):
> >         MFC--------KMS--------FIMD or HDMI
> >
> > The above scenario is to send decoded image data (YUV format) to display
> > device via post process. However, we don't really need to use IPP
> framework
> > in case of using gscaler as VP. All we have to do is to call kms
> interface
> > (setplane) for it like we did before.
> >
> > 2. More features for HDMI sound support - we need to implement Exynos
> ALSA
> > SoC DAI driver for HDMI audio (CPU DAI and CODEC DAI). Sampling freq,
> bit
> > rate, and so on from user side should be sent to drm hdmi driver via
> ALSA
> > interface and the ALSA SoC DAI driver. As of now, it seems like that we
> > should implement this driver like OMAP does because there is no common
> > framework for interfacing between ALSA SoC DAI driver and DRM HDMI
> driver:
> > in case of OMAP, it seems like that ALSA SoC audio driver calls
> interfaces
> > of DSS driver directly. I think we could implement ALSA SoC DAI driver
> in
> > more generic way if we first implement common framework for it.
> >
> > Welcome to any volunteer and other opinions.
> >
> > Thanks,
> > Inki Dae
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
