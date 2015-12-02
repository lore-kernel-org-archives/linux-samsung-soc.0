From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 2/2] drm/exynos: dp: fix wrong return type
Date: Wed, 2 Dec 2015 09:03:42 -0300
Message-ID: <565EDE1E.6070002@osg.samsung.com>
References: <1449057472-4389-1-git-send-email-inki.dae@samsung.com>
 <1449057472-4389-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:51165 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754627AbbLBMDq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Dec 2015 07:03:46 -0500
In-Reply-To: <1449057472-4389-2-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org

Hello Inki,

On 12/02/2015 08:57 AM, Inki Dae wrote:
> This patch fixes wrong return type when dt binding of bridge device
> failed.
> 
> If a board has a bridge device then of_graph_get_remote_port_parent
> function shouldn't be NULL. So this patch will return a proper error
> type so that the deferred probe isn't triggered.
> 
> Changelog v2:
> - return -EINVAL if getting a port node failed.
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
