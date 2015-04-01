From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 1/3] drm/exynos: mixer: add 2x scaling to
 =?UTF-8?Q?mixer=5Fgraph=5Fbuffer?=
Date: Wed, 01 Apr 2015 15:34:36 +0200
Message-ID: <4edfafbdeda7d972e2eac7ee5b6333ca@math.uni-bielefeld.de>
References: <1427325438-3791-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20150326142615.GA18573@joana> <55149475.1090900@math.uni-bielefeld.de>
 <20150327131151.GA15911@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:36827 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753135AbbDANeh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 09:34:37 -0400
In-Reply-To: <20150327131151.GA15911@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hello Gustavo,

On 2015-03-27 14:11, Gustavo Padovan wrote:
> If you can rebase this in on top of my series this would be really 
> good.
like I said in my other mail, the series doesn't apply cleanly anymore, 
so I had to rebase your series.


>> Then it would just be:
>> static int mixer_setup_scale(const struct exynos_drm_plane *plane,
>> 	unsigned int *x_ratio, unsigned int *y_ratio)
>> 
>> Also that would automatically fix your other comment below [*].
>> 
>> 
>> > Use EPERM or ENOTSUPP. Or even true/false.
>> Will do!
>> 
>> 
>> > You need to fix style here
>> >
>> >         if (mixer_setup_scale(win_data->src_width, win_data->src_height,
>> >                               win_data->crtc_width, win_data->crtc_height,
>> >                               &x_ratio, &y_ratio))
>> >                 return;
>> With [*] this would just be:
>> if (mixer_setup_scale(plane, &x_ratio, &y_ratio)) return;
>> 
>> What do you think?
> 
> Changes sounds good to me. Please go ahead and send a new patch. :)
I've integrated the changes and just sent it out together with two other 
small fixes.

Here's the important part:
https://patchwork.kernel.org/patch/6140451/


With best wishes,
Tobias
