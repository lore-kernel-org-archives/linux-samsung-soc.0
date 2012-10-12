From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v1 6/6] arm: exynos: removing exynos-drm device registration from non-dt platforms
Date: Sat, 13 Oct 2012 00:12:59 +0200
Message-ID: <1757629.b0fz3a83zj@flatron>
References: <1349981868-2116-1-git-send-email-rahul.sharma@samsung.com> <1349981868-2116-7-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:62072 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172Ab2JLWM7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Oct 2012 18:12:59 -0400
Received: by mail-wg0-f44.google.com with SMTP id dr13so2776220wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Oct 2012 15:12:58 -0700 (PDT)
In-Reply-To: <1349981868-2116-7-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On Friday 12 of October 2012 00:27:47 Rahul Sharma wrote:
> As exynos-drm is a software device, its registration is moved to the
> exynos drm driver. This will provide generic solution for device
> registration for dt and non-dt platforms. Corresponding patches are
> posted to dri-devel list.

In which patch is exynos drm registration being moved to exynos drm 
driver?

Best regards,
Tomasz Figa
