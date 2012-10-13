From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v1 6/6] arm: exynos: removing exynos-drm device
 registration from non-dt platforms
Date: Sat, 13 Oct 2012 08:19:30 +0530
Message-ID: <CAPdUM4O__EKEOPN5YS8s0+pszNGz7HS8f3z0NAuFVPN7ViW_Ag@mail.gmail.com>
References: <1349981868-2116-1-git-send-email-rahul.sharma@samsung.com>
	<1349981868-2116-7-git-send-email-rahul.sharma@samsung.com>
	<1757629.b0fz3a83zj@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:37956 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752517Ab2JMCtb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Oct 2012 22:49:31 -0400
Received: by mail-gg0-f174.google.com with SMTP id k5so942419ggd.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Oct 2012 19:49:30 -0700 (PDT)
In-Reply-To: <1757629.b0fz3a83zj@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com

Hi Tomasz,

On Sat, Oct 13, 2012 at 3:42 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Rahul,
>
> On Friday 12 of October 2012 00:27:47 Rahul Sharma wrote:
>> As exynos-drm is a software device, its registration is moved to the
>> exynos drm driver. This will provide generic solution for device
>> registration for dt and non-dt platforms. Corresponding patches are
>> posted to dri-devel list.
>
> In which patch is exynos drm registration being moved to exynos drm
> driver?
>
> Best regards,
> Tomasz Figa
>

Patch set is listed at
http://comments.gmane.org/gmane.comp.video.dri.devel/75121.

regards,
Rahul Sharma
