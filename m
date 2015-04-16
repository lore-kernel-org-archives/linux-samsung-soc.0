From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [RFC 3/6] drm/exynos: introduce struct =?UTF-8?Q?exynos=5Fdrm?=
 =?UTF-8?Q?=5Fplane=5Fconfig?=
Date: Thu, 16 Apr 2015 16:29:06 +0200
Message-ID: <61166cec959425bf9728e73a08914ece@math.uni-bielefeld.de>
References: <1429110120-7043-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1429110120-7043-4-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20150415201451.GC29804@joana> <552EC8B9.40405@math.uni-bielefeld.de>
 <20150415203316.GA2683@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:58453 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757375AbbDPO3I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Apr 2015 10:29:08 -0400
In-Reply-To: <20150415203316.GA2683@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com

Hello!

On 2015-04-15 22:33, Gustavo Padovan wrote:
>> > As a follow up of my atomic series I started cleaning up exynos drm a bit more
>> > and right now I'm removing most of struct exynos_drm_plane. Most of the plane
>> > information there is also present in plane->state thus I'm basically removing
>> > all the duplicated information there.
>> Sounds like a good plan.
>> 
>> 
>> > That said, I think we avoid creating exynos_drm_plane_config and stuff
>> > everything directly in struct exynos_drm_plane, it will be quite small and
>> > easier to manipulate.
>> So that would imply that we then just have:
>> int exynos_plane_init(struct drm_device *dev, struct exynos_drm_plane
>> *exynos_plane);
>> 
>> Correct?
> 
> Correct, passing exynos_drm_plane simplifies things a lot for us.
> 
>> 
>> Anyway, I'm going to wait then until the cleanups are posted and 
>> rebase
>> this series onto it.
> 
> Right, I'll probably have that the next week or the other one, I'm 
> currently
> working on some testing scripts to speed up my testing and make sure 
> I'm not
> breaking anything.
Cool, take your time. And sorry that I haven't provided any feedback on 
the atomic patches yet. Something urgent came up that day and I haven't 
found enough time since then.

With best wishes,
Tobias
