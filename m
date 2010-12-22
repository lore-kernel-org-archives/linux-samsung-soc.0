From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 7/9] media: MFC: Add MFC v5.1 V4L2 driver
Date: Wed, 22 Dec 2010 14:08:11 +0100
Message-ID: <00d301cba1d9$4c74a880$e55df980$%szyprowski@samsung.com>
References: <1293018885-15239-1-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-2-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-3-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-4-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-5-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-6-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-7-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-8-git-send-email-jtp.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14083 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752780Ab0LVNIT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Dec 2010 08:08:19 -0500
In-reply-to: <1293018885-15239-8-git-send-email-jtp.park@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jeongtae Park' <jtp.park@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: k.debski@samsung.com, jaeryul.oh@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, jonghun.han@samsung.com, kyungmin.park@samsung.com

Hello,

On Wednesday, December 22, 2010 12:55 PM Jeongtae Park wrote:

> Multi Format Codec v5.1 is a module available on S5PC110 and S5PC210
> Samsung SoCs. Hardware is capable of handling a range of video codecs
> and this driver provides V4L2 interface for video decoding & encoding.
> 
> Reviewed-by: Peter Oh <jaeryul.oh@samsung.com>
> Signed-off-by: Jeongtae Park <jtp.park@samsung.com>

This patch is heavily based on the earlier patch posted by Kamil Debski. See 
http://permalink.gmane.org/gmane.linux.drivers.video-input-infrastructure/26316

However I see no credits for the original author in the patch header. Moreover,
Jeongtae Park put himself as an author of this patch...

This is a VERY BAD practice that shouldn't be accepted in the open source
community.

Dear Jeongtae Park, you should separate your work (encoding) from the work
of others (I mean original patch posted by Kamil). You can achieve this by
including the original patches (with all Signed-off-by lines) and add your
incremental extensions to them. This way the author of each part will be
credited correctly. This is very important for proper cooperation.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
