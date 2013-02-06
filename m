From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: moving dt binding documents for video devices to
 common place
Date: Wed, 06 Feb 2013 15:50:15 +0100
Message-ID: <51126DA7.2040309@samsung.com>
References: <1360162668-29677-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33406 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754590Ab3BFOuS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 09:50:18 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHS009G1ZTAD070@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 14:50:16 +0000 (GMT)
Received: from [106.116.147.32] by eusync4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHS00CHVZVSFQA0@eusync4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 14:50:16 +0000 (GMT)
In-reply-to: <1360162668-29677-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On 02/06/2013 03:57 PM, Rahul Sharma wrote:
> Binding Documents for drm-devices are placed in
> Documentation/devicetree/bindings/drm/*. But these devices are common
> for v4l framework, hence moved to a common place
> Documentation/devicetree/bindings/video/. 'exynos_' prefix is added to
> associate them with exynos soc series.

It looks good to me, I would just use 'exynos-' prefix instead,
this seems to be more common across existing files. Sorry for
the nitpicking..

I suppose you should address the patch to and base on the tree of
the device tree maintainers.

Thanks,
Sylwester
