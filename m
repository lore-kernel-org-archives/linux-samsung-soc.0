Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6589C43461
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 May 2021 12:25:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76E42613BF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 May 2021 12:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbhEEM0o (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 May 2021 08:26:44 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3020 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbhEEM0o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 May 2021 08:26:44 -0400
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwhS2R9Nz6rlbj;
        Wed,  5 May 2021 20:17:44 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 14:25:46 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:25:45 +0100
Date:   Wed, 5 May 2021 13:24:06 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kamil Debski <kamil@wypas.org>,
        "Marek Szyprowski" <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        "Sylwester Nawrocki" <s.nawrocki@samsung.com>
Subject: Re: [PATCH 04/25] media: s5p_cec: decrement usage count if disabled
Message-ID: <20210505132406.00003050@Huawei.com>
In-Reply-To: <a1c4c8a65061897f66ef119ddfd8ae858eec8a6d.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <a1c4c8a65061897f66ef119ddfd8ae858eec8a6d.1620207353.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.120.138]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 5 May 2021 11:41:54 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> There's a bug at s5p_cec_adap_enable(): if called to
> disable the device, it should call pm_runtime_put()
> instead of pm_runtime_disable(), as the goal here is to
> decrement the usage_count and not to disable PM runtime.
> 
> Reported-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/cec/platform/s5p/s5p_cec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
> index 2a3e7ffefe0a..3c7c4c3c798c 100644
> --- a/drivers/media/cec/platform/s5p/s5p_cec.c
> +++ b/drivers/media/cec/platform/s5p/s5p_cec.c
> @@ -51,7 +51,7 @@ static int s5p_cec_adap_enable(struct cec_adapter *adap, bool enable)
>  	} else {
>  		s5p_cec_mask_tx_interrupts(cec);
>  		s5p_cec_mask_rx_interrupts(cec);
> -		pm_runtime_disable(cec->dev);
> +		pm_runtime_put(cec->dev);
>  	}
>  
>  	return 0;

