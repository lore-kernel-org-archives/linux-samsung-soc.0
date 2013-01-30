From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 0/6] ARM: dts: Add MFC support for Exynos4
Date: Wed, 30 Jan 2013 10:00:00 +0100
Message-ID: <5108E110.3040503@samsung.com>
References: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61737 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751285Ab3A3JAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 04:00:04 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHF008OGKZCFC20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 09:00:01 +0000 (GMT)
Received: from [106.116.147.32] by eusync4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHF005PJL010S70@eusync4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 09:00:01 +0000 (GMT)
In-reply-to: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org

On 01/30/2013 08:11 AM, Sachin Kamat wrote:
> Changes since v1:
> Addressed comments from Sylwester
>   - Updated documentation
>   - Added 'status' to the nodes
>   - Updated Kconfig entry
> 
> This series is based on for-next branch of Kukjin Kim's tree.
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> Sachin Kamat (6):
>   ARM: dts: Update MFC DT binding documentation
>   ARM: dts: Add MFC codec support for Exynos4 DT machines
>   ARM: dts: Add MFC codec support to SMDKV310 DT
>   ARM: dts: Add MFC codec support to Origen DT
>   ARM: dts: Add MFC codec entry to exynos4412-origen DT file
>   ARM: dts: Add MFC codec entry to exynos4412-smdk4412 DT file

Thanks Sachin. For the whole series:

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I have also tested patch 2/6 on an Exynos4412 based board,
just added the mfc clock entries in the codec node.

--

Regards,
Sylwester
