From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v5 09/12] drm/exynos: remove exported functions
 from exynos_drm_plane
Date: Thu, 21 May 2015 20:12:51 +0200
Message-ID: <555E2023.2050200@math.uni-bielefeld.de>
References: <1432220576-18532-1-git-send-email-gustavo@padovan.org> <1432220576-18532-11-git-send-email-gustavo@padovan.org> <d7371b0c9e0e68b22cc66325d9b84625@math.uni-bielefeld.de> <20150521153357.GB1641@joana> <20150521162615.GA14089@joana> <555E1B50.100@math.uni-bielefeld.de> <20150521181027.GB14089@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39458 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752526AbbEUSMx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 14:12:53 -0400
In-Reply-To: <20150521181027.GB14089@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com

Gustavo Padovan wrote:
> 2015-05-21 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:
> 
>> Gustavo Padovan wrote:
>>> 2015-05-21 Gustavo Padovan <gustavo.padovan@collabora.co.uk>:
>>>
>>>> 2015-05-21 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:
>>>>
>>>>> Hi,
>>>>>
>>>>> like I said before, this clashes with my commit 'drm/exynos: plane: honor
>>>>> buffer offset for dma_addr' (5d878bdb51bd7915ba3def8b531238c67624aa58),
>>>>> which is currently sitting in airlied's drm-fixes.
>>>>
>>>> Inki has to merge his -fixes tree into exynos-drm-next to solve this.
>>>> It is the only way I can rebase on top of your commit and solve the
>>>> conflict.
>>>> Anyway, I just figured that exynos-drm-next was updated from yesterday
>>>> to today so this v5 doesn't apply on today's tree. I'll send a v6 once
>>>> Inki merges "drm/exynos: plane: honor buffer offset for dma_addr" into
>>>> exynos-drm-next.
>>>>
>>>> Inki, can you please do that? so we can proceed with atomic and
>>>> hopefully have it ready for 4.2 merge window.
>>>
>>> Actually the patch is on exynos-drm-next but with a different commit id.
>>> I wonder why. Why did you applied it directly to your branch instead of
>>> merging the -fixes tree? Now we have the same commit with the differents
>>> hashes in the tree.
>> I never do merges for my tree, I always rebase (either on stable/linux
>> or torvalds/master). For submitting patches I cherry-pick stuff to the
>> corresponding upstream branch (exynos-drm-next in this case) and then
>> submit via git-send-email.
> 
> Actually I'm asking Inki. He pushed the same patch twice.
Ah, sorry, I'm getting confused here! :D


> 
> 	Gustavo
> 
