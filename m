From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/2] media: exynos4-is: fix deadlock on driver probe
Date: Mon, 2 May 2016 00:59:56 +0300
Message-ID: <57267C5C.2000403@linux.intel.com>
References: <1461839104-29135-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:14975 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752363AbcEAWAF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 May 2016 18:00:05 -0400
In-Reply-To: <1461839104-29135-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>

Hi Marek,

Marek Szyprowski wrote:
> Commit 0c426c472b5585ed6e59160359c979506d45ae49 ("[media] media: Always
> keep a graph walk large enough around") changed
> media_device_register_entity() function to take mdev->graph_mutex. This
> causes deadlock in driver probe, which calls (indirectly) this function
> with ->graph_mutex taken. This patch removes taking ->graph_mutex in
> driver probe to avoid deadlock. Other drivers don't take ->graph_mutex
> for entity registration, so this change should be safe.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

You could also add:

Fixes: 0c426c472b55 ("[media] media: Always keep a graph walk large 
enough around")

I guess these should go to fixes, the patches in question are already 
heading for v4.6. Cc Mauro.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
