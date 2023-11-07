Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D24BC4167B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Nov 2023 19:37:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjKGThL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Nov 2023 14:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234393AbjKGThK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Nov 2023 14:37:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1D610C0
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Nov 2023 11:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699385785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=f2GkHL9Asj7cZ9gDAWnYJZ3/Dq1fD/MZuGhccXlmPBI=;
        b=MgREWolNd1OUGwr4kUNuSSAb+3Cf4DB7DMJ6pfT8lNvGQRTQDXvOZSPCmyD+TA+kvoWMC+
        mJ0b7TkM2NU1Ut0nQ9hGr0YB9rLGnoBe9b75MZPfEQRUunLEH9wuzs01O/WRXgJcSjBXJ3
        D5QDXqEVlYuyFD9rbih1RVQyOf84Jxw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-fUv0AslDMrOggUej4VxSCQ-1; Tue, 07 Nov 2023 14:36:24 -0500
X-MC-Unique: fUv0AslDMrOggUej4VxSCQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-778999c5f1dso688988885a.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Nov 2023 11:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699385784; x=1699990584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2GkHL9Asj7cZ9gDAWnYJZ3/Dq1fD/MZuGhccXlmPBI=;
        b=Aud3gNH/nFhhz8VWcIkZYDjhrRVOsC1KAm85Zz+13LsVWdmDvJQD5KX7AqFCst3hz6
         do1Aa05L66xLQL508Z5ZbtZ8xMLA/5CFuMiJue6Xy86HoQLsoHBrbEP2Av3a9TtiPLxa
         +fZZe74arV6OhLF5faBHSBInkDjG7OuLAya1bbxgv3BX2q3i/0zZCL97W7uG5Acl6Teg
         505Sa5PjhqnkXvb7ve1XyAzSvfxuw0bZf3L2SIyc7L7hGmIwlFFIvmzROSDae83ahcD/
         +aRDjfJcYQzRiNJJrP4S8hKJnSlsND+Gh4W7qyHUgaDXP7T4HZQJS8w3o+XhCz6PWem1
         etyg==
X-Gm-Message-State: AOJu0Yx8V5oodIzGMwOF+x+9wooJQP78XVwVLwjdDSnZ6OHG319WzdJp
        rJgsnUR0zbQXoLcJI32P0/lpt2OMVmkoU9XucW8RRg3mQvG/mmSfqwPwxRMCfDPZBr3XaSltaig
        jwHww9EB+7CrJDbc49/QxZwgN9jWcN/g=
X-Received: by 2002:ad4:5ecf:0:b0:675:6a83:8084 with SMTP id jm15-20020ad45ecf000000b006756a838084mr17136084qvb.14.1699385783787;
        Tue, 07 Nov 2023 11:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCasVvUsu1Pm+2+uqpGskpzIAz52YVkupGLyfFo54ljOeoSzf1eiTLLEVSdNTLByNhDpkAJg==
X-Received: by 2002:ad4:5ecf:0:b0:675:6a83:8084 with SMTP id jm15-20020ad45ecf000000b006756a838084mr17136067qvb.14.1699385783454;
        Tue, 07 Nov 2023 11:36:23 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id k16-20020ad44210000000b0067169e210b3sm206076qvp.70.2023.11.07.11.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 11:36:23 -0800 (PST)
Date:   Tue, 7 Nov 2023 13:36:20 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Can Guo <cang@qti.qualcomm.com>
Cc:     quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        stanley.chu@mediatek.com, adrian.hunter@intel.com,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Brian Masney <bmasney@redhat.com>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] scsi: ufs: host: Rename structure ufs_dev_params
 to ufs_host_params
Message-ID: <fcovysoo6vxvqdrypfbnfyclrmifibio46rne5zhiqnmqhzd7k@5ltemasdhfxp>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-2-git-send-email-cang@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1699332374-9324-2-git-send-email-cang@qti.qualcomm.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 06, 2023 at 08:46:07PM -0800, Can Guo wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> Structure ufs_dev_params is actually used in UFS host vendor drivers to
> declare host specific power mode parameters, like ufs_<vendor>_params or
> host_cap, which makes the code not very straightforward to read. Rename the
> structure ufs_dev_params to ufs_host_params and unify the declarations in
> all vendor drivers to host_params.
> 
> In addition, rename the two functions ufshcd_init_dev_pwr_param() and

nit: s/ufshcd_init_dev_pwr_param/ufshcd_init_pwr_dev_param/

> ufshcd_get_dev_pwr_param() which work based on the ufs_host_params to

nit: s/ufshcd_get_dev_pwr_param/ufshcd_get_pwr_dev_param/

> ufshcd_init_host_param() and ufshcd_negotiate_pwr_param() respectively to
> avoid confusions.
> 
> This change does not change any functionalities or logic.
> 
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-exynos.c    |  7 +++---
>  drivers/ufs/host/ufs-hisi.c      | 11 ++++-----
>  drivers/ufs/host/ufs-mediatek.c  | 12 ++++------
>  drivers/ufs/host/ufs-qcom.c      | 12 ++++------
>  drivers/ufs/host/ufshcd-pltfrm.c | 49 ++++++++++++++++++++--------------------
>  drivers/ufs/host/ufshcd-pltfrm.h | 10 ++++----
>  6 files changed, 47 insertions(+), 54 deletions(-)
> 

<snip>

> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index da2558e..6e65b61 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -285,17 +285,17 @@ static int ufshcd_parse_operating_points(struct ufs_hba *hba)
>  }
>  
>  /**
> - * ufshcd_get_pwr_dev_param - get finally agreed attributes for
> + * ufshcd_negotiate_pwr_param - get finally agreed attributes for
>   *                            power mode change
> - * @pltfrm_param: pointer to platform parameters
> + * @host_param: pointer to platform parameters
>   * @dev_max: pointer to device attributes
>   * @agreed_pwr: returned agreed attributes
>   *
>   * Return: 0 on success, non-zero value on failure.
>   */
> -int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
> -			     const struct ufs_pa_layer_attr *dev_max,
> -			     struct ufs_pa_layer_attr *agreed_pwr)
> +int ufshcd_negotiate_pwr_param(const struct ufs_host_params *host_param,
> +			       const struct ufs_pa_layer_attr *dev_max,
> +			       struct ufs_pa_layer_attr *agreed_pwr)
>  {
>  	int min_pltfrm_gear;

If you're going to change pltfrm -> host, maybe do so for
min_pltfrm_gear too? I think this all reads nicer with the functions
changed as is, but the consistency would be nice in my opinion.

Outside of those nits, I think this reads nicer now as well.

Acked-by: Andrew Halaney <ahalaney@redhat.com>

