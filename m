From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 1/3] drm/exynos: mixer: add 2x scaling to mixer_graph_buffer
Date: Fri, 27 Mar 2015 00:21:25 +0100
Message-ID: <55149475.1090900@math.uni-bielefeld.de>
References: <1427325438-3791-1-git-send-email-tjakobi@math.uni-bielefeld.de> <20150326142615.GA18573@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:51488 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753355AbbCZXVc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Mar 2015 19:21:32 -0400
In-Reply-To: <20150326142615.GA18573@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hello!


Gustavo Padovan wrote:
> I would keep calling these two vars x_ratio and y_ratio. I don't see a reason
> to change the name here.
Right, I'm going to change this. Also I was thinking of basing the patch
on your latest cleanup series (the 'drm/exynos: remove struct *_win_data
abstraction on planes' one).

Then it would just be:
static int mixer_setup_scale(const struct exynos_drm_plane *plane,
	unsigned int *x_ratio, unsigned int *y_ratio)

Also that would automatically fix your other comment below [*].


> Use EPERM or ENOTSUPP. Or even true/false.
Will do!


> You need to fix style here
> 
>         if (mixer_setup_scale(win_data->src_width, win_data->src_height,        
>                               win_data->crtc_width, win_data->crtc_height,      
>                               &x_ratio, &y_ratio))                              
>                 return; 
With [*] this would just be:
if (mixer_setup_scale(plane, &x_ratio, &y_ratio)) return;

What do you think?


> I think your patch is good after these things get fixes and we can go with it
> and drop mine. Then I'll just rebase the alpha channel fix patch on top of
> this one.
Might I suggest to extend the alpha channel patch in this way:
https://github.com/tobiasjakobi/linux-odroid/commit/e3aad184eda2cade4d59a874e459a8ff265ed75f

With this we get at least some pixelformat validation into the driver.


With best wishes,
Tobias
