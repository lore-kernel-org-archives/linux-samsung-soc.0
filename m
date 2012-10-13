From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v1 6/6] arm: exynos: removing exynos-drm device registration from non-dt platforms
Date: Sat, 13 Oct 2012 15:35:44 +0200
Message-ID: <1389234.4SCBNBfI6d@flatron>
References: <1349981868-2116-1-git-send-email-rahul.sharma@samsung.com> <1757629.b0fz3a83zj@flatron> <CAPdUM4O__EKEOPN5YS8s0+pszNGz7HS8f3z0NAuFVPN7ViW_Ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:46633 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751240Ab2JMNfn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Oct 2012 09:35:43 -0400
Received: by mail-wi0-f178.google.com with SMTP id hr7so497853wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Oct 2012 06:35:42 -0700 (PDT)
In-Reply-To: <CAPdUM4O__EKEOPN5YS8s0+pszNGz7HS8f3z0NAuFVPN7ViW_Ag@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com

On Saturday 13 of October 2012 08:19:30 Rahul Sharma wrote:
> Hi Tomasz,
> 
> On Sat, Oct 13, 2012 at 3:42 AM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> > Hi Rahul,
> > 
> > On Friday 12 of October 2012 00:27:47 Rahul Sharma wrote:
> >> As exynos-drm is a software device, its registration is moved to the
> >> exynos drm driver. This will provide generic solution for device
> >> registration for dt and non-dt platforms. Corresponding patches are
> >> posted to dri-devel list.
> > 
> > In which patch is exynos drm registration being moved to exynos drm
> > driver?
> > 
> > Best regards,
> > Tomasz Figa
> 
> Patch set is listed at
> http://comments.gmane.org/gmane.comp.video.dri.devel/75121.

Thanks.

You should list it as a dependency of this series in cover letter to make 
things clear.

Best regards,
Tomasz Figa
