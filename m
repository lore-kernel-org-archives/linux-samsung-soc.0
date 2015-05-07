From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 0/5] drm/exynos: rework layer blending setup
Date: Thu, 7 May 2015 17:57:48 -0300
Message-ID: <20150507205748.GA14159@joana>
References: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:33250 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751253AbbEGU5w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 May 2015 16:57:52 -0400
Received: by qgdy78 with SMTP id y78so27495243qgd.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 May 2015 13:57:52 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, gustavo.padovan@collabora.co.uk, dri-devel@lists.freedesktop.org

2015-05-06 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:

> Hello,
> 
> this is a rework of the layer blending setup in the Exynos DRM mixer. The current setup is static and spread out through the mixer code. This rework pushes all the configuration details into a layer_config array, which specifies the priority of each layer.
> 
> Two arrays are currently found in the code, one for SoC versions with a video processor (VP) and one for SoC versions without VP. The VP gives us one additional layer, the video layer, which natively supports the NV12/NV21 pixelformat.
> 
> The blending setup roughly works like this:
> 1) Find the bottom-most enabled layer. Disable all blending for this layer. This is done because we currently don't expose modification of the mixer background to userspace. Once this is done we can add more flexibility here.
> 2) Find the next enabled layer in our layer stack. If the layer has a framebuffer with an alpha-pixelformat attached, enable blending for this layer. If not, disable blending.
> 3) Iterate (2) until all enabled layers are processed.
> 
> The series has been tested on a Hardkernel Odroid-X2 (Exynos4412, which has a VP).
> 
> If you want to use libdrm's modetest to check the series, please apply patches [1] and [2]. This should make it possible to also test a plane with NV12 format (which is located 'behind' the primary plane).


The whole series works fine for me on Samsung Snow 5250 (which doesn't
have a VP).

Tested-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
