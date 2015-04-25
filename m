From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH 1/2] drm/exynos: mixer: cleanup pixelformat handling
Date: Sat, 25 Apr 2015 20:08:07 +0200
Message-ID: <553BD807.8080109@gmx.net>
References: <1429791146-4410-1-git-send-email-tjakobi@math.uni-bielefeld.de> <1429791146-4410-2-git-send-email-tjakobi@math.uni-bielefeld.de> <5539A0EB.6060706@samsung.com> <aae08db4a8603a5109e5e3946e30e770@math.uni-bielefeld.de> <20150424181440.GF13025@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:56662 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754807AbbDYSI0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Apr 2015 14:08:26 -0400
In-Reply-To: <20150424181440.GF13025@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, gustavo.padovan@collabora.co.uk, dri-devel@lists.freedesktop.org

Gustavo Padovan wrote:
>> How about MXR_FORMAT_XYZ, to stay consistent with the regs-mixer header?
> 
> I'm fine with MXR_FORMAT_XYZ. Other than that:
> 
> Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Thanks, updated version sent!

With best wishes,
Tobias


> 
> 	Gustavo
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
