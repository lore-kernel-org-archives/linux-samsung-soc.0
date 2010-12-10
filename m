From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RFC/PATCH v4 2/4] MFC: Add MFC 5.1 driver to plat-s5p
Date: Fri, 10 Dec 2010 12:41:10 +0900
Message-ID: <028701cb981c$1861a5f0$4924f1d0$%kim@samsung.com>
References: <1291901723-20361-1-git-send-email-k.debski@samsung.com>
 <1291901723-20361-3-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12095 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754389Ab0LJDlQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Dec 2010 22:41:16 -0500
In-reply-to: <1291901723-20361-3-git-send-email-k.debski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kamil Debski' <k.debski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, pawel@osciak.com, kyungmin.park@samsung.com, jaeryul.oh@samsung.com

Kamil Debski wrote:
> 
> Add platform support for Multi Format Codec 5.1 is a module available
> on S5PC110 and S5PC210 Samsung SoCs. Hardware is capable of handling
> a range of video codecs and this driver provides V4L2 interface for
> video decoding.
> 
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

(snip)

> +struct platform_device s5p_device_mfc5 = {

In this case, just "s5p_device_mfc" is better because basically used last
number as channel, for example, fimc0 means fimc channel 0.

> +	.name          = "s5p-mfc5",
> +	.id            = -1,
> +	.num_resources = ARRAY_SIZE(s5p_mfc_resource),
> +	.resource      = s5p_mfc_resource,
> +};
> +
> +EXPORT_SYMBOL(s5p_device_mfc5);

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
